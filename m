Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DBAEE6B74
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Feb 2026 07:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zfrTqOSUG7AD+lakq500tzmKNF21DsNTmAF+QN+Ny/E=; b=mO9J26SiYVikGg
	cROvERRJxBLjdUoVjp9fFMhVElqUtTQdLegeCfdAgpH1DsXqr6Cl3sTy66D0H8Q807rkbIyXEI7FJ
	GCLw6GoGJ3LOeAJD+iV1tVNeV0pCYMM+PCH6GuqJtVMA1c/DHq4db8D9LcpsEjPoTN+/+Re6S/Oh1
	B9Whujjh5fp/5CbW33Hi5SifNc2nMWTU3aOEknlDT85BHVbC1N+DGKqxCiGOUrbdwtWpIJhQSOIW4
	tGb/3+IYi4rJaI1IsKUpbDkx9tLnLKW0ITjg+nZ/t6x5Pt8nq0zG55g4QLJAZSlg/ISuzdFNyT09Q
	4eQrWXUQJAlkbvyjWrTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vocMS-0000000CCFV-0CNT;
	Sat, 07 Feb 2026 07:04:08 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vocMO-0000000CCF4-2J9L
	for linux-mtd@lists.infradead.org;
	Sat, 07 Feb 2026 07:04:06 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-823075fed75so1706905b3a.1
        for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2026 23:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770447843; x=1771052643; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09LJ83o11Ex+v61x2aS+6WHjo6AYzF1e7mZQxiT7CPg=;
        b=mLbohfi1vh3eESZRGsE+8YKGHttTSsj/c9e+QQJswEmPZJZ+UdeHuvCHldUtBVQxQu
         f3YMEv6taO+itMuKmJ0BbHSWmA6c5zrBy9GNky3/jkLo7S6a1c+wtvE74DDdOlX0B79B
         Ty9hwDT2CxGJR5ILLEKHzL0CKHUpRMwlz3AtjAysNE5K0r8E4jq2zvXtNMKK0/dvSpnf
         g5chlpif1l0775bb0NW05DJKF/5sBAAUC1x+QkemBWGjKCe1DT5OOmT26oLe0dhZuiZ3
         kUO1GdRU+dt49Y71NOK+8PtrBH3YiOusaRm0Ue9yEqV7SaCUBy+ZitgEZ4Lx9ZpvZE6k
         UHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770447843; x=1771052643;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09LJ83o11Ex+v61x2aS+6WHjo6AYzF1e7mZQxiT7CPg=;
        b=a6dihZ5q/d9udm2AS8Al2T7X6e57C9V3prhz1BrCi6C0eXod0TmlXTQJxMkFCGOhyA
         EWuDx8vBvitI6q+pQ4c9T+y2JbjSLgfsiv1ck79tA8umsXlK6tkf0d/ErTQQlf648dkD
         rx2PyGHAF9FGWRA/x2AgkshX93tPVm6numx6zrqsNFQMWIrmZlXr16ufhdOyUw65UITs
         VaMi3x0gzq2qzKs0d5G/ymmFIpTsDn20fSOJLiDnV0GxdWuiQqM8T5rdlQ0oOcv4fi6L
         RujhZr4XmSMLWQxdvw6+VXFKQa1whsf2gYVoaKQJnSlqiYsE2pljopCzODm8ro79ontc
         GRew==
X-Forwarded-Encrypted: i=1; AJvYcCUnbB/707ZuRyTkpExOfPhNEIvBNrofoDRtIuu5qKfEXLCSMBn+sMetnu315DUa/JfA4yVaOtqQaNo=@lists.infradead.org
X-Gm-Message-State: AOJu0YynEP6hP7oRShaMZ3gskUsYOWjwR+2f6GEj1bcaQ7abWECjBRxK
	b7xxY+6CzdZ0CI6qqKwtbmF7Dd5s4jwoFZ+gf948PKhN8sWaTVvJhN+N
X-Gm-Gg: AZuq6aKNazUtwFaCyaOtvoDQ5hF9I8nJtQtaxWj2jFivZoNFG9ndxUyOk05jJNPikdV
	F31goeacK84KWz8G/rD0E50p+/P39jrRXdRJ16v7ZfoZDSwWUJgKBaHLTwGQdrPDXuPQDXlhcKY
	OBe87Fygs+CFqlzBaHxWkgDc8Dig2GM5OawLtdPCEqrXyAl7Z2Z90GX9GqZLt91clZm2oOsUgMZ
	lNxxAM4XugcJOi/a6/GIFLU2xlrSLDgEGDtoNJPQ32Aa221znKL6yjdHoceUvaXRwKuidirNUKw
	WG8/B0lu0fNW9qy6+i6zQobkj9468Usnv23i89XvO1yb7Ah2FNZDm0pG3PiU6ssWcrkIzRKN4C/
	NzUl53D08KXoOZ6ecSKsE0zD7myQDAZuc6g92YcOtQfCp7zaocIdsQWtYUbePpNMXTqfaDeqnFY
	DzzD+q4FvBazbOezzS+yurq44PI8w/soiubltahTs=
X-Received: by 2002:a05:6a00:228c:b0:822:69b2:7ed0 with SMTP id d2e1a72fcca58-82440c1d429mr5231599b3a.6.1770447843215;
        Fri, 06 Feb 2026 23:04:03 -0800 (PST)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b60easm4250622b3a.55.2026.02.06.23.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 23:04:02 -0800 (PST)
Date: Sat, 7 Feb 2026 11:02:43 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Miquel@desktop-tit0j8o.localdomain, Raynal@desktop-tit0j8o.localdomain,
	miquel.raynal@bootlin.com, Richard@desktop-tit0j8o.localdomain,
	Weinberger@desktop-tit0j8o.localdomain, richard@nod.at,
	Vignesh@desktop-tit0j8o.localdomain,
	Raghavendra@desktop-tit0j8o.localdomain, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>, naseefkm@gmail.com
Subject: [PATCH v2] mtd: nand: realtek-ecc: relax OOB size check to minimum
Message-ID: <aYbjk7vRA/gMZPSx@DESKTOP-TIT0J8O.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_230405_224451_34F6848B 
X-CRM114-Status: GOOD (  17.48  )
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

Suggested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
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

Changes in v2:
  - Reorder Suggested-by before Signed-off-by
  - Update driver comment per Markus's review

 drivers/mtd/nand/ecc-realtek.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/ecc-realtek.c b/drivers/mtd/nand/ecc-realtek.c
index 0046da37e..7d003fd72 100644
--- a/drivers/mtd/nand/ecc-realtek.c
+++ b/drivers/mtd/nand/ecc-realtek.c
@@ -17,10 +17,12 @@
  * - BCH12 : Generate 20 ECC bytes from 512 data bytes plus 6 free bytes
  *
  * It can run for arbitrary NAND flash chips with different block and OOB sizes. Currently there
- * are only two known devices in the wild that have NAND flash and make use of this ECC engine
- * (Linksys LGS328C & LGS352C). To keep compatibility with vendor firmware, new modes can only
- * be added when new data layouts have been analyzed. For now allow BCH6 on flash with 2048 byte
- * blocks and 64 bytes oob.
+ * are a few known devices in the wild that make use of this ECC engine
+ * (Linksys LGS328C, LGS352C & Netlink HG323DAC). To keep compatibility with vendor firmware,
+ * new modes can only be added when new data layouts have been analyzed. For now allow BCH6 on
+ * flash with 2048 byte blocks and at least 64 bytes oob. Some vendors make use of
+ * 128 bytes OOB NAND chips (e.g. Macronix MX35LF1G24AD) but only use BCH6 and thus the first
+ * 64 bytes of the OOB area. In this case the engine leaves any extra bytes unused.
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
