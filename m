Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564CBC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 10:41:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E947464F7F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 10:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E947464F7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5v4ASEk/UEzNOwjQpJpZvt/6xHKuCY7duKkvoapNU04=; b=SWKcRj4RCqCwaFi+KSkAc1eHmc
	h3gu8tTD8GIRdCIxkkcxJw3PYXUemgsLXrI+EI0Arit01XjApetBGWTpUTpEEhLR5ZBldtjag/Bpb
	gpRkK78c9yOcNK8Hm5/4ceD7ZLpSU2T1WtbL1vOTiNiWuRZHV3HB9/xcRJeLpqVwm5wPBpynz8gu8
	DhA61Ye7E+Jf9eFcLhezlfGHIvG4ozwnWEosTWWw4Lfg+CWztF/HJYTUDhFhc87hUvkQTHgAk62GQ
	2uzRi0JXpC6xOVxvmGs+qxrnUKtNps/AOQR0FQSd6gf0AYNY4kf37Cb5NyP2UOGMdNLWgbqbtW2aV
	HWS1qWAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM77o-000QcZ-UF; Tue, 16 Mar 2021 10:40:33 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM77j-000QbX-Uy
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 10:40:31 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 51D5022236;
 Tue, 16 Mar 2021 11:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615891224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lTaJCMBMD70HK7Jt4qdFkAWDzYuK5uUMFdvUtqzGVuY=;
 b=uT2WK8KT2ir5NHCh336NMf9v9ijntq7feoxZ4mrVAVOOHsAd//+2gcq5v4tIo/xfk++5/7
 Wmcl48AZiuftqKMZ1XB9CH5TR+CYWdcrJsoFBRfejxG/sulPfKaHh4E+fXIEqymOw3P8z4
 iLmYxBdh1DEKDmZjxdTBHOJwXWcQIPE=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [RFC PATCH] mtd-utils: Add flash_otp_erase
Date: Tue, 16 Mar 2021 11:40:15 +0100
Message-Id: <20210316104015.27460-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_104028_137315_555484B6 
X-CRM114-Status: GOOD (  16.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On some SPI NOR flashes you can actually erase the OTP region until its
fully locked. Add a small utility for that.

Signed-off-by: Michael Walle <michael@walle.cc>
---
RFC patch because the OTPERASE ioctl patch wasn't merged yet.

 .gitignore                   |  1 +
 include/mtd/mtd-abi.h        |  2 ++
 misc-utils/Makemodule.am     |  4 ++-
 misc-utils/flash_otp_erase.c | 64 ++++++++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 misc-utils/flash_otp_erase.c

diff --git a/.gitignore b/.gitignore
index 4c04c1a..1644ef0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -24,6 +24,7 @@ fectest
 flash_erase
 flash_lock
 flash_otp_dump
+flash_otp_erase
 flash_otp_info
 flash_otp_lock
 flash_otp_write
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index bcd7496..a54c386 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -201,6 +201,8 @@ struct otp_info {
  * modes (see "struct mtd_write_req")
  */
 #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
+/* Erase a given range of user data (must be in mode %MTD_FILE_MODE_OTP_USER) */
+#define OTPERASE		_IOW('M', 25, struct otp_info)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
index b15c119..bc69b1c 100644
--- a/misc-utils/Makemodule.am
+++ b/misc-utils/Makemodule.am
@@ -32,6 +32,8 @@ flash_otp_dump_SOURCES = misc-utils/flash_otp_dump.c
 
 flash_otp_lock_SOURCES = misc-utils/flash_otp_lock.c
 
+flash_otp_erase_SOURCES = misc-utils/flash_otp_erase.c
+
 flash_otp_write_SOURCES = misc-utils/flash_otp_write.c
 
 flashcp_SOURCES = misc-utils/flashcp.c
@@ -43,7 +45,7 @@ sbin_PROGRAMS += \
 	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
 	serve_image recv_image fectest flash_erase flash_lock \
 	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
-	flash_otp_write flashcp mtdpart
+	flash_otp_erase flash_otp_write flashcp mtdpart
 
 MISC_SH = \
 	misc-utils/flash_eraseall
diff --git a/misc-utils/flash_otp_erase.c b/misc-utils/flash_otp_erase.c
new file mode 100644
index 0000000..771e230
--- /dev/null
+++ b/misc-utils/flash_otp_erase.c
@@ -0,0 +1,64 @@
+/*
+ * flash_otp_erase.c -- erase area of One-Time-Program data
+ */
+
+#define PROGRAM_NAME "flash_otp_erase"
+
+#include <stdio.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <string.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <sys/ioctl.h>
+
+#include <mtd/mtd-user.h>
+#include "common.h"
+
+int main(int argc,char *argv[])
+{
+	int fd, val, ret, offset, size;
+	struct otp_info info;
+	char *p;
+
+	if (argc != 5 || strcmp(argv[1], "-u")) {
+		fprintf(stderr, "Usage: %s -u <device> <offset> <size>\n", PROGRAM_NAME);
+		fprintf(stderr, "offset and size must match on OTP region boundaries\n");
+		return EINVAL;
+	}
+
+	fd = open(argv[2], O_WRONLY);
+	if (fd < 0) {
+		perror(argv[2]);
+		return errno;
+	}
+
+	val = MTD_OTP_USER;
+	ret = ioctl(fd, OTPSELECT, &val);
+	if (ret < 0) {
+		perror("OTPSELECT");
+		return errno;
+	}
+
+	offset = strtoul(argv[3], &p, 0);
+	if (argv[3][0] == 0 || *p != 0) {
+		fprintf(stderr, "%s: bad offset value\n", PROGRAM_NAME);
+		return ERANGE;
+	}
+
+	size = strtoul(argv[4], &p, 0);
+	if (argv[4][0] == 0 || *p != 0) {
+		fprintf(stderr, "%s: bad size value\n", PROGRAM_NAME);
+		return ERANGE;
+	}
+
+	info.start = offset;
+	info.length = size;
+	ret = ioctl(fd, OTPERASE, &info);
+	if (ret	< 0) {
+		perror("OTPERASE");
+		return errno;
+	}
+
+	return 0;
+}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
