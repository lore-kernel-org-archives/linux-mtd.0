Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB30C5B552
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Jun 2025 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6wXskysBEN7kurxHJWdxqOCrewKeh7x8C8hW23qJ5TI=; b=m+x1lzVQ53pHAg
	ba2oWymjzjxp8X6DH92aqHtq4ewMXJbVknGO48shEW6pWhlMMT065uhaR+fD2VMeXF7Cy6wMCqrDZ
	JPpmFSwGrmPktkiAVRFCTVTOlIhyPHOeJ8XcgxtpqF55rKp5dNmbsEP/k7MTZcnP4O2mfjKGaGDce
	BDeqcqQetPmsPO/B9/7naLfLYA3nOhucBtbBudrOXYQa+ThY/PxyyWHIXKJCfbc3tRg0kIEX1BsU4
	P8Og0QVFEkeb7nfG8n657oNQyMKBSpgJSU7hndbLLWwZZhCjpexJwUFT01AnHJcNDrVw0y2LLAhb2
	ThdVkaOz1GdBTswq4Wzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvca-00000006Os9-1dd2;
	Tue, 10 Jun 2025 09:50:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvEZ-00000006KOW-2MQL
	for linux-mtd@lists.infradead.org;
	Tue, 10 Jun 2025 09:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A627560007;
	Tue, 10 Jun 2025 09:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D63C4CEEF;
	Tue, 10 Jun 2025 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547530;
	bh=RfZNz0n2J2TJ6046WMefgYpYZO2DefM5CufpjlFs2pY=;
	h=From:To:Cc:Subject:Date:From;
	b=NQuq14ErrXeuyu47nWnBPsc9raD8bX4awuNRC/5q1YaBDkP9DiWJeIBp5FivpliRE
	 ND04jw9qhEIRKZJqIAPIkgY6FdbOT0xZ72ugUHVHoJChFbPH57UQZy3sZMywwqY5++
	 8I5AyvR07k1Lp2FKlCBnzU4SBHtQGO8os70KeSaaeEj/HnHuVMDB/GCA6Zf7xQNXIu
	 2ktv2fLsT2Iy7VOarMJ3b8KLy1INzanfvpdVuc6EGlz+O49iicbqqI4QG+8RO4uoRo
	 evh9lNtm46FcCyxNlh31iNIv2HjSVqOXxEJS7zP+9+dUKnLvVCha/Pi+ar8fNWTyxQ
	 FZwij3Z73V0YA==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nftl: reduce stack usage in NFTL_movebuf()
Date: Tue, 10 Jun 2025 11:25:22 +0200
Message-Id: <20250610092526.2640870-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

The code in the ntfl write function is rather complex, and it contains
a 512 byte on-stack buffer. The combination of these two leads to using
more than the per-function stack warning limit in some configurations,
especially with KASAN enabled:

drivers/mtd/nftlcore.c:673:12: error: stack frame size (1328) exceeds limit (1280) in 'nftl_writeblock' [-Werror,-Wframe-larger-than]

Avoid this warning by moving the on-stack buffer into a separate function
that only copies one part of the device to another.

This does not really help with the total maximum stack usage in the
(non-KASAN) normal case, but it does two things:

 - no single function has more than the warning limit
 - the complexity goes down, so the parent function ends up
   spilling few local variables, and the total actually goes
   down slightly.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nftlcore.c | 43 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 64d319e959b2..868aa3d35d09 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -228,6 +228,25 @@ static u16 NFTL_findfreeblock(struct NFTLrecord *nftl, int desperate )
 	return BLOCK_NIL;
 }
 
+static noinline_for_stack void NFTL_move_block(struct mtd_info *mtd, loff_t src, loff_t dst)
+{
+	unsigned char movebuf[512];
+	struct nftl_oob oob;
+	size_t retlen;
+	int ret;
+
+	ret = mtd_read(mtd, src, 512, &retlen, movebuf);
+	if (ret < 0 && !mtd_is_bitflip(ret)) {
+		ret = mtd_read(mtd, src, 512, &retlen, movebuf);
+		if (ret != -EIO)
+			printk("Error went away on retry.\n");
+	}
+	memset(&oob, 0xff, sizeof(struct nftl_oob));
+	oob.b.Status = oob.b.Status1 = SECTOR_USED;
+
+	nftl_write(mtd, dst, 512, &retlen, movebuf, (char *)&oob);
+}
+
 static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned pendingblock )
 {
 	struct mtd_info *mtd = nftl->mbd.mtd;
@@ -389,9 +408,6 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 	*/
 	pr_debug("Folding chain %d into unit %d\n", thisVUC, targetEUN);
 	for (block = 0; block < nftl->EraseSize / 512 ; block++) {
-		unsigned char movebuf[512];
-		int ret;
-
 		/* If it's in the target EUN already, or if it's pending write, do nothing */
 		if (BlockMap[block] == targetEUN ||
 		    (pendingblock == (thisVUC * (nftl->EraseSize / 512) + block))) {
@@ -403,25 +419,8 @@ static u16 NFTL_foldchain (struct NFTLrecord *nftl, unsigned thisVUC, unsigned p
 		if (BlockMap[block] == BLOCK_NIL)
 			continue;
 
-		ret = mtd_read(mtd,
-			       (nftl->EraseSize * BlockMap[block]) + (block * 512),
-			       512,
-			       &retlen,
-			       movebuf);
-		if (ret < 0 && !mtd_is_bitflip(ret)) {
-			ret = mtd_read(mtd,
-				       (nftl->EraseSize * BlockMap[block]) + (block * 512),
-				       512,
-				       &retlen,
-				       movebuf);
-			if (ret != -EIO)
-				printk("Error went away on retry.\n");
-		}
-		memset(&oob, 0xff, sizeof(struct nftl_oob));
-		oob.b.Status = oob.b.Status1 = SECTOR_USED;
-
-		nftl_write(nftl->mbd.mtd, (nftl->EraseSize * targetEUN) +
-			   (block * 512), 512, &retlen, movebuf, (char *)&oob);
+		NFTL_move_block(mtd, (nftl->EraseSize * BlockMap[block]) + (block * 512),
+				(nftl->EraseSize * targetEUN) + (block * 512));
 	}
 
 	/* add the header so that it is now a valid chain */
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
