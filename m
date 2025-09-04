Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88903CA1013
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Odsgjoz2No54PapdN921lIkmwVp7d+y9gEfWoEZhZ6k=; b=IDznmtzV1Bg6gd
	CIkZ06BJhgUNCaXRPcEDJQlu+HPmhOdbv0oK9p6sZ20LgpYIF0KOFT1yEV5MlwIjubyhUdBCCBqLG
	5GhUvWXns1/AhxG9rXSuAvqftbMnyb12zdn+4ngZRHO7ttRlOigAUhzzrDIoLhkdfLp0qGPtS6+bW
	AdhE25VBc+/pZQAokxKl6YTDJ28spZdmOxlcoQ9cq097Mk2gvl0AsJ61wgUblCxpD7UlhUxX98Fh1
	PQAKJg1eWsWqbSBRLk2PUZsr0EeHprMOdaXfrmfGhdUN8keYJ7Zs4aNhd4QY++fj5Wkog9txzbGG6
	jBxdfAJyo5O7Z0TqQP4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCmW-0000000Csaj-2J3c;
	Thu, 04 Sep 2025 16:25:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9gK-0000000Bm4U-03rk
	for linux-mtd@bombadil.infradead.org;
	Thu, 04 Sep 2025 13:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MHZ5Ehyd1qzYy6nXBLDw97kJUWNCE1D0HSmP0+Retkc=; b=Xzz6MtQbtb4JUJRbeENT9ML0G7
	l/nu8H56VJzya6c5THToLhS3uSUc6M9SYjo9eqZAqzWxJ/2PqsxEgWRt19GclLJz5WCsNq3wKYKHn
	ai0X2Kt+7Hk3ydiu2y3vpScvDAqc/c2MdJ/KqAX67Ze7UQixzS2MGekX+LWZ8WzM7ICmghGT0AGQB
	NzWVsUf4h2ZyVMA6QxvCDLTfEtwkyltIYGdWoMyakQIUcMHlIruTq8fyn2eglr08SgdmvfrE+GwPH
	Pj+ZoPgvo5+Sjq6beCUtznrklMKiNsomRVF2xeq04R00hnU40q3oI66TJzOaq6agS8fbjvrL6/Lo0
	Xmd+LdhQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9gG-00000004LyL-27N0
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 13:07:14 +0000
Received: from loongson.cn (unknown [223.64.68.89])
	by gateway (Coremail) with SMTP id _____8BxH9PzjrloRqwGAA--.13838S3;
	Thu, 04 Sep 2025 21:06:59 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.89])
	by front1 (Coremail) with SMTP id qMiowJCxocLpjrlofA5+AA--.2906S4;
	Thu, 04 Sep 2025 21:06:59 +0800 (CST)
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
Subject: [PATCH v4 2/7] mtd: rawnand: loongson: Add 6-byte NAND ID reading support
Date: Thu,  4 Sep 2025 21:06:34 +0800
Message-ID: <27a9ff3bfde299badcd5c3cb121021144c0a2476.1756991031.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1756991031.git.zhoubinbin@loongson.cn>
References: <cover.1756991031.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
X-CM-TRANSID: qMiowJCxocLpjrlofA5+AA--.2906S4
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw18WF43ZrWrCFW3CFy7XFc_yoW5KF17pa
	yrAwsIkrs8tr4a9FyjqFZ8CF15uryfJ39rGa97u34I9wn3Jw17Wa45GF1FyFnIkr1Yqr1U
	ZFyvga9Y9anrJrcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8jZX5UUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_140713_243399_9577144F 
X-CRM114-Status: GOOD (  14.42  )
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

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
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
