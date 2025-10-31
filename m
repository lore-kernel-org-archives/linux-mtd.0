Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E09CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxTJbrQemVeZ6nrMFUoKClX4PUOhl5UsDIZYvKiI+qo=; b=jFJggmVxon53J1
	3EXacY0duacFMaCHRqWCFcsOg7iIhwF1DGY79MX/iFXM/z2TSv/tK5uY7u5o0OZis025rzSYTF+oI
	HqfzDi4MnQD8Wb6rUMHa52UFEHCKrj/Rs5LwyDqailr3Sle82zQJHzMViUsPUSv9Prb50ZVxnCcWG
	PCpss27Ll+z5plx3/W0Tnq5a/wbAMsr4nvnKqZ4jCxfkYVhc4bTGRv8dbFfSZJTg4gDJ0rhA9S1H2
	3tFBakuDoQ2nls9R9sXLBNNxzEDkVNGwa9KWvlz5ROnjMwDTx7DTwcf+tclV8liU3/HZKthTNoHy8
	33ELk+5La2dOZZWe2UWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswa-00000006Vp0-3ZVe;
	Fri, 31 Oct 2025 17:29:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvY-00000006UVj-2kMa
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 31AE71A17C6;
	Fri, 31 Oct 2025 17:28:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08ED260704;
	Fri, 31 Oct 2025 17:28:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34D801181800A;
	Fri, 31 Oct 2025 18:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ex2SptpuBK+4RMrw2hKUubiMGuwo3pULUp58RhXWy8w=;
	b=Lqri9Bfp6SGJi9VpPmHo/57DgqJdOMKyMulKxVXHIi3QC4AAF79B6F+8ZLKit4C8ASo7UO
	K1n8kNY/vTq2dvQjXPSHjfVGANKoIHExxrMZ6qlLB2sJE8pjMiAFgIGs8ETRUxPVdfEAcy
	ql3ge0KV8xxAE+YpANVrKMS4b0D/ufEWgHk9XR3mArK78+2j210ME00om8M3PTL9lVkg3M
	3gGRPJitvJpAmjRlajBIVaVMRSp1zOWz+odGXPbCr4ws8J4uZOH4/b8/yxbasn9gQLZHdS
	oNYFsTk4PSMxPiF/FuiCGpPyGn8+nYI1taPrBekYVqcI+TaYGsWkPAWkvjpkJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:05 +0100
Subject: [PATCH 21/28] mtd: spinand: winbond: Configure the IO mode after
 the dummy cycles
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-21-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102841_352438_CEF15AEE 
X-CRM114-Status: GOOD (  12.42  )
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
index b169636376835157c64bce17a4f32549e1c1eb9f..1d79a8ae79206af7d823018c4603b3bd36a0dd88 100644
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
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
