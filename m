Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39455C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RMWgqs7gfuhx9XONidHMZD1Idz1YlZFk6AX7xTzIbdc=; b=eCGU5L0nxwLIFY
	sTmUaCF/QqG58q9QwvlT/2OBRHngVQCA9J+KJwbhQOvrgheUp7h6JFYhxOAHP2wZ7z0itAOrWFxyL
	bThvbVBX/KMSavv/0aagoooJhpjgU/ZCknHYRw0d0l1PXNRbldzE9a/U9XrdBhhriZqeocCRJcmnp
	bemrg+IQmiybTD2QepR5bi9PM8MRSyEtx1ojXPNwyIkOv/9F3OFZOB80J+FaLtmgnRofb1qqcmcvU
	LrkOjwaThzlVW7z0MR6uOfkEdfB0GoQSPgyvjdf4eE76UCDVCJrv5ZcD9vt4o+rNthjt0swWoghy7
	IjGEjzNlKV5ze9BTf/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms5vH-0069Rr-Sl; Tue, 30 Nov 2021 16:24:03 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms5vF-0069QL-7v
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 16:24:02 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:8920:40aa:e125:4a65])
 by michel.telenet-ops.be with bizsmtp
 id QgPo2600v173Tg306gPoqr; Tue, 30 Nov 2021 17:23:54 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ms5v2-001YvT-9R; Tue, 30 Nov 2021 17:23:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1ms5v1-00GlJG-RE; Tue, 30 Nov 2021 17:23:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-mtd@lists.infradead.org, linux-block@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC -nxt] mtd_blkdevs: Set GENHD_FL_NO_PART
Date: Tue, 30 Nov 2021 17:23:46 +0100
Message-Id: <c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_082401_465453_63D49E23 
X-CRM114-Status: GOOD (  12.61  )
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

When DT declares the partitions of an spi-nor device using
"fixed-partitions", the individual mtdblockN partitions are now scanned
for partitition tables, which should not happen.

Fix this by setting the GENHD_FL_NO_PART flag in the MTD block layer
interface.

Fixes: 1ebe2e5f9d68e94c ("block: remove GENHD_FL_EXT_DEVT")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Seen with e.g. arch/arm/boot/dts/r8a7791-koelsch.dts.
I only noticed because I have debug code to measure QSPI performance,
which informed me about 8 x 512 bytes being read from each partition
detected.

RFC as I'm not sure this is correct in all cases.
I did verify that in the absence of "fixed-partitions", the spi-nor
device is not scanned for partitions before and after commit
1ebe2e5f9d68e94c.
---
 drivers/mtd/mtd_blkdevs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 113f86df76038575..95c84faa794d22c6 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -345,6 +345,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	gd->first_minor = (new->devnum) << tr->part_bits;
 	gd->minors = 1 << tr->part_bits;
 	gd->fops = &mtd_block_ops;
+	gd->flags |= GENHD_FL_NO_PART;
 
 	if (tr->part_bits)
 		if (new->devnum < 26)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
