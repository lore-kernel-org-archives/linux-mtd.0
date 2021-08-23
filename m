Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E873C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:39:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8AC61242
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B8AC61242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oo2fWhvUjVw5PuD/ET1cum5nQGm4QhbuqH5p+MUuzp8=; b=U/aMpNMdsUxHdY
	KEpEw6RAOawvMkjvTvEI2Csa0sP9q9ri8SdSfgivLD1LmJ14lEX1NX+9OdgF4S50HuvWqUIuV7Zcs
	il54126OTH2imqWZQiVuFPTr+TPUya0uvrw1T4ocTLf07jHFwOyOP6FNWy7NmHYFtOy7JiInPxu+q
	5vtBMsze05TTIbR/oTQoHAeQls0Ni58V5efLOOwP289/YzYGesWRn4YuWqqrthk396/G4hyCD2X7y
	kdxmLv1XnKkh9X/wSf2LpVulVsV1oW1LwOxUfTI1NeuDiS1jqZqx/SQY7cEuPIXQ/ALQZwPvKttVU
	HpSIVGRjmwc4psQgGY6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4Xx-00FldA-Ts; Mon, 23 Aug 2021 07:39:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Xw-00FlcT-PH
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Rv7dq3PUX/Wod9/odynZeofhwYjWg3dzwGlAC8IVmSU=; b=nagscX5z7wfrwRMMcCbRyEClwn
 Ma2k3yXNHjWz9UX4rFYotc1XfhO7Egyb7qpIor/YsjPjRKMB4QSroUDPkfvmUIC20Yj96983bzrVj
 3VPodgqJiKW0t1wzvhLPW2ONv5GiX4bQX2Up/BAW649Orr0yvoCLlHJsV9ZqQVT5UEzyhbxFcy0Xu
 hdnjQt8hvu2pU6++FpUl19nozgfgIrS9T0Gd/ItJZqkgocEj5RJV9jshyfKb0s2brX6PxkbdwPuHB
 6jQaMl0zIAugVu7PR2OIC008UkxB5kxFSZyp9OA4/2sM4SqP08yxR3Y1xmpi3jArxE18I9ApwJIE8
 uJxwIlGA==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4X0-009Qs0-Et; Mon, 23 Aug 2021 07:38:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 6/8] mtd_blkdevs: remove blktrans_ref_mutex
Date: Mon, 23 Aug 2021 09:33:57 +0200
Message-Id: <20210823073359.705281-7-hch@lst.de>
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

blktrans_ref_mutex is not actually needed.  The kref is serialized
internally, and devnum assignment in add_mtd_blktrans_dev happens before
the disk is added and thus any of the block_device_operations methods
otherwise using it are called.  It  is also already serialized by the
global mtd_table_mutex.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/mtd_blkdevs.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index f5e13b919614..6f226b7cbb5c 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -23,7 +23,6 @@
 #include "mtdcore.h"
 
 static LIST_HEAD(blktrans_majors);
-static DEFINE_MUTEX(blktrans_ref_mutex);
 
 static void blktrans_dev_release(struct kref *kref)
 {
@@ -41,18 +40,13 @@ static struct mtd_blktrans_dev *blktrans_dev_get(struct gendisk *disk)
 {
 	struct mtd_blktrans_dev *dev = disk->private_data;
 
-	mutex_lock(&blktrans_ref_mutex);
 	kref_get(&dev->ref);
-	mutex_unlock(&blktrans_ref_mutex);
-
 	return dev;
 }
 
 static void blktrans_dev_put(struct mtd_blktrans_dev *dev)
 {
-	mutex_lock(&blktrans_ref_mutex);
 	kref_put(&dev->ref, blktrans_dev_release);
-	mutex_unlock(&blktrans_ref_mutex);
 }
 
 
@@ -299,7 +293,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	lockdep_assert_held(&mtd_table_mutex);
 
-	mutex_lock(&blktrans_ref_mutex);
 	list_for_each_entry(d, &tr->devs, list) {
 		if (new->devnum == -1) {
 			/* Use first free number */
@@ -311,7 +304,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 			}
 		} else if (d->devnum == new->devnum) {
 			/* Required number taken */
-			mutex_unlock(&blktrans_ref_mutex);
 			return -EBUSY;
 		} else if (d->devnum > new->devnum) {
 			/* Required number was free */
@@ -329,14 +321,11 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	 * minor numbers and that the disk naming code below can cope
 	 * with this number. */
 	if (new->devnum > (MINORMASK >> tr->part_bits) ||
-	    (tr->part_bits && new->devnum >= 27 * 26)) {
-		mutex_unlock(&blktrans_ref_mutex);
+	    (tr->part_bits && new->devnum >= 27 * 26))
 		return ret;
-	}
 
 	list_add_tail(&new->list, &tr->devs);
  added:
-	mutex_unlock(&blktrans_ref_mutex);
 
 	mutex_init(&new->lock);
 	kref_init(&new->ref);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
