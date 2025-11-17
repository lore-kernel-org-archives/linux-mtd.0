Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8B6CE8D6B
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 19:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NvnpYTnL1ep756BDX973QC0Ln+F4CZD9K9xz7v2BrXg=; b=f4RWDRFBGm0Ebl
	xPpCmV9TnA/3v6GUNz8gycH0uzPVQ6Zp3KriYFBd1OQjgF84XAE+YzIEw81Fjqzxu4OQpZPxz88YK
	xXdC2mnmsDnjjEuzWUx47DWBLFXz5J3ioHpq38HnuxN1sTgeUCn0tNQ/Em8kqjrPllfYm+7lT9ltC
	hFv50C58dS/PdIHqRIEOaCcLjscs3d6Jv9pLwgybgHNhP1UwBlRq3SN511SyC7uRZlpy7OAsG7sQI
	P+HzsI2ksc9Ym3/gOsoh5AwzfSmYwTKNfQgfaKQ6qHhFdCMeTP2iBqswr6888u0JzeM9sEBDdT3TF
	+hVkYVYVo50/akgtH9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4w2-0000000GlE8-41k1;
	Mon, 17 Nov 2025 19:30:46 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4w1-0000000GlDq-3E4H;
	Mon, 17 Nov 2025 19:30:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: docg3: fix kernel-doc warnings
Date: Mon, 17 Nov 2025 11:30:45 -0800
Message-ID: <20251117193045.517052-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
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

Fix kernel-doc warnings in docg3.h to avoid build warnings:

Warning: ../drivers/mtd/devices/docg3.h:276 bad line:
Warning: drivers/mtd/devices/docg3.h:299 struct member 'max_block' not
 described in 'docg3'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: remove extraneous "and" in patch description;
    drop the blank kernel-doc line (Miquel)

Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/devices/docg3.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251114.orig/drivers/mtd/devices/docg3.h
+++ linux-next-20251114/drivers/mtd/devices/docg3.h
@@ -274,11 +274,11 @@ struct docg3_cascade {
  * @cascade: the cascade this device belongs to
  * @device_id: number of the cascaded DoCG3 device (0, 1, 2 or 3)
  * @if_cfg: if true, reads are on 16bits, else reads are on 8bits
-
  * @reliable: if 0, docg3 in normal mode, if 1 docg3 in fast mode, if 2 in
  *            reliable mode
  *            Fast mode implies more errors than normal mode.
  *            Reliable mode implies that page 2*n and 2*n+1 are clones.
+ * @max_block: maximum block number for this device
  * @bbt: bad block table cache
  * @oob_write_ofs: offset of the MTD where this OOB should belong (ie. in next
  *                 page_write)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
