Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE52D26D7C
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7Jq8vTiP4t345P2VHFNgDjjmToZjCOlbTcvdOQ1LeA=; b=JQfppo4rkKEUka
	SWZ4IMw8Xsl8VIkU4N7ab7S0lMRO5xsOd5BKIHdjqI+YFfHKGWSkaTbg9i0cV9DRdI6D9+YYqoYQb
	8Qc+pp8h7ZETiwFpMmcIRLf1IKmdmRiLPCIP8ar0wEoSRwyxOy9o3jTw72ZczASGRDeJN/pMicQRb
	7gWEyigDI46I6yQ2topiC3JWOGndIsOrLr62B8C2IqZuQ/G65Otw3WQUWWTXxQErF0YpUk1E9Rb8t
	Ag2QjeEEGFccIREjcHuI2c9jvYGrU4klrghGsBvny62rb7kUVaGHbFzkazanA9Ch0BZs+6PSaa8Os
	OPQdlg+zpnBgxHxECKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEW-00000002o5X-1Rzz;
	Fri, 09 Jan 2026 17:25:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGES-00000002o2E-02ke
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:25:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 628BE4E42029;
	Fri,  9 Jan 2026 17:18:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38D1E606C6;
	Fri,  9 Jan 2026 17:18:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99992103C89BE;
	Fri,  9 Jan 2026 18:18:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MJtnWz64Xe2CigN2SsqL9dz4pY2jKcHax/iVWEjwuVE=;
	b=VsVf09XIYY2kdVeC7p8aVeJhhXqg3JjokyNXGBN/qHn+C8TZq/tt9kVF8GKjfzrTja2L49
	ObuMZwLg6icAY8fW1jwM8TCNfKPkvcWs4PqikhCyUD+7fqYCE/mjiTLzwBfYEQGICfoQb7
	LHVUj0tVRQ0O9Y3pZypA10d2LigK45IrsM87PfSQj9Lr2H/chB6Ct017Vm/mDMM/tHHAzI
	OmF7aL5DFTrSBB1621r+FS+UtY4TCk869vywmaiZB/zZc629UUxlIn1LxHE21ThmJa4SYC
	M0XEXdCHeuIgfp7NjC8xu/6zHpYF2N9bWBYd0E8O8oe/MY+vEVJGz2kvP619Dw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:18 +0100
Subject: [PATCH v2 20/27] mtd: spinand: winbond: Configure the IO mode
 after the dummy cycles
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-20-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092504_235026_222830FC 
X-CRM114-Status: GOOD (  12.95  )
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

When we will change the bus interface, the action that actually performs
the transition is the IO mode register write. This means after the IO
mode register write, we should use the new bus interface. But the
->configure_chip() hook itself is not responsible of making this change
official, it is the caller that must act according to the return value.

Reorganize this helper to first configure the dummy cycles before
possibly switching to another bus interface.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index b16963637683..1d79a8ae7920 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -381,21 +381,6 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand)
 
 	op = spinand->op_templates->read_cache;
 
-	single = (op->cmd.buswidth == 1 && op->addr.buswidth == 1 && op->data.buswidth == 1);
-	dtr = (op->cmd.dtr || op->addr.dtr || op->data.dtr);
-	if (single && !dtr)
-		io_mode = W35N01JW_VCR_IO_MODE_SINGLE_SDR;
-	else if (!single && !dtr)
-		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_SDR;
-	else if (!single && dtr)
-		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_DDR;
-	else
-		return -EINVAL;
-
-	ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_IO_MODE_REG, io_mode);
-	if (ret)
-		return ret;
-
 	dummy_cycles = ((op->dummy.nbytes * 8) / op->dummy.buswidth) / (op->dummy.dtr ? 2 : 1);
 	switch (dummy_cycles) {
 	case 8:
@@ -413,6 +398,21 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
+	single = (op->cmd.buswidth == 1 && op->addr.buswidth == 1 && op->data.buswidth == 1);
+	dtr = (op->cmd.dtr && op->addr.dtr && op->data.dtr);
+	if (single && !dtr)
+		io_mode = W35N01JW_VCR_IO_MODE_SINGLE_SDR;
+	else if (!single && !dtr)
+		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_SDR;
+	else if (!single && dtr)
+		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_DDR;
+	else
+		return -EINVAL;
+
+	ret = w35n0xjw_write_vcr(spinand, W35N01JW_VCR_IO_MODE_REG, io_mode);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
