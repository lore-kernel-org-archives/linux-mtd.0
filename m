Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF29C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RByloyOVzuLyX20s3d3YdA/d7Ag1W/aPW4bkFUJJiIU=; b=S7QmKimKNGj7iz
	tF/met0OgY+Z6gcVyaVpiS7J2Qc01EfILOwMOYvvkuHuYb3MTfzxyg0n4/Uc2VkcO3KBZizst/FUI
	55OMT1YwFRZZkNwtLhRzw0Imc7wVWqjZEcJgfdH9wB8Z2aiShvoeqxn/NEl0CL1Vc4YSX907Xjiy/
	RTgEIc2rB2IO7fvW9e86awnD/hOdCbtUh7sRpgWmsZChbzbeXIrUxhKeVaqfQF+rPB2d0paGhRZhP
	NMAjussudGs6ztbPbYthzVNc8yi3e+78GLlRaTdcPVtHYteNU7loe+ZF6ehnj1QZqMpMa1W7U+9cJ
	/zvkWZ+osv6UYiC7egYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5SdC-0008P5-Lg; Thu, 06 Jan 2022 13:16:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5Scx-0008Lx-9m
 for linux-mtd@lists.infradead.org; Thu, 06 Jan 2022 13:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1641474983; x=1673010983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BXPzbPZ/ssF/48ZYAhIwqGMu3Se1bRG4usRlYmMMhRg=;
 b=xQCnnkfihKfTLiVkUdpB5FpYVhT1i4CI31RBbmGIQXsAwNdxY//v7rBH
 R8z8ljBIUzko07l4KZp80CM70YyA6rkoy9N7/QGOsdeLD4HVt4NGGpDEj
 etLCITi5aFXdVX7PrqAQLs4lSIkWaBm/G8KQ2blMw0laGaO9/nPJH3ai1
 QVDTHeMqxPPOZhVQ9YpBrpJgWCh9BAO+lpqmNj3qqFO+2eweZUq2Ysdqs
 i0FnfWdktMADMKwj66nYbNMYXQ8+io2GbnE5MzwEv0f5jl5XHxXqv++iq
 napqUBPM7osySaQH/RzF2MBUCcdA41+10evJK1Uo7i1m3NmS2vbz0trGo g==;
IronPort-SDR: zo+Z4pvVkCG8YGhrKky4RA9DFgsIEvjH0c7Mtuu0ls5+9fXtcY343jHhwjabI/2S1jsXyy99U/
 /PwRDB6PtrWJSxy79+4OoNF27k1OhwyhkxRrqtFKnmiUlMGeUgk/fHsoAJO4rXbbw5zIStrroN
 /7CwbteL5cJqT4nmCVaGAEwv8aAIJ+s1AoOZN132xwUgyT9nZNGImpt776A7NV+HlvhRo6be62
 8HfWU1JfRDlRLOeR0gMXvNUZYCS5Cao9SewKtpUtgvO7eGEvbZEZEtgqiujKxXx5U+n+g9SBvJ
 gZHYfeTE4hFuUtMVxOhq9PZw
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="148757598"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jan 2022 06:16:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 6 Jan 2022 06:16:22 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 6 Jan 2022 06:16:20 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 2/2] mtd: rawnand: Rework of_get_nand_bus_width()
Date: Thu, 6 Jan 2022 15:16:10 +0200
Message-ID: <20220106131610.225661-2-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106131610.225661-1-tudor.ambarus@microchip.com>
References: <20220106131610.225661-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_051623_386168_097A24AD 
X-CRM114-Status: GOOD (  13.33  )
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

of_get_nand_bus_width() had a wrong behavior because:
1/ it ignored the -ENODATA and -EOVERFLOW return values of
   of_property_read_u32(). "nand-bus-width" without value was tolerated
   while it shouldn't have been according to the devicetree bindings.
2/ returned -EIO when the nand-bus-width was neither 8 nor 16, when it
   should have returned -EINVAL instead.
3/ returned the 8 or 16 bus-width integer, but it was never used it its
   caller. A simply return 0 on success is enough.
Rework of_get_nand_bus_width() and address all the above. The execution
is now stopped in case of errors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/nand_base.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index b8e7f1aae032..54153d7aa671 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5271,20 +5271,24 @@ static void of_get_nand_ecc_legacy_user_config(struct nand_chip *chip)
 		user_conf->placement = of_get_rawnand_ecc_placement_legacy(dn);
 }
 
-static int of_get_nand_bus_width(struct device_node *np)
+static int of_get_nand_bus_width(struct nand_chip *chip)
 {
+	struct device_node *dn = nand_get_flash_node(chip);
 	u32 val;
+	int ret;
 
-	if (of_property_read_u32(np, "nand-bus-width", &val))
-		return 8;
+	ret = of_property_read_u32(dn, "nand-bus-width", &val);
+	if (ret == -EINVAL)
+		/* Buswidth defaults to 8 if the property does not exist .*/
+		return 0;
+	else if (ret)
+		return ret;
 
-	switch (val) {
-	case 8:
-	case 16:
-		return val;
-	default:
-		return -EIO;
-	}
+	if (val == 16)
+		chip->options |= NAND_BUSWIDTH_16;
+	else if (val != 8)
+		return -EINVAL;
+	return 0;
 }
 
 static int of_get_nand_secure_regions(struct nand_chip *chip)
@@ -5360,12 +5364,14 @@ static int rawnand_dt_init(struct nand_chip *chip)
 {
 	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
 	struct device_node *dn = nand_get_flash_node(chip);
+	int ret;
 
 	if (!dn)
 		return 0;
 
-	if (of_get_nand_bus_width(dn) == 16)
-		chip->options |= NAND_BUSWIDTH_16;
+	ret = of_get_nand_bus_width(chip);
+	if (ret)
+		return ret;
 
 	if (of_property_read_bool(dn, "nand-is-boot-medium"))
 		chip->options |= NAND_IS_BOOT_MEDIUM;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
