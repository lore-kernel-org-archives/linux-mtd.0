Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9590C87FC8
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jul 2025 09:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYs+wm0wuYjev2JB7/ylRUHLZOA0qCIMhNUdoxmD9Bo=; b=K1xU1uwR36hyNi
	SqVrQ8PiObzjrwNtILeUVDBVMpWnKemGwlw5cjXsR0VFEnHKiZD3kEciqk/xzpCJ2/aw5UMp/fIM9
	7Dr4f+IrQ5jsxmIwB1/2gIFFoQ3vKz9Rb8nerAY5qIf0JmXEmHv5Bcb8eo5Xy+1FaJtrfNk5TCZd6
	C7JnQn2Ov5jy5DWDiXT2+VISBrBRWTYkZsJpRX73TmcZvyxDE5qUomIeKjYVOOdHMjSvyAFE+92lI
	5PBUdd2dm9rMPgwCb34fjFpw94F3o7wt2/xFhzADCJrzAMdO3N0dTLDnOkgIPiSvuz8ABrdaf2qlF
	QPQLoz0VX4BY7q3IbdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9CC-00000001zWR-0zzQ;
	Tue, 22 Jul 2025 09:22:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue91d-00000001xI8-30zT
	for linux-mtd@bombadil.infradead.org;
	Tue, 22 Jul 2025 09:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XB4OMTsb3uNhCy9Zne9DiC25fLyRs2Xte3o+UW+VEZY=; b=BX9p6UwqJJg/BMMZ5EBK4VLyP6
	zuT28x+CWnlIvfVOZlYCNynKVfnuB4Uoz483OEp7elWp62/RBROru03r9cn+DbepL0lod9RymnSj6
	v6aFtRq+yPpQ6K1PvpVIu25D7iJjRscO4mipwbFz21juUXhmQr7otmCVMrlVsxljeND7QEy1QhOXU
	n0XcrkHydX5rqVf2mGHwZ+AAi7U8mZ0G3qYPDd6h34WvAQfJAcQY1AjwOxhNpKH5NeRuGJSzfoRlj
	QAPZPyLXKvgXrE0RPPHMXk83LZiPr6IaOoCfiEiQJDxqDNjb8jZpI3brHvxSvnOBb/oXa8MVFQBvk
	/a1gytoQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue91Z-00000008HlI-3i4F
	for linux-mtd@lists.infradead.org;
	Tue, 22 Jul 2025 09:11:04 +0000
Received: from loongson.cn (unknown [223.64.68.193])
	by gateway (Coremail) with SMTP id _____8CxaWqkVX9oWH8vAQ--.34819S3;
	Tue, 22 Jul 2025 17:11:00 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.193])
	by front1 (Coremail) with SMTP id qMiowJAxQMKUVX9oprIhAA--.38699S5;
	Tue, 22 Jul 2025 17:10:59 +0800 (CST)
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
Subject: [PATCH v1 3/8] mtd: rawnand: loongson: Add 6-byte NAND ID reading support
Date: Tue, 22 Jul 2025 17:10:34 +0800
Message-ID: <7777bd2b47bdc4ab1406500d0abcd428cc15fba5.1753166096.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1753166096.git.zhoubinbin@loongson.cn>
References: <cover.1753166096.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJAxQMKUVX9oprIhAA--.38699S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw1UKF15uFWUWFW3Gw1fKrX_yoW5KF17pa
	yrAwsIkrs5tr4a9FyjqFZ8CF15uryfJ39rGa97u34I9wn3Jw17Wa45GF1FyFnIkryYqr1U
	ZFyvga9Y9anrJrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j8CztUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_101103_098518_0F10DF10 
X-CRM114-Status: GOOD (  11.74  )
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

From: Keguang Zhang <keguang.zhang@gmail.com>

Loongson-1C and Loongson-2K SoCs support NAND flash chips with 6-byte ID.
However, the current implementation only handles 5-byte ID which can lead
to incorrect chip detection.

Extend loongson_nand_read_id_type_exec() to support 6-byte NAND ID.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 .../mtd/nand/raw/loongson-nand-controller.c   | 29 +++++++++++++++----
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index b5a7be0fcacc..97cd566420a8 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -50,6 +50,9 @@
 #define LOONGSON_NAND_COL_ADDR_CYC	2U
 #define LOONGSON_NAND_MAX_ADDR_CYC	5U
 
+#define LOONGSON_NAND_READ_ID_SLEEP_US		1000
+#define LOONGSON_NAND_READ_ID_TIMEOUT_US	5000
+
 #define BITS_PER_WORD			(4 * BITS_PER_BYTE)
 
 struct loongson_nand_host;
@@ -73,6 +76,8 @@ struct loongson_nand_op {
 };
 
 struct loongson_nand_data {
+	unsigned int max_id_cycle;
+	unsigned int id_cycle_field;
 	unsigned int status_field;
 	unsigned int op_scope_field;
 	unsigned int hold_cycle;
@@ -458,10 +463,10 @@ static int loongson_nand_read_id_type_exec(struct nand_chip *chip, const struct
 	struct loongson_nand_op op = {};
 	int i, ret;
 	union {
-		char ids[5];
+		char ids[6];
 		struct {
 			int idl;
-			char idh;
+			u16 idh;
 		};
 	} nand_id;
 
@@ -469,11 +474,16 @@ static int loongson_nand_read_id_type_exec(struct nand_chip *chip, const struct
 	if (ret)
 		return ret;
 
-	nand_id.idl = readl(host->reg_base + LOONGSON_NAND_IDL);
-	nand_id.idh = readb(host->reg_base + LOONGSON_NAND_IDH_STATUS);
+	ret = regmap_read_poll_timeout(host->regmap, LOONGSON_NAND_IDL, nand_id.idl, nand_id.idl,
+				       LOONGSON_NAND_READ_ID_SLEEP_US,
+				       LOONGSON_NAND_READ_ID_TIMEOUT_US);
+	if (ret)
+		return ret;
 
-	for (i = 0; i < min(sizeof(nand_id.ids), op.orig_len); i++)
-		op.buf[i] = nand_id.ids[sizeof(nand_id.ids) - 1 - i];
+	nand_id.idh = readw(host->reg_base + LOONGSON_NAND_IDH_STATUS);
+
+	for (i = 0; i < min(host->data->max_id_cycle, op.orig_len); i++)
+		op.buf[i] = nand_id.ids[host->data->max_id_cycle - 1 - i];
 
 	return ret;
 }
@@ -676,6 +686,10 @@ static int loongson_nand_controller_init(struct loongson_nand_host *host)
 	if (IS_ERR(host->regmap))
 		return dev_err_probe(dev, PTR_ERR(host->regmap), "failed to init regmap\n");
 
+	if (host->data->id_cycle_field)
+		regmap_update_bits(host->regmap, LOONGSON_NAND_PARAM, host->data->id_cycle_field,
+				   host->data->max_id_cycle << __ffs(host->data->id_cycle_field));
+
 	chan = dma_request_chan(dev, "rxtx");
 	if (IS_ERR(chan))
 		return dev_err_probe(dev, PTR_ERR(chan), "failed to request DMA channel\n");
@@ -800,6 +814,7 @@ static void loongson_nand_remove(struct platform_device *pdev)
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {
+	.max_id_cycle = 5,
 	.status_field = GENMASK(15, 8),
 	.hold_cycle = 0x2,
 	.wait_cycle = 0xc,
@@ -807,6 +822,8 @@ static const struct loongson_nand_data ls1b_nand_data = {
 };
 
 static const struct loongson_nand_data ls1c_nand_data = {
+	.max_id_cycle = 6,
+	.id_cycle_field = GENMASK(14, 12),
 	.status_field = GENMASK(23, 16),
 	.op_scope_field = GENMASK(29, 16),
 	.hold_cycle = 0x2,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
