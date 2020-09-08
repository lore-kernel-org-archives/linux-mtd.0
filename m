Return-Path: <SRS0=nfXs=CR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CC1C433E2
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2020 20:08:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E4CE207DE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2020 20:08:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qOjuClq6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fishpost-de.20150623.gappssmtp.com header.i=@fishpost-de.20150623.gappssmtp.com header.b="pJTRTZ1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E4CE207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fishpost.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZK5vMjldTwg7n9zD62+QuPC1HyQV0UQC+i4Oz3JC3s=; b=qOjuClq6b9cEgmdX5Qlx4714D1
	EyAKnBjQXbrTqvKDIyowKrbKO8xXBEgSaqSK1fUx4WI2Md60sdNzd9q0BEB6Ji4hz5FqgdSHUSgr9
	klxSfe5mOM5p94wthMBihtbSKRpWv/CcYD1L13FetxXERnm19iOkksuEu4XTcURhlnXFf8PFmZcBG
	z/FWVRAK3MeHBLjeAvHAoImx8DvCJ28bsyjcslbbWczdtA5v32kPpQNSjJ4Vc+iqo+4EhhlLoOrW+
	2bRB3SFYDAkQh9WbAeWfWRewmzGJVTe9oaxpJFPAAT7yQmePhPcblcpde0P+Gwjye8HHsw+ZLmOFG
	BrQZqD5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFjtm-0008Qm-Ak; Tue, 08 Sep 2020 20:07:26 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFjtk-0008QB-80
 for linux-mtd@lists.infradead.org; Tue, 08 Sep 2020 20:07:25 +0000
Received: by mail-ed1-x541.google.com with SMTP id n22so359132edt.4
 for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2020 13:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fishpost-de.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x808xb0EzvdbV5XvHoHhWKE4Grr1AEvISqOsZd8KJOk=;
 b=pJTRTZ1rUh6kSWmQ5+o6wnA81dmLg4fl52Cwf47+ReXSK81y9k7PhopGeHlNkJbCBm
 nr0XDVixphQCXoz+CPjokQm54NafproFFsU9ZFi/eIKQ2pOJheCHY+WeDht8reyUEvZc
 QOIM3OXFJWxGTstK02tV/Ol4BnCmI2RQtdIel3WoPHK9Qv7VROxR2nJVDaBE8vCnvPOp
 ZRNwWLFQ3YKFdMiDaT87sgVqqIIFWYoq0y6aMateu9Tp3RP7FTNONq4lzEkt5S7ioE9p
 GSYdnenuvdaUl6Ml8QZzbdyH+oFQIxbBFnf4U0rz8PpPijKN0vJTFG1DM/GAPVrlFCpN
 R5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x808xb0EzvdbV5XvHoHhWKE4Grr1AEvISqOsZd8KJOk=;
 b=aox7PmVUygUXEKVydKvTs+SXtbOfUsCKVQw264b/5YZwT1BeUuPW2Bpy4fI11oiRdI
 t918jUzpDo79yJyadnVtgi18OYjQ3O9hdrCyDnM5UBVtJS0ijXhdgKDOVjIbM1plNohr
 kNI6FRSC5SVzyNfpGnWqWurA46zRF6D80atIxzl9mR7MB/Das3VEmenxbKCMT/RNiLjc
 Y5eniyy5KZruvjLeHuIhg1gDzGJdwHodp0C6X6CM8cMc23q+ctndoe33L1sLlp5XgJGu
 TUUW4i8ScFdGEwc7UbOK7HsGp2P6SPg55il5iC2Y2xKygkIS6Y7Dpy6S0WY7lZvRvJ39
 qzhQ==
X-Gm-Message-State: AOAM533XIi62slBqEimdNpONmDP95BoNdGr6Onkg38yP+2XjqS9r9HDy
 +hrE9s3aS+viZgs1QLuk/bqffrmdTjEE/E9r
X-Google-Smtp-Source: ABdhPJy6hfJ7qjVLWXdpR8NfqFS9HExn95ZE5Q1LL0K2goIgnDFXiS1T13XumsDmofHDNj5Oi2YABQ==
X-Received: by 2002:a50:bf4a:: with SMTP id g10mr753045edk.188.1599595640316; 
 Tue, 08 Sep 2020 13:07:20 -0700 (PDT)
Received: from thinkbage.fritz.box
 (p200300d06f42a300a5a855abe04a2b61.dip0.t-ipconnect.de.
 [2003:d0:6f42:a300:a5a8:55ab:e04a:2b61])
 by smtp.gmail.com with ESMTPSA id y9sm159715ejw.96.2020.09.08.13.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 13:07:19 -0700 (PDT)
From: Bastian Germann <bastiangermann@fishpost.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix typos found by Debian's lintian tool
Date: Tue,  8 Sep 2020 22:07:11 +0200
Message-Id: <20200908200711.5777-1-bastiangermann@fishpost.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_160724_396051_FA0F20CB 
X-CRM114-Status: GOOD (  19.50  )
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
Cc: Bastian Germann <bastiangermann@fishpost.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: Bastian Germann <bastiangermann@fishpost.de>
---
 jffsX-utils/mkfs.jffs2.1            | 4 ++--
 misc-utils/lsmtd.8                  | 2 +-
 misc-utils/lsmtd.c                  | 6 +++---
 misc-utils/lsmtd_scan.c             | 2 +-
 ubi-utils/mtdinfo.c                 | 2 +-
 ubi-utils/ubinize.c                 | 2 +-
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/jffsX-utils/mkfs.jffs2.1 b/jffsX-utils/mkfs.jffs2.1
index 7c57ddc..75f96f5 100644
--- a/jffsX-utils/mkfs.jffs2.1
+++ b/jffsX-utils/mkfs.jffs2.1
@@ -119,13 +119,13 @@ the kernel can be changed with a #define to accept images of the
 non-native endianness. Full bi-endian support in the kernel is not
 planned.
 
-It is unlikely that JFFS2 images are useful except in conjuction
+It is unlikely that JFFS2 images are useful except in conjunction
 with the MTD (Memory Technology Device) drivers in the Linux
 kernel, since the JFFS2 file system driver in the kernel requires
 MTD devices.
 .SH OPTIONS
 Options that take SIZE arguments can be specified as either
-decimal (e.g., 65536), octal (0200000), or hexidecimal (0x1000).
+decimal (e.g., 65536), octal (0200000), or hexadecimal (0x1000).
 .TP
 .B -p, --pad[=SIZE]
 Pad output to SIZE bytes with 0xFF.  If SIZE is not specified,
diff --git a/misc-utils/lsmtd.8 b/misc-utils/lsmtd.8
index 3061c40..198c8a7 100644
--- a/misc-utils/lsmtd.8
+++ b/misc-utils/lsmtd.8
@@ -14,7 +14,7 @@ command reads the
 .B sysfs
 filesystem to gather information. Alternatively, the
 .B procfs
-filesystem and ioctl interfaces are used, should the sysfs filesytem not
+filesystem and ioctl interfaces are used, should the sysfs filesystem not
 be available.
 .PP
 The command prints all MTD and UBI devices in a pretty-printed list format by
diff --git a/misc-utils/lsmtd.c b/misc-utils/lsmtd.c
index 24a30ac..b62b69f 100644
--- a/misc-utils/lsmtd.c
+++ b/misc-utils/lsmtd.c
@@ -72,11 +72,11 @@ static struct column cols[] = {
 	{ "SUB-SIZE", "subpage size", COL_SUBSIZE, COL_DT_SIZE, 0 },
 	{ "OOB-SIZE", "out of band data size", COL_OOBSIZE, COL_DT_SIZE, 0 },
 	{ "RO", "read-only device", COL_RO, COL_DT_BOOL, 0 },
-	{ "CORRUPTED", "wheather an UBI volume is corrupted",
+	{ "CORRUPTED", "whether an UBI volume is corrupted",
 		COL_CORRUPTED, COL_DT_BOOL, 0 },
 	{ "REGIONS", "number of additional erase regions",
 		COL_REGION, COL_DT_NUMBER, 0 },
-	{ "BB", "wheather the MTD device may have bad eraseblocks",
+	{ "BB", "whether the MTD device may have bad eraseblocks",
 		COL_BB, COL_DT_BOOL, 0 },
 	{ "MAX-EC", "current highest erase counter value on UBI devices",
 		COL_MAXEC, COL_DT_NUMBER, 0 },
@@ -107,7 +107,7 @@ static NORETURN void usage(int status)
 "  -r, --raw            Use raw output format\n"
 "  -P, --pairs          Use key=\"value\" output format\n"
 "  -J, --json           Use JSON output format\n"
-"  -o, --output <list>  Comma seperated list of columns to print\n"
+"  -o, --output <list>  Comma separated list of columns to print\n"
 "  -O, --output-all     Print all columns\n"
 "  -x, --sort <column>  Sort output by <column>\n"
 "  -m, --no-ubi         Do not display information about UBI devices/volumes\n"
diff --git a/misc-utils/lsmtd_scan.c b/misc-utils/lsmtd_scan.c
index cec7b5c..9331c5b 100644
--- a/misc-utils/lsmtd_scan.c
+++ b/misc-utils/lsmtd_scan.c
@@ -162,7 +162,7 @@ int scan_ubi(libubi_t lib_ubi)
 		}
 
 		if (j == num_mtd_devices) {
-			fprintf(stderr, "Cannot find mtd device %d refered to "
+			fprintf(stderr, "Cannot find mtd device %d referred to "
 				"by ubi device %d\n", dev_info.mtd_num,
 				dev_info.dev_num);
 			return -1;
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 0606ab0..8bd0fc8 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -161,7 +161,7 @@ static void print_ubi_info(const struct mtd_info *mtd_info,
 	struct ubigen_info ui;
 
 	if (!mtd_info->sysfs_supported) {
-		errmsg("cannot provide UBI info, becasue sub-page size is "
+		errmsg("cannot provide UBI info, because sub-page size is "
 		       "not known");
 		return;
 	}
diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index 967b65c..ac8c1e5 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -376,7 +376,7 @@ static int read_section(const struct ubigen_info *ui, const char *sname,
 	if (vi->alignment == -1)
 		vi->alignment = 1;
 	else if (vi->id < 0)
-		return errmsg("negative volume alignement %d in section \"%s\"",
+		return errmsg("negative volume alignment %d in section \"%s\"",
 			      vi->alignment, sname);
 
 	verbose(args.verbose, "volume alignment: %d", vi->alignment);
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index d4be610..cd66d93 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -210,9 +210,9 @@ static const char *helptext =
 "Usage: mkfs.ubifs [OPTIONS] target\n"
 "Make a UBIFS file system image from an existing directory tree\n\n"
 "Examples:\n"
-"Build file system from directory /opt/img, writting the result in the ubifs.img file\n"
+"Build file system from directory /opt/img, writing the result in the ubifs.img file\n"
 "\tmkfs.ubifs -m 512 -e 128KiB -c 100 -r /opt/img ubifs.img\n"
-"The same, but writting directly to an UBI volume\n"
+"The same, but writing directly to an UBI volume\n"
 "\tmkfs.ubifs -r /opt/img /dev/ubi0_0\n"
 "Creating an empty UBIFS filesystem on an UBI volume\n"
 "\tmkfs.ubifs /dev/ubi0_0\n\n"
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
