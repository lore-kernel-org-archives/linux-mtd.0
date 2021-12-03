Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0412C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 06:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvl4RaiSn6iBlTaonIqUDCjH/RrcuC9HpDHMvzKhEWE=; b=hso6SmtCfLF8w3
	4ksFTNrntO0v/oNkEB9TpOXogAp3G8AO/+AU+lmvaL0oyoZ3M3+Kq9mnJAJQX7tdptohlvpRcceyI
	S2poooi0+2+5vH9t2HGcAW3Fjib+tYnYTqkM9tYK4V6vBJSXRCbM4cCmdaYQybuEh6QP/qrb1ItbC
	U7nxSb5C90FW/P1T4GMuH0xroDq0gJy9w/gBMvzZvjRazZncGvz8PMOlZpHwjEPt1iHzh0Y384Po+
	XobZBPza8lXpOfahN3LMPB9KEN/vBkX5meiexHZquG6Bzx4Pfh3cpWYj8bmTZbrfY5nHpSr+V85Wo
	JgAp8XPH4tx5CWmY0Juw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt2Vt-00Ee1m-Qk; Fri, 03 Dec 2021 06:57:45 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt2Vo-00EdzH-Hk
 for linux-mtd@lists.infradead.org; Fri, 03 Dec 2021 06:57:42 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id F2F6868AFE; Fri,  3 Dec 2021 07:57:26 +0100 (CET)
Date: Fri, 3 Dec 2021 07:57:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-mtd@lists.infradead.org, linux-block@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC -nxt] mtd_blkdevs: Set GENHD_FL_NO_PART
Message-ID: <20211203065726.GA3072@lst.de>
References: <c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c26dfdf9ce56e92d23530a09db386b283e62845d.1638289204.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_225740_783433_1DFC72F7 
X-CRM114-Status: GOOD (  10.82  )
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

I think we need the patch below to restore the old behavior where a
partitions scan happens only for those sub-drivers that do report a
partition shift.

MTD maintainers: is this intentional that raw mtdblock does not support
partitions, but the various "FTL" modules do?

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 113f86df76038..57a22d2ebaeca 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -345,6 +345,8 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	gd->first_minor = (new->devnum) << tr->part_bits;
 	gd->minors = 1 << tr->part_bits;
 	gd->fops = &mtd_block_ops;
+	if (!tr->part_bits)
+		gd->flags |= GENHD_FL_NO_PART;
 
 	if (tr->part_bits)
 		if (new->devnum < 26)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
