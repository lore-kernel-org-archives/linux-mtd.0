Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mgdhx-0006td-8V
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 12:04:05 +0000
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id C79B31C154B1
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 14:03:58 +0200 (CEST)
Received: from vitb-lp.localdomain (unknown [89.169.140.112])
	by smtp-auth.mnet-online.de (Postfix) with ESMTP id 6B51E901B1
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 14:03:58 +0200 (CEST)
Received: from vitb-lp (vitb-lp [127.0.0.1])
	by vitb-lp.localdomain (Postfix) with ESMTP id 0D7C61DD
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 16:04:38 +0400 (MSD)
Date: Thu, 27 Aug 2009 16:04:33 +0400
From: Vitaly Bordug <vitb@kernel.crashing.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] jedec: Fix compilation problem with I28F640C3B definition
Message-ID: <20090827160433.45e595f6@vitb-lp>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix compilation problem with I28F640C3B definition

From: Stefan Roese <sr@denx.de>
Date:   Tue Feb 12 17:05:25 2008 +0100

    mtd: Fix compilation problem with I28F640C3B definition

    Signed-off-by: Stefan Roese <sr@denx.de>
    Signed-off-by: Vitaly Bordug <vitb@kernel.crashing.org>
---
This has been sitting in DENX tree for a while, any reason not having
it upstream?

drivers/mtd/chips/jedec_probe.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)


diff --git a/drivers/mtd/chips/jedec_probe.c
b/drivers/mtd/chips/jedec_probe.c index ccc4cfc..94a0d8f 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -111,6 +111,11 @@
 #define I28F320B3B	0x8897
 #define I28F640B3T	0x8898
 #define I28F640B3B	0x8899
+#define I28F640C3B	0x88CD
+#define I28F160F3T	0x88F3
+#define I28F160F3B	0x88F4
+#define I28F160C3T	0x88C2
+#define I28F160C3B	0x88C3
 #define I82802AB	0x00ad
 #define I82802AC	0x00ac
 
@@ -1103,6 +1108,19 @@ static const struct amd_flash_info jedec_table[]
= { }
 	}, {
 		.mfr_id		= MANUFACTURER_INTEL,
+		.dev_id		= I28F640C3B,
+		.name		= "Intel 28F640C3B",
+		.devtypes	= CFI_DEVICETYPE_X16,
+		.uaddr		= MTD_UADDR_UNNECESSARY,
+		.dev_size	= SIZE_8MiB,
+		.cmd_set	= P_ID_INTEL_STD,
+		.nr_regions	= 2,
+		.regions	= {
+			ERASEINFO(0x02000, 8),
+			ERASEINFO(0x10000, 127),
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_INTEL,
 		.dev_id		= I82802AB,
 		.name		= "Intel 82802AB",
 		.devtypes	= CFI_DEVICETYPE_X8,
