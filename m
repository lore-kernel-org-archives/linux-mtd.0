Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB220C54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 12:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kWkwO0ftjZ79VKQBLmeVW4eILtx7thlzlQtmgubh/iM=; b=q8DqmDcLWC27v/
	ygQdgV58oEDiZIScfX3dIjiHJAQ8LfESjQcTQxnzREBvNGfIBp2/JJ/QNdA/K41Rcfc491x8ajuVn
	F9limOgo/2VDZrvKE5SqCcNuBAWi1SEF5yWsySbyFgJUIU9w/HHDj/OmpMsOnXoUevuDAYywf5Jbl
	DkVD8y0TKPXvQ19HisjApQMsV0YIGbQXTu9dcapdGWNfwOmmWDqLSDLvfnDI13HaWUmaSGcst8qyi
	uX3M4Ji66f4pw7Sv1pANU4OGvwGNBuHqTlJq8W/0edrsxFQ3aQ2AmmORnFwtHSN+RJCS3OZrdLVA9
	zdPRR+6IptI9dQecP18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpS7W-00000008kOf-3HDQ;
	Wed, 27 Mar 2024 12:11:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpS7Q-00000008kJ9-29Oc
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 12:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CAEF9CE16C2;
	Wed, 27 Mar 2024 12:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81180C433F1;
	Wed, 27 Mar 2024 12:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711541455;
	bh=fqH/vwRWApc26Sbipm6ozbFEBw4FdYS/8zFOtx/kQCs=;
	h=From:To:Cc:Subject:Date:From;
	b=XDTAfM+3cg6Y7XqSxg+1xaNWYwjdsa8D39/Ya/iEp1PqR5n6v861ihotLLVuI4tPB
	 FxaBz/CwDosoXk6GOlNEDVnEeYxe6fvtaES6AfS/GV3qKOcNhnugZw642n/vwsmi3V
	 kFNoQ8KMZEbEjqh/piEuvBq9PwkKoogJtPW9iSpL3yg6wwzvh+PxGzVp8R3uztll4P
	 EWUpLWsf/hkcZNg3ZOPggWwiskzAZGEG5G+6qzUgpV5A5+ddoNWahsfPKM6mexMaQb
	 KE4wn51zEBLEA72WdogYXOKuBJ86Y3iy9pHaNM3PI/l0ecpzsWCEHfZECXVGDVh/9f
	 vmGjbYhWdo9Ww==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: FAILED: Patch "mtd: rawnand: Ensure all continuous terms are always in sync" failed to apply to 6.6-stable tree
Date: Wed, 27 Mar 2024 08:10:53 -0400
Message-ID: <20240327121053.2828334-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_051101_183739_D1142DCD 
X-CRM114-Status: GOOD (  14.80  )
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 6fb075fca63c3486612986eeff84ed4179644038 Mon Sep 17 00:00:00 2001
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 23 Feb 2024 12:55:45 +0100
Subject: [PATCH] mtd: rawnand: Ensure all continuous terms are always in sync

While crossing a LUN boundary, it is probably safer (and clearer) to
keep all members of the continuous read structure aligned, including the
pause page (which is the last page of the lun or the last page of the
continuous read). Once these members properly in sync, we can use the
rawnand_cap_cont_reads() helper everywhere to "prepare" the next
continuous read if there is one.

Fixes: bbcd80f53a5e ("mtd: rawnand: Prevent crossing LUN boundaries during sequential reads")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Link: https://lore.kernel.org/linux-mtd/20240223115545.354541-4-miquel.raynal@bootlin.com
---
 drivers/mtd/nand/raw/nand_base.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d6a27e08b1127..4d5a663e4e059 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1232,6 +1232,15 @@ static void rawnand_cap_cont_reads(struct nand_chip *chip)
 		chip->cont_read.pause_page = rawnand_last_page_of_lun(ppl, first_lun);
 	else
 		chip->cont_read.pause_page = chip->cont_read.last_page;
+
+	if (chip->cont_read.first_page == chip->cont_read.pause_page) {
+		chip->cont_read.first_page++;
+		chip->cont_read.pause_page = min(chip->cont_read.last_page,
+						 rawnand_last_page_of_lun(ppl, first_lun + 1));
+	}
+
+	if (chip->cont_read.first_page >= chip->cont_read.last_page)
+		chip->cont_read.ongoing = false;
 }
 
 static int nand_lp_exec_cont_read_page_op(struct nand_chip *chip, unsigned int page,
@@ -1298,12 +1307,11 @@ static int nand_lp_exec_cont_read_page_op(struct nand_chip *chip, unsigned int p
 	if (!chip->cont_read.ongoing)
 		return 0;
 
-	if (page == chip->cont_read.pause_page &&
-	    page != chip->cont_read.last_page) {
-		chip->cont_read.first_page = chip->cont_read.pause_page + 1;
-		rawnand_cap_cont_reads(chip);
-	} else if (page == chip->cont_read.last_page) {
+	if (page == chip->cont_read.last_page) {
 		chip->cont_read.ongoing = false;
+	} else if (page == chip->cont_read.pause_page) {
+		chip->cont_read.first_page++;
+		rawnand_cap_cont_reads(chip);
 	}
 
 	return 0;
@@ -3510,10 +3518,7 @@ static void rawnand_cont_read_skip_first_page(struct nand_chip *chip, unsigned i
 		return;
 
 	chip->cont_read.first_page++;
-	if (chip->cont_read.first_page == chip->cont_read.pause_page)
-		chip->cont_read.first_page++;
-	if (chip->cont_read.first_page >= chip->cont_read.last_page)
-		chip->cont_read.ongoing = false;
+	rawnand_cap_cont_reads(chip);
 }
 
 /**
-- 
2.43.0





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
