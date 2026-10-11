Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF13CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2026 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNdv+kzYnFJhIEwOS88kAQTBibjBifrxxcGzcYBmmls=; b=ZDyPniufhzjgFa
	hzAnjITqRKS7BjW7a/JaA8Y/PqGDGHvymSU9XgAXEQhdZmkpG5WK2KJHgcPmK5yiJ6J0iqnPBelPO
	I9b6/ZF98FeKObRiVcZmugOOVzcLv34OWUikHzejrjYc7VpeztpTmhoCx7M7L7c8a5W5+IzkKXvJF
	5T/O6hd7q2SqA+BFA0jWAxgGfKHByVqGcD/HmjNGcKnXz+WgkpE1nSwHHgkiZ4f6EWfZABbuCftKD
	Te3hxoBMMUjfKlG5uizbNggciukh3WOO4GcbimXg8mH8BIL9phzgrpIY2HJN4EwWXAbHT67QKgYAK
	C/HsN6hML3fOiNB/tBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFn3d-00000008lRJ-0TyY;
	Sun, 11 Oct 2026 06:29:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFn3Z-00000008lPa-2khK
	for linux-mtd@lists.infradead.org;
	Sun, 11 Oct 2026 06:29:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so7283155e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700152; x=1792304952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuzYqr333bVnyPHn9BORMpm/ycVJyKnySjL8xjIdXeU=;
        b=CPSL+xJOvw4Sw7Uq0Ed7OFxgNWMw+BA/lkX24jskNpwMjMNwVihbe/ASHq5dQA6xZW
         q9VXhx0lgp7CA3bwniFRQKHI3SwtRWgz0XPvKL13TcsbBbvp14hNKkS9MdJsZzXLB902
         I9ibN05IeGGEMpmyY1lWqtyxlu7cCpCYpRS8bxwGm20kT6K/ZFKMhkxuAtax53wTZD0w
         OXCgi7CvJUZe5TbxKXE178rEtgAVE/NtaQhDSmauI3FTaMrS5odPFg7plCIaBEFFj1Ek
         4yX+bvN0B7w83rBrZsPv+nZ6e5mrE5y01A6A1fK0rLeTGDHTiZcdjaSyXjYJg7sTeyAC
         3Qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700152; x=1792304952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JuzYqr333bVnyPHn9BORMpm/ycVJyKnySjL8xjIdXeU=;
        b=gQbk93ek/uxykK/qU4sCDdhdXmdFMnoUe2oVe7rSUtMU2l2ZExYs7ekc2HND5tQkf7
         FpQE1MkHcekPYyYztXvje6N4oYJgD05G+5xYop0eOgoybhYWTbRt+it7js4WGbIhRq3H
         uD9aoSNv1ZyoUozU1Fn59UoyK34F0xGGtrN2+R13i2HV4jXUUUhPNqFPeSAQ9bLUKKAM
         qmbNfgPtm/yshhbvXJZqHyteuoyk2U5AGetQ3kAfFQDOfhWhtLJT8rKR1Coen6ubNN/3
         64Etq6/HgNdHxP8O/RcQzR6BCWp9EJQ6B4FTlfF6sk80SJxmwryhx1yerubC7HM9d4qe
         f/HQ==
X-Gm-Message-State: AFq9FYLcKtm6BisGRYmSL9YM45UQA0ZXNHEbzb066WUYlrRplitm/0IS
	J/OdGHzjqlc0wiNeBdmiba5CKIqM84l/ZJKmmubngMHb5prLZB8e/2cW
X-Gm-Gg: AYBFou0uwwejQ7Kier1KOouR/6Y0zAEsWk8Brsan7qWxmGRv0KjtJgf1NF9MYgD45jK
	gacriC9soTyvprSm+0NPxmLznV2bvj1KkjoKUg9WDJXQUHjr27U7pnOf2MhI4ID5eNSdNG6vAML
	ElS3cvmcKnvCa+shHnxElYF+yAumn44hf2rT3sb4YSQ1KwzMIQcxrsBFN9HiJHCfX2tL1wCKtC+
	KrpNkutw8j/M/F8aWpC+Y9fbSm7Jv4xyA19vZh0s+sOQfKeTOQUNuMFLRhPHh8hQZW2NZ37v5Fd
	Qv76Ec3dP7kQfP7T3XuYoRU+XJia+PpHPCe7awm9LSyT0uGANBVe1L1XjUEcdBBkpUDPyTZD+4O
	DHGdLVrmGHKkXjshQ7DqMk2+uqxH9I4r0++d5DjHR9xCiVXVnzm28W4l6+nuwz/vviyypLg7Lmw
	5DLkmZJR6zhhyozlnDBN6cT88axpda4CK0Q7M9vjOg0ximmb873Q9IcLYEv1b3ds0EIwG6iq6g5
	Ke+ijlXIQgC4wYtoEYHcnrClbGdj6E5H6gR0DWzj78NSU53yw9aP6BRzaiN058dgIMW1HBxCBQX
	m6G/2zkRVk9aMGVi
X-Received: by 2002:a05:600c:e548:10b0:49f:e427:e88f with SMTP id 5b1f17b1804b1-4a18e4b584amr69996185e9.21.1791700151689;
        Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
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
Subject: [PATCH v3 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sun, 11 Oct 2026 06:29:08 +0000
Message-ID: <20261011062908.2365879-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011062908.2365879-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261011062908.2365879-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_232913_721075_EB73AE1A 
X-CRM114-Status: GOOD (  19.19  )
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

Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v3: Assisted-by in the documented form.
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
