Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406ACC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 20:15:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38752610F8
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 20:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38752610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sFjR6LHuO50Wb3GwCy2R3NcyE1ovaZR2JKwx5II2yNg=; b=POfFhimGTLqbGCtyZbeBXSLiCH
	qGQrPm+yL/tDY8eqb6P4O4AHsvknihuey0tCJdRBlUKSvN9udml72zT8IJOJDkkComDiHhyDuTmkV
	apPRo5L0I6fyefgLzhIZARFxUxEWeX/07LlVCoo6c7MHSbkfpZtVneGB6Ccz09K6Xh1yZTYGUYWVH
	82gvGYd6HMUEL9EXrj2BKkoBgK84hzt395K6589TgC51uh6RlEt1GEn+r4prt87tFlqozgs2BoQWX
	3GqhW/SkzSt/+QtK/belGTtd32PoOHdwD8cZa0FuPU8LvAye6WQafVAd2BFbgMr7SO3skVggwgLoc
	J5H6mwWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgCHZ-00Fdg0-W5; Mon, 10 May 2021 20:13:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCHX-00Fdfg-SE
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gLW0OXoqIOZ6toVulnU7Q7dm9QXk59VCJ9ndTYAOOEo=; b=yr/w4PC+OjWK+5FkLPZinwJdI4
 qFwXMPbwZKW+Z+r595YtoS0hBAE0MnW39YZBeF6zd83Ax1ZVITLyl8gO7WxArs5GG8vaBv5OM4dn7
 NVqQlFAoeT3DLTaewu5AcdCepew1rixsEfL9PFPziJpqPFA56AJAQFkJO64I+Iu2ag2Why3AYQ8F0
 55efdBCQW3n2eZI+GL8Tn/0C8jn/YYScGAcUXSUyRkTBrzLtzVjPGL9ew652Cb/WV012Juju+Nv+G
 X89st98uuKbEtngT3GkeLiiwtlWTifo5fw265hDK5M9nAHp7P1FjH4rTzYaA6/SqS0t6eErrEr2Fu
 ndvcXdhA==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgCHU-0096A5-Qb
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 20:13:34 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 81EB92222E;
 Mon, 10 May 2021 22:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1620677609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gLW0OXoqIOZ6toVulnU7Q7dm9QXk59VCJ9ndTYAOOEo=;
 b=YfrYHKh1fL228QbNfJWXE68EzKYMy9dGkS16uUjWE1DPj8EfKnDbkuhOAmLW6NQudF0sSk
 99dGPdUAQTtv3yfmM+nMZORzeQnkStUNGOCJiLG5skS5AV4P8AdNEWK3AIpBLUQOOsa+9N
 4Gmd0OgT6bQbkUDtA5WRv/iBFHnUYjY=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd-utils: Add flash_otp_erase
Date: Mon, 10 May 2021 22:13:19 +0200
Message-Id: <20210510201319.25975-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_131333_036401_489D320D 
X-CRM114-Status: GOOD (  16.02  )
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
The ioctl was merged in linux commit e3c1f1c92d6e ("mtd: add OTP
(one-time-programmable) erase ioctl").

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
