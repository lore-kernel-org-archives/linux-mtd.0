Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F285C1099B49
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4p6mTIdBYKByWr9MFV8CIGW29x9UORuey6crVuUR+OY=; b=q3rNpNc8YxROeZ
	bMI8KHMvAXdr2Il2zDjm2Ju3OlvKlmxrgu72v5cF1s5TcraOmWONWtZ5VUGlJ94RakiufLqzWO+ID
	mdlsFL0Ly5CiiBUVd8Ykcwl68CQqxX3rUToHH48l8Glw3Ef1zsBEq3Q9SwwHg8C3kEcQmMWzfLpDw
	t5JwkNYZymYwNOg3Xpn6eKHeiPV/YCplUz7lIshFRx8rFvJjnLvKLGxmxhcCn+n/m3iq1DuXUW85U
	BxN4/IkudF3A8HWNp7qIok33d0LKUmHa4JyHP3zu51dHf9wVul7HMjWfrn/kY/oPkM8KqvluGDidY
	CZoKN574ccZCHwVjqrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6v-0000000DfeA-09ai;
	Fri, 20 Mar 2026 22:14:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i6s-0000000Dfas-28oW;
	Fri, 20 Mar 2026 22:14:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 219DA41838;
	Fri, 20 Mar 2026 22:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E6EC2BC87;
	Fri, 20 Mar 2026 22:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774044866;
	bh=EJFefe3k86LwmaxBPXrya5hP9X6x4nyWEoivmKnN/xA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I4f0P+4/Fr6KtbcDwJjO9w3QoIlF6KRTpZZJWZSbvooeYpf7n8wbwYC1XDUZKnHdS
	 xJOHJXSYItqCme2WWVfCRZflxAnLBFq0xUXkN/i0EoMg/pppX8wxvEhdW4so2zLAaW
	 8o22ncvQ+k+qmAqGFLocIUB3mwyn4EFgiCAmzExcQ2PJXvFrx0OGiIndik/aoCynLN
	 9JymF+UWIuaY29XIocf6s5fsDz9rF1s06hN8PoHaaGnJyhpqaOsm9NjsdMF+qSOTnQ
	 TtuOLyxXpYUlmButgynZGHhdY/u1nPzDI5uyj80JTcR+BPt0fmTl9WQ4HOYZ3YlHK1
	 lA5kQrtlVkd5Q==
Date: Fri, 20 Mar 2026 22:14:24 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Bodo Stroesser <bostroesser@gmail.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v3 15/16] mm: add mmap_action_map_kernel_pages[_full]()
Message-ID: <d709465e-79ba-4a12-9bf7-803a3732aa85@lucifer.local>
References: <cover.1773944114.git.ljs@kernel.org>
 <54ff3670662e10a66ce0c1a13c0ae93b99a5f201.1773944114.git.ljs@kernel.org>
 <20260320210812.GA3988975@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260320210812.GA3988975@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_151426_594629_EE116BFB 
X-CRM114-Status: GOOD (  29.72  )
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

On Fri, Mar 20, 2026 at 02:08:12PM -0700, Nathan Chancellor wrote:
> Hi Lorenzo,
>
> On Thu, Mar 19, 2026 at 06:23:39PM +0000, Lorenzo Stoakes (Oracle) wrote:
> > A user can invoke mmap_action_map_kernel_pages() to specify that the
> > mapping should map kernel pages starting from desc->start of a specified
> > number of pages specified in an array.
> >
> > In order to implement this, adjust mmap_action_prepare() to be able to
> > return an error code, as it makes sense to assert that the specified
> > parameters are valid as quickly as possible as well as updating the VMA
> > flags to include VMA_MIXEDMAP_BIT as necessary.
> >
> > This provides an mmap_prepare equivalent of vm_insert_pages().  We
> > additionally update the existing vm_insert_pages() code to use
> > range_in_vma() and add a new range_in_vma_desc() helper function for the
> > mmap_prepare case, sharing the code between the two in range_is_subset().
> >
> > We add both mmap_action_map_kernel_pages() and
> > mmap_action_map_kernel_pages_full() to allow for both partial and full VMA
> > mappings.
> >
> > We update the documentation to reflect the new features.
> >
> > Finally, we update the VMA tests accordingly to reflect the changes.
> >
> > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ...
> > diff --git a/mm/util.c b/mm/util.c
> > index 8cf59267a9ac..682d0d24e1c6 100644
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -1446,6 +1446,8 @@ int mmap_action_prepare(struct vm_area_desc *desc)
> >  		return io_remap_pfn_range_prepare(desc);
> >  	case MMAP_SIMPLE_IO_REMAP:
> >  		return simple_ioremap_prepare(desc);
> > +	case MMAP_MAP_KERNEL_PAGES:
> > +		return map_kernel_pages_prepare(desc);
> >  	}
> >
> >  	WARN_ON_ONCE(1);
> > @@ -1476,6 +1478,9 @@ int mmap_action_complete(struct vm_area_struct *vma,
> >  	case MMAP_REMAP_PFN:
> >  		err = remap_pfn_range_complete(vma, action);
> >  		break;
> > +	case MMAP_MAP_KERNEL_PAGES:
> > +		err = map_kernel_pages_complete(vma, action);
> > +		break;
> >  	case MMAP_IO_REMAP_PFN:
> >  	case MMAP_SIMPLE_IO_REMAP:
> >  		/* Should have been delegated. */
> > @@ -1497,6 +1502,7 @@ int mmap_action_prepare(struct vm_area_desc *desc)
> >  	case MMAP_REMAP_PFN:
> >  	case MMAP_IO_REMAP_PFN:
> >  	case MMAP_SIMPLE_IO_REMAP:
> > +	case MMAP_MAP_KERNEL_PAGES:
> >  		WARN_ON_ONCE(1); /* nommu cannot handle these. */
> >  		break;
> >  	}
>
> Not sure if it has been reported/addressed yet but it looks like
> mmap_action_complete() was missed here, as pointed out by clang:
>
>   $ make -skj"$(nproc)" ARCH=arm LLVM=1 mrproper allnoconfig mm/util.o
>   mm/util.c:1520:10: warning: enumeration value 'MMAP_MAP_KERNEL_PAGES' not handled in switch [-Wswitch]
>    1520 |         switch (action->type) {
>         |                 ^~~~~~~~~~~~
>
> I assume
>
> diff --git a/mm/util.c b/mm/util.c
> index 682d0d24e1c6..c41c119a5a74 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1523,6 +1523,7 @@ int mmap_action_complete(struct vm_area_struct *vma,
>  	case MMAP_REMAP_PFN:
>  	case MMAP_IO_REMAP_PFN:
>  	case MMAP_SIMPLE_IO_REMAP:
> +	case MMAP_MAP_KERNEL_PAGES:
>  		WARN_ON_ONCE(1); /* nommu cannot handle this. */
>
>  		err = -EINVAL;
> --
>
> should be the fix?
>
> Cheers,
> Nathan

Thanks, will fix, working on a respin now anyway :)

Cheers, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
