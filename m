Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80288C35242
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:48:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 301EA20724
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 00:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g6FaQpLk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IndtyLyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 301EA20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWdGavWVgu+3Gkn19H2hgKiXLFcnsed4QPWymsWmoTk=; b=g6FaQpLkS5pUPF
	wDr6Quuef5pXRd8QRDRnWaYBHSugUIEYzlPWhoql+LbwmAlYKxLjJ0leAqtZAjJItOjuivVkZ8MLa
	CVsMowVdTffvWNor+yxcwMqPU0c/qoNxPDs7+YhRGlPZdYigrljyE4UfkzLhrk6nxbmhc6fd6ycAA
	AThuvXI281VN65MeBzQjTXC80Whyl8qfcfkCA+v2prCIDKU6LCi5fC64dKH3418+ndn71ewP91LGA
	fmupE50UxrxQaX9acco/Te/xZSNa4Scb+BSbpYxDdhKMROxsgrss1U/ye44+hAnrDJ/cm0tk9cSXx
	fM0u68XmwJ7Ft9KMEWNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1gCA-0008CB-BT; Wed, 12 Feb 2020 00:48:02 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1g4u-0008OR-Du; Wed, 12 Feb 2020 00:40:36 +0000
Received: by mail-lf1-x143.google.com with SMTP id 9so258037lfq.10;
 Tue, 11 Feb 2020 16:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2UEgY4ao2+798RrC+bgRDj1MAy2fBXO4FFMvPRI1C4g=;
 b=IndtyLyVtvp5a7K9IKZkW7pCthfJxOF/LdZ+pgJGVT4Gb8u/yJr/CPU0GrYi+o44n4
 qQFeWSXzNDHCLjyQXTXq2V19GV+YjvFz4ET8lP8UsPB8zDrtpNHuoYcdhXcaYs0oBNAQ
 byexFtFsf7fcB8MYtQt0ZhrJHDg//JRBcp3BvBnYFEz3Z/TpGOSzp4epjj7OawV/xnVs
 EGUhAFMh1VVXBvkp5aJvYNPDP1fnVA0z7hc1m0yvrtfQUEX4vVKXSdimWT/zyls8CtGs
 pOCOWPA/jUJT2fa9fhzjMM45EyUqPefcJUwAvCIFN8U5pu4zLxGWwHlCxpPQUveLN8oA
 Nsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2UEgY4ao2+798RrC+bgRDj1MAy2fBXO4FFMvPRI1C4g=;
 b=WBZlpxov8XS7xlCoIe5x1EesOt+pdyUn8xpuBsxnOrhNb4GWvWSRA3an68r5CQmbDu
 fO2FAPIiWCH0r0q/eqk3+CwfOWVvKU2PO9mUrWLDsz6qi1X2UivEzeHZ+f0aqRknzZNr
 uxJm3APuVrrMgOEhGiHnQH7RpU4hZdg8hUP6clAsen+d8xGut1d6LzXqF90J2Px1t3MJ
 IKXM3+mU1kHP32b/u35gUmnEpVjZf15UShXS+n4YhY/z/gXa8Bi8DychMV/+7JiyEcQD
 a3YM8Eb6zrVNEdbUFSPBrLkT2xpag+d7SJ+kY9yvcmWR1wLKYu93B+tqrbcF3WYOmUQO
 SHZQ==
X-Gm-Message-State: APjAAAUlFuPZe48ksOi/w0Sz1SHDwYuR3vnHlsaI5nfwi3sviBt9D7eK
 TCKRBTaASPg1IauLnsSHGU0=
X-Google-Smtp-Source: APXvYqwGzDZunZ82ZiLa1YumLPIcrrgQ3aVnv5FhxhmDF3C3h64og6Ucdk0KrfRDM6DpAQfsg8Toqg==
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr5183706lfi.77.1581468030700;
 Tue, 11 Feb 2020 16:40:30 -0800 (PST)
Received: from z50.gdansk-morena.vectranet.pl
 (109241122244.gdansk.vectranet.pl. [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id e8sm3621935ljb.45.2020.02.11.16.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 16:40:30 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [RFC PATCH 14/14] mtd: rawnand: ams-delta: Rename structures and
 functions to gpio_nand*
Date: Wed, 12 Feb 2020 01:39:29 +0100
Message-Id: <20200212003929.6682-15-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200212003929.6682-1-jmkrzyszt@gmail.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_164032_626132_2B973DF1 
X-CRM114-Status: GOOD (  14.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Another step in preparation for merging the driver with "gpio-nand".

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 86 ++++++++++++++++----------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 9e659984bf59..6fda2979e820 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -29,7 +29,7 @@
 /*
  * MTD structure for E3 (Delta)
  */
-struct ams_delta_nand {
+struct gpio_nand {
 	struct nand_controller	base;
 	struct nand_chip	nand_chip;
 	struct gpio_desc	*gpiod_rdy;
@@ -43,19 +43,18 @@ struct ams_delta_nand {
 	bool			data_in;
 	unsigned int		tRP;
 	unsigned int		tWP;
-	u8			(*io_read)(struct ams_delta_nand *this);
-	void			(*io_write)(struct ams_delta_nand *this,
-					    u8 byte);
+	u8			(*io_read)(struct gpio_nand *this);
+	void			(*io_write)(struct gpio_nand *this, u8 byte);
 };
 
-static void ams_delta_write_commit(struct ams_delta_nand *priv)
+static void gpio_nand_write_commit(struct gpio_nand *priv)
 {
 	gpiod_set_value(priv->gpiod_nwe, 1);
 	ndelay(priv->tWP);
 	gpiod_set_value(priv->gpiod_nwe, 0);
 }
 
-static void ams_delta_io_write(struct ams_delta_nand *priv, u8 byte)
+static void gpio_nand_io_write(struct gpio_nand *priv, u8 byte)
 {
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	DECLARE_BITMAP(values, BITS_PER_TYPE(byte)) = { byte, };
@@ -63,10 +62,10 @@ static void ams_delta_io_write(struct ams_delta_nand *priv, u8 byte)
 	gpiod_set_raw_array_value(data_gpiods->ndescs, data_gpiods->desc,
 				  data_gpiods->info, values);
 
-	ams_delta_write_commit(priv);
+	gpio_nand_write_commit(priv);
 }
 
-static void ams_delta_dir_output(struct ams_delta_nand *priv, u8 byte)
+static void gpio_nand_dir_output(struct gpio_nand *priv, u8 byte)
 {
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	DECLARE_BITMAP(values, BITS_PER_TYPE(byte)) = { byte, };
@@ -76,12 +75,12 @@ static void ams_delta_dir_output(struct ams_delta_nand *priv, u8 byte)
 		gpiod_direction_output_raw(data_gpiods->desc[i],
 					   test_bit(i, values));
 
-	ams_delta_write_commit(priv);
+	gpio_nand_write_commit(priv);
 
 	priv->data_in = false;
 }
 
-static u8 ams_delta_io_read(struct ams_delta_nand *priv)
+static u8 gpio_nand_io_read(struct gpio_nand *priv)
 {
 	u8 res;
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
@@ -99,7 +98,7 @@ static u8 ams_delta_io_read(struct ams_delta_nand *priv)
 	return res;
 }
 
-static void ams_delta_dir_input(struct ams_delta_nand *priv)
+static void gpio_nand_dir_input(struct gpio_nand *priv)
 {
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	int i;
@@ -110,68 +109,67 @@ static void ams_delta_dir_input(struct ams_delta_nand *priv)
 	priv->data_in = true;
 }
 
-static void ams_delta_write_buf(struct ams_delta_nand *priv, const u8 *buf,
-				int len)
+static void gpio_nand_write_buf(struct gpio_nand *priv, const u8 *buf, int len)
 {
 	int i = 0;
 
 	if (len > 0 && priv->data_in)
-		ams_delta_dir_output(priv, buf[i++]);
+		gpio_nand_dir_output(priv, buf[i++]);
 
 	while (i < len)
 		priv->io_write(priv, buf[i++]);
 }
 
-static void ams_delta_read_buf(struct ams_delta_nand *priv, u8 *buf, int len)
+static void gpio_nand_read_buf(struct gpio_nand *priv, u8 *buf, int len)
 {
 	int i;
 
 	if (priv->data_gpiods && !priv->data_in)
-		ams_delta_dir_input(priv);
+		gpio_nand_dir_input(priv);
 
 	for (i = 0; i < len; i++)
 		buf[i] = priv->io_read(priv);
 }
 
-static void ams_delta_ctrl_cs(struct ams_delta_nand *priv, bool assert)
+static void gpio_nand_ctrl_cs(struct gpio_nand *priv, bool assert)
 {
 	gpiod_set_value(priv->gpiod_nce, assert);
 }
 
-static int ams_delta_exec_op(struct nand_chip *this,
+static int gpio_nand_exec_op(struct nand_chip *this,
 			     const struct nand_operation *op, bool check_only)
 {
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	struct gpio_nand *priv = nand_get_controller_data(this);
 	const struct nand_op_instr *instr;
 	int ret = 0;
 
 	if (check_only)
 		return 0;
 
-	ams_delta_ctrl_cs(priv, 1);
+	gpio_nand_ctrl_cs(priv, 1);
 
 	for (instr = op->instrs; instr < op->instrs + op->ninstrs; instr++) {
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
 			gpiod_set_value(priv->gpiod_cle, 1);
-			ams_delta_write_buf(priv, &instr->ctx.cmd.opcode, 1);
+			gpio_nand_write_buf(priv, &instr->ctx.cmd.opcode, 1);
 			gpiod_set_value(priv->gpiod_cle, 0);
 			break;
 
 		case NAND_OP_ADDR_INSTR:
 			gpiod_set_value(priv->gpiod_ale, 1);
-			ams_delta_write_buf(priv, instr->ctx.addr.addrs,
+			gpio_nand_write_buf(priv, instr->ctx.addr.addrs,
 					    instr->ctx.addr.naddrs);
 			gpiod_set_value(priv->gpiod_ale, 0);
 			break;
 
 		case NAND_OP_DATA_IN_INSTR:
-			ams_delta_read_buf(priv, instr->ctx.data.buf.in,
+			gpio_nand_read_buf(priv, instr->ctx.data.buf.in,
 					   instr->ctx.data.len);
 			break;
 
 		case NAND_OP_DATA_OUT_INSTR:
-			ams_delta_write_buf(priv, instr->ctx.data.buf.out,
+			gpio_nand_write_buf(priv, instr->ctx.data.buf.out,
 					    instr->ctx.data.len);
 			break;
 
@@ -188,15 +186,15 @@ static int ams_delta_exec_op(struct nand_chip *this,
 			break;
 	}
 
-	ams_delta_ctrl_cs(priv, 0);
+	gpio_nand_ctrl_cs(priv, 0);
 
 	return ret;
 }
 
-static int ams_delta_setup_data_interface(struct nand_chip *this, int csline,
+static int gpio_nand_setup_data_interface(struct nand_chip *this, int csline,
 					  const struct nand_data_interface *cf)
 {
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
+	struct gpio_nand *priv = nand_get_controller_data(this);
 	const struct nand_sdr_timings *sdr = nand_get_sdr_timings(cf);
 	struct device *dev = &nand_to_mtd(this)->dev;
 
@@ -217,23 +215,23 @@ static int ams_delta_setup_data_interface(struct nand_chip *this, int csline,
 	return 0;
 }
 
-static const struct nand_controller_ops ams_delta_ops = {
-	.exec_op = ams_delta_exec_op,
-	.setup_data_interface = ams_delta_setup_data_interface,
+static const struct nand_controller_ops gpio_nand_ops = {
+	.exec_op = gpio_nand_exec_op,
+	.setup_data_interface = gpio_nand_setup_data_interface,
 };
 
 /*
  * Main initialization routine
  */
-static int ams_delta_init(struct platform_device *pdev)
+static int gpio_nand_probe(struct platform_device *pdev)
 {
 	struct gpio_nand_platdata *pdata = dev_get_platdata(&pdev->dev);
 	const struct mtd_partition *partitions = NULL;
 	int num_partitions = 0;
-	struct ams_delta_nand *priv;
+	struct gpio_nand *priv;
 	struct nand_chip *this;
 	struct mtd_info *mtd;
-	int (*probe)(struct platform_device *pdev, struct ams_delta_nand *priv);
+	int (*probe)(struct platform_device *pdev, struct gpio_nand *priv);
 	int err = 0;
 
 	if (pdata) {
@@ -242,7 +240,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct ams_delta_nand),
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct gpio_nand),
 			    GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -329,8 +327,8 @@ static int ams_delta_init(struct platform_device *pdev)
 			return -ENODEV;
 		}
 
-		priv->io_read = ams_delta_io_read;
-		priv->io_write = ams_delta_io_write;
+		priv->io_read = gpio_nand_io_read;
+		priv->io_write = gpio_nand_io_write;
 		priv->data_in = true;
 	}
 
@@ -348,8 +346,8 @@ static int ams_delta_init(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	/* Initialize the NAND controller object embedded in ams_delta_nand. */
-	priv->base.ops = &ams_delta_ops;
+	/* Initialize the NAND controller object embedded in gpio_nand. */
+	priv->base.ops = &gpio_nand_ops;
 	nand_controller_init(&priv->base);
 	this->controller = &priv->base;
 
@@ -385,9 +383,9 @@ static int ams_delta_init(struct platform_device *pdev)
 /*
  * Clean up routine
  */
-static int ams_delta_cleanup(struct platform_device *pdev)
+static int gpio_nand_remove(struct platform_device *pdev)
 {
-	struct ams_delta_nand *priv = platform_get_drvdata(pdev);
+	struct gpio_nand *priv = platform_get_drvdata(pdev);
 	struct mtd_info *mtd = nand_to_mtd(&priv->nand_chip);
 
 	/* Apply write protection */
@@ -415,9 +413,9 @@ static const struct platform_device_id gpio_nand_plat_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpio_nand_plat_id_table);
 
-static struct platform_driver ams_delta_nand_driver = {
-	.probe		= ams_delta_init,
-	.remove		= ams_delta_cleanup,
+static struct platform_driver gpio_nand_driver = {
+	.probe		= gpio_nand_probe,
+	.remove		= gpio_nand_remove,
 	.id_table	= gpio_nand_plat_id_table,
 	.driver		= {
 		.name	= "ams-delta-nand",
@@ -425,7 +423,7 @@ static struct platform_driver ams_delta_nand_driver = {
 	},
 };
 
-module_platform_driver(ams_delta_nand_driver);
+module_platform_driver(gpio_nand_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Jonathan McDowell <noodles@earth.li>");
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
