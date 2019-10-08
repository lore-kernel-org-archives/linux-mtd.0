Return-Path: <SRS0=afzE=YB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F73AC10F14
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 13:12:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22F8D206BB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 13:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSmOgmDL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22F8D206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJIpMlyKIxsa1bhUO75S9VtW7bfkrC5CXAdxTjsifd4=; b=QSmOgmDLznAVWS
	332cPiOjcJ3b3Kp0MbyqBJQhcPX32UQcPOyXaL8sb5/Ky59i3ykHZsz6Ks7qsXAKJ3qBpiZrJqyCf
	w4SIv3xGXPq1JtlKnDDw90Y71ie7RBhY6JpOE2i8YqF/EcD6Srgv5t9SfmIttx0Pb17eZf8ol1e6y
	mdPCOMHtlVfE721G+Irm9/911VzTFIBs5xt09+Ul4TLZpfF/E6scfWbRnHkvCsRbKmBw3g07SyBLr
	CyAh4k4T4WwSKe5Vfh5ZKm1ISI/LfygmRBVByApqzk348KVvnkWxtqsB5llWgcRofjwDFlC567UqV
	ADZrdLtm7+4DziPnWbyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHpID-0006T6-DU; Tue, 08 Oct 2019 13:12:45 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHpI9-0006S2-Up
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2019 13:12:44 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D0DBFF939A5CF394AFA8;
 Tue,  8 Oct 2019 21:12:32 +0800 (CST)
Received: from [127.0.0.1] (10.177.31.14) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 21:12:28 +0800
Subject: Re: [PATCH] mtd: blkdevs: protect tr->devs list by mtd_table_mutex
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, Maxim Levitsky <maximlevitsky@gmail.com>
References: <20190929141157.115845-1-houtao1@huawei.com>
Message-ID: <fb4b28cb-7bb8-d7a9-abd2-10ed587674f2@huawei.com>
Date: Tue, 8 Oct 2019 21:12:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190929141157.115845-1-houtao1@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.177.31.14]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_061242_592711_72D72CD4 
X-CRM114-Status: GOOD (  21.78  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ping ?

On 2019/9/29 22:11, Hou Tao wrote:
> There may be list corruption if there are concurrent list traversal
> and list deletion on tr->devs as showed in the following case:
> 
> CPU 0                               CPU 1
> 
> open /dev/mtdblock1
> 
> // remove mtd1
> blktrans_notify_remove()
>     del_mtd_blktrans_dev()
> 
> close /dev/mtdblock1
>   blktrans_release
>     blktrans_dev_put
>       acquire blktrans_ref_mutex     // remove mtd0
>       // the final release           acquire mtd_table_mutex
>       blktrans_dev_release()         blktrans_notify_remove()
>         // remove mtdblock1            // next is mtdblock1
>         list_del(&dev->list)           list_for_each_entry_safe()
> 
> We could fix the problem by acquiring blktrans_ref_mutex during
> the traversal of tr->devs, but blktrans_ref_mutex needs to be released
> before invoking tr->remote_dev(), so we also need to increase the kref
> of current device else the device may be freed and decrease the kref
> after the removal.
> 
> Or we could move the list deletion to del_mtd_blktrans_dev(), and protect
> the operations on tr->devs by mtd_table_mutex which has already be taken.
> 
> The latter fix is simpler. We also can remove the unnecessary acquisitions
> of blktrans_ref_mutex in add_mtd_blktrans_dev() because operations on
> tr->devs have already been protected by mtd_table_mutex.
> 
> Fixes: 048d87199566 ("mtd: blktrans: Hotplug fixes")
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
> I found the problem by code review, and could not find a way to
> ensure the problem, because the removal of mtd devices almost
> comes from the removal of modules, and the open of /dev/mtdblockX
> will prevent the module from removing.
> ---
>  drivers/mtd/mtd_blkdevs.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 0c05f77f9b21..e04260237a25 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -35,7 +35,6 @@ static void blktrans_dev_release(struct kref *kref)
>  	blk_mq_free_tag_set(dev->tag_set);
>  	kfree(dev->tag_set);
>  	put_disk(dev->disk);
> -	list_del(&dev->list);
>  	kfree(dev);
>  }
>  
> @@ -350,7 +349,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>  		BUG();
>  	}
>  
> -	mutex_lock(&blktrans_ref_mutex);
>  	list_for_each_entry(d, &tr->devs, list) {
>  		if (new->devnum == -1) {
>  			/* Use first free number */
> @@ -362,7 +360,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>  			}
>  		} else if (d->devnum == new->devnum) {
>  			/* Required number taken */
> -			mutex_unlock(&blktrans_ref_mutex);
>  			return -EBUSY;
>  		} else if (d->devnum > new->devnum) {
>  			/* Required number was free */
> @@ -381,14 +378,12 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>  	 * with this number. */
>  	if (new->devnum > (MINORMASK >> tr->part_bits) ||
>  	    (tr->part_bits && new->devnum >= 27 * 26)) {
> -		mutex_unlock(&blktrans_ref_mutex);
>  		goto error1;
>  	}
>  
>  	list_add_tail(&new->list, &tr->devs);
> - added:
> -	mutex_unlock(&blktrans_ref_mutex);
>  
> + added:
>  	mutex_init(&new->lock);
>  	kref_init(&new->ref);
>  	if (!tr->writesect)
> @@ -484,6 +479,8 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
>  		BUG();
>  	}
>  
> +	list_del(&old->list);
> +
>  	if (old->disk_attributes)
>  		sysfs_remove_group(&disk_to_dev(old->disk)->kobj,
>  						old->disk_attributes);
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
