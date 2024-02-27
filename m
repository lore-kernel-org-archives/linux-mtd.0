Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F51C54798
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 19:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tP71mUhvrgGdWGDohMAXmOtkeo1/8MLjL06AhtNC9po=; b=FlMaC2wKsDNJjQ
	N5LxUy20vkAAPrkDGnKU/qlWqejvcDGIO+H6aRYUuEoG+h0xJzCfTrDk7zVXwVWPM6jYzRm9KK21n
	Ifv48D2woiX5Y4Ds9QiU336EkPbi2qWfWCvrM3oG2YLKCfk5/yPnBCbrc8Qu4cpaGuUPx8o4QQYmp
	lb1ljeYPY+ExEoKs6yofYM4+RW0x1F7m8MrHr/xqZxZ4lgoebIqTQog4xKjIjNpLP/OBSkAMNAeXj
	xlmizuUMpbUSjZPJXnsMlEcJlaoMZO6Dr9stcOoSMMXj/d9CnoFxjCIl+kPnTpXhOl7a9RaTIgsct
	qP+joJQIt8+XLr0VF+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2jf-00000006Xbo-2kCc;
	Tue, 27 Feb 2024 19:03:27 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2jZ-00000006XXr-3M4r;
	Tue, 27 Feb 2024 19:03:25 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 38C09C002447;
	Tue, 27 Feb 2024 11:03:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 38C09C002447
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1709060598;
	bh=BoWABUn1BHPA1kyndGRUMStiFm/fHNE3QtKwM9H3nBM=;
	h=From:To:Cc:Subject:Date:From;
	b=OVFmRDrYgzqLGPly1HT6HYrshnsYYT48BvU8jVn9UBewjWVkzpDazgtEEbk4qMIVc
	 jgT0+K0xciQkv++/5yukLJWftEr14alsLbKIh9UOWrICPqIBE+IHh5QuuBe4JLf79H
	 cCLrw4v5+scKOo4maI5BkHnpVe1iPl0UYpJJxxNQ=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id B9BB418041CAC4;
	Tue, 27 Feb 2024 11:03:16 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	miquel.raynal@bootlin.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	kernel test robot <lkp@intel.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	David Regan <dregan@broadcom.com>
Subject: [PATCH] mtd: rawnand: brcmnand: fix sparse warnings
Date: Tue, 27 Feb 2024 11:02:57 -0800
Message-Id: <20240227190258.200929-1-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_110322_076950_D9A974DE 
X-CRM114-Status: GOOD (  13.08  )
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

Fix the following sparse warnings:
sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:79:41: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse:
cast removes address space '__iomem' of expression
   drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c:80:17: sparse: sparse:
cast removes address space '__iomem' of expression

Fixes: c52c16d1bee5 ("mtd: rawnand: brcmnand: Add BCMBCA read data bus interface")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402270940.gmVLVRg0-lkp@intel.com/
Signed-off-by: William Zhang <william.zhang@broadcom.com>

---

 drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
index 7ad3e7a98f97..ea534850b97a 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcmbca_nand.c
@@ -76,8 +76,8 @@ static void bcmbca_read_data_bus(struct brcmnand_soc *soc,
 	 * and dest address, which is incompatible with nand cache. Fallback
 	 * to the memcpy_fromio in such case
 	 */
-	if (bcmbca_nand_is_buf_aligned((void *)flash_cache, buffer))
-		memcpy((void *)buffer, (void *)flash_cache, fc_words * 4);
+	if (bcmbca_nand_is_buf_aligned((void __force *)flash_cache, buffer))
+		memcpy((void *)buffer, (void __force *)flash_cache, fc_words * 4);
 	else
 		memcpy_fromio((void *)buffer, flash_cache, fc_words * 4);
 }
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
