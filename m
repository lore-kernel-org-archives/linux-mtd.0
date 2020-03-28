Return-Path: <SRS0=12Mr=5N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB11C43331
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Mar 2020 13:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29C8206F6
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Mar 2020 13:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J0XL4PTc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D29C8206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n5ad0dvrGS8xVK248Yv393eiirY9bcYmgbTpl+8Yljw=; b=J0XL4PTcohc9Md
	KPZxiD+H9HGGJ0+FkuWkk8hHXF6aRzQkmmt8ybAqkdzu0E5ED55h/G63BZYs5Wew8KashTnKVcS5y
	5pj64tziJXUArjurDkylpb3laGCfjCSSeyMHqHu3VFXw/PaHbeFj8t5MSUZMI7LGx3v91bCge0ia/
	ZRylExLP55E38/aiXd4fgRmu3EcfRANr62PKHsTEq78HKtFHycoNwrJ2u2Q6degWQnzp+zeCJgqO8
	l69r4kT/PxrT1lruKdPIhAbS1P6AwsyrBlrkC/LFZGpyTIjKtdV7XAr/FN1w/R/ri759JChpI7N0I
	eR6culeqY0GEsK4sbdOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIB5z-00063p-FU; Sat, 28 Mar 2020 13:01:51 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIB5r-00062A-O1
 for linux-mtd@lists.infradead.org; Sat, 28 Mar 2020 13:01:45 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CC0D1DB02DE44016DCAE;
 Sat, 28 Mar 2020 21:01:26 +0800 (CST)
Received: from use12-sp2.huawei.com (10.67.189.174) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sat, 28 Mar 2020 21:01:20 +0800
From: Xiaoming Ni <nixiaoming@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH] mtd:clear cache_state to avoid writing to bad clocks
 repeatedly
Date: Sat, 28 Mar 2020 21:01:17 +0800
Message-ID: <1585400477-65705-1-git-send-email-nixiaoming@huawei.com>
X-Mailer: git-send-email 1.8.5.6
MIME-Version: 1.0
X-Originating-IP: [10.67.189.174]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200328_060144_356673_E54270EB 
X-CRM114-Status: GOOD (  12.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: wangle6@huawei.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, zhangweimin12@huawei.com, houtao1@huawei.com,
 nixiaoming@huawei.com, yebin10@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The function call process is as follows:
	mtd_blktrans_work()
	  while (1)
	    do_blktrans_request()
	      mtdblock_writesect()
	        do_cached_write()
	          write_cached_data() /*if cache_state is STATE_DIRTY*/
	            erase_write()

write_cached_data() returns failure without modifying cache_state
and cache_offset. so when do_cached_write() is called again,
write_cached_data() will be called again to perform erase_write()
on the same cache_offset.

but if this cache_offset points to a bad block, erase_write() will
always return -EIO. Writing to this mtdblk is equivalent to losing
the current data, and repeatedly writing to the bad block.

Repeatedly writing a bad block has no real benefits,
but brings some negative effects:
1 Lost subsequent data
2 Loss of flash device life
3 erase_write() bad blocks are very time-consuming. for example:
	the function do_erase_oneblock() in chips/cfi_cmdset_0020.c or
	chips/cfi_cmdset_0002.c may take more than 20 seconds to return

Therefore, when erase_write() returns -EIO in write_cached_data(),
clear cache_state to avoid writing to bad clocks repeatedly.

Signed-off-by: Xiaoming Ni <nixiaoming@huawei.com>
---
 drivers/mtd/mtdblock.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 078e0f6..98c25d6 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -89,8 +89,6 @@ static int write_cached_data (struct mtdblk_dev *mtdblk)
 
 	ret = erase_write (mtd, mtdblk->cache_offset,
 			   mtdblk->cache_size, mtdblk->cache_data);
-	if (ret)
-		return ret;
 
 	/*
 	 * Here we could arguably set the cache state to STATE_CLEAN.
@@ -98,9 +96,14 @@ static int write_cached_data (struct mtdblk_dev *mtdblk)
 	 * be notified if this content is altered on the flash by other
 	 * means.  Let's declare it empty and leave buffering tasks to
 	 * the buffer cache instead.
+	 *
+	 * if this cache_offset points to a bad block
+	 * data cannot be written to the device.
+	 * clear cache_state to avoid writing to bad clocks repeatedly
 	 */
-	mtdblk->cache_state = STATE_EMPTY;
-	return 0;
+	if (ret == 0 || ret == -EIO)
+		mtdblk->cache_state = STATE_EMPTY;
+	return ret;
 }
 
 
-- 
1.8.5.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
