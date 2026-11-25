Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50096606A69D
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WJKqU2l+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rjIba73h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=la0wD6Q7U5MHyhLideg2TbEC98+kQ1MSfDwrFmNKdXU=; b=WJKqU2l+ibf+bxy+so80WXeMlD
	vSY47l623un/7xNEUxDHIX6sswmOtxauiY99FRKynsF+l6POYCurbrRMi6Vi18vmUDH7Jr5VuG2/v
	6Os05c9kgs7UaVZZqO9mzCuthZ7GVoBVM7nm9+xClZyy7YGR/5QONA7CkQotjS++Y7uRJduFK6+tK
	ucUVEMPRLHOBVm/rQ1bG8jfMJOZ9UzUrxfWaEOsJ4YyQ3aK7JFRPlN8dAeNT1cpfT8GG7xZQg2MNH
	7LMUVeCfI/i/k/VU9rifnoTkfiyqKyevVbEmh8oTHavn2JqN9tv/qvA3t8ISlWfT5pZ9NNKFkDsvI
	dKBcD/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAI-0000000AnmA-3FAY;
	Wed, 25 Nov 2026 17:52:18 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH9n-0000000AnID-0rwD;
	Wed, 25 Nov 2026 17:51:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F9544E41786;
	Wed, 25 Nov 2026 17:51:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 203C260480;
	Wed, 25 Nov 2026 17:51:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6C4E11E6B0CB;
	Wed, 25 Nov 2026 18:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fhMRTzkLSH5MxpIkUJMv2XmW944j+sfZQtVHooeXfNc=;
	b=rjIba73hZY4git7Vg/XhATFE76hCuXmQOIhpokw7phcPJkpu77IDcANyPWfhmWmpm/wwkw
	7zbQD+YFwagsL7TNez3rOk+tOFWqoaCfJAx1uuqP216t7R8+f4CsYaufNaWbd4w2ksU6ls
	o09e1p0lj1XUqz7LHURSpJFtq+Htd9sNCARv4WJwIT/kU4e9pb0KPG4o3J5r6pNSJh8k44
	2smGQ9sg7zZrrVxSReD/fxJB3988w6XyQ0OTBaxpRuQWXI9S5DchsjnJOE9ylpGWH584fK
	UT5SFyzDHqH0XSUkJ1oQK2DgBG1Vi5MEfWCZMTtyf4OYFjw9GBbwtUwG2zVYGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 25 Nov 2026 18:51:15 +0100
Subject: [PATCH RFC 01/16] spi: spi-mem: Handle a corner case while
 sanitizing ops
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-macronix-upstreaming-spi-mem-cycles-v1-1-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Han Xu <han.xu@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095149_083817_3B36758C 
X-CRM114-Status: GOOD (  11.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some mixed mode operations (such as 1S-xD-yD) will be flagged with
op_is_dtr but will not enter the ODTR checks. As a result, the number of
command bytes will never be checked.

Reorganize a little bit this helper:
- If the operation contains a DTR phase, sanitize it.
- Then sanitize the op, should it be:
  - ODTR (8D-8D-8D)
  - anything else

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 8047b7508c8d..c64e906ba919 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -170,6 +170,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 	struct spi_controller *ctlr = mem->spi->controller;
 	bool op_is_dtr =
 		op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr;
+	bool op_is_odtr = op->cmd.dtr && op->cmd.buswidth == 8;
 
 	if (op_is_dtr) {
 		if (!spi_mem_controller_is_capable(ctlr, dtr) && !ctlr->dtr_caps)
@@ -177,23 +178,22 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 
 		if (op->data.swap16 && !spi_mem_controller_is_capable(ctlr, swap16))
 			return false;
+	}
 
-		/* Extra 8D-8D-8D limitations */
-		if (op->cmd.dtr && op->cmd.buswidth == 8) {
-			if (op->cmd.nbytes != 2)
-				return false;
-
-			if ((op->addr.nbytes % 2) ||
-			    (op->dummy.nbytes % 2) ||
-			    (op->data.nbytes % 2)) {
-				dev_err(&ctlr->dev,
-					"Even byte numbers not allowed in octal DTR operations\n");
-				return false;
-			}
-		}
-	} else {
+	if (!op_is_odtr) {
 		if (op->cmd.nbytes != 1)
 			return false;
+	} else {
+		if (op->cmd.nbytes != 2)
+			return false;
+
+		if ((op->addr.nbytes % 2) ||
+		    (op->dummy.nbytes % 2) ||
+		    (op->data.nbytes % 2)) {
+			dev_err(&ctlr->dev,
+				"Even byte numbers not allowed in octal DTR operations\n");
+			return false;
+		}
 	}
 
 	if (op->data.ecc) {

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
