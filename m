Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4167FC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 21:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IEVmgID6SmfrLGJPKNJkxgJ1Ob7rGh1Ufhowml9Y4lc=; b=s4d29j/bewd6Kd
	4IbaFkpCXF+Ukssiz8d4AupuEczD27exRgcWQViDV6rpv3T7zWf8ArTnBYUbeRie2XTPOfWq/I9mp
	yS+UPbepPDDvR6DxrC/jJKeu9x8r2KxsRgGFSWLlA6b9znafUr1S62jwe2nEGhuVL+Tmh6y0MoA+U
	v9Ey0+IXRxcNj63l6dxzEHZzQ62l+kf/gv4ECoyjJihD3tkZwvoYE260Niwx+yAJLYG4Gs1tTKuXb
	lhSy7sNMKPMHRzW0Deja6TZ7RXmYwkurPUIn/k4MiqwIIoQ71l8TOQO3zb5IXbdZ8R/Or5zwOx85S
	0ulABeBRSz7I+PXwN8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9B0O-00EfMK-04;
	Fri, 01 Dec 2023 21:25:00 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9B0K-00EfLQ-1U
	for linux-mtd@lists.infradead.org;
	Fri, 01 Dec 2023 21:24:58 +0000
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 1F4DFC0026F7;
	Fri,  1 Dec 2023 13:24:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 1F4DFC0026F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1701465893;
	bh=vrVkTfIsWsT8Eahag1TdS0Wt98iSbiCsHD0P4PcYheg=;
	h=From:To:Subject:Date:From;
	b=mfy+ovjXTbcYsnjF66uv7gotQKR7IeIFXWg/HwaDebtRzMYRl1lnXxxBPBje7HyOE
	 5zLANU4AhEk2UeCoRsHkASAjSzGDWVtv0vKzGPu5VY1ebpHkR5uwGVujV62kLXBrGP
	 RptI+77X8FoexGaX4hndVzSFkXMfTNSoMeohJxbk=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.75.138.105])
	by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 0F1F318728D;
	Fri,  1 Dec 2023 13:24:53 -0800 (PST)
From: dregan <dregan@broadcom.com>
To: dregan <dregan@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH v2 1/1] mtd: rawnand: Add deassert_wp comment
Date: Fri,  1 Dec 2023 13:24:46 -0800
Message-Id: <20231201212446.189491-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_132456_982806_895D0902 
X-CRM114-Status: UNSURE (   8.64  )
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

From: David Regan <dregan@broadcom.com>

Add deassert_wp description comment

Signed-off-by: David Regan <dregan@broadcom.com>
---
Changes in v2: removed Boris Brezillon as author and SOB
---
 include/linux/mtd/rawnand.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index fcad94aa0515..3049b05d8a20 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1001,6 +1001,8 @@ struct nand_op_parser {
 /**
  * struct nand_operation - NAND operation descriptor
  * @cs: the CS line to select for this NAND operation
+ * @deassert_wp: set to true when the operation requires the WP pin to be
+ *		 de-asserted (ERASE, PROG, ...)
  * @instrs: array of instructions to execute
  * @ninstrs: length of the @instrs array
  *
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
