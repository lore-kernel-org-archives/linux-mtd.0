Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF283EE208E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 10:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jkQhdXfmr4XL+ZiBF+Ger/FHHSBqOm1mczbFPopR+k4=; b=YAU0tg9Lat4RBq
	AzvQ03BAw8zryv0nzq/xFP0PXQdl0kj0MKLmJ0nt0PTvtQsNk/8HwfjPUKiWsQqe3FuHiYE8uw5Q2
	uObSwnunf1bswEBv3BJc81z3vQk/o7SXFJbVss2ReBf/727xOHQzToJwXbWnls9uRSMe1K9iPNEr0
	18wBjNXJFxVSiYjLxK+R4MtwzU+gdc97452w1Jsw9XDHuNYsvE68dA4agrZIjGKTP5UecNbA7o1VN
	BLh7v7dwPEfP5DxYRjgTDrqS/xO38OWJqSzcrPdoaIuKuqTflxWTgky8c3Y8aD9xUvNorzpnijiYp
	U7gMMEE/bLANkSEs5zVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJYQ-0000000BCnT-0P7k;
	Fri, 06 Feb 2026 10:59:14 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJYL-0000000BCmo-2Kto
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 10:59:12 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso227170a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2026 02:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375548; x=1770980348; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQwt5IqIkOZZ+qzQveJ8TG5nKHMAOt9DhTdseZr0Ibs=;
        b=V3y8RX/1tTYRDPcNccJWN8S6k6Zw9VuOgZ1oEPSXelCqJCx2B3zFxF/28egbAcy7X7
         oGpDroI9dTXgJN1E/vgJUXk3CbXJ8YlbdUGCz6Tw8nxApaqxxU8iZxc4Nu3ltFOLBUJ8
         TfAZwXub+ZwZD4ZwCY0Z/8ObO2mhZGPT38ULXMm5qX9cnJkE4VujDYOJFN5E/A8C+pVF
         Oa3EFcsqs/mtS2E+6CpA+79idETdnzu5t+3cSQ6tEfd1Yp3jeORxovclCFDxJrtQmlkZ
         gZH69GX+hVirKesvYG8WmDDfcA7Bd+ZB5L2x5I6NSJe2A3/izyKsFH7c4nMasgZTxQ2D
         cK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375548; x=1770980348;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQwt5IqIkOZZ+qzQveJ8TG5nKHMAOt9DhTdseZr0Ibs=;
        b=S7Ysfkw6+TOwtYtHIPwk4+mxb/75iiOA3VL/X01cLxNQbqShVNO7c5ag4iJJskZ9LI
         pTD6MQyIGUY1+cYvtFCyVPvzVWSQfnwC8COKCi+z2ureC9xtg5WgpDCmwLfR2xgD748p
         TMyn2TIPr4wV04DPOxi72PSRVMUVSKOEuLXvr5ciiPgUuA4djdehGvhUx/VZRzL58wqc
         cG17nXb0+u5FlGop67fQCi5L+gGgqh1wIUakctNv8aPhXFDoslzbovAv/FgWCUNJJ4Pg
         jFQkXLmRfffBj2xqxO12L0B0b40uqYmZCIMbVoiobzIsOMKAscrHP9JMa0mL5x1QJfv5
         IVKg==
X-Forwarded-Encrypted: i=1; AJvYcCWE5AM5XmqmVwU/+8Y0PYoK0m6N/ljt0hGtG+P8NPLine5w2/ZWrk07wYoDkLF4gBS2+RO5GsQO7Gg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSsjdsnPIIybL14iHoUSnCcyHSFrYQ5sQLPzHrw9WrQQONdmlA
	MPo/f6kt6mOTgCgN8noYuQGqGNNWhumIU5ItTZm275mxZTW/rnJj5SFL
X-Gm-Gg: AZuq6aKXF9iKY0CHpez0PYNJMFT8+dV6EyxXSEZMjjPrSPeBIr8I8bIzRxjlrLYDwMU
	MamlVsAkkd2Q/0usaPIvEbklkB07EXy0oIJAux8kD9cYERLWS7gT0+VNagUmbr9Tr7hKXiTWP5K
	7lPAc5PZ9xShgr+e3/vKsn3YJQV4akI9iMuc3zrh3uyThA3GVRAF8ycm4UdzFtesAPfrsSKUfFK
	1HNgP2cJpo6HcYy5J/szXTW5mzWOErubBPgX+iaLKAMYKtjrticwKS4Cjw/tVU74n6+p4XwiYk5
	kfLOgJX4xM1XSEIBihDo5pOUUD98h7bLMPWN/QW82zFouspyhUwmn8t4fET26ldUg8VW+QgI37p
	KDusM6pGxYM6TtxlXIrMtCrtLnLnuPU++XvcKD1PQyG6ehhIAg1KOtjk574aa8NgmZttLmZMMed
	wRtsvhmAhhWONrnPX8DNi/ewtNqCvYPECWNKfEkH0=
X-Received: by 2002:a17:90b:5746:b0:34c:6124:3616 with SMTP id 98e67ed59e1d1-354b3e460f2mr1983693a91.27.1770375548025;
        Fri, 06 Feb 2026 02:59:08 -0800 (PST)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3549c0bf8bbsm5093870a91.7.2026.02.06.02.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:59:07 -0800 (PST)
Date: Fri, 6 Feb 2026 14:57:54 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	markus.stockhausen@gmx.de, naseefkm@gmail.com
Subject: [PATCH] mtd: nand: realtek-ecc: relax OOB size check to minimum
Message-ID: <aYXJMtouDgjBNIVh@DESKTOP-TIT0J8O.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_025909_622931_8D76ABB8 
X-CRM114-Status: GOOD (  17.12  )
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

The ECC engine strictly validates that flash OOB size equals exactly
64 bytes. However, some NAND chips have a larger physical OOB while
vendor firmware only uses the first 64 bytes for the ECC layout. For
example the Macronix MX35LF1G24AD found in the Netlink HG323DAC has
128 byte physical OOB but vendor firmware only uses the first 64
bytes (24 bytes free + 40 bytes BCH6 parity), leaving bytes 64-127
unused.

Since the engine only operates on the first 64 bytes of OOB
regardless of the physical size, change the check from exact match
to minimum size. Flash with OOB >= 64 bytes works correctly with
the engine's 64-byte layout.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
Suggested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
On the Netlink HG323DAC with the Macronix MX35LF1G24AD (ID: 0xc2,
0x14), the Realtek ECC engine probe fails with:

  spi-nand spi0.0: Macronix SPI NAND was found.
  spi-nand spi0.0: 128 MiB, block size: 128 KiB, page size: 2048, OOB size: 128
  rtl-nand-ecc-engine 1801a600.ecc: only flash geometry data=2048, oob=64 supported
  nand: No suitable ECC configuration
  spi-nand spi0.0: probe with driver spi-nand failed with error -22

The chip has 128 bytes of physical OOB but the OEM firmware only uses
64 bytes (24 free + 40 BCH6 parity). The OEM bootlog confirms:

  nand: device found, Manufacturer ID: 0xc2, Chip ID: 0x14
  nand: Macronix
  nand: 128MiB, SLC, page size: 2048, OOB size: 64

The rtl9607c GPL sources have no specific entry for chip ID 0x14 in
the Macronix SPI NAND table and fall back to the default 64-byte
spare configuration with BCH6 ECC.

I verified this by booting an OpenWrt initramfs with the ECC engine
disabled and inspecting raw OOB via nanddump --noecc --oob. Both
the env and kernel partitions confirm the OEM layout uses only the
first 64 bytes:

  - OOB[0:23]:   24 bytes free  (4 steps x 6 bytes)
  - OOB[24:63]:  40 bytes BCH6 parity (4 steps x 10 bytes)
  - OOB[64:127]: unused (all 0xFF)

This matches the engine's expected format exactly. Since the engine
only operates on the first 64 bytes, the relaxation from exact match
to minimum size is safe for any flash with OOB >= 64.

 drivers/mtd/nand/ecc-realtek.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/ecc-realtek.c b/drivers/mtd/nand/ecc-realtek.c
index 0046da37e..9e2d15252 100644
--- a/drivers/mtd/nand/ecc-realtek.c
+++ b/drivers/mtd/nand/ecc-realtek.c
@@ -20,7 +20,9 @@
  * are only two known devices in the wild that have NAND flash and make use of this ECC engine
  * (Linksys LGS328C & LGS352C). To keep compatibility with vendor firmware, new modes can only
  * be added when new data layouts have been analyzed. For now allow BCH6 on flash with 2048 byte
- * blocks and 64 bytes oob.
+ * blocks and at least 64 bytes oob. Some NAND chips (e.g. Macronix MX35LF1G24AD) have a
+ * physical OOB size of 128 bytes but vendor firmware only uses the first 64 bytes for the ECC
+ * layout. The engine operates on the first 64 bytes of OOB only; any extra bytes are unused.
  *
  * This driver aligns with kernel ECC naming conventions. Neverthless a short notice on the
  * Realtek naming conventions for the different structures in the OOB area.
@@ -39,7 +41,7 @@
  */
 
 #define RTL_ECC_ALLOWED_PAGE_SIZE 	2048
-#define RTL_ECC_ALLOWED_OOB_SIZE	64
+#define RTL_ECC_ALLOWED_MIN_OOB_SIZE	64
 #define RTL_ECC_ALLOWED_STRENGTH	6
 
 #define RTL_ECC_BLOCK_SIZE 		512
@@ -310,10 +312,10 @@ static int rtl_ecc_check_support(struct nand_device *nand)
 	struct mtd_info *mtd = nanddev_to_mtd(nand);
 	struct device *dev = nand->ecc.engine->dev;
 
-	if (mtd->oobsize != RTL_ECC_ALLOWED_OOB_SIZE ||
+	if (mtd->oobsize < RTL_ECC_ALLOWED_MIN_OOB_SIZE ||
 	    mtd->writesize != RTL_ECC_ALLOWED_PAGE_SIZE) {
-		dev_err(dev, "only flash geometry data=%d, oob=%d supported\n",
-			RTL_ECC_ALLOWED_PAGE_SIZE, RTL_ECC_ALLOWED_OOB_SIZE);
+		dev_err(dev, "only flash geometry data=%d, oob>=%d supported\n",
+			RTL_ECC_ALLOWED_PAGE_SIZE, RTL_ECC_ALLOWED_MIN_OOB_SIZE);
 		return -EINVAL;
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
