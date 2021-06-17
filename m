Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DA4C2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 11:52:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FFA6613E7
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 11:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FFA6613E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YwTM3WATuNJaYbbKVm66hUUvLRdFiqVr0cPtd+dwtk=; b=15Dgdga+DIR+pL
	1hI/jUH4AQfCRl18F9UTNpN/0rchniSQbdWBXweZ14xqzb7H6ZEpnI6ZzyD3PVkQEuLCxNFB/lHqH
	n5y9mERJjD9pN6MAMaNhGq4kuAfzBpODdZr90F5qZEnxq5Ia7ygmlZuyIQaW47kfd5AwWS5YDLhQ4
	b2GgR3NUvFfgDVICyVd5CtDQN4N6E310GLwR/Fdy0VscqbPdXcjTD9vBQrDmMuGmYqSCt78ESchbg
	bI89Od1gUvKdSPW3Bp/lA4Vqt4V+8tKYdqCayijW9bH9/bMJYDuNG9fINIDxwYAdP2qN0I8aUqfsX
	TnGyYiDi/iR44drL+syg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltqYp-00A9Wh-Q1; Thu, 17 Jun 2021 11:51:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltqYn-00A9VY-PB
 for linux-mtd@bombadil.infradead.org; Thu, 17 Jun 2021 11:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eWfLpTUm88WigYNAtGgk0puveZH4s8vjCO/lhD+KZFA=; b=Ksd9U+/hjhk7n5mA5nDGHYSxdq
 ZjKymSIxqpChMzh0uIjvW46GqzQIAUbUkc2KgZ9iAtw8Occ48KXpEdrwhf1V/SOTILfcoq15YzLe3
 pd2CTMHOibHCqPeQRFeJ+4BC4ILcOzzZlwMQ2XJdFSZSJQvxqsSIiiB86v16VD2X6LhGwWc2G4m1t
 uFkCcygCch96mtPisbW0Rcu8S0F+xiZ7w0iBJigWj0LIkJiT4+ftv1HKs+Gl2mWC+/9jGuRXczqQu
 giuqpDjJl4ppLa1xG1/FiE+jjtHCtzBVDRSSiR/xwcuf8YQMDOUoC40mvQmMTWu7Ez0sr24mI8Vhz
 GU+A0e7g==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1ltqYN-0095Tm-BZ; Thu, 17 Jun 2021 11:51:30 +0000
Date: Thu, 17 Jun 2021 12:51:23 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] block: break circular locks in blk_request_module
Message-ID: <YMs3O/cg4V7ywlVq@infradead.org>
References: <20210617092016.522985-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617092016.522985-1-desmondcheongzx@gmail.com>
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

On Thu, Jun 17, 2021 at 05:20:16PM +0800, Desmond Cheong Zhi Xi wrote:
>  	mutex_lock(&major_names_lock);
>  	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
>  		if ((*n)->major == major && (*n)->probe) {
> -			(*n)->probe(devt);
> +			probe = (*n)->probe;
>  			mutex_unlock(&major_names_lock);
> +			probe(devt);

And now you can all probe after it has been freed and/or the module has
been unloaded. The obviously correct fix is to only hold mtd_table_mutex
for the actually required critical section:

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index fb8e12d590a1..065d94f9b1fb 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -529,13 +529,11 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 		register_mtd_user(&blktrans_notifier);
 
 
-	mutex_lock(&mtd_table_mutex);
 
 	ret = register_blkdev(tr->major, tr->name);
 	if (ret < 0) {
 		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
 		       tr->name, tr->major, ret);
-		mutex_unlock(&mtd_table_mutex);
 		return ret;
 	}
 
@@ -545,12 +543,12 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	tr->blkshift = ffs(tr->blksize) - 1;
 
 	INIT_LIST_HEAD(&tr->devs);
-	list_add(&tr->list, &blktrans_majors);
 
+	mutex_lock(&mtd_table_mutex);
+	list_add(&tr->list, &blktrans_majors);
 	mtd_for_each_device(mtd)
 		if (mtd->type != MTD_ABSENT)
 			tr->add_mtd(tr, mtd);
-
 	mutex_unlock(&mtd_table_mutex);
 	return 0;
 }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
