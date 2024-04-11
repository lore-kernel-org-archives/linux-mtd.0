Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B05C4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 15:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkZnTHUfQec25GC0HGH0QmvEmZBpOaAmr+Xv+5yFhUo=; b=49TbqoJG6L8Que
	ussGms3mtI9e2vT/ZLdwwWphkrLWaHR6ENjK8xrO85/09fkZpGIN6rZ2D1PyRvDVft28hY0RCK2N3
	dZj7LR1kgJjsygrEQ5qknYvWYZNn0MLNjISuF6ZBStsjOJs9thD9S5Swq93gXMOBmmShoy2u2YvxG
	w6WFgOLnJbtN0P4+UJA0Fr9KGumGHC9pngD5W1lfvuIx6AZSjkRy10zdOZ0Xj31GDpF9QWsMm+xpZ
	IzR2Nyv1RbqCcnrDw9piV7FiY3LDolXCrZvgStkjX+HsbVmiD/3p765tMtS0L2KNklR2/G9M3NXWE
	VjR3hTaBKyBDvE8DIWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwf5-0000000Cply-4022;
	Thu, 11 Apr 2024 15:48:27 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwf2-0000000CpjM-39vH
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 15:48:26 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ruwes-0006Iz-2b;
	Thu, 11 Apr 2024 15:48:14 +0000
Date: Thu, 11 Apr 2024 16:48:12 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: richard@nod.at, miquel.raynal@bootlin.com, ben.hutchings@mind.be,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ubi: ubi_init: Fix missed ubiblock cleanup in
 error handling path
Message-ID: <ZhgGPE_5urw2izAA@makrotopia.org>
References: <20240411031903.3050278-1-chengzhihao1@huawei.com>
 <20240411031903.3050278-3-chengzhihao1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411031903.3050278-3-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_084824_820325_87437271 
X-CRM114-Status: GOOD (  23.56  )
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

On Thu, Apr 11, 2024 at 11:19:01AM +0800, Zhihao Cheng wrote:
> The ubiblock_init called by ubi_init will register device number, but
> device number is not released in error handling path of ubi_init when
> ubi is loaded by inserting module (eg. attaching failure), which leads
> to subsequent ubi_init calls failed by running out of device number
> (dmesg shows that "__register_blkdev: failed to get major for ubiblock").
> Since ubiblock_init() registers notifier and invokes notification
> functions, so we can move it after ubi_init_attach() to fix the problem.
> 
> Fixes: 927c145208b0 ("mtd: ubi: attach from device tree")
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> ---
>  drivers/mtd/ubi/build.c | 51 +++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 7f95fd7968a8..bc63fbf5e947 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1263,9 +1263,21 @@ static struct mtd_notifier ubi_mtd_notifier = {
>  	.remove = ubi_notify_remove,
>  };
>  
> +static void detach_mtd_devs(int count)

Missing __init to avoid section missmatch.

See also: https://lore.kernel.org/oe-kbuild-all/202404112327.158HJfAw-lkp@intel.com/

> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++)
> +		if (ubi_devices[i]) {
> +			mutex_lock(&ubi_devices_mutex);
> +			ubi_detach_mtd_dev(ubi_devices[i]->ubi_num, 1);
> +			mutex_unlock(&ubi_devices_mutex);
> +		}
> +}
> +
>  static int __init ubi_init_attach(void)
>  {
> -	int err, i, k;
> +	int err, i;
>  
>  	/* Attach MTD devices */
>  	for (i = 0; i < mtd_devs; i++) {
> @@ -1317,12 +1329,7 @@ static int __init ubi_init_attach(void)
>  	return 0;
>  
>  out_detach:
> -	for (k = 0; k < i; k++)
> -		if (ubi_devices[k]) {
> -			mutex_lock(&ubi_devices_mutex);
> -			ubi_detach_mtd_dev(ubi_devices[k]->ubi_num, 1);
> -			mutex_unlock(&ubi_devices_mutex);
> -		}
> +	detach_mtd_devs(i);
>  	return err;
>  }
>  #ifndef CONFIG_MTD_UBI_MODULE
> @@ -1366,15 +1373,6 @@ static int __init ubi_init(void)
>  	if (err)
>  		goto out_slab;
>  
> -	err = ubiblock_init();
> -	if (err) {
> -		pr_err("UBI error: block: cannot initialize, error %d\n", err);
> -
> -		/* See comment above re-ubi_is_module(). */
> -		if (ubi_is_module())
> -			goto out_debugfs;
> -	}
> -
>  	register_mtd_user(&ubi_mtd_notifier);
>  
>  	if (ubi_is_module()) {
> @@ -1383,11 +1381,21 @@ static int __init ubi_init(void)
>  			goto out_mtd_notifier;
>  	}
>  
> +	err = ubiblock_init();
> +	if (err) {
> +		pr_err("UBI error: block: cannot initialize, error %d\n", err);
> +
> +		/* See comment above re-ubi_is_module(). */
> +		if (ubi_is_module())
> +			goto out_detach;
> +	}
> +
>  	return 0;
>  
> +out_detach:
> +	detach_mtd_devs(mtd_devs);
>  out_mtd_notifier:
>  	unregister_mtd_user(&ubi_mtd_notifier);
> -out_debugfs:
>  	ubi_debugfs_exit();
>  out_slab:
>  	kmem_cache_destroy(ubi_wl_entry_slab);
> @@ -1403,17 +1411,10 @@ device_initcall(ubi_init);
>  
>  static void __exit ubi_exit(void)
>  {
> -	int i;
> -
>  	ubiblock_exit();
>  	unregister_mtd_user(&ubi_mtd_notifier);
>  
> -	for (i = 0; i < UBI_MAX_DEVICES; i++)
> -		if (ubi_devices[i]) {
> -			mutex_lock(&ubi_devices_mutex);
> -			ubi_detach_mtd_dev(ubi_devices[i]->ubi_num, 1);
> -			mutex_unlock(&ubi_devices_mutex);
> -		}
> +	detach_mtd_devs(UBI_MAX_DEVICES);
>  	ubi_debugfs_exit();
>  	kmem_cache_destroy(ubi_wl_entry_slab);
>  	misc_deregister(&ubi_ctrl_cdev);
> -- 
> 2.39.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
