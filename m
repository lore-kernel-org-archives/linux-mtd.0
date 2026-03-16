Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC6EF506E2
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc/OJ+WCMmkBuKo+eM0geIib4irWJ+yiajhLw2BG3I4=; b=1RYGWOd03wNSas
	oSIhi+gIewGFc/N0ZcIuOY0nhdxgW8HHswMFBMCbMTKa7gWLpbkw1j3gS6u7IdxpxrNAsi6EGpd4v
	weiPiv3z0mXqphHL31NfugvW76KVoCJQE7cllW+s72WWKVUU0LuefiSn42Ucm6JNqYGjxPvZc4bhQ
	bZ3cy9+IfREI6KwX0mx1W82Rn22f/KFpetCmQxk4upgek0fppD3wHuc97uDrRvFOGlk0BcU32OzZa
	9fmdj0//8aJmxgW7n+mBzJJsB3F7bNTQzxbPXEMnQR9TRSiY2PplSUFHFlmlGaHxUmoBKQiw/uhuV
	6aeyhCrS2cDwa9ChFy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29EJ-00000004EBo-1WTR;
	Mon, 16 Mar 2026 14:47:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29EF-00000004E8z-4B51;
	Mon, 16 Mar 2026 14:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 680A56012B;
	Mon, 16 Mar 2026 14:47:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73DEC2BC87;
	Mon, 16 Mar 2026 14:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672455;
	bh=SWyWovQpZcRYDA2RTZfFVXcBgJf/dKBAYGsO0cjwpR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBoPKg5akPio74rsRGXjA5HYsmf0U0scEYxrF9JlUrnKHGrjoBxvJmuqAcLCHgUoS
	 IFCj8Q6ofjLHnZu+caNKOvyGbzv4zt5yp93PoYG0JqtHPeAHRWXKG7bs4UrW91MZHc
	 AOTUOG75P0LPx53kTgiD9zdeSjGIjxfzeut773v0jtaoImyzhRkvHh9a/Uzr51SXfi
	 gokr/3PW4cHZn0v/iCNUutyK7CIsTQk80ZURS3qpuz7koF3Fd9qNvUkuVpQG0yN/9k
	 uONkj8w6MwBSTEMqIXQ4bc8ZhtmCxRAk5iXQW6PEviYet3WsvklRl6FBuzmcJmE6t0
	 4z2vm0eSfUFwA==
Date: Mon, 16 Mar 2026 14:47:24 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
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
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-mtd@lists.infradead.org, linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 01/15] mm: various small mmap_prepare cleanups
Message-ID: <c7e16d31-ce30-456c-aba7-aaa6dd781b19@lucifer.local>
References: <cover.1773346620.git.ljs@kernel.org>
 <56372fe273f775b26675a04652c1229e14680741.1773346620.git.ljs@kernel.org>
 <CAJuCfpEsCrFEYNkkTfRLGojGOYAAx1=WOojOhpBb_=WZBr6bnQ@mail.gmail.com>
 <CAJuCfpHcjFU1r7ixiJM4b_a5HTesxBmW6DiCreaWpJ8DLM5haQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpHcjFU1r7ixiJM4b_a5HTesxBmW6DiCreaWpJ8DLM5haQ@mail.gmail.com>
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

On Sun, Mar 15, 2026 at 04:06:48PM -0700, Suren Baghdasaryan wrote:
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -4116,10 +4116,10 @@ static inline void mmap_action_ioremap_full(struct vm_area_desc *desc,
> > >         mmap_action_ioremap(desc, desc->start, start_pfn, vma_desc_size(desc));
> > >  }
> > >
> > > -void mmap_action_prepare(struct mmap_action *action,
> > > -                        struct vm_area_desc *desc);
> > > -int mmap_action_complete(struct mmap_action *action,
> > > -                        struct vm_area_struct *vma);
> > > +int mmap_action_prepare(struct vm_area_desc *desc,
> > > +                       struct mmap_action *action);
> > > +int mmap_action_complete(struct vm_area_struct *vma,
> > > +                        struct mmap_action *action);
> > >
> > >  /* Look up the first VMA which exactly match the interval vm_start ... vm_end */
> > >  static inline struct vm_area_struct *find_exact_vma(struct mm_struct *mm,
> > > diff --git a/mm/internal.h b/mm/internal.h
> > > index 95b583e7e4f7..7bfa85b5e78b 100644
> > > --- a/mm/internal.h
> > > +++ b/mm/internal.h
> > > @@ -1775,26 +1775,32 @@ int walk_page_range_debug(struct mm_struct *mm, unsigned long start,
> > >  void dup_mm_exe_file(struct mm_struct *mm, struct mm_struct *oldmm);
> > >  int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm);
> > >
> > > -void remap_pfn_range_prepare(struct vm_area_desc *desc, unsigned long pfn);
> > > -int remap_pfn_range_complete(struct vm_area_struct *vma, unsigned long addr,
> > > -               unsigned long pfn, unsigned long size, pgprot_t pgprot);
> > > +int remap_pfn_range_prepare(struct vm_area_desc *desc,
> > > +                           struct mmap_action *action);
> > > +int remap_pfn_range_complete(struct vm_area_struct *vma,
> > > +                            struct mmap_action *action);
> > >
> > > -static inline void io_remap_pfn_range_prepare(struct vm_area_desc *desc,
> > > -               unsigned long orig_pfn, unsigned long size)
> > > +static inline int io_remap_pfn_range_prepare(struct vm_area_desc *desc,
> > > +                                            struct mmap_action *action)
> > >  {
> > > +       const unsigned long orig_pfn = action->remap.start_pfn;
> > > +       const unsigned long size = action->remap.size;
> > >         const unsigned long pfn = io_remap_pfn_range_pfn(orig_pfn, size);
> > >
> > > -       return remap_pfn_range_prepare(desc, pfn);
> > > +       action->remap.start_pfn = pfn;
> > > +       return remap_pfn_range_prepare(desc, action);
> > >  }
> > >
> > >  static inline int io_remap_pfn_range_complete(struct vm_area_struct *vma,
> > > -               unsigned long addr, unsigned long orig_pfn, unsigned long size,
> > > -               pgprot_t orig_prot)
> > > +                                             struct mmap_action *action)
> > >  {
> > > -       const unsigned long pfn = io_remap_pfn_range_pfn(orig_pfn, size);
> > > -       const pgprot_t prot = pgprot_decrypted(orig_prot);
> > > +       const unsigned long size = action->remap.size;
> > > +       const unsigned long orig_pfn = action->remap.start_pfn;
> > > +       const pgprot_t orig_prot = vma->vm_page_prot;
> > >
> > > -       return remap_pfn_range_complete(vma, addr, pfn, size, prot);
> > > +       action->remap.pgprot = pgprot_decrypted(orig_prot);
>
> I'm guessing it doesn't really matter but after this change
> action->remap.pgprot will store the decrypted value while before this
> change it was kept the way mmap_prepare() originally set it. We pass
> the action structure later to mmap_actpion_finish() but it does not use
> action->remap.pgprot, so this probably doesn't matter.

Yeah it doesn't really matter either way.

Cheers, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
