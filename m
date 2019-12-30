Return-Path: <SRS0=iF+I=2U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE89C2D0D3
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31995206CB
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="poOV6aaS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pSbRTLAU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31995206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Cua8x4T6UHhUtPKW3ZQt224mHK15WadOuaXMu8pMy0=; b=poOV6aaSzJlWhD
	oF4TF+6rJrtQla1/4D/73Br5FWsqlhRUN3RgceJPgcryiXjr4quzZGW+sJXZVGKCz5RYHFbVopbkW
	Oihn7f5/NupLonMXYZBkCg7AporyopegICHegApVW1B1yx398GKJvBKlxfmQVCoQXRgjaTaxg+KJQ
	sIDek9qv8ThrSfvmH7d5H8g/bvvX591Wi+C/ivscxoQvO77K5Egt50Erlz5Q4qqjaYHE5Jsy8Pjz9
	K9f/MZNqce71ipu0WTUw5KqXHBDshj+DuQXvn+aDnD95aH3wlX8Nztp7NPBmuHaBEmHvfr3PoT1/J
	qPXq9NnYowcvqTxnkBTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilyIG-0004wU-6G; Mon, 30 Dec 2019 16:53:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyH8-0003qH-80
 for linux-mtd@bombadil.infradead.org; Mon, 30 Dec 2019 16:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i9aEw4mX6oH4kDn3IJdtHulcBq1ppxGKC9yxStW04k8=; b=pSbRTLAUbagk2sgSvcPvvqLwky
 GwCa2g5V/9z2lv65VH9FDiz/1KgbOCXu/jm+3ny6qyA+PLQulSAgFgdHymsFLG2Pl56dpCBnPmrd2
 trtPEkrxibixmH1cbCnVFq3TsbdYsXNyDPE4bD4F8pOFLEt+Bz3mG7ebRvIxxtAqiRRhzh17b3wEa
 Aiq7XxokV25oFsOollP1l2BS3e+bPVZI7wvX468BWxCUjT9ycTsPw/ETSMSDgHbYYL8i24YCfXR1F
 pUovDaUJ/DkijN9GozA9dj7+67sDQS0oUyZL9EdB+PBpbACl3voDDsLOSL35XzpuUMjT931ZXUqF5
 bOqAAKbg==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyHW-0006yG-3o
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2019 16:52:39 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E3A72C0002;
 Mon, 30 Dec 2019 16:51:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/8] mtd: rawnand: toshiba: Add a specific init for
 TC58TEG5DCLTA00
Date: Mon, 30 Dec 2019 17:51:22 +0100
Message-Id: <20191230165129.11925-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191230165129.11925-1-miquel.raynal@bootlin.com>
References: <20191230165129.11925-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_165238_183532_A6E27237 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

TC58TEG5DCLTA00 is an MLC NAND which requires scrambling and supports
SDR timings mode 5.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_toshiba.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 9c03fbb1f47d..9114b96880d7 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -140,6 +140,14 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 	}
 }
 
+static int tc58teg5dclta00_init(struct nand_chip *chip)
+{
+	chip->onfi_timing_mode_default = 5;
+	chip->options |= NAND_NEED_SCRAMBLING;
+
+	return 0;
+}
+
 static int toshiba_nand_init(struct nand_chip *chip)
 {
 	if (nand_is_slc(chip))
@@ -150,6 +158,9 @@ static int toshiba_nand_init(struct nand_chip *chip)
 	    chip->id.data[4] & TOSHIBA_NAND_ID4_IS_BENAND)
 		toshiba_nand_benand_init(chip);
 
+	if (!strcmp("TC58TEG5DCLTA00", chip->parameters.model))
+		tc58teg5dclta00_init(chip);
+
 	return 0;
 }
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
