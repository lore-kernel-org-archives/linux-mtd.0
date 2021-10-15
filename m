Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553D4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2940161151
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 23:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2940161151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O435UnqL1dgxZMhvsJGemGaoiImItDAYY/+lmcJxeF4=; b=NjU7XQ5B7hY58O
	Tn1qUpsC9XsyHRbKz+8nMg5RZTPTgHvp7NjM3fOxtwCjyKLrdr49xcTOYzR+jOAE8T2onMrnMhcwB
	6UGSyPS9dasZVpRTvrTueJJYLJ7eh0svzebtASUrBNJNV61Km5qVAyMLDNel8KLgPTW5fL12d5QDz
	7e0mDv5YPs3G7aSxnqQiaANaWNKyB4UqQdgINn6SJ32qtFqVbyeCL4n/qHOUCqkaEJKioOEEW6fII
	DmYVt7xW00kPGWBR+ssPjzXSon6SJpo+sveelcnY32cVC3Vs1TCzB8i7koMV3kns1W8cwu9sazuvu
	z2Fp8ZKjJCmoSET40vfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWfI-0096Fc-IK; Fri, 15 Oct 2021 23:31:04 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095v3-Bg; Fri, 15 Oct 2021 23:30:29 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, jejb@linux.ibm.com, martin.petersen@oracle.com,
 agk@redhat.com, snitzer@redhat.com, colyli@suse.de,
 kent.overstreet@gmail.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, roger.pau@citrix.com, geert@linux-m68k.org,
 ulf.hansson@linaro.org, tj@kernel.org, hare@suse.de, jdike@addtoit.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
 krisman@collabora.com, chris.obbard@collabora.com, thehajime@gmail.com,
 zhuyifei1999@gmail.com, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com, linux-mtd@lists.infradead.org
Cc: linux-scsi@vger.kernel.org, dm-devel@redhat.com,
 linux-bcache@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 6/9] m68k/emu/nfblock: add error handling support for
 add_disk()
Date: Fri, 15 Oct 2021 16:30:25 -0700
Message-Id: <20211015233028.2167651-7-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
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

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 arch/m68k/emu/nfblock.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index 9a8394e96388..4de5a6087034 100644
--- a/arch/m68k/emu/nfblock.c
+++ b/arch/m68k/emu/nfblock.c
@@ -100,6 +100,7 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 {
 	struct nfhd_device *dev;
 	int dev_id = id - NFHD_DEV_OFFSET;
+	int err = -ENOMEM;
 
 	pr_info("nfhd%u: found device with %u blocks (%u bytes)\n", dev_id,
 		blocks, bsize);
@@ -130,16 +131,20 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 	sprintf(dev->disk->disk_name, "nfhd%u", dev_id);
 	set_capacity(dev->disk, (sector_t)blocks * (bsize / 512));
 	blk_queue_logical_block_size(dev->disk->queue, bsize);
-	add_disk(dev->disk);
+	err = add_disk(dev->disk);
+	if (err)
+		goto out_cleanup_disk;
 
 	list_add_tail(&dev->list, &nfhd_list);
 
 	return 0;
 
+out_cleanup_disk:
+	blk_cleanup_disk(dev->disk);
 free_dev:
 	kfree(dev);
 out:
-	return -ENOMEM;
+	return err;
 }
 
 static int __init nfhd_init(void)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
