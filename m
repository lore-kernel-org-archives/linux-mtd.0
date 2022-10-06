Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592D0C433FE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KturWT4jK7rHaT1/EeLZcFBE3kEkn0OdD9X9cr4t1ac=; b=X++itg4vGCGXS8
	pmfsa7Nu6A4NhO7UgSX+Pga2eB+6jo63p8npa1B4T8jmoqLAEWK8Y6L0L0fwhJh2e+wN1Y8ykPrQ/
	SEbZBPpg9AwPSxF9gWUwhkunQgEbecLv06KIczMiiDdSCjLEt+LSHDhgJ/7ikgrGUCwJBU3t9EliA
	GP23A7vq6BwesPLZCI1LrZ1WU9/aVm6nkxysqcgNPK4Ee4u3d0fHxNEST2trqhhaubdwH2cKg2S7s
	mV2TVeilPezxlurXlyXw576ge4enFwWmPxu8zZXJwHVhIOH0crUpJQLWKBJPC4Qb1m2AlxO87qRph
	g7+DMJZoETGx8kqkACNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMoL-000wSF-P5; Thu, 06 Oct 2022 09:04:57 +0000
Received: from unicom145.biz-email.net ([210.51.26.145])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogMoF-000w9l-I7
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 09:04:54 +0000
Received: from ([60.208.111.195])
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id BLL00125;
        Thu, 06 Oct 2022 17:04:25 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.12; Thu, 6 Oct 2022 17:04:25 +0800
From: Deming Wang <wangdeming@inspur.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Deming
 Wang <wangdeming@inspur.com>
Subject: [PATCH] mtd: Delete commented printk and add some space for required
Date: Thu, 6 Oct 2022 05:04:19 -0400
Message-ID: <20221006090419.1635-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.200.104.82]
tUid: 202210061704258abef967f8c5459d926e3c657d2d60e7
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_020451_970009_28A1B8CC 
X-CRM114-Status: UNSURE (   9.97  )
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

Delete commented printk for NFTL_findwriteunit and

NFTL_makefreeblock. Add required space for the variable blockofs

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 drivers/mtd/nftlcore.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 64d319e959b2..e3c17ed4c219 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -486,7 +486,6 @@ static u16 NFTL_makefreeblock( struct NFTLrecord *nftl , unsigned pendingblock)
 
 		while (EUN <= nftl->lastEUN) {
 			thislen++;
-			//printk("VUC %d reaches len %d with EUN %d\n", chain, thislen, EUN);
 			EUN = nftl->ReplUnitTable[EUN] & 0x7fff;
 			if (thislen > 0xff00) {
 				printk("Endless loop in Virtual Chain %d: Unit %x\n",
@@ -501,7 +500,6 @@ static u16 NFTL_makefreeblock( struct NFTLrecord *nftl , unsigned pendingblock)
 		}
 
 		if (thislen > ChainLength) {
-			//printk("New longest chain is %d with length %d\n", chain, thislen);
 			ChainLength = thislen;
 			LongestChain = chain;
 		}
@@ -525,7 +523,7 @@ static inline u16 NFTL_findwriteunit(struct NFTLrecord *nftl, unsigned block)
 	u16 thisVUC = block / (nftl->EraseSize / 512);
 	struct mtd_info *mtd = nftl->mbd.mtd;
 	unsigned int writeEUN;
-	unsigned long blockofs = (block * 512) & (nftl->EraseSize -1);
+	unsigned long blockofs = (block * 512) & (nftl->EraseSize - 1);
 	size_t retlen;
 	int silly, silly2 = 3;
 	struct nftl_oob oob;
@@ -592,10 +590,6 @@ static inline u16 NFTL_findwriteunit(struct NFTLrecord *nftl, unsigned block)
 			   a chain to make room.
 			*/
 
-			/* First remember the start of this chain */
-			//u16 startEUN = nftl->EUNtable[thisVUC];
-
-			//printk("Write to VirtualUnitChain %d, calling makefreeblock()\n", thisVUC);
 			writeEUN = NFTL_makefreeblock(nftl, BLOCK_NIL);
 
 			if (writeEUN == BLOCK_NIL) {
@@ -618,7 +612,6 @@ static inline u16 NFTL_findwriteunit(struct NFTLrecord *nftl, unsigned block)
 				printk(KERN_WARNING "Cannot make free space.\n");
 				return BLOCK_NIL;
 			}
-			//printk("Restarting scan\n");
 			continue;
 		}
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
