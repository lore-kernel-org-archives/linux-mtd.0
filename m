Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FDACA9EBE
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 18:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TtijtuAb6kC2hXbyAWqpy/XAgMpjM0bdfPBj7jbblk=; b=GyfqX0sBQ+6Oej
	DJWGBwmT2T6INWEL3QHSZp2P/ZoeK6iwaWjwQY2NSb2TVAMBzIbOKNzy3r79DFB/eobKk8WU0gEi4
	kL/HA6HUjA65WWklM78rGLUhbPMDNTfRPG2SJDqu+1SeIy8MLFoyTNpS/4yEbrgcQHAYdQKFlRPDI
	sxZ9/bSzNoH3cPNgFHbaXE6Dm63mK7/UaOTTJwQfcP3ZSx33MEIiazyOhijtLfmMzcrg3BXplHHTa
	wLynrRm7jBUbVNuunckfi5XOMEqlBAqbFY6yJVCLdpHeIkFPCHhq/NFBr7vcfdFolPRZZcXRrUCQ+
	FBoA4WqqLHzVS2h95Idw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbVA-00000008MSp-0Uhs;
	Sat, 10 Oct 2026 18:08:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbV7-00000008MR3-1Fbh
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 18:08:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a16c399641so7152585e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655731; x=1792260531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwjLjIdBjLhSbHy5MbJpSboN8vZWvV8OrJbj2jSTRdo=;
        b=i5xIGcJwDC0g+PI7PdSOmMcDUWAdywvpMdWy4ugvxIbw4LkYppb6J6BQWvlkqONjgn
         ENJPihws6/IR4JuSZ7suc3hNfnYcu/9W7bCD2ALobZwfPFF1caFgAPBYZS7d6Z7J9XgD
         wA+t4z929kbQ11OjlN7EF8E7AuR3PkH9E3giQZOhUq/Sq/f93qff+DBfnSZM1uXegOWv
         prdIeTa/+AHEZ/S28TWgMuMZBBHSiYjD8Ec9ebIBvex/QB3OcjjptdjVDuybbI/h/LUs
         PFg+vl3wH3oOFvrQaZm9ulkRNjltAuUSXntxygxQAGXlZSl1pMv+cP0BZ9IuxWJHp3pH
         9jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655731; x=1792260531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwjLjIdBjLhSbHy5MbJpSboN8vZWvV8OrJbj2jSTRdo=;
        b=EVQMsaBbFWm5iDVqz4E7Ugvrdq7cexS0GKSLzdrzNor9Pn9HsXku5kOpZ0qlpYSO9C
         q+NFXy2zX5oPDB8osQ9FfWWKoct7oe625Ab8HZa5dwDYqUAgXktuaehJqL7pDyBX/q5o
         9Rbu+CSp/bfqF6bSXeBMJ8xi8T4UsvHYnDsEaY/m9PLBSCnSpaWQpDJSwU/8YwIdV12i
         tyKeU+78IcM3SocPmDWFLx8WrDv+rNQoBuFlJZ1Z9/E6POF/qV1Hjtbj10hofKEQ+sG8
         kwhqrk2TBl8HnY+V3r2b4tslrEwudwszVeN770USSgj0M1c4kXzov1CQQXvwHpjibBeT
         06WA==
X-Gm-Message-State: AFq9FYIVZeLn9Sg/6Wg1VMjtjLURQl7RVi4SYd/vNoP7TPuDCAjBTsbr
	f2cltKDhcuso8NPaZG+pkNP0d/rb43i187tpHt3n52uUOH/hVbBE71Sx
X-Gm-Gg: AYBFou2Ex3LFU0uXN/7mUrIdDj9lEZJlrfoBG8an0iiAOX0I2WXB/CLLCJwGuuVX8XL
	aG6U4qm3g3VeJvM1Z6jWZZVWY5VGcAsiUzVGQzebjkpCQLjrVgaJWH6dKK/phWif3Za+XvSH+wS
	tB0jevmgWjQQNnRsBG0iU96vWWBOePweqS8SEqdPI+TsSdJxjCwfpjIDueToANuMKfWxlPizcvl
	otZ5JBmwnyVSeyrkP97MvzkNj4Y4CbJJFWcOtL0kFDOSNM/u5vuWGqZLYHsLbsnirh4cD0esiwN
	oVjzO4TFC/pPaiuTza6U7fmhWvpXnejD148lcNFNzYFYDa8zclIfzNF4sN8hu5O3l68Un1XEdkV
	h9vPZtETdsL83VyjulMF2tEPUJikIG042ag8zCAwvJWmc6PDJzriyCOVo+uM7l9P54Gbof4o2fo
	sQgyWuEos31E5bT6pbzkrQEUyq0L1yMrN/lGj3N9Vrkgox2dXzBUnJhDvaK7x/w8pvyfAgtAAJF
	Viyv/vBEFPP2cEtA0/Co8GgrXWB1UpsizRdu8rx5wa2iqPh7zeC+mNDuT+zxn13bm3TrSr85cq9
	CGb76msvlqim4pbun65Enl9lB+c=
X-Received: by 2002:a05:600c:674a:b0:4a1:7cf8:5433 with SMTP id 5b1f17b1804b1-4a18e443ee9mr99738155e9.3.1791655731151;
        Sat, 10 Oct 2026 11:08:51 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:49 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sat, 10 Oct 2026 18:08:40 +0000
Message-ID: <20261010180840.2152492-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010180840.2152492-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_110853_390953_B3792B0A 
X-CRM114-Status: GOOD (  19.53  )
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

CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS, and since
commit 8c1e6b14e27d ("MIPS: OCTEON: Protect accesses to bootbus flash
with octeon_bootbus_sem.") the flash map accessors take the semaphore
around every access. Its only other user is the eMMC host of the older
parts ("cavium,octeon-6130-mmc" in drivers/mmc/host/cavium-octeon.c),
which shares the boot bus; the CIU3 parts serialize their eMMC with a
lock of their own.

On boards without that host the semaphore guards nothing, but the
custom accessors make the map non-simple, so MTD will not let jffs2
point at it and its mount copies every used eraseblock. Use
simple_map_init() there. The test is for the node, not the driver, so
a disabled mmc node keeps the semaphore.

simple_map_init() BUG()s on an unsupported bank width; the old code
warned and then hit the BUG() in the inline map accessors on the first
probe command. Check the width before mapping anything and fail the
probe instead.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map is one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).

 arch/mips/cavium-octeon/flash_setup.c | 36 +++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 9242521..1c0b7d7 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -63,6 +63,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 	up(&octeon_bootbus_sem);
 }
 
+static bool octeon_flash_bus_shared(void)
+{
+	struct device_node *np;
+	bool shared;
+
+	np = of_find_compatible_node(NULL, NULL, "cavium,octeon-6130-mmc");
+	shared = !!np;
+	of_node_put(np);
+	return shared;
+}
+
 /*
  * Module/ driver initialization.
  *
@@ -85,6 +96,12 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
+		if (!map_bankwidth_supported(region_cfg.s.width + 1)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       region_cfg.s.width + 1);
+			return -EINVAL;
+		}
 		/*
 		 * The bootloader always takes the flash and sets its
 		 * address so the entire flash fits below
@@ -102,11 +119,20 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
 			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 */
+		if (octeon_flash_bus_shared()) {
+			flash_map.read = octeon_flash_map_read;
+			flash_map.write = octeon_flash_map_write;
+			flash_map.copy_from = octeon_flash_map_copy_from;
+			flash_map.copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(&flash_map);
+		}
 		mymtd = do_map_probe("cfi_probe", &flash_map);
 		if (mymtd) {
 			mymtd->owner = THIS_MODULE;
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
