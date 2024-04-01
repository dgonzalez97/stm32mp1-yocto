FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://davidstmwifi.config"

do_configure_append() {
    cat ${WORKDIR}/davidstmwifi.config >> ${B}/.config || true
}
