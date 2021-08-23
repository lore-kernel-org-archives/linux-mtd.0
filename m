Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE5EC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:37:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3519661242
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3519661242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w89YGrcX7byjL0ih7W3ouxH+9o9R6Pe3aRXWgkyhcyw=; b=d6yuODs7wXCI0i
	BLd4nfW9o4mfYxht31uMVVZaHvdj45Agnzhd5EXZqVOyyFGirRd5hIEWCCEqSWyu/TirvRSMHb53G
	o4mtxhYrhgjXEu66KsZyzKoCzy2pbP2sQGpwY4h7ssj7Z/iK7a7nZrzBzaVUjsyisBA5ajGnHJNzT
	pFDwfpMOg7FysYGgLF+yKWLPXbAjaPm3MkPTszWImch5b9wEgcJXFBpsiTfX0+ZklrIPKfKBjxA5s
	MdUfDfSnkeNqXkCKc4rWpV02G15GLJ7xkOW/jhKn7yrLHsONl8HzawxFC1MJ0euWMvRQX47I+6sng
	aLnB+Ry/fvrOK9Sx8V6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4VQ-00FkmA-13; Mon, 23 Aug 2021 07:36:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4VN-00FklJ-MO
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=b9Uclk6xpoiqnKRmUY/NkslucqoYr3q7peRqvLgdZC0=; b=khgBdt3e+C/I60lCMW3e21PVF8
 ZcxCbOobT2+edSAS9yR0ytdZJXhig5OPGRrqV6BIzcYbWLdMTX+k52DCorgSVlc8KddifcrOKPPFQ
 cBkEh0HFu0Sl3fANZFx4zDbKKuY8CKDjmJU0mRqnOSz+Bcdts/8UnknoOKLjo1PjCEME8eDmHWD0D
 aNP3+ygMzfok/UtMrsr2Fva56da06KSC94M6f04v8/OlNN35308o2E47c2w00FFNfbNg176t+IYe1
 NkmbUsNomYkCPVv+DictHDhmUZYZ/VAPgniEbhIrC8FrasZ2vAyNHY58DLv/gJCrHFKF1ttEo5/q/
 z9NA8QbA==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4UH-009QjV-Sk; Mon, 23 Aug 2021 07:35:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/8] mtd_blkdevs: use lockdep_assert_held
Date: Mon, 23 Aug 2021 09:33:53 +0200
Message-Id: <20210823073359.705281-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823073359.705281-1-hch@lst.de>
References: <20210823073359.705281-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Use lockdep_assert_held to ensure mtd_table_mutex is held instead of
mutex_trylock games.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 6b81a1c9ccbe..81f0ce2a0b5a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -310,10 +310,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	struct gendisk *gd;
 	int ret;
 
-	if (mutex_trylock(&mtd_table_mutex)) {
-		mutex_unlock(&mtd_table_mutex);
-		BUG();
-	}
+	lockdep_assert_held(&mtd_table_mutex);
 
 	mutex_lock(&blktrans_ref_mutex);
 	list_for_each_entry(d, &tr->devs, list) {
@@ -444,10 +441,7 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 {
 	unsigned long flags;
 
-	if (mutex_trylock(&mtd_table_mutex)) {
-		mutex_unlock(&mtd_table_mutex);
-		BUG();
-	}
+	lockdep_assert_held(&mtd_table_mutex);
 
 	if (old->disk_attributes)
 		sysfs_remove_group(&disk_to_dev(old->disk)->kobj,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
