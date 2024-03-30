FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://davidusbwifi.config"

do_configure_append() {
    cat ${WORKDIR}/davidusbwifi.config >> ${B}/.config || true
}
