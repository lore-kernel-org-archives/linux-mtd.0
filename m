Return-Path: <SRS0=DvMR=BC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DCAC433EA
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 10:00:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E81A120737
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2020 10:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zWFM4FAc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E81A120737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HWBd63i5eKlTQ5SBY4motO2lKPbd/EF++D2TVl211BA=; b=zWFM4FAcjlPJWwk3qmTF7/HEA
	Bqp8xv2mcu/5PZ2yFLKC+qnCZe20RUtBtumfn5QRvurpmZiX6xIOQAeEF9asxWwGSowQoye5Jgsi1
	hXNloJ8+aTjqVJwHDdKXSqccTnpUlYft5wPkxQuYLAMsGxRR0ZfdUc3Sseq4jo8FlhgPxNmV88Euq
	JTcpmVuESZTecHi8wGfGp6xAwlFoXuUEMrGca/Xgu+pMqzZbEeSdXv6LMTLHa3w/lvhOV1vjoZERX
	HlWbeLyM6RDNLL0BjKklv/Bc9hDI0+1yaPx0kfl/fxxaCsGKFy5Oee9UGrATjLgKl10yqO2MGLq9f
	wp+3jl6Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyY0E-0002Kx-3e; Thu, 23 Jul 2020 09:59:02 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyY0A-0002IG-VL
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2020 09:59:00 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 23A9053A4D19736B6009;
 Thu, 23 Jul 2020 17:58:52 +0800 (CST)
Received: from [10.174.177.167] (10.174.177.167) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Jul 2020 17:58:45 +0800
Subject: Re: [PATCH] jffs2: move jffs2_init_inode_info() just after allocating
 inode
To: "zhangyi (F)" <yi.zhang@huawei.com>, <viro@zeniv.linux.org.uk>,
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>
References: <20200106080411.41394-1-yi.zhang@huawei.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <2202d894-5b47-e606-2f58-306ec151626b@huawei.com>
Date: Thu, 23 Jul 2020 17:58:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200106080411.41394-1-yi.zhang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.167]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_055859_349873_B4710627 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: zhongguohua1@huawei.com, daniel@iogearbox.net, yihuaijie@huawei.com,
 ast@kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Cc +Richard +David

On 2020/1/6 16:04, zhangyi (F) wrote:
> After commit 4fdcfab5b553 ("jffs2: fix use-after-free on symlink
> traversal"), it expose a freeing uninitialized memory problem due to
> this commit move the operaion of freeing f->target to
> jffs2_i_callback(), which may not be initialized in some error path of
> allocating jffs2 inode (eg: jffs2_iget()->iget_locked()->
> destroy_inode()->..->jffs2_i_callback()->kfree(f->target)).
> 
Could you please elaborate the scenario in which the use of a uninitialized
f->target is possible ? IMO one case is that there are concurrent
jffs2_lookup() and jffs2 GC on an evicted inode, and two new inodes
are created, and then one needless inode is destroyed.

> Fix this by initialize the jffs2_inode_info just after allocating it.
> 
> Reported-by: Guohua Zhong <zhongguohua1@huawei.com>
> Reported-by: Huaijie Yi <yihuaijie@huawei.com>
> Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
> Cc: stable@vger.kernel.org
> ---
A Fixes tag is also needed here.

>  fs/jffs2/fs.c    | 2 --
>  fs/jffs2/super.c | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index ab8cdd9e9325..50a9df7d43a5 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -270,7 +270,6 @@ struct inode *jffs2_iget(struct super_block *sb, unsigned long ino)
>  	f = JFFS2_INODE_INFO(inode);
>  	c = JFFS2_SB_INFO(inode->i_sb);
>  
> -	jffs2_init_inode_info(f);
>  	mutex_lock(&f->sem);
>  
>  	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
> @@ -438,7 +437,6 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
>  		return ERR_PTR(-ENOMEM);
>  
>  	f = JFFS2_INODE_INFO(inode);
> -	jffs2_init_inode_info(f);
>  	mutex_lock(&f->sem);
>  
>  	memset(ri, 0, sizeof(*ri));
> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> index 0e6406c4f362..90373898587f 100644
> --- a/fs/jffs2/super.c
> +++ b/fs/jffs2/super.c
> @@ -42,6 +42,8 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
>  	f = kmem_cache_alloc(jffs2_inode_cachep, GFP_KERNEL);
>  	if (!f)
>  		return NULL;
> +
> +	jffs2_init_inode_info(f);
>  	return &f->vfs_inode;
>  }
>  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
