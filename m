Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA738C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 20:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iyLZT2b1P8CnVtG6CbBK8Yg2tgN9eH3nJj5g5+H+UDw=; b=YFA/3AkmaCv3+D
	oQnmBPjs9nguOR8YvVNFI/xLBRzSTV3owY0OUMso7ArpcqMAkSlE9IfKA8rFSRun7Y4kKmqFEN+t/
	R1VNP27arUQn85lIuSHVpz/O/bh8mug3lfC5mWJdvpDWLcAWrov2SBfQbe8tg8ATRNcP/fSs665IH
	BTOvLAqYXIJGh+vNKYZ/Doz4dL8jkMws0SmPVEVbKL6WH9VPsUOh3dxjWzXfF9whhrshBuPoYAPvh
	2CHS2r60rtAyXEWa6laCvLnCuMj1Qhv8BH9vbOqmV/fzv7sNHr4LpgBX56royXDBlDPIpmDsTmgSZ
	Gk7ttBF40aZoZVVSzeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NkH-00AsfU-BI; Thu, 08 Dec 2022 20:43:53 +0000
Received: from tartarus.angband.pl ([51.83.246.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NXW-00AjT1-0g
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 20:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl;
	s=tartarus; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g3y3xySZxBlQlj57F0YJH44EoXt1qWsIXBwAWCPFRw8=; b=QK/NDMNIkQlkoE9riafhNStuJ6
	FM00+32r4PsFqLqLr7FYbqzJ3j8MOeMZ9lRTcKHPoMsUA7UxL7rsihuQg9gSQ+T7JThd9cjWhOCab
	PKKZG4rhFe/PHS6GSVwczkE+eYX//uovJB8fGpO0FMSkhWTW8ZPuLWksfdK+x9JUF1zY=;
Received: from localhost ([127.0.0.1] helo=valinor.angband.pl)
	by tartarus.angband.pl with smtp (Exim 4.94.2)
	(envelope-from <kilobyte@valinor.angband.pl>)
	id 1p3NX2-005HTm-8R; Thu, 08 Dec 2022 21:30:12 +0100
Received: (nullmailer pid 11068 invoked by uid 1000);
	Thu, 08 Dec 2022 20:30:08 -0000
From: Adam Borowski <kilobyte@angband.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH v2] mtd: eject cfi_interleave code to its own header
Date: Thu,  8 Dec 2022 21:29:59 +0100
Message-Id: <20221208202959.48320-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kilobyte@valinor.angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_123042_596292_BA62A8B2 
X-CRM114-Status: GOOD (  16.90  )
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

This fixes build failures for stuff that doesn't care about that, such as:

In file included from ./include/linux/mtd/spi-nor.h:10,
                 from drivers/spi/spi-intel.c:13:
./include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support
   62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
      |  ^~~~~~~

Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
v2: Added a Fixes: tag.

 drivers/mtd/chips/cfi_cmdset_0001.c |  1 +
 drivers/mtd/chips/cfi_cmdset_0002.c |  1 +
 drivers/mtd/chips/cfi_cmdset_0020.c |  1 +
 drivers/mtd/chips/cfi_util.c        |  1 +
 drivers/mtd/chips/gen_probe.c       |  1 +
 drivers/mtd/chips/jedec_probe.c     |  1 +
 include/linux/mtd/cfi.h             | 75 --------------------------
 include/linux/mtd/cfi_interleave.h  | 83 +++++++++++++++++++++++++++++
 8 files changed, 89 insertions(+), 75 deletions(-)
 create mode 100644 include/linux/mtd/cfi_interleave.h

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 54f92d09d9cf..efbf06fce95b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -34,6 +34,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 
 /* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
 /* #define CMDSET0001_DISABLE_WRITE_SUSPEND */
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 67453f59c69c..70d00c3641d8 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -37,6 +37,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 #include <linux/mtd/xip.h>
 
 #define AMD_BOOTLOC_BUG
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index d35df526e0a6..007e37faff56 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -31,6 +31,7 @@
 #include <linux/interrupt.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 #include <linux/mtd/mtd.h>
 
 
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 6a6a2a21d2ed..608315032f9e 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 
 void cfi_udelay(int us)
 {
diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 4d4f97841016..8703890ff20e 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -10,6 +10,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 #include <linux/mtd/gen_probe.h>
 
 static struct mtd_info *check_cmd_set(struct map_info *, int);
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 6f7e7e1b3fe5..88a979bb59bb 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 #include <linux/mtd/gen_probe.h>
 
 /* AMD */
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d88bb56c18e2..4a8ddb51afee 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -8,87 +8,12 @@
 
 #include <linux/delay.h>
 #include <linux/types.h>
-#include <linux/bug.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi_endian.h>
 #include <linux/mtd/xip.h>
 
-#ifdef CONFIG_MTD_CFI_I1
-#define cfi_interleave(cfi) 1
-#define cfi_interleave_is_1(cfi) (cfi_interleave(cfi) == 1)
-#else
-#define cfi_interleave_is_1(cfi) (0)
-#endif
-
-#ifdef CONFIG_MTD_CFI_I2
-# ifdef cfi_interleave
-#  undef cfi_interleave
-#  define cfi_interleave(cfi) ((cfi)->interleave)
-# else
-#  define cfi_interleave(cfi) 2
-# endif
-#define cfi_interleave_is_2(cfi) (cfi_interleave(cfi) == 2)
-#else
-#define cfi_interleave_is_2(cfi) (0)
-#endif
-
-#ifdef CONFIG_MTD_CFI_I4
-# ifdef cfi_interleave
-#  undef cfi_interleave
-#  define cfi_interleave(cfi) ((cfi)->interleave)
-# else
-#  define cfi_interleave(cfi) 4
-# endif
-#define cfi_interleave_is_4(cfi) (cfi_interleave(cfi) == 4)
-#else
-#define cfi_interleave_is_4(cfi) (0)
-#endif
-
-#ifdef CONFIG_MTD_CFI_I8
-# ifdef cfi_interleave
-#  undef cfi_interleave
-#  define cfi_interleave(cfi) ((cfi)->interleave)
-# else
-#  define cfi_interleave(cfi) 8
-# endif
-#define cfi_interleave_is_8(cfi) (cfi_interleave(cfi) == 8)
-#else
-#define cfi_interleave_is_8(cfi) (0)
-#endif
-
-#ifndef cfi_interleave
-#warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
-static inline int cfi_interleave(void *cfi)
-{
-	BUG();
-	return 0;
-}
-#endif
-
-static inline int cfi_interleave_supported(int i)
-{
-	switch (i) {
-#ifdef CONFIG_MTD_CFI_I1
-	case 1:
-#endif
-#ifdef CONFIG_MTD_CFI_I2
-	case 2:
-#endif
-#ifdef CONFIG_MTD_CFI_I4
-	case 4:
-#endif
-#ifdef CONFIG_MTD_CFI_I8
-	case 8:
-#endif
-		return 1;
-
-	default:
-		return 0;
-	}
-}
-
 
 /* NB: these values must represents the number of bytes needed to meet the
  *     device type (x8, x16, x32).  Eg. a 32 bit device is 4 x 8 bytes.
diff --git a/include/linux/mtd/cfi_interleave.h b/include/linux/mtd/cfi_interleave.h
new file mode 100644
index 000000000000..03d94a6d11fc
--- /dev/null
+++ b/include/linux/mtd/cfi_interleave.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __MTD_CFI_INTERLEAVE_H__
+#define __MTD_CFI_INTERLEAVE_H__
+
+#include <linux/bug.h>
+
+#ifdef CONFIG_MTD_CFI_I1
+#define cfi_interleave(cfi) 1
+#define cfi_interleave_is_1(cfi) (cfi_interleave(cfi) == 1)
+#else
+#define cfi_interleave_is_1(cfi) (0)
+#endif
+
+#ifdef CONFIG_MTD_CFI_I2
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
+# else
+#  define cfi_interleave(cfi) 2
+# endif
+#define cfi_interleave_is_2(cfi) (cfi_interleave(cfi) == 2)
+#else
+#define cfi_interleave_is_2(cfi) (0)
+#endif
+
+#ifdef CONFIG_MTD_CFI_I4
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
+# else
+#  define cfi_interleave(cfi) 4
+# endif
+#define cfi_interleave_is_4(cfi) (cfi_interleave(cfi) == 4)
+#else
+#define cfi_interleave_is_4(cfi) (0)
+#endif
+
+#ifdef CONFIG_MTD_CFI_I8
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
+# else
+#  define cfi_interleave(cfi) 8
+# endif
+#define cfi_interleave_is_8(cfi) (cfi_interleave(cfi) == 8)
+#else
+#define cfi_interleave_is_8(cfi) (0)
+#endif
+
+#ifndef cfi_interleave
+#warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
+static inline int cfi_interleave(void *cfi)
+{
+	BUG();
+	return 0;
+}
+#endif
+
+static inline int cfi_interleave_supported(int i)
+{
+	switch (i) {
+#ifdef CONFIG_MTD_CFI_I1
+	case 1:
+#endif
+#ifdef CONFIG_MTD_CFI_I2
+	case 2:
+#endif
+#ifdef CONFIG_MTD_CFI_I4
+	case 4:
+#endif
+#ifdef CONFIG_MTD_CFI_I8
+	case 8:
+#endif
+		return 1;
+
+	default:
+		return 0;
+	}
+}
+
+
+#endif /* __MTD_CFI_INTERLEAVE_H__ */
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
