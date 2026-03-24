Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB0FF54AC4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 14:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjoXeqIE9Wv0bk1BHapEBYTUXHWk9CStrbK002s2lJ0=; b=qEarP1b685rNMs
	b0HzuZozMoVu1+fn4t/wMxa1UOygeZ8JKGNBOljGIfYWFFgh4b4KWWtS2djuRA5qqNGRKtA4mgUId
	kKBaPoBmSB2AWbnK7dxD5wXL1yEQWd2N+BsrFTRuJVo0iDWSH7444r74hRXYwM929xlMwPsXASaFM
	ouBCwfKHyZgls8qjr/wYvrI646+CMSVKI6PoecuIlWkzbJ5TEACv3ke6kXms6A3Igg18pZPbXWM8m
	65n5+PPSARU3ToDdmwzOnUT/XYj/ZQCsErFg+06ssw7pLIFfI26pPxMErw39UieYoDKdxEJjSSGfU
	C2xdGLhVcY+ZPXIOU/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52iW-00000001dt9-0U4i;
	Tue, 24 Mar 2026 14:26:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52iO-00000001dpL-3seC;
	Tue, 24 Mar 2026 14:26:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1748040207;
	Tue, 24 Mar 2026 14:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF10FC19424;
	Tue, 24 Mar 2026 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774362397;
	bh=jbmeTUiHgD1/BUVa6y6/L4uBWdzAaIyEnuCWg6Aqqwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jHLE0f+jKQrZNp687YBoBRWvKqV1yWHDJoeSVdPwmNvSWECrmPXDTbAi2oKjk+1NJ
	 qnx4cHZLM+LIL/EoJtJgr2egOHXEYl3PmIEgTgWfctCXapgNTUzCU72gmELiYyBz2u
	 Bmagz4Dqlv/xXZnYGIqOcn/VE+9HcIDQca+kSTZwU2EdFdYDcSCQi3OsySsDqMWMEj
	 xJBl1+rl8ONOJYI/rFp2Q6/AgAT6Ooo3EbuSldP/+bCHPCgnXfLdZYk7zRnOoBztke
	 5D4hhUKhkSo5DjVR7YkZzeoY/AhHGi4yeVpH65JJi5N0Pl6nFAlDHXYhnAvm2OMXP/
	 QLKTQd8HLcvhQ==
Message-ID: <d5b66671-697f-4a4d-8039-d9c9ac5ad4d7@kernel.org>
Date: Tue, 24 Mar 2026 15:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/21] mm: switch the rmap lock held option off in
 compat layer
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
 <dda74230d26a1fcd79a3efab61fa4101dd1cac64.1774045440.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <dda74230d26a1fcd79a3efab61fa4101dd1cac64.1774045440.git.ljs@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_072641_033543_CF188ED1 
X-CRM114-Status: GOOD (  19.88  )
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
> In the mmap_prepare compatibility layer, we don't need to hold the rmap
> lock, as we are being called from an .mmap handler.
> 
> The .mmap_prepare hook, when invoked in the VMA logic, is called prior to
> the VMA being instantiated, but the completion hook is called after the VMA
> is linked into the maple tree, meaning rmap walkers can reach it.
> 
> The mmap hook does not link the VMA into the tree, so this cannot happen.
> 
> Therefore it's safe to simply disable this in the mmap_prepare
> compatibility layer.
> 
> Also update VMA tests code to reflect current compatibility layer state.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

a typo fix below, Andrew can fix locally?

> ---
>  mm/util.c                       |  6 ++++-
>  tools/testing/vma/include/dup.h | 42 +++++++++++++++++----------------
>  2 files changed, 27 insertions(+), 21 deletions(-)
> 
> diff --git a/mm/util.c b/mm/util.c
> index a2cfa0d77c35..182f0f5cc400 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1204,6 +1204,7 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
> 
>  		.action.type = MMAP_NOTHING, /* Default */
>  	};
> +	struct mmap_action *action = &desc.action;
>  	int err;
> 
>  	err = vfs_mmap_prepare(file, &desc);
> @@ -1214,8 +1215,11 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
>  	if (err)
>  		return err;
> 
> +	/* being invoked from .mmmap means we don't have to enforce this. */

				.mmap

> +	action->hide_from_rmap_until_complete = false;
> +
>  	set_vma_from_desc(vma, &desc);
> -	err = mmap_action_complete(vma, &desc.action);
> +	err = mmap_action_complete(vma, action);
>  	if (err) {
>  		const size_t len = vma_pages(vma) << PAGE_SHIFT;
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
