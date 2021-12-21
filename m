Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A68C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+urQPmfaHrKOrPNHzjtajkxHHjck4ClFU/8AjRVcLM=; b=koJ92qIm12B+58
	AFvHMtNyA6JMhHnpCFnKZ9rwKxM3eRtzeEL6tXA7WrUuVAriXgXqX6F/O5mPDwLUHtXwVdeEtyJxj
	9aPIH2STEbq9TR2Ob+5Do9N/fOo2tJQWH55VYOAHyxHzz7JxZ9ruPRVU4oH06Hm3qDYrlUEzkz6s2
	Mu3UIQ2l5sEYdQYyIf75OGPwKy3kW6vbhYif3D9X4t5P6KrmCkH+trQCt8+VXTmRC8HNwULjToIk4
	IvElvtEe0KzSOfToVNkiKkEDMRonTXrz2OdNA3nZ4etyq7IR47XcA8zvMHAWhFioipSeH8nCdBdzu
	76Q4P4HARobOCULoMloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjGP-007vaY-IP; Tue, 21 Dec 2021 17:49:25 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjFv-007vSA-LX
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 17:48:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0FC53200005;
 Tue, 21 Dec 2021 17:48:48 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v8 01/14] spi: spi-mem: reject partial cycle transfers in
Date: Tue, 21 Dec 2021 18:48:31 +0100
Message-Id: <20211221174844.56385-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211221174844.56385-1-miquel.raynal@bootlin.com>
References: <20211221174844.56385-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_094855_885159_2577E0CF 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Pratyush Yadav <p.yadav@ti.com>

In 8D-8D-8D mode two bytes are transferred per cycle. So an odd number
of bytes cannot be transferred because it would leave a residual half
cycle at the end. Consider such a transfer invalid and reject it.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 37f4443ce9a0..1dfd38d82607 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -163,7 +163,17 @@ static bool spi_mem_check_buswidth(struct spi_mem *mem,
 bool spi_mem_dtr_supports_op(struct spi_mem *mem,
 			     const struct spi_mem_op *op)
 {
-	if (op->cmd.nbytes != 2)
+	if (op->cmd.buswidth == 8 && op->cmd.nbytes % 2)
+		return false;
+
+	if (op->addr.nbytes && op->addr.buswidth == 8 && op->addr.nbytes % 2)
+		return false;
+
+	if (op->dummy.nbytes && op->dummy.buswidth == 8 && op->dummy.nbytes % 2)
+		return false;
+
+	if (op->data.dir != SPI_MEM_NO_DATA &&
+	    op->dummy.buswidth == 8 && op->data.nbytes % 2)
 		return false;
 
 	return spi_mem_check_buswidth(mem, op);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
