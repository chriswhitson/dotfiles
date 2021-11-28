add_cloud_sdk_repo() {

	test -f /etc/yum.repos.d/google-cloud-sdk.repo || sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg       
EOM
}

install_cloud_sdk(){
	sudo dnf install -y google-cloud-sdk
}

setup_gcloud(){
	gcloud init --console-only
}

add_cloud_sdk_repo
install_cloud_sdk
setup_gcloud
