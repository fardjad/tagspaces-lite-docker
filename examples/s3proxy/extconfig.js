const s3Url = new URL(window.location.href);
s3Url.search = "";
s3Url.hash = "";
s3Url.pathname = "/s3proxy";

window.ExtIsFirstRun = false;
window.ExtShowWelcomePanel = false;
window.ExtTheme = "dark";
window.ExtUseSidecarsForFileTagging = true;
window.ExtLocations = [
	{
		uuid: "s3proxy",
		type: "1",
		name: "S3 Proxy",
		path: "",
		accessKeyId: "anonymous",
		secretAccessKey: "anonymous",
		bucketName: "tagspaces",
		region: "",
		endpointURL: s3Url.toString(),
		isNotEditable: true,
		isDefault: true,
		isReadOnly: false,
		disableIndexing: false,
		disableThumbnailGeneration: true,
		fullTextIndex: false,
		// activates the watching for changed files in the current location, (feature is not working on cloud locations)
		watchForChanges: false,
		// time in milliseconds
		maxIndexAge: 0,
		persistTagsInSidecarFile: true,
	},
];

window.ExtTagLibrary = [];
