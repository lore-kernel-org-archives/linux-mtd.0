Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A90C33CA1
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 11:45:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59C412073D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 11:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ir68R9Me"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59C412073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWLO9RlYeV4IhzkQj+uI8VTFrKX5V8X7E/kRXJX2bzY=; b=Ir68R9MeD9UpV1
	vpd7cV7/3P4vCXXed2Xw7o0sjE0oH0od/mE3e9dtjqsp4ud/8eLojHHB1vAWx3d+H9Je4r4UD/cRO
	8PUdrrQhjBym1zW0vXEicvtdI6p7+3V+Z2u4d3UPn6EwgchgBdG16Rw1LcAsIxc3WsRRZ2FJCXyNh
	uC3Zsa2Zv3KNLMqZc1TSOb+R/t0zGGZl9ZXvn66N4v5W1U9ABijxqtweDoX8ssg9H5kLr9xrFFkpt
	m2nUTGSm+ZifgO0JFEyZ06hf41JahGSoGzIF0gvnpug4EtEa7RGr9SguCL6v3BsVtYlZimHCz4dg3
	4wbKwPetDwt//DaFPrhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itVUh-0003nE-Iw; Mon, 20 Jan 2020 11:45:23 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itVUZ-0002wH-AY
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 11:45:21 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5F8E6EBFB9287DB8B0BD;
 Mon, 20 Jan 2020 19:45:01 +0800 (CST)
Received: from [127.0.0.1] (10.173.220.179) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 20 Jan 2020 19:44:52 +0800
Subject: Re: [PATCH] jffs2: move jffs2_init_inode_info() just after allocating
 inode
To: <viro@zeniv.linux.org.uk>
References: <20200106080411.41394-1-yi.zhang@huawei.com>
From: "zhangyi (F)" <yi.zhang@huawei.com>
Message-ID: <1559fa23-525b-5dad-220e-2ab2821d33eb@huawei.com>
Date: Mon, 20 Jan 2020 19:44:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200106080411.41394-1-yi.zhang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.173.220.179]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_034515_527943_809772C5 
X-CRM114-Status: GOOD (  13.47  )
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
 ast@kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ping.

On 2020/1/6 16:04, zhangyi (F) wrote:
> After commit 4fdcfab5b553 ("jffs2: fix use-after-free on symlink
> traversal"), it expose a freeing uninitialized memory problem due to
> this commit move the operaion of freeing f->target to
> jffs2_i_callback(), which may not be initialized in some error path of
> allocating jffs2 inode (eg: jffs2_iget()->iget_locked()->
> destroy_inode()->..->jffs2_i_callback()->kfree(f->target)).
> 
> Fix this by initialize the jffs2_inode_info just after allocating it.
> 
> Reported-by: Guohua Zhong <zhongguohua1@huawei.com>
> Reported-by: Huaijie Yi <yihuaijie@huawei.com>
> Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
> Cc: stable@vger.kernel.org
> ---
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
