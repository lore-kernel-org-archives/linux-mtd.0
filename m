Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F44606A687
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=od9k7Fp7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUWur+aD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TIBp+MWt+rWDo0ooYUHvAwAnVVXPuyVBnMIAemHD6wg=; b=od9k7Fp722yyML2oIcDJ7wCTnP
	uk1pn10unnwjBQvjXd028Hrvjs18b8qNrhNG1VmrgSqmpWzxXUG1TQuJgT5tF1ZJrzGkKE39b9o2w
	hAdEyGNvtDbUJ1U7f4yqCLGxbIdyQzQZYyRGP8lGozreMJKXiJdIa9FhsS5b7lEFJrlqxlJN6n3UY
	H1H0/oovX5J9P1pVpvrbYaFVgvxphwC67ELGX/pqCrpTquHB2r9IWD4jMDaAXQHe4u/VUD1dFtoHT
	o26qBuvnKl3A6cXK3DOI7C0q3iT9Tgi1Qg4plK7rrtfAPRdyuFUuNZb69jTgUcuDkFQPxeyvlftkS
	NgwS4qCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVK1-0000000CT6o-3sYY;
	Thu, 26 Nov 2026 08:59:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVJy-0000000CT4V-0pHP
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 08:59:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3835045f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 00:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683552; x=1796288352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZeaCKjXj7rhQtKUY6dpSt9k3JcLhM/MuU5+xZ27Sxw=;
        b=oUWur+aDKv2q0Oljp8aFk4fSJ8/pt8MidQA1La6Gxe9V8INK1kJAd6f75wOjPPw0+x
         5no/KDIvRT0avcH5Riw0xC7eQNb499kXopig87GYR+ffThpzOnabRnr/xa/nLO8Z8AbO
         QGFWUM/uxTypq7z+C7BlVXddE6gjfK7MhihJHJbhKW22QzRNRJ433mufkMsf/6MTrpUH
         Zta+wFzNMc8kSoqyT/hzev981t0DBoOX3lT+7jXVh1RYkyXYARkNNRrNb47JOAAUnA/W
         EwEIuTDqnm7GBaENVQJ2ffiF8vndpOqhwhD2eP3y0BeEhpLKWG1p7PTHifI4NlVP0nkX
         IfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683552; x=1796288352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZeaCKjXj7rhQtKUY6dpSt9k3JcLhM/MuU5+xZ27Sxw=;
        b=AVEjT1sPMGmbODkzyTiIROYH7TszPMtP7DBmUbmhQIjHiB/SILikYtedG5ok9OEbma
         ArAsNvDd1obM/db1vtdzoXyHgK+UQocFmELEn5+/+V6ojRg0Vx2XkObMMF+JvpK6XqBM
         i9MA1aPE/c3czzWAu3HZPdp84ywQwPbiprRKE0+QQxqTp9kEN4zH/MyOIqEeCm1q4a02
         XGOn06kZpPX2y0xG+9oz/zh+swk0DRiMy0nOk0PVC3YEDus3ZRxXfNbGhmRagVNavEI2
         bC6YqL4YMV9CFLUtdImFxSbd2h09bhV2/jCrrGSxwA3zsjokLHNX621cU3SK52Odr0H8
         odig==
X-Gm-Message-State: APuU4Z/ntZ9szneQ/jDBTRm8IArEdM2cCOvHiHNeZQTjZsC2+MbFBcd5
	TMpJyhsHmkUXWo2JLaOAr5KUM+SVCe2ViFkWAac24FDVLzIFnNuGxUU7
X-Gm-Gg: AZFdTZerikzBGGJ+F0Ch18AShTFGI5LycDTf2QMuEr2K+Ao9UVcTm7aruvhF0N2p6hi
	2VsrQMy6AtVlTRyRrqCBTuVTUxbI43LfYMR2xcoztijYJtt9s3kutKOp/hdX4o/qhKn1Ht0MlB0
	RdwP3Ntf6NvqTNTqXcqTsjP75RFQYZjkilAHri5CGWbtNvzBbAAKKKb54Z6AYyK+0hZZCSrQ2JX
	VRpB6xwSDBQwbGp7DG7CF897jOmVdbmwj61Aov9KY6JgdV7uDziHsOTfsBMiD2wOadKlCkoS3+L
	zQNxLQ0QmAvS9N07hs2aH6bBzpmClrptfpp5x8pPLEzKoZbDsjGAlpmZyDiIY6QlxryA/xipAWv
	UxoT3AMtTQuAqWWN2UkLfZDr1boKBmjhC4SLqnGZ1zjsPbUSx8lgN+X/dKZQQLZ+wvDfxvQt+Ht
	mbKPzIrJ8xLkFI0F1++t85AkmQ3YotpfEdaFUjuq78nmmX0px+ny2u1B/qmF95ZfFgX4Dd/Anng
	7nTdMuHdLC9CkYCzmm461v0CP4pkkkqS5mUfPVngAUWvACPeoBRP3qFDNubtKmJjbX+ewbLuXHs
	AJ25U6QnZpamAs1d6wj4Gb0lGAKnfPK+dgSVE0n1eOz71wObTGn56Q==
X-Received: by 2002:a5d:64c8:0:b0:493:c0a:507d with SMTP id ffacd0b85a97d-4abaab633c7mr44200123f8f.1.1795683552059;
        Thu, 26 Nov 2026 00:59:12 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:11 -0800 (PST)
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
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 3/4] MIPS: Octeon: flash: allocate the map per device
Date: Thu, 26 Nov 2026 08:59:05 +0000
Message-ID: <20261126085906.814373-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com>
References: <20261126085906.814373-1-orgads@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005914_259605_328AD493 
X-CRM114-Status: GOOD (  19.62  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
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

Fixes: 7f481716bc90 ("MIPS: OCTEON: Use device tree to probe for flash chips.")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v5: add the Fixes tag (sashiko); join the split pr_notice() string.
v4: new. sashiko flagged the shared static flash_map against v2 and
    v3 of the next patch; v3 left it as it is in mainline, this fixes
    it first.


 arch/mips/cavium-octeon/flash_setup.c | 51 ++++++++++++++++-----------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 66d173b57..d69249acf 100644
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
-		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
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
+		map->bankwidth = region_cfg.s.width + 1;
+		map->virt = devm_ioremap(&pdev->dev, map->phys, map->size);
+		if (!map->virt)
+			return -ENOMEM;
+		pr_notice("Bootbus flash: Setting flash for %luMB flash at 0x%08llx\n",
+			  map->size >> 20, map->phys);
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
