Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC3606A880
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 21:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0DVF6lyr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i5zpdUTt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BUjnqrbQ51thRj4C42hjT7CsnRj9xqd6/xJDMQXhONY=; b=0DVF6lyrZ3BWmwS1Mm5zO8EAj7
	eM302yEx1ICPOd5l+5BRYaidOlkXRk9Kdou9m5RskogyIGHwx5Eqf2BKnqDfHP98a3ofm2i7jifld
	kFAl7SQEZq/aDv7+JJbvzuM9PiA/pxc/Z7YM7Qpf6FO8H5rH6tBzJuXpdPtZRjtlQu7WQBKFJO1l6
	psOJ9PaKAGlyJ3wvyQfZ0BS7D6mVpwkOvZBijVsqUGHD7qQJkuWOZIrHWcZrUKpVmgKmaymQKz5QK
	TFSzgWxkLhwDHSUx6ds0vFGXO2f6BI1A8TB/EEtp8uo6e5VQdwgjM9Wx7dJ6fk7BVI2RwDDV5xIS2
	ELcbVqQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQw5-000000079I4-47W6;
	Tue, 17 Nov 2026 21:41:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQw3-000000079Fy-0Af2
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 21:41:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-490d59c3edaso96908f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 13:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951709; x=1795556509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSOzTuildzOc1Vsgs2eOA/FCbZ+NSuERw0qAipq6Ry0=;
        b=i5zpdUTtbFSJsjKTWhgqr01ySHP/0NGKkVnqqcltf9kH/gEHab36f4hDfDDX/BMSyI
         QQ0hVDIYNRUeYzPpQ58VlGruhskljulZ258wkYLumknUL4kzjg63VcOZyq+i+rxgZGoh
         w+INpWoV0FTmB4KMD2qezZgTUlm8szrPbdzxxWfVNxDsMf94aODA6UeKr9yVHLmCakJk
         PwjoXwR02Jkp5VFc69YozKc85oBFaKvWSnWON3GsUGyoIrr8PjcBv54aMiMUtqheqBlH
         e+FPVktchAEzURiiM+07+22cthRMHgK3kClmD1U7FTn6zSU0OZTqlziQXtyGy320+ZV0
         02NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951709; x=1795556509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSOzTuildzOc1Vsgs2eOA/FCbZ+NSuERw0qAipq6Ry0=;
        b=z3zlrhH0v+/wop6bDLravbc5I2iZaskGH20iMrGXwtIuB8nrzLxBR9dvDcFWak3p3c
         jlA5A7Aq9ShGzAYbtFqXtxuhYJ4uDvYTRdrXMVN6hxu7J4K2tdkycF+XGlfoZ6CXa5co
         y05eLF+5uJbcRtPws07b2eVMSOPERUNcQnSBMa+TL3O+McNEtZA0aa8X3eaADuKoskJ3
         xizF79nvJxkIjurlEpeTjwPldT609Ee733o5OCzNvWAVP1HCR1m2J99ElY2infEVpJl+
         8gij/PSDeTiWhqla1oeo8Psz+bvsY1PKu7GDqXEXwujO6buvCE+edmR1n3eYZVYKQ/Qa
         uPXg==
X-Gm-Message-State: APuU4Z9ZGAXksGaXZTH37I2QTuPAIhaoB10k75fMoZ8QywjU532g2P3S
	pGtN9I9ooE2Ns0ffPVICE5Rc3VY9up+XHfg62IplKR08KSYrPn+WNs9b
X-Gm-Gg: AZFdTZc/YRfSAbUqfh1NpnK+hmEHz50epS1owWZAhnJjehiJBpyOWEkeX2E50NfAbxt
	dgfUksVvP9VmyATpjKHJ3OO3teX+t0nBI6K4wT9l9Ruw2TWCkkr7KJxlxvXx09U7JeA8+QfJI/2
	x9rgmqKTpAkR5sxlfZ5KPknmExdD4D1huGmXHNhAQwMlXA6TgpRESsuMmlAD05r8aPu1zZWmioN
	Te4KwlejbRatzYVgJoqJaE9wLdnlYKt8HgjVtCFl+hhttgjgX6sEDnYte5iFpWpsqGOek+Oi9dF
	fGkdzaqxzJ2UO+BYC5RjJXUBQXmykSYBDLFypLLHAdRoF0jO12da0ajVoiIAphR2Er6hKtAIWUD
	M4aLD5lCLCTn9gwKm+fhqFcrYNLIM3Kd37D1qonRrSDocHXuVomdJFKSlvkEl2tmlgslw4WXId+
	92+6nqQazTO/2e3uUzUEcs0acFfF8n94nbLLwVbowot9ioNIq+qZE1qh9TvpKWKa9lll3tR9HUO
	cNnR2ek44DlEnqA1HFIdkc7B6Jro4NIpIX9AlSe+m2GnjEys0YwZFVwdDc8NijJlODDojLJwKTu
	2w7j3GdD7AiTPzRy3vECF0s2kyMTCWBtKzZLG1ClX35De7XRKT7Fm7GepW1l2FzddySCUuXj1D1
	ZZ3WgaXdY8VLpAjH2uzaWCEj7pqIXt3Pav76gmzBgbvUh1EU=
X-Received: by 2002:a05:6000:4705:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4a3771eeb83mr9286381f8f.21.1794951709112;
        Tue, 17 Nov 2026 13:41:49 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:48 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 3/4] MIPS: Octeon: flash: allocate the map per device
Date: Tue, 17 Nov 2026 21:41:40 +0000
Message-ID: <20261117214141.3826637-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117214141.3826637-1-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134151_109455_B0C64792 
X-CRM114-Status: GOOD (  19.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

octeon_flash_probe() fills in one static map_info for every "cfi-flash"
node it binds to, so a second chip select overwrites the phys, virt,
size and bank width of the first while that MTD device still uses the
map. A probe whose do_map_probe() finds no chip also keeps its
ioremap() mapping and still returns success.

Allocate the map with devm_kzalloc(), map it with devm_ioremap() and
fail the probe when no chip is found or the partitions cannot be
registered, so the mapping goes away with the device. mymtd was never
read; drop it.

The driver has no remove(), and the mapping is now device-managed: a
sysfs unbind would unmap the flash while its MTD device stays
registered. Set suppress_bind_attrs to rule that out.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v4: new. sashiko flagged the shared static flash_map against v2 and
    v3 of the next patch; v3 left it as it is in mainline, this fixes
    it first.

 arch/mips/cavium-octeon/flash_setup.c | 49 ++++++++++++++++-----------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 66d173b..0e5652f 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -18,8 +18,6 @@
 
 #include <asm/octeon/octeon.h>
 
-static struct map_info flash_map;
-static struct mtd_info *mymtd;
 static const char *part_probe_types[] = {
 	"cmdlinepart",
 #if IS_ENABLED(CONFIG_MTD_REDBOOT_PARTS)
@@ -71,6 +69,8 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 static int octeon_flash_probe(struct platform_device *pdev)
 {
 	union cvmx_mio_boot_reg_cfgx region_cfg;
+	struct map_info *map;
+	struct mtd_info *mtd;
 	u32 cs;
 	int r;
 	struct device_node *np = pdev->dev.of_node;
@@ -85,6 +85,9 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
+		if (!map)
+			return -ENOMEM;
 		/*
 		 * The bootloader always takes the flash and sets its
 		 * address so the entire flash fits below
@@ -94,26 +97,32 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		 * access 4MB.
 		 */
 		/* Use this name so old part lines work */
-		flash_map.name = "phys_mapped_flash";
-		flash_map.phys = region_cfg.s.base << 16;
-		flash_map.size = 0x1fc00000 - flash_map.phys;
+		map->name = "phys_mapped_flash";
+		map->phys = region_cfg.s.base << 16;
+		map->size = 0x1fc00000 - map->phys;
 		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
-		flash_map.bankwidth = region_cfg.s.width + 1;
-		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
+		map->bankwidth = region_cfg.s.width + 1;
+		map->virt = devm_ioremap(&pdev->dev, map->phys, map->size);
+		if (!map->virt)
+			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
-			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
-		mymtd = do_map_probe("cfi_probe", &flash_map);
-		if (mymtd) {
-			mymtd->owner = THIS_MODULE;
-			mtd_device_parse_register(mymtd, part_probe_types,
-						  NULL, NULL, 0);
-		} else {
+			  "0x%08llx\n", map->size >> 20, map->phys);
+		WARN_ON(!map_bankwidth_supported(map->bankwidth));
+		map->read = octeon_flash_map_read;
+		map->write = octeon_flash_map_write;
+		map->copy_from = octeon_flash_map_copy_from;
+		map->copy_to = octeon_flash_map_copy_to;
+		mtd = do_map_probe("cfi_probe", map);
+		if (!mtd) {
 			pr_err("Failed to register MTD device for flash\n");
+			return -ENXIO;
+		}
+		mtd->owner = THIS_MODULE;
+		r = mtd_device_parse_register(mtd, part_probe_types,
+					      NULL, NULL, 0);
+		if (r) {
+			map_destroy(mtd);
+			return r;
 		}
 	}
 	return 0;
@@ -131,6 +140,8 @@ static struct platform_driver of_flash_driver = {
 	.driver = {
 		.name = "octeon-of-flash",
 		.of_match_table = of_flash_match,
+		/* No remove(): the map and the MTD device stay registered */
+		.suppress_bind_attrs = true,
 	},
 	.probe		= octeon_flash_probe,
 };
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
