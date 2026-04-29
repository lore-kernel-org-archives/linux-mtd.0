Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862E8CD13D9
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcqou0A12OK0AStTq1nbrTChhG1/7wAEqjLaw/MVD9I=; b=jCCH5jx9KTpgh4
	BsSkb1+kZIFtqiIyLHjzwPKXn2C6lhappMCX5imRwnfV6K9DaHzLjtHVPO/GnWn9eWgJIGV98Iq9Q
	3PKBsLEERHR1GyHkYTd/i4TqAfgB+7mR1jewbNHaSE+ZyplszGLA9GChmcSS2s69zwqgLvSyglRfG
	9NadeSXo/utWmv4+0pXQqiyl33sas7AWq5REjaAOfAfuLbm/luRdMN37aUXDYc5Qc3CdqB8ARmNml
	MzKKUOIyuXUn+S2+ZjszFpnzVfkVAL//ah6zavz0HQ4oz35az7Foq1DaH0XZQ3YcsZ+Y0SLJKHMC3
	wtkdFbXfi7G4KOVd/1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9AT-000000040Oc-2JSM;
	Wed, 29 Apr 2026 17:57:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9AQ-000000040M8-1IXZ;
	Wed, 29 Apr 2026 17:57:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF4001A33F4;
	Wed, 29 Apr 2026 17:57:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A25475FD43;
	Wed, 29 Apr 2026 17:57:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 811921072B16D;
	Wed, 29 Apr 2026 19:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777485461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pRtlUGFfk1AjNaQYKbHs4RmZNZ5DHT9f7bq1vbOMB34=;
	b=NXWUJIFzygDfQ7zjIeyD37p2jDhewvoKDSntinFms7jvk9dOXJLWtQHw+UkFYO0NhJeIjM
	STfpzdg2sYIjGY6C7+Fzr4WXsn+KBSuIu5UyfYzZlD/U1c7XLIx37jF1O1AhcTxI21N33E
	DQmxcpFD41RJYWNdmP5qpl3rNVUo2uPxARHR+n5Z8u599+GT+0ka1catIfl/VshOMoAu0W
	fsSlRi+NTvVI+VHtDf4qZIFZMj6xPiJCYPTqUPkB2Nns0fWL31gmeq1mdv9+6WcM7lGBeO
	JbHctYaj9m9K68JL+5ZH58LGrBE1dl+Luq9ZVrU4Z8dxJGq188aCiwAdf5nSSA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:39 +0200
Subject: [PATCH v3 02/11] mtd: spinand: Expose spinand_op_is_odtr()
MIME-Version: 1.0
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-2-0f38b3c229ad@bootlin.com>
References: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
In-Reply-To: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105746_491334_9BD60EA8 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

This helper is going to be needed in a vendor driver, so expose it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index fba3cc213c88..1c3ac9ad650e 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1400,7 +1400,7 @@ static void spinand_manufacturer_cleanup(struct spinand_device *spinand)
 		return spinand->manufacturer->ops->cleanup(spinand);
 }
 
-static bool spinand_op_is_odtr(const struct spi_mem_op *op)
+bool spinand_op_is_odtr(const struct spi_mem_op *op)
 {
 	return op->cmd.dtr && op->cmd.buswidth == 8;
 }
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 58abd306ebe3..e1f19664bb25 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -862,6 +862,8 @@ static inline void spinand_set_of_node(struct spinand_device *spinand,
 	nanddev_set_of_node(&spinand->base, np);
 }
 
+bool spinand_op_is_odtr(const struct spi_mem_op *op);
+
 int spinand_match_and_init(struct spinand_device *spinand,
 			   const struct spinand_info *table,
 			   unsigned int table_size,

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
