Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7127BC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zru+i7IjwCmyrzU3gjdDS5hdg7hwV0bcyy4etrULvZI=; b=srfoYmTOy7rkqk
	pX7/vrJr/OH/C9pvUX35OZhWUbKvBExNaHPKgRWJrC0AnfETefE/nuWlaTDelLiRdwVRcI7eFBgGX
	X5Kr1o8rJLX/bC5n11Z4VNSV55C6v4HhH2WmTMImzqYwL3i92UHY1WVGFn7p0RFgB6iXHsiAk5QnR
	0OsEEw+OORJYRsEvWPciI/naa8hfMw7cwhp+EhI/pevRLIejByfE0TovJ0srNfjBVFzxixbgaEqfr
	uQDD5Yq4lKt2IaUL5RaraKPhu7k9DjswGFNWvNiGMHFQWsuOE3+wP6wk6OD3teYeMVexQjvZ+aZzf
	0e97x+UNm6+sEScshzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myGl3-00BOMM-01; Fri, 17 Dec 2021 17:11:01 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFup-00B7UH-8N
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 16:17:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 92E57200009;
 Fri, 17 Dec 2021 16:16:59 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v7 01/14] spi: spi-mem: Fix a DTR related check in
 spi_mem_dtr_supports_op()
Date: Fri, 17 Dec 2021 17:16:41 +0100
Message-Id: <20211217161654.367782-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217161654.367782-1-miquel.raynal@bootlin.com>
References: <20211217161654.367782-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_081703_477652_3CF89633 
X-CRM114-Status: GOOD (  11.18  )
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

It seems that the number of command bytes must be "2" only when the
command itself is sent in DTR mode. The current logic checks if the
number of command bytes is "2" when any of the cycles is a DTR cycle. It
is likely that so far no device was actually mixing DTR/non-DTR cycles
in the same operation, explaining why this was left undetected until
now.

Fixes: 539cf68cd51b ("spi: spi-mem: add spi_mem_dtr_supports_op()")
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 37f4443ce9a0..c4da0c9b05e9 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -163,7 +163,7 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op)
 {
-	if (op->cmd.nbytes != 2)
+	if (op->cmd.dtr && op->cmd.nbytes != 2)
 		return false;
 
 	return spi_mem_check_buswidth(mem, op);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
