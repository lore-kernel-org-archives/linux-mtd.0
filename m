Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B810A88D4
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17NQDq/FTLpIyIUGLdF1dpcoac1lbAgNEyUWsvHnX24=; b=r6mcqvqkiWU7LW
	9iYj1W1+eZ+9iDYWALZpILYK8ebTQNCxEg02sV/RxwRMh9tkNBE7NxlL+/eMRKVKnUfx8HaIiiw1Q
	Vk7nDj0mKNhxaQQ+H/A/WgcUGV8ueR+84B1rVee2BKZVPMLcZXhjp0gcDy+gdKb4C0QfO5xjxJiwH
	v1XZy1fK1rzFGZ5uUg84UnYv0lS1EYo8m6e/1z2cm2/vC0Psd5Oov3qAZu+U8kfmlaZ95UT8CnDZi
	jLHA0TyZLDzu/gvoXocZQD8rU/FHApQ0JAnQaqy87+W8CIQWU1R0spqRrFU1wxbZU3cNhdjsehBv2
	mrEPAtGpxRQN1VDYRGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXO-00000005qhe-15Nn;
	Thu, 26 Mar 2026 16:26:26 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nXJ-00000005qcU-48AU
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:26:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B9F80C566BF;
	Thu, 26 Mar 2026 16:26:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 774A2601FA;
	Thu, 26 Mar 2026 16:26:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D215010450CA0;
	Thu, 26 Mar 2026 17:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774542379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yGIuJpVwWLTfF36jwuLLhNiOA2wGXHIPXa0FAwaadKw=;
	b=yNpQjZDO1vFDiEPq3WhKYtssiq5FUYuxDMYyFlOkvjHTEEr3eVYwlFgQA90asN7MzpS7ca
	I5qTCr1d0YD3DYmEEwPlxlGLHD5VsZtRDQDTKux8LYVzlsWphM0i9LNe29B6b5uMg5JWsR
	6KUdnok2MS3Wgn5VQ/8QnHvKQOMxkldRFDEtXvT9oWIhMoNg7Q2C/ZLsVjBuGPhFFzruO5
	wmEsxdINcjKnYZn5OfppjKkMJOazVlL0JdNWnyH0en46LdnbDOi5fPqZr6SEG7mDwM1paf
	Z7Vcei3R36l7OzdWj8HVRVg+5DipF009szLRf9L2V+nXIT/Jaj3FhAYbxFU/5A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:25:57 +0100
Subject: [PATCH v2 10/11] mtd: spinand: winbond: Create a helper to detect
 the need for the HS bit
MIME-Version: 1.0
Message-Id: <20260326-winbond-v6-18-rc1-cont-read-v2-10-643de97a68a3@bootlin.com>
References: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
In-Reply-To: <20260326-winbond-v6-18-rc1-cont-read-v2-0-643de97a68a3@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_092622_175311_5DDC39F5 
X-CRM114-Status: GOOD (  10.74  )
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

The logic is not complex but might be reused to cleanup a bit the
section by moving it to a dedicated helper.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b30a343a6672..ffbcd25b0366 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -421,30 +421,33 @@ static int w25n0xjw_set_sr4_hs(struct spinand_device *spinand, bool enable)
 	return spinand_write_reg_op(spinand, W25N0XJW_SR4, sr4);
 }
 
+/*
+ * SDR dual and quad I/O operations over 104MHz require the HS bit to
+ * enable a few more dummy cycles.
+ */
+static bool w25n0xjw_op_needs_hs(const struct spi_mem_op *op)
+{
+	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
+		return false;
+	else if (op->cmd.buswidth != 1 || op->addr.buswidth == 1)
+		return false;
+	else if (op->max_freq && op->max_freq <= 104 * HZ_PER_MHZ)
+		return false;
+
+	return true;
+}
+
 static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 			   enum spinand_bus_interface iface)
 {
 	const struct spi_mem_op *op;
-	bool hs;
 
 	if (iface != SSDR)
 		return -EOPNOTSUPP;
 
-	/*
-	 * SDR dual and quad I/O operations over 104MHz require the HS bit to
-	 * enable a few more dummy cycles.
-	 */
 	op = spinand->op_templates->read_cache;
-	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
-		hs = false;
-	else if (op->cmd.buswidth != 1 || op->addr.buswidth == 1)
-		hs = false;
-	else if (op->max_freq && op->max_freq <= 104 * HZ_PER_MHZ)
-		hs = false;
-	else
-		hs = true;
 
-	return w25n0xjw_set_sr4_hs(spinand, hs);
+	return w25n0xjw_set_sr4_hs(spinand, w25n0xjw_op_needs_hs(op));
 }
 
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
