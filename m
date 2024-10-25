Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B223FD149CD
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2024 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZqT4kW1AxjjwSxC/j7l/kCjRf1Fbi2hBjla3CP7NaA=; b=DIkSJlQRVd0vrQ
	PByDUbsZiVdf4d1AYFDHrexrFUyuN/8l9udK7QXRwowZo2jEHwIzaXpLK6TdqudqGcu6fNTURYSwS
	kn7QLpfStf5sqjDP2F/e6nF7CWJrxi4mkgYGiCNRd6Fpq6e+rfRwnHbiBBY9Ha9LRKoTzh+Wvauzn
	Gs0wkBdDF2jSpJC4V7kZxfVJ1U2XEG4NC7l0sGm2u7xhYs7byQRvul2SvJ+4x2zZIzV1VavdXUrxU
	nMOYUrT6EEQJLSCF6xjar77XgP4vBRwISCxPAiW+3wKgSPFY6Zq4wK+RHN9CJxetHRpLEzcwpDlrl
	9auhnvHCTaa+9qjJI4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O9k-00000004bcR-3WUw;
	Fri, 25 Oct 2024 17:31:24 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MyI-00000004Nnt-2IHf
	for linux-mtd@lists.infradead.org;
	Fri, 25 Oct 2024 16:15:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1446BE0004;
	Fri, 25 Oct 2024 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729872929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yqGvU7azUx3LNm3o2HtldcmYAlcxu8czPOWxcCObUhE=;
	b=p4DZs35X0p/+6ydtSEtAkbQuo+fLq33uiox6svJMNcNrvC8Ar8nSbdclpMVukCQYOowp5c
	xSZgpL1OBg3BZpg6b5XmFRpqB4gl7g8v8Nu/Mdl28G8mUkK+1A+uSOzS7TvNRg3zo109Py
	i1lC4orVrkxOEluXWWnEF+dQIdQ84KccA3DwvEsWAoLadfBGvycxK/utE7F90S1Us+nadg
	ZK3g5mc9gQvh4Ty0ssv17bPVzC+Yapn+YCG8Ztb645CI1bg+uW5bqF6UgJdqz9KJMc5bWA
	d/1ML8ZbVyM71T77v8tbhTa2bp/vk2IRFugwkLBKev2oFdC5dJStNfk+C2ezcw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>,
	Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 23/24] mtd: spinand: winbond: Add comment about naming
Date: Fri, 25 Oct 2024 18:15:00 +0200
Message-ID: <20241025161501.485684-24-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025161501.485684-1-miquel.raynal@bootlin.com>
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_091530_823655_794A554C 
X-CRM114-Status: UNSURE (   9.60  )
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

Make the link between the core macros and the datasheet.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 686e872fe0ff..9e2562805d23 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -18,6 +18,11 @@
 
 #define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
 
+/*
+ * "X2" in the core is equivalent to "dual output" in the datasheets,
+ * "X4" in the core is equivalent to "quad output" in the datasheets.
+ */
+
 static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
