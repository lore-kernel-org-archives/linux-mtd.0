Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADEA3CA1015
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KFacU2J+RQ+oV+xq+LgopwX30+VpN06vJXxZwMrgnXY=; b=YBF7bbTCCZglx+
	/yhiGoUhyRnqYGqgl58WIQxFp6j5ppb/o1SM/SWpP5AEynGHfyM8GyzBDmMbEctL7C1ydRtCb5Dq6
	xjzH/6g81gCz5wL7vr0ghDUOU3mUP25R0ewnAT6s2IjhVuKftgPe2yE475a5Wd/+Fty3012coATYE
	4Mm3Xok2MyPYDRaxPJeEFWL5YU27m20vT/dHtLi0WMWz/8GhPfC0ILDkWpIwkFfPpasxyDTKQzqbp
	v1BuKFHY+xCYIoL0R+ihUCmYZP53AkmsfN3H/UqnRS6WUZuR8y+6O+v186rkYh42b8o0SBpsblpQB
	5c0mRAAk5neyGBAhIcnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkT-0000000Dac8-0x4y;
	Thu, 04 Sep 2025 18:31:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9gQ-0000000Bm6g-1GK3
	for linux-mtd@bombadil.infradead.org;
	Thu, 04 Sep 2025 13:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DP4qZtk1DcVv6qfxjLNwYcMGyE7GJY35dO9FeCIUSGo=; b=USSTPTiZGDXH4OzuXKvRKQsQxj
	8fwFU3W//X029gLb2GImsoKVivKJrkjtdFVE7k+wxZOcArqYZdcsHvOBirckZYHM3HU6ffyy/HoUH
	DuzutIk1NiQ0BbxeerD9JFFpL3iRqnshQddsm+ahBt6XOpZCLQc/uFSWiWMgRS/96ZDetXW9xmAAt
	KjxnRNYi7kaHyLNiXB69/PQcucwhdMOqixZiG29ZnNx0+NYzK6Nn48btr9n96msamuYipGffFaoyV
	oZuT9+L2OAbtyJA3MNDtT/jmOVktXZssc/YQU/q0rrxnlvgLg8yvRm4ySVs5TbR1SDRN88/lh/apv
	bZDIxfZg==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9gM-00000001DiJ-0wXC
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 13:07:21 +0000
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8Dxfb_2jrloUqwGAA--.12953S3;
	Thu, 04 Sep 2025 21:07:02 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJCxocLpjrlofA5+AA--.2906S5;
	Thu, 04 Sep 2025 21:07:01 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v4 3/7] mtd: rawnand: loongson: Add nand chip select support
Date: Thu,  4 Sep 2025 21:06:35 +0800
Message-ID: <1664ba1c55d84b4d383ec42ca159a6a1016b9bff.1756991031.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1756991031.git.zhoubinbin@loongson.cn>
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJCxocLpjrlofA5+AA--.2906S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Ar1kJF15Xw1rGFyUuryDJwc_yoW7AFyxpa
	y5Aw4fKrnYkF4Uur1DKFs5Cr1Yy3yrJrW7GFZ2v34S93sxtw1UWF15CFyaqrWFkw1UKwnx
	Zw40gaykCF1UWrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x
	0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07URBT5UUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140719_490864_EACE9578 
X-CRM114-Status: GOOD (  14.19  )
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

The page address register describes the page address of the starting
address for NAND read/write/erase operations.

According to the manual, it consists of two parts:
	{chip select, page number}

The `chip select` is fixed at 2 bits, and the `page number` is
determined based on the actual capacity of the single-chip memory.
Therefore we need to determine the `chip select` bits base on the `page
number`.

For example, for a 1GB capacity chip (2K page size), it has 1M pages.
Thus, [19:0] is used to represent the page number, and [21:20]
represents the chip select.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../mtd/nand/raw/loongson-nand-controller.c   | 116 ++++++++++++++----
 1 file changed, 90 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 97cd566420a8..1427dd6943a7 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -82,6 +82,7 @@ struct loongson_nand_data {
 	unsigned int op_scope_field;
 	unsigned int hold_cycle;
 	unsigned int wait_cycle;
+	unsigned int nand_cs;
 	void (*set_addr)(struct loongson_nand_host *host, struct loongson_nand_op *op);
 };
 
@@ -90,6 +91,7 @@ struct loongson_nand_host {
 	struct nand_chip chip;
 	struct nand_controller controller;
 	const struct loongson_nand_data *data;
+	unsigned int addr_cs_field;
 	void __iomem *reg_base;
 	struct regmap *regmap;
 	/* DMA Engine stuff */
@@ -215,6 +217,26 @@ static int loongson_nand_parse_instructions(struct nand_chip *chip, const struct
 	return 0;
 }
 
+static void loongson_nand_set_addr_cs(struct loongson_nand_host *host)
+{
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+
+	if (!host->data->nand_cs)
+		return;
+
+	/*
+	 * The Manufacturer/Chip ID read operation precedes attach_chip, at which point
+	 * information such as NAND chip selection and capacity is unknown. As a
+	 * workaround, we use 128MB cellsize (2KB pagesize) as a fallback.
+	 */
+	if (!mtd->writesize)
+		host->addr_cs_field = GENMASK(17, 16);
+
+	regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, host->addr_cs_field,
+			   host->data->nand_cs << __ffs(host->addr_cs_field));
+}
+
 static void ls1b_nand_set_addr(struct loongson_nand_host *host, struct loongson_nand_op *op)
 {
 	struct nand_chip *chip = &host->chip;
@@ -263,6 +285,8 @@ static void ls1c_nand_set_addr(struct loongson_nand_host *host, struct loongson_
 			regmap_update_bits(host->regmap, LOONGSON_NAND_ADDR2, mask, val);
 		}
 	}
+
+	loongson_nand_set_addr_cs(host);
 }
 
 static void loongson_nand_trigger_op(struct loongson_nand_host *host, struct loongson_nand_op *op)
@@ -603,42 +627,82 @@ static int loongson_nand_exec_op(struct nand_chip *chip, const struct nand_opera
 	return nand_op_parser_exec_op(chip, &loongson_nand_op_parser, op, check_only);
 }
 
-static int loongson_nand_attach_chip(struct nand_chip *chip)
+static int loongson_nand_get_chip_capacity(struct nand_chip *chip)
 {
 	struct loongson_nand_host *host = nand_get_controller_data(chip);
 	u64 chipsize = nanddev_target_size(&chip->base);
-	int cell_size = 0;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 
-	switch (chipsize) {
-	case SZ_128M:
-		cell_size = 0x0;
-		break;
-	case SZ_256M:
-		cell_size = 0x1;
-		break;
-	case SZ_512M:
-		cell_size = 0x2;
-		break;
-	case SZ_1G:
-		cell_size = 0x3;
-		break;
-	case SZ_2G:
-		cell_size = 0x4;
+	switch (mtd->writesize) {
+	case SZ_512:
+		switch (chipsize) {
+		case SZ_8M:
+			host->addr_cs_field = GENMASK(15, 14);
+			return 0x9;
+		case SZ_16M:
+			host->addr_cs_field = GENMASK(16, 15);
+			return 0xa;
+		case SZ_32M:
+			host->addr_cs_field = GENMASK(17, 16);
+			return 0xb;
+		case SZ_64M:
+			host->addr_cs_field = GENMASK(18, 17);
+			return 0xc;
+		case SZ_128M:
+			host->addr_cs_field = GENMASK(19, 18);
+			return 0xd;
+		}
 		break;
-	case SZ_4G:
-		cell_size = 0x5;
+	case SZ_2K:
+		switch (chipsize) {
+		case SZ_128M:
+			host->addr_cs_field = GENMASK(17, 16);
+			return 0x0;
+		case SZ_256M:
+			host->addr_cs_field = GENMASK(18, 17);
+			return 0x1;
+		case SZ_512M:
+			host->addr_cs_field = GENMASK(19, 18);
+			return 0x2;
+		case SZ_1G:
+			host->addr_cs_field = GENMASK(20, 19);
+			return 0x3;
+		}
 		break;
-	case SZ_8G:
-		cell_size = 0x6;
+	case SZ_4K:
+		if (chipsize == SZ_2G) {
+			host->addr_cs_field = GENMASK(20, 19);
+			return 0x4;
+		}
 		break;
-	case SZ_16G:
-		cell_size = 0x7;
+	case SZ_8K:
+		switch (chipsize) {
+		case SZ_4G:
+			host->addr_cs_field = GENMASK(20, 19);
+			return 0x5;
+		case SZ_8G:
+			host->addr_cs_field = GENMASK(21, 20);
+			return 0x6;
+		case SZ_16G:
+			host->addr_cs_field = GENMASK(22, 21);
+			return 0x7;
+		}
 		break;
-	default:
-		dev_err(host->dev, "unsupported chip size: %llu MB\n", chipsize);
-		return -EINVAL;
 	}
 
+	dev_err(host->dev, "Unsupported chip size: %llu MB with page size %u B\n",
+		chipsize, mtd->writesize);
+	return -EINVAL;
+}
+
+static int loongson_nand_attach_chip(struct nand_chip *chip)
+{
+	struct loongson_nand_host *host = nand_get_controller_data(chip);
+	int cell_size = loongson_nand_get_chip_capacity(chip);
+
+	if (cell_size < 0)
+		return cell_size;
+
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_NONE:
 		break;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
