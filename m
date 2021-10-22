Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D00C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B84A610A8
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B84A610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWVsrAdDghBBQRgnUqTktwB/pw2Smaygfn4wEaSqJvs=; b=y7rXOUngRDk7KQ
	1qVjwFdiXzGqocIcd+YKkc4mSlheBFRgtHHDa/CFTqHXRWT4sXRjAkKK7Hczr5OmAI4XUZ6p1beuh
	j1d8G0T5BHZ3FGZBb0wTseA/lsywGGDucOkbKrmCyZy+KACSksfw3pvlLFzn9SjCU8OAE8oO/+O8x
	6jTPhZPagLaq0K3p0WLsPIoKVHO/TyuClB+ftCZpohSjhKIniA1R1WcA/2bk5wt/Xznij99OnNEUM
	eUF509xXS2Xvqkv72Z+I/0Lot1Y64VXLMbJCZ4PBzc24hBPkqmYnCmCqzyURhEnzPOeIRJAjr6ypi
	VaKr/p7ZFuJybIIM384A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqEJ-00AEfR-8a; Fri, 22 Oct 2021 08:48:47 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqEG-00AEeI-E1
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 08:48:45 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 0A2DC2199B;
 Fri, 22 Oct 2021 08:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634892523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3eOyqjTYeSFpI90LY5QA2iYYQmlUyWdBLPJTQWj8wBU=;
 b=AMTs2nvqN3QiOl5gydTNg3F6JaH5KE7/rT7bQCOZ/DwyP0r60NHvx65BnJ//D8YArVhM6b
 dmbUaruaNaewNcCQiuYTGZowIL8Of+SyxvBKkr2nSrJF1iCkRBg8XtEiaEtqiqB74RRzvs
 KPBnfOYuWMVkqWNjiA9JB+9Lh+chuUc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634892523;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3eOyqjTYeSFpI90LY5QA2iYYQmlUyWdBLPJTQWj8wBU=;
 b=ptFu8OPTAXe92AJJt59WAAQn0sQvjyiIumwrX+lHPLhNrb8Q6XClnpyINKeGqhN29O10gf
 sa6ExXevSG/IZxBw==
Received: from quack2.suse.cz (unknown [10.100.224.230])
 by relay2.suse.de (Postfix) with ESMTP id EAC60A3B83;
 Fri, 22 Oct 2021 08:48:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id A073F1E11B6; Fri, 22 Oct 2021 10:48:41 +0200 (CEST)
Date: Fri, 22 Oct 2021 10:48:41 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jan Kara <jack@suse.cz>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 3/5] fs: explicitly unregister per-superblock BDIs
Message-ID: <20211022084841.GD1026@quack2.suse.cz>
References: <20211021124441.668816-1-hch@lst.de>
 <20211021124441.668816-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021124441.668816-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_014844_651006_965DC03C 
X-CRM114-Status: GOOD (  20.04  )
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

On Thu 21-10-21 14:44:39, Christoph Hellwig wrote:
> Add a new SB_I_ flag to mark superblocks that have an ephemeral bdi
> associated with them, an unregister it when the superblock is shut down.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/super.c         | 3 +++
>  include/linux/fs.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/fs/super.c b/fs/super.c
> index bcef3a6f4c4b5..3bfc0f8fbd5bc 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -476,6 +476,8 @@ void generic_shutdown_super(struct super_block *sb)
>  	spin_unlock(&sb_lock);
>  	up_write(&sb->s_umount);
>  	if (sb->s_bdi != &noop_backing_dev_info) {
> +		if (sb->s_iflags & SB_I_PERSB_BDI)
> +			bdi_unregister(sb->s_bdi);
>  		bdi_put(sb->s_bdi);
>  		sb->s_bdi = &noop_backing_dev_info;
>  	}
> @@ -1562,6 +1564,7 @@ int super_setup_bdi_name(struct super_block *sb, char *fmt, ...)
>  	}
>  	WARN_ON(sb->s_bdi != &noop_backing_dev_info);
>  	sb->s_bdi = bdi;
> +	sb->s_iflags |= SB_I_PERSB_BDI;
>  
>  	return 0;
>  }
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index e7a633353fd20..226de651f52e6 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1443,6 +1443,7 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_I_UNTRUSTED_MOUNTER		0x00000040
>  
>  #define SB_I_SKIP_SYNC	0x00000100	/* Skip superblock at global sync */
> +#define SB_I_PERSB_BDI	0x00000200	/* has a per-sb bdi */
>  
>  /* Possible states of 'frozen' field */
>  enum {
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
