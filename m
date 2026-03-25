Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4560FEA83B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 10:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+SOnrOw3Q6je4rOCV0hLWjWbrlg9ma2uC6L8SVAapI=; b=QjKUz5SyhQZBeb
	IMx9dUagJwmAf7i7OmHNdbFK8v2EuB5YR77Ab5ZTl8LiPkNjZ2XwP781aJtmcpTCxib0nk33AqmSX
	rR+tX+jaPfwCnoiV20ZhYq8EQdLHDGvKBpm3u4WlFhO3BbmuBm1NA6yRLwPq0IohBGdkO+crvB/mv
	JrZHh1GR/4SCDiibgFycPTbeMwFB80mKAagk6txDyLuK38YpaTUqGAh7gNVlFT3Z2Q1+u1D23fdb2
	062TFGPhJ8QiIga4PlgEhED8flhmXOeAuienpuCEpLZdhoX0d1Qr1EiZNBIEtB0o5Pc5xGdIS+quk
	PtiWP7042tEJH1w0BPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LMN-0000000389T-1oU0;
	Wed, 25 Mar 2026 10:21:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LML-0000000387m-22sf;
	Wed, 25 Mar 2026 10:21:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 511AE60121;
	Wed, 25 Mar 2026 10:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE9CC4CEF7;
	Wed, 25 Mar 2026 10:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434068;
	bh=RwCKSiFjpQQG+EZJNqN0KyvxsrmGDZdhVKBOE/Aaduc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DZVmn8IxFYfhF8HzW7FdXHkwuvW4yhgRak70Foc0vLl1eakxYnHkDHZjUe6OelBMN
	 YrH79MiaqsFIgMBT9jA4780GQHimOe4Cv+sPzqrEw3TuC6LhDvBflKVhc6rP/hCTZ0
	 OkAtwV5P48v9lio9wSNInQxkePOmt3TugwsUQB8vPjl/zhKytLDeu/bDPGr0rtRwKf
	 5Q0Z39eqjOGm4G6rq5+oLonltaHsNJV4rmuGcNpEtABhyQ+gaiGiYGh/lQSeHB2D/D
	 pZ5uYQuilIxryf4YM/itDGepxaKc8ZzRoKiSBNAMWRegHKeDyNslHKiZ/RNKFJ+IKs
	 rWnmdaorTDm+g==
Message-ID: <05d59b49-fa53-413b-a306-feb21594f6a6@kernel.org>
Date: Wed, 25 Mar 2026 11:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/21] mtdchar: replace deprecated mmap hook with
 mmap_prepare, clean up
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Bodo Stroesser <bostroesser@gmail.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Ryan Roberts <ryan.roberts@arm.com>
References: <cover.1774045440.git.ljs@kernel.org>
 <d036855c21962c58ace0eb24ecd6d973d77424fe.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <d036855c21962c58ace0eb24ecd6d973d77424fe.1774045440.git.ljs@kernel.org>
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

On 3/20/26 23:39, Lorenzo Stoakes (Oracle) wrote:
> Replace the deprecated mmap callback with mmap_prepare.
> 
> Commit f5cf8f07423b ("mtd: Disable mtdchar mmap on MMU systems") commented
> out the CONFIG_MMU part of this function back in 2012, so after ~14 years
> it's probably reasonable to remove this altogether rather than updating
> dead code.
> 
> Acked-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  drivers/mtd/mtdchar.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 55a43682c567..bf01e6ac7293 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -1376,27 +1376,12 @@ static unsigned mtdchar_mmap_capabilities(struct file *file)
>  /*
>   * set up a mapping for shared memory segments
>   */
> -static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
> +static int mtdchar_mmap_prepare(struct vm_area_desc *desc)
>  {
>  #ifdef CONFIG_MMU
> -	struct mtd_file_info *mfi = file->private_data;
> -	struct mtd_info *mtd = mfi->mtd;
> -	struct map_info *map = mtd->priv;
> -
> -        /* This is broken because it assumes the MTD device is map-based
> -	   and that mtd->priv is a valid struct map_info.  It should be
> -	   replaced with something that uses the mtd_get_unmapped_area()
> -	   operation properly. */
> -	if (0 /*mtd->type == MTD_RAM || mtd->type == MTD_ROM*/) {
> -#ifdef pgprot_noncached
> -		if (file->f_flags & O_DSYNC || map->phys >= __pa(high_memory))
> -			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> -#endif
> -		return vm_iomap_memory(vma, map->phys, map->size);
> -	}
>  	return -ENODEV;
>  #else
> -	return vma->vm_flags & VM_SHARED ? 0 : -EACCES;
> +	return vma_desc_test(desc, VMA_SHARED_BIT) ? 0 : -EACCES;
>  #endif
>  }
>  
> @@ -1411,7 +1396,7 @@ static const struct file_operations mtd_fops = {
>  #endif
>  	.open		= mtdchar_open,
>  	.release	= mtdchar_close,
> -	.mmap		= mtdchar_mmap,
> +	.mmap_prepare	= mtdchar_mmap_prepare,
>  #ifndef CONFIG_MMU
>  	.get_unmapped_area = mtdchar_get_unmapped_area,
>  	.mmap_capabilities = mtdchar_mmap_capabilities,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
