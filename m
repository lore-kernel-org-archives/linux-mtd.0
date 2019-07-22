Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E572BC76188
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB51521955
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ONd0z3N9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFXR9KV6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB51521955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqLdtx1IjsFozN5oF1HkuitSmpXkvdCZ1n7bUrL0lK8=; b=ONd0z3N9QERSNb
	Uhh6HfG6Ct8t+55+qMzd+Go7AKI0fBCP6N1WZ3lj4KcXREIrIAiu8kl/e8nT0tyJTWaG/QkN5fGfY
	768fFtagmZSoYPuaX1k2mqcv+bS9vicdeacmLaAqH9NP1GsHjzyK+czjvzD6SS54PrW43UT6m4Zcj
	qG1+A4mGR4I76pvfmQl7KlouMglZjlmlekH6j2STcii2Iwu5lXAnV3v7KSuOrrzKX5TRa87N2XZB8
	1XOZFm66vMU5aH+ABWinuAODg6OZ0vgFPztCsZP6ejAd4pFLcUSHokzpQr94H0LC8E5NZ/HFg2SVZ
	5d7AhLwbtjrmKbzfNsRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpROf-0002dF-1I; Mon, 22 Jul 2019 06:02:05 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpRJx-0006DD-Eh
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 05:57:15 +0000
Received: by mail-ed1-x543.google.com with SMTP id m10so39477640edv.6
 for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2019 22:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=zO4yKVmIa9YvWgGk/0+i5c9t3cZGy5igpPanc2xkxac=;
 b=KFXR9KV64XDKn922AuqENwVrvCjE5sS60Icms22EU6DorpQM4EBvfpwMj8nobQXz/n
 JwiUQ+HOs2oxOhUOtysnquS5y6RNE6xI63FVzJkXqKctxQbHtQOT2a51PqEDvVlxh17v
 LEwFiLvvdhmLx6oYeIJhckiHRE2choX19rY881IOvYusmq8B4FRWkukpM/sUeDCzxAKi
 o8Az9+2SQwtdN+WmToyjY1eYB7uYxujxfyLducTlZRmgQdUckoCOxGSI2wWRgmVrvjWR
 //IZqCFnuYpI4MwGzU0YPgHLBzICycAnP+aXVnBPtdGwhTrxINfgbVtQpMmyahkvrH4e
 MzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=zO4yKVmIa9YvWgGk/0+i5c9t3cZGy5igpPanc2xkxac=;
 b=KyiHTCRi1coKxfqjf+waQtDl+ChSesbO/rkESfukOka8XPwytguymFrE6ADDd9zeyZ
 sb/gtwAra4i71HyPHX0DwF3MOE/YWUFBJ+w4eg/wGe4uaRY7r543nIwHkZPMct2csHHz
 iFkegc/ylP3OIcIGZZxwIreFElMImHdf0dMjK7k/Ehos7uU8IHCVSCaYXoIGcKDribfU
 9L1KNQiTcRgpuMCsBLQear2JKvBUJEapZ98GpJNBumvUneKvHscci1DDTUiFsh+SRV/t
 Tbft6dlZ9g+DooPIBrxuKeP+l7Is0nwsU7H42JshaZVdl1ihE0wbMXa52pGqRqaOR4CL
 dPJg==
X-Gm-Message-State: APjAAAU+exyBjcCL0M61FLXhX4bnpuUEc4ObLVmTeDLYrrBKPBex9V1k
 e63C6jaQX17v9s3Ru8kLVJU=
X-Google-Smtp-Source: APXvYqw6Q7piGD5BWsnPoIG/2OE+vGWUkd+9athz6x7RRFsj5kPgeYBstb8EQbao8+w1NA+vfp3YFw==
X-Received: by 2002:a50:ae8f:: with SMTP id e15mr58257582edd.74.1563775031758; 
 Sun, 21 Jul 2019 22:57:11 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id a6sm10351725eds.19.2019.07.21.22.57.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 22:57:11 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [PATCH 6/8] mtd: spinand: micron: Turn driver implementation generic
Date: Mon, 22 Jul 2019 07:56:19 +0200
Message-Id: <20190722055621.23526-7-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722055621.23526-1-sshivamurthy@micron.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_225713_530252_AA8CA740 
X-CRM114-Status: GOOD (  15.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Driver is redesigned using parameter page to support Micron SPI NAND
flashes.
The reason why spinand_select_op_variant globalized is that the Micron
driver no longer calling spinand_match_and_init.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/core.c   |  2 +-
 drivers/mtd/nand/spi/micron.c | 61 +++++++++++++++++++++++++----------
 include/linux/mtd/spinand.h   |  4 +++
 3 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 7ae76dab9141..aae715d388b7 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -920,7 +920,7 @@ static void spinand_manufacturer_cleanup(struct spinand_device *spinand)
 		return spinand->manufacturer->ops->cleanup(spinand);
 }
 
-static const struct spi_mem_op *
+const struct spi_mem_op *
 spinand_select_op_variant(struct spinand_device *spinand,
 			  const struct spinand_op_variants *variants)
 {
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 95bc5264ebc1..6fde93ec23a1 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -90,22 +90,10 @@ static int micron_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
-static const struct spinand_info micron_spinand_table[] = {
-	SPINAND_INFO("MT29F2G01ABAGD", 0x24,
-		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
-		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
-		     0,
-		     SPINAND_ECCINFO(&micron_ooblayout_ops,
-				     micron_ecc_get_status)),
-};
-
 static int micron_spinand_detect(struct spinand_device *spinand)
 {
+	const struct spi_mem_op *op;
 	u8 *id = spinand->id.data;
-	int ret;
 
 	/*
 	 * Micron SPI NAND read ID need a dummy byte,
@@ -114,16 +102,55 @@ static int micron_spinand_detect(struct spinand_device *spinand)
 	if (id[1] != SPINAND_MFR_MICRON)
 		return 0;
 
-	ret = spinand_match_and_init(spinand, micron_spinand_table,
-				     ARRAY_SIZE(micron_spinand_table), id[2]);
-	if (ret)
-		return ret;
+	spinand->flags = 0;
+	spinand->eccinfo.get_status = micron_ecc_get_status;
+	spinand->eccinfo.ooblayout = &micron_ooblayout_ops;
+
+	op = spinand_select_op_variant(spinand,
+				       &read_cache_variants);
+	if (!op)
+		return -ENOTSUPP;
+
+	spinand->op_templates.read_cache = op;
+
+	op = spinand_select_op_variant(spinand,
+				       &write_cache_variants);
+	if (!op)
+		return -ENOTSUPP;
+
+	spinand->op_templates.write_cache = op;
+
+	op = spinand_select_op_variant(spinand,
+				       &update_cache_variants);
+	spinand->op_templates.update_cache = op;
 
 	return 1;
 }
 
+static void micron_fixup_param_page(struct spinand_device *spinand,
+				    struct nand_onfi_params *p)
+{
+	/*
+	 * As per Micron datasheets vendor[83] is defined as
+	 * die_select_feature
+	 */
+	if (p->vendor[83] && !p->interleaved_bits)
+		spinand->base.memorg.planes_per_lun = 1 << p->vendor[0];
+
+	spinand->base.memorg.ntargets = p->lun_count;
+	spinand->base.memorg.luns_per_target = 1;
+
+	/*
+	 * As per Micron datasheets,
+	 * vendor[82] is ECC maximum correctability
+	 */
+	spinand->base.eccreq.strength = p->vendor[82];
+	spinand->base.eccreq.step_size = 512;
+}
+
 static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
 	.detect = micron_spinand_detect,
+	.fixup_param_page = micron_fixup_param_page,
 };
 
 const struct spinand_manufacturer micron_spinand_manufacturer = {
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index fea820a20bc9..ddb2194273a8 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -461,4 +461,8 @@ int spinand_match_and_init(struct spinand_device *dev,
 int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
 
+const struct spi_mem_op *
+spinand_select_op_variant(struct spinand_device *spinand,
+			  const struct spinand_op_variants *variants);
+
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
