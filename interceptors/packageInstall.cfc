/**
* @author Seb Duggan
*
* I am an interceptor that checks if a package destination is a Git repo, and if so skips the installation.
*
*/
component {
	property name="packageService" inject="packageService";

	function init() {}

	function onInstall() {
		var slug            = interceptData.artifactDescriptor.slug ?: "";
		var installPath     = interceptData.containerBoxJSON.installPaths[ slug ] ?: "";
		var fullInstallPath = interceptData.packagePathRequestingInstallation & installPath;
		var isGitRepo       = directoryExists( "#fullInstallPath#/.git" );

		if ( isGitRepo ) {
			interceptData.skipInstall = true;
			if ( interceptData.keyExists( "job" ) ) {
				interceptData.job.addWarnLog( "#fullInstallPath# seems to be a Git repository, so will skip package installation." );
			}
		}
	}

}
