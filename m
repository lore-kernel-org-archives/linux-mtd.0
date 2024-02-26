Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5259AC47DD9
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 02:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foFeq7BYLuiX0iaK766eJNFTk11iTn/YGDpHWqXrCXQ=; b=Yw2rFSQxMgZI1v
	vyRnqjwTVIezkn8lZ610uQl7HgN54hQAAQwulwZsw8b88JbX3UBneFUuFR3TXfYYAcl0CwcT9d+m2
	jCe3C72JwE2xdwZTQDa3sSYfswwDMXMeHJcayS6B6tLDsCDoDl40sIjoEgQ5pIOSEkGqRMKpzpfCi
	oYGbAWU6P2EbrlD1mxxzDj2ZMc6mbjwFllYo7ZUfEJE1bvXyw+tXAowh1PE00P44PsV9TAjVVuOTX
	gd6w93WqpT5NyhWtEPWToe99Gq6Y+RyoC+0Yy1HoWiwfiJh6ovUlJAQ/oxvup40hjJev5Fd07pFME
	QM9ataIKnovG+cyDWyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQzl-0000000GCPu-3I8R;
	Mon, 26 Feb 2024 02:45:33 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reQzi-0000000GCOL-24JS
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 02:45:32 +0000
Message-ID: <f143006a-e014-4ad9-b19e-25e1a45a75c2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708915525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXnD7RPS7a0IM2G7o5VSGYEyaa6ZbvJGWVpct+px6Vk=;
	b=IUItaLg0MK+ENd5N/W7leikGICW7KA6Vzo4Zf+SyNTa+06xzai3RT6lBLdr+tZiMM8J9Q7
	Vycgeex9KHPChU/o/AKjOd0ucEcKwjsxvfwPw73B+xBGHgB20qYW0FbOVldIhQhnV2rf0A
	su6RF5+18kIkaxumvHUX8w0nhTBLGSg=
Date: Mon, 26 Feb 2024 10:45:01 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] jffs2: remove SLAB_MEM_SPREAD flag usage
Content-Language: en-US
To: dwmw2@infradead.org, richard@nod.at, jack@suse.cz,
 chuck.lever@oracle.com, dave.kleikamp@oracle.com, amir73il@gmail.com
Cc: zhouchengming@bytedance.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vbabka@suse.cz, roman.gushchin@linux.dev,
 Xiongwei.Song@windriver.com
References: <20240224134915.829634-1-chengming.zhou@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <20240224134915.829634-1-chengming.zhou@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_184530_711483_677140C5 
X-CRM114-Status: GOOD (  14.82  )
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

On 2024/2/24 21:49, chengming.zhou@linux.dev wrote:
> From: Chengming Zhou <zhouchengming@bytedance.com>
> 
> The SLAB_MEM_SPREAD flag is already a no-op as of 6.8-rc1, remove
> its usage so we can delete it from slab. No functional change.

Update changelog to make it clearer:

The SLAB_MEM_SPREAD flag used to be implemented in SLAB, which was
removed as of v6.8-rc1, so it became a dead flag. And the series[1]
went on to mark it obsolete to avoid confusion for users. Here we
can just remove all its users, which has no functional change.

[1] https://lore.kernel.org/all/20240223-slab-cleanup-flags-v2-1-02f1753e8303@suse.cz/

Thanks!

> 
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
> ---
>  fs/jffs2/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> index f99591a634b4..aede1be4dc0c 100644
> --- a/fs/jffs2/super.c
> +++ b/fs/jffs2/super.c
> @@ -387,7 +387,7 @@ static int __init init_jffs2_fs(void)
>  	jffs2_inode_cachep = kmem_cache_create("jffs2_i",
>  					     sizeof(struct jffs2_inode_info),
>  					     0, (SLAB_RECLAIM_ACCOUNT|
> -						SLAB_MEM_SPREAD|SLAB_ACCOUNT),
> +						SLAB_ACCOUNT),
>  					     jffs2_i_init_once);
>  	if (!jffs2_inode_cachep) {
>  		pr_err("error: Failed to initialise inode cache\n");

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
