Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2392C04A94
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFMXMX77ASeC3Eg6jOYr5muecmi7miEW47r9rIKIt74=; b=GB9X13vpwfkvQW
	dAEgCn9vF7TTBKDLnT2C0vWH1K5t+UiukXrUDtQAlCimWM1j5FWUWWdW3Pc+CqlUi/DMawZZvuKeH
	vXlKCuXZy3oU8bPWPswLDsHE5SzKIDt0xRevkWLKRDxvYel6VYucBbVC2xZ3ztOWiCtdpkF2h1XLa
	eSTCV9/41sAZ18rMawRGgZvrUuQdDLbsAnZ6MIXCwtUaQDyc2jdo/7M//jSksz01xFlRMz2xyXP1u
	oxlTZku0DbFoNKgOTtikd01r+itpA6F0UBuNsiTkT2+bmJuQFnbRL2RQcLRnWcz+4kHZEpMROIFUi
	Dy4Fha+BkBmwQFxndpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSK3s-00EKHK-2s;
	Sat, 05 Aug 2023 16:23:28 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSK3p-00EKGa-3D
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 16:23:27 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qSK3i-0000dH-1f;
	Sat, 05 Aug 2023 16:23:18 +0000
Date: Sat, 5 Aug 2023 17:23:11 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/7] mtd: ubi: improve Kconfig formatting
Message-ID: <62240f36e4838e925e32add167a2d7d201843b0d.1691252291.git.daniel@makrotopia.org>
References: <cover.1691252291.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1691252291.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_092326_035126_0A3356CB 
X-CRM114-Status: GOOD (  18.38  )
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

Kconfig help text should be indented with one tab + 2 spaces
according to coding-style.rst. Apply this rule in
drivers/mtd/ubi/Kconfig

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/Kconfig | 60 ++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 2ed77b7b3fcb5..184118f9a2969 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -61,47 +61,47 @@ config MTD_UBI_FASTMAP
 	bool "UBI Fastmap (Experimental feature)"
 	default n
 	help
-	   Important: this feature is experimental so far and the on-flash
-	   format for fastmap may change in the next kernel versions
-
-	   Fastmap is a mechanism which allows attaching an UBI device
-	   in nearly constant time. Instead of scanning the whole MTD device it
-	   only has to locate a checkpoint (called fastmap) on the device.
-	   The on-flash fastmap contains all information needed to attach
-	   the device. Using fastmap makes only sense on large devices where
-	   attaching by scanning takes long. UBI will not automatically install
-	   a fastmap on old images, but you can set the UBI module parameter
-	   fm_autoconvert to 1 if you want so. Please note that fastmap-enabled
-	   images are still usable with UBI implementations without
-	   fastmap support. On typical flash devices the whole fastmap fits
-	   into one PEB. UBI will reserve PEBs to hold two fastmaps.
-
-	   If in doubt, say "N".
+	  Important: this feature is experimental so far and the on-flash
+	  format for fastmap may change in the next kernel versions
+
+	  Fastmap is a mechanism which allows attaching an UBI device
+	  in nearly constant time. Instead of scanning the whole MTD device it
+	  only has to locate a checkpoint (called fastmap) on the device.
+	  The on-flash fastmap contains all information needed to attach
+	  the device. Using fastmap makes only sense on large devices where
+	  attaching by scanning takes long. UBI will not automatically install
+	  a fastmap on old images, but you can set the UBI module parameter
+	  fm_autoconvert to 1 if you want so. Please note that fastmap-enabled
+	  images are still usable with UBI implementations without
+	  fastmap support. On typical flash devices the whole fastmap fits
+	  into one PEB. UBI will reserve PEBs to hold two fastmaps.
+
+	  If in doubt, say "N".
 
 config MTD_UBI_GLUEBI
 	tristate "MTD devices emulation driver (gluebi)"
 	help
-	   This option enables gluebi - an additional driver which emulates MTD
-	   devices on top of UBI volumes: for each UBI volumes an MTD device is
-	   created, and all I/O to this MTD device is redirected to the UBI
-	   volume. This is handy to make MTD-oriented software (like JFFS2)
-	   work on top of UBI. Do not enable this unless you use legacy
-	   software.
+	  This option enables gluebi - an additional driver which emulates MTD
+	  devices on top of UBI volumes: for each UBI volumes an MTD device is
+	  created, and all I/O to this MTD device is redirected to the UBI
+	  volume. This is handy to make MTD-oriented software (like JFFS2)
+	  work on top of UBI. Do not enable this unless you use legacy
+	  software.
 
 config MTD_UBI_BLOCK
 	bool "Read-only block devices on top of UBI volumes"
 	default n
 	depends on BLOCK
 	help
-	   This option enables read-only UBI block devices support. UBI block
-	   devices will be layered on top of UBI volumes, which means that the
-	   UBI driver will transparently handle things like bad eraseblocks and
-	   bit-flips. You can put any block-oriented file system on top of UBI
-	   volumes in read-only mode (e.g., ext4), but it is probably most
-	   practical for read-only file systems, like squashfs.
+	  This option enables read-only UBI block devices support. UBI block
+	  devices will be layered on top of UBI volumes, which means that the
+	  UBI driver will transparently handle things like bad eraseblocks and
+	  bit-flips. You can put any block-oriented file system on top of UBI
+	  volumes in read-only mode (e.g., ext4), but it is probably most
+	  practical for read-only file systems, like squashfs.
 
-	   When selected, this feature will be built in the UBI driver.
+	  When selected, this feature will be built in the UBI driver.
 
-	   If in doubt, say "N".
+	  If in doubt, say "N".
 
 endif # MTD_UBI
-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
