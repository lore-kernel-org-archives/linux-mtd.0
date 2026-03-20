Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8601099B3F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 21:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHHPqa6fQ9OGGiLfb+J9o0xNgUrTrc/eVwwi4/b0CeY=; b=cfEZRu9navde5T
	N4+v4oCC/P10YXXErnzCAs5FCozvaRJ1nTbu2SALCdfAT6gJyM+T2UyZfvRf6AF3lJeRsAtz8VHLB
	aUWDnkBHLQymtx/3bMaDccYxVbaOZWcCkfLoNEXOjDVB7TBZyKwetMbRja9z73OWmSAyDy/8RuRod
	chWxv8YA8tpg0B4Mg3eU09J3Jedm7iRA77q2WJ87F32mMrSpnTf4UJx+NXyXes6MSiqSddeBPYh6N
	lmHN60eMl6/GI3g7Ezvcf2BxyRgcj5P45yDRkarnbM2txBuU6glb1PSqxRUo4nZt/O0d3Gu0S6A6s
	VxYzsEkripS927kGq9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3h52-0000000DaaN-1PBr;
	Fri, 20 Mar 2026 21:08:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3h4y-0000000DaZz-3jvg;
	Fri, 20 Mar 2026 21:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF0F760126;
	Fri, 20 Mar 2026 21:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E28C4CEF7;
	Fri, 20 Mar 2026 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774040903;
	bh=u0zdmPIhkicnjjaekGwGuaSnl24uNp/SD6pTY4tTyoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qC8HBmDJbc3QTlANvhaLjcn0O5ay5GqzDEvYHXsOkZQejTAbOkx+bkEo+ki3/IcqS
	 2zxeTAiPAA/ZnIrs1vWkKIH1qQM6hWWWHXeyTtkY/GTcJVwCwrNv3c5QnInC7yBUEZ
	 Emq3X5gGUqXLf66MStAVqC5m2WCTfSbnlpAHXDlhTtb1Ap6h4AtLg1EuCVIYnM3U2k
	 9XYMGV8lFcVQ3Ofo63x/aFk8UD8Gt0FgB8ThIniVMGJGtCnjMclwn9hpHtv2VORGXx
	 vrpZQBmOIITR6wCUusRaEbZoc8REFtZupMT7Shny3yqCThx6DNBFOpK9/XXBVuE7o9
	 ZHBuzLHK9WgAw==
Date: Fri, 20 Mar 2026 14:08:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v3 15/16] mm: add mmap_action_map_kernel_pages[_full]()
Message-ID: <20260320210812.GA3988975@ax162>
References: <cover.1773944114.git.ljs@kernel.org>
 <54ff3670662e10a66ce0c1a13c0ae93b99a5f201.1773944114.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54ff3670662e10a66ce0c1a13c0ae93b99a5f201.1773944114.git.ljs@kernel.org>
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

Hi Lorenzo,

On Thu, Mar 19, 2026 at 06:23:39PM +0000, Lorenzo Stoakes (Oracle) wrote:
> A user can invoke mmap_action_map_kernel_pages() to specify that the
> mapping should map kernel pages starting from desc->start of a specified
> number of pages specified in an array.
> 
> In order to implement this, adjust mmap_action_prepare() to be able to
> return an error code, as it makes sense to assert that the specified
> parameters are valid as quickly as possible as well as updating the VMA
> flags to include VMA_MIXEDMAP_BIT as necessary.
> 
> This provides an mmap_prepare equivalent of vm_insert_pages().  We
> additionally update the existing vm_insert_pages() code to use
> range_in_vma() and add a new range_in_vma_desc() helper function for the
> mmap_prepare case, sharing the code between the two in range_is_subset().
> 
> We add both mmap_action_map_kernel_pages() and
> mmap_action_map_kernel_pages_full() to allow for both partial and full VMA
> mappings.
> 
> We update the documentation to reflect the new features.
> 
> Finally, we update the VMA tests accordingly to reflect the changes.
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
...
> diff --git a/mm/util.c b/mm/util.c
> index 8cf59267a9ac..682d0d24e1c6 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1446,6 +1446,8 @@ int mmap_action_prepare(struct vm_area_desc *desc)
>  		return io_remap_pfn_range_prepare(desc);
>  	case MMAP_SIMPLE_IO_REMAP:
>  		return simple_ioremap_prepare(desc);
> +	case MMAP_MAP_KERNEL_PAGES:
> +		return map_kernel_pages_prepare(desc);
>  	}
>  
>  	WARN_ON_ONCE(1);
> @@ -1476,6 +1478,9 @@ int mmap_action_complete(struct vm_area_struct *vma,
>  	case MMAP_REMAP_PFN:
>  		err = remap_pfn_range_complete(vma, action);
>  		break;
> +	case MMAP_MAP_KERNEL_PAGES:
> +		err = map_kernel_pages_complete(vma, action);
> +		break;
>  	case MMAP_IO_REMAP_PFN:
>  	case MMAP_SIMPLE_IO_REMAP:
>  		/* Should have been delegated. */
> @@ -1497,6 +1502,7 @@ int mmap_action_prepare(struct vm_area_desc *desc)
>  	case MMAP_REMAP_PFN:
>  	case MMAP_IO_REMAP_PFN:
>  	case MMAP_SIMPLE_IO_REMAP:
> +	case MMAP_MAP_KERNEL_PAGES:
>  		WARN_ON_ONCE(1); /* nommu cannot handle these. */
>  		break;
>  	}

Not sure if it has been reported/addressed yet but it looks like
mmap_action_complete() was missed here, as pointed out by clang:

  $ make -skj"$(nproc)" ARCH=arm LLVM=1 mrproper allnoconfig mm/util.o
  mm/util.c:1520:10: warning: enumeration value 'MMAP_MAP_KERNEL_PAGES' not handled in switch [-Wswitch]
   1520 |         switch (action->type) {
        |                 ^~~~~~~~~~~~

I assume

diff --git a/mm/util.c b/mm/util.c
index 682d0d24e1c6..c41c119a5a74 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1523,6 +1523,7 @@ int mmap_action_complete(struct vm_area_struct *vma,
 	case MMAP_REMAP_PFN:
 	case MMAP_IO_REMAP_PFN:
 	case MMAP_SIMPLE_IO_REMAP:
+	case MMAP_MAP_KERNEL_PAGES:
 		WARN_ON_ONCE(1); /* nommu cannot handle this. */
 
 		err = -EINVAL;
--

should be the fix?

Cheers,
Nathan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
