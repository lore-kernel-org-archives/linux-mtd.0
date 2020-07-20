Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FUZZY_XPILL,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2761C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 21:09:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7740E207DF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 21:09:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FRfiEgNU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=appliedlogix.com header.i=@appliedlogix.com header.b="V9YCWtkJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7740E207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=appliedlogix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JvskBwFujv95VuIN2HPk66JC54aOI1+xxSF45Ykuklc=; b=FRfiEgNUjNG+6QDP8uDFLuxAgC
	wd7+7CKr/ojdwuAaYFnmSRJUuZsOuDEJmJrVFipoWDGmvQLtxvNMwaA7NAF5yUfJKL/Aa1OvDUZIN
	i6OupOvBXiRNh7cEuyvSsOfmTmyLGlyRQoCUg45hrWQ9IcpVji+pOjfZmQUQABl4rM2748FnsAEL0
	Z8pjAYgQkict2aV+3thYm30A1q8tSYRFvwFkbwRXjzh7PE+V2G5KP7zY8tI56Hx+bSoqq4UegPdl8
	ErnzMlovMIybVf3pA9JsZN2fYWE8UKiOasKtNAmPKBJ7M4i3GjZZz/54Nz8ewKYwKALPIuwNSrng5
	dXjyXO0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxd1o-0007PE-A6; Mon, 20 Jul 2020 21:08:52 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxd1m-0007Ob-AW
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 21:08:51 +0000
Received: by mail-vs1-xe34.google.com with SMTP id q15so9265205vso.9
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=appliedlogix.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=SkP5QUftP8Y/iupRAXBvMU9v5LXCfuh4AOfgLwGkx4E=;
 b=V9YCWtkJnvXiZXGc6YNuiAPeoRelAWxldW5AteEPSS3S6zbkZ1+ANw9etZEXI44mGR
 u79XUt/dJYNqZSDTHHzRks3heS67goApxuSvEY5yC38KljvcJvFknI6ElhDy8RS3mS/P
 EcOWCKqAq0kwmcwd+9y2Ck5ifwGDMn4CX1viQgwQiU/E+XeSgBvMzHOa9IsgThQtvuyt
 tcLvwx1ytpMiFLV9+EzQjO5ROztjrtLF84NiOVjKeTF36MuJ32Yintqa8vq/jxD5qk9d
 dIE0jqqqUbzgdygojQQ2fdRAGJ9YMgXC2ujKLHkkmOKC2G0GF5TOzbVvxFl//uLf+wC+
 M7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SkP5QUftP8Y/iupRAXBvMU9v5LXCfuh4AOfgLwGkx4E=;
 b=hTFMnJBXONj0ozMm7gP0GeCEE25ra8rMj/fYWMBotqZrhiAUMnPCHS+BZrpssfjoyl
 kZngYm6W99xeHlk7bakW3A5ToQP/0Yt+B3P5YQ3WIzOvC/hqX5ZBdy75MFaKU2c0Zw3S
 Tx5MG0/une4/IPAfIaAMoc+6DfUMG+8u5qcSx4X5NyLwB3KA/GldodSyBtFIrJu1IgX5
 NqmUdlEeIYkp+KhJZ9b+fzf/WaxgbmGvUWygmtZZxoLdIX1/v6jTYVMiSgKB5ii7Uang
 8W849fj6fZ4wTpCK8YkugrsOgyp33QmailA3mr1EUQUe8ySqoggGujCJOLEgl1XeJZGS
 kN1A==
X-Gm-Message-State: AOAM533+pkolHhUA7vx/lX7LGm7NE7yBoGHL8nwvTYNi20fa8NsZb26M
 Xj6z1eB+HwpEaoN/bNXBBC+D39OTxpUexFm+cR3xLMuLCtI=
X-Google-Smtp-Source: ABdhPJwpSdybMrdirD3ShB64qnb1lmNAxVu/iu8WnXquJZL7yGiI8QnE2FOp7SZmF4W8VZor3cjDzG7YF6lKOfRlpAw=
X-Received: by 2002:a67:643:: with SMTP id 64mr18201553vsg.32.1595279328356;
 Mon, 20 Jul 2020 14:08:48 -0700 (PDT)
MIME-Version: 1.0
From: Michael Sander <msander@appliedlogix.com>
Date: Mon, 20 Jul 2020 17:08:37 -0400
Message-ID: <CAOM0yYSnUERV38T0D_Z=Um6XvWMV4M4SreCj2=J0wXHCvmrzyg@mail.gmail.com>
Subject: Unable to lock flash
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_170850_407454_19B13DAF 
X-CRM114-Status: GOOD (  10.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I am seeing the following failure:

root@localhost:~#  flash_unlock -i /dev/mtd0
flash_unlock: error!: could not check lock status device: /dev/mtd0

              error 95 (Operation not supported)

I can read and write the flash without any problems.

The kernel version is: 4.14.0-xilinx-v2018.3
I am using Petalinux on a Xilinx Zynq 7000 family SOC

dmesg is not showing any kernel errors associated with the call.

The MTD version is:
root@localhost:~# flash_unlock -V
flash_unlock (mtd-utils) 2.0.0

Looking at the source, it appears that the "95" error is from the
library call to the driver, and in the driver I see:

int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
{
    if (!mtd->_is_locked)
        return -EOPNOTSUPP;
    if (ofs < 0 || ofs >= mtd->size || len > mtd->size - ofs)
        return -EINVAL;
    if (!len)
        return 0;
    return mtd->_is_locked(mtd, ofs, len);
}
EXPORT_SYMBOL_GPL(mtd_is_locked);

So the driver appears to think the locking functionality is not supported.

The flash chip is a MT25QL128ABA8E12-1SIT which appears to support locking.

The device tree is as follows

&qspi {
        #address-cells = <1>;
        #size-cells = <0>;
        flash0: flash@0 {
                compatible = "n25q512a","micron,m25p80";
                reg = <0x0>;
                #address-cells = <1>;
                #size-cells = <1>;
                spi-max-frequency = <50000000>;
                /delete-node/ partition@qspi-fsbl-uboot;
                /delete-node/ partition@qspi-linux;
                /delete-node/ partition@qspi-device-tree;
                /delete-node/ partition@qspi-rootfs;
                /delete-node/ partition@qspi-bitstream;
                partition@0x00000000 {
                        label = "fs-boot";
                        reg = <0x00000000 0x00120000>;
                };
                partition@0x00120000 {
                        label = "fs-bootenv";
                        reg = <0x00120000 0x00020000>;
                };
                partition@0x00140000 {
                        label = "fs-kernel";
                        reg = <0x00140000 0x00d00000>;
                };
                partition@0x00e40000 {
                        label = "boot";
                        reg = <0x00e40000 0x00120000>;
                };
                partition@0x00f60000 {
                        label = "bootenv";
                        reg = <0x00f60000 0x00020000>;
                };
                partition@0x00f80000 {
                        label = "envshare";
                        reg = <0x00f80000 0x00010000>;
                };
                partition@0x00f90000 {
                        label = "spare";
                        reg = <0x00f90000 0x00070000>;
                };
        };
};

And mtdinfo is as follows, apologies, we have a few partitions set up.

root@localhost:~# mtdinfo -a
Count of MTD devices:           7
Present MTD devices:            mtd0, mtd1, mtd2, mtd3, mtd4, mtd5, mtd6
Sysfs interface supported:      yes

mtd0
Name:                           fs-boot
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          18 (1179648 bytes, 1.1 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             true

mtd1
Name:                           fs-bootenv
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          2 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:2
Bad blocks are allowed:         false
Device is writable:             true

mtd2
Name:                           fs-kernel
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          208 (13631488 bytes, 13.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:4
Bad blocks are allowed:         false
Device is writable:             true

mtd3
Name:                           boot
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          18 (1179648 bytes, 1.1 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:6
Bad blocks are allowed:         false
Device is writable:             true

mtd4
Name:                           bootenv
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          2 (131072 bytes, 128.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:8
Bad blocks are allowed:         false
Device is writable:             true

mtd5
Name:                           envshare
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          1 (65536 bytes, 64.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:10
Bad blocks are allowed:         false
Device is writable:             true

mtd6
Name:                           spare
Type:                           nor
Eraseblock size:                65536 bytes, 64.0 KiB
Amount of eraseblocks:          7 (458752 bytes, 448.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:12
Bad blocks are allowed:         false
Device is writable:             true

thanks,
-- 
Michael Sander
www.appliedlogix.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
