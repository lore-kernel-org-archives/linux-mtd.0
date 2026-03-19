Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9FF109024E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9Uu357JzA8oTEstMRKiDFFjoZoo9Pz+wDhSqiG7SsA=; b=i2XmHjSAkinW+/
	v58abem549psNBIfiEDyIScvi08+9Qbf1OWjhSCYACNy8LP0qbGJZ9Xbuc49GsgO7hwYH/baHqpvY
	BKW+GRh4txjM+fWRQ8tivcyxvUhE1wpnERe5U303UHWv5pL/GyZqg2ZLOUGbq83a0lJDfh34jwrEt
	SqtD3PyyzlTP68kpNJ+0C3IMhiBkbjDhX6oYqgjGE+ApMrApon6YEqCvBFt5QpJUcagJa+LomGcgN
	TAknzqTAQLStb1cUkJvfI8ZQ+uPJTRxMB46lfc3jPiJKLwsMA7m5aaazfg4XwBQLVIKSAUrlguUqr
	joDycdRBFtO7OzTBpYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GFu-0000000B4rG-3ze0;
	Thu, 19 Mar 2026 16:29:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GFt-0000000B4qg-11cc;
	Thu, 19 Mar 2026 16:29:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ABB0600AD;
	Thu, 19 Mar 2026 16:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248A3C19424;
	Thu, 19 Mar 2026 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937761;
	bh=i5FY2xFUG82H2mxUurUo54YyYFYdXZArEFQEN+SDOy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aF5DbFFAnHCvzhvJhT5dGtrQoRtJ9QNrqQlmJnbfZGodcTPOczAfqoQkVJIF/LXmE
	 NRUWZ3gYSMcre4wgwUNw09xxVKFI5Sgemkg2LAotinZjLLwX4iM1PGYkctTph/RumK
	 vZbtY4tdz04aVkTwegcY+ogZdGqZvTefi0axkcs96JyYYbbFlBfs82HELbk8bZzpWu
	 r3XKupXWro4jRmoWCi9Q8Sv10Og+jz9lMJHhwiLehTvhEzP5QW3ShgVjN49nGeFKrY
	 HHr/eCyrr+oVH6Ygchgg5RWipe/5nmkCpI4UsgYg0JGgzQb2ofwBsZCXqUHlfYYlJr
	 B/ySfzNIrgg5Q==
Date: Thu, 19 Mar 2026 16:29:19 +0000
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
Subject: Re: [PATCH v2 06/16] mm: add mmap_action_simple_ioremap()
Message-ID: <939645bf-50c3-47bd-8132-89acf95056c5@lucifer.local>
References: <cover.1773695307.git.ljs@kernel.org>
 <1e58aaf3cdb61cc317d890c12c9a558dfc206913.1773695307.git.ljs@kernel.org>
 <CAJuCfpGocCSRT0yDxPOLg2NZ+W_ZSTjHGPZRKBd3U90=sQtHCw@mail.gmail.com>
 <330f3614-7dc1-4e80-96c4-8472b25108bb@lucifer.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <330f3614-7dc1-4e80-96c4-8472b25108bb@lucifer.local>
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

On Wed, Mar 18, 2026 at 08:39:25PM +0000, Lorenzo Stoakes (Oracle) wrote:
> On Mon, Mar 16, 2026 at 09:14:28PM -0700, Suren Baghdasaryan wrote:
> > > +int simple_ioremap_prepare(struct vm_area_desc *desc)
> > > +{
> > > +       struct mmap_action *action = &desc->action;
> > > +       const phys_addr_t start = action->simple_ioremap.start_phys_addr;
> > > +       const unsigned long size = action->simple_ioremap.size;
> > > +       unsigned long pfn;
> > > +       int err;
> > > +
> > > +       err = __simple_ioremap_prep(desc->start, desc->end, desc->pgoff,
> > > +                                   start, size, &pfn);
> > > +       if (err)
> > > +               return err;
> > > +
> > > +       /* The I/O remap logic does the heavy lifting. */
> > > +       mmap_action_ioremap(desc, desc->start, pfn, vma_desc_size(desc));
> >
> > nit: Looks like a perfect opportunity to use mmap_action_ioremap_full() here.
>
> Yeah can do!
>
> >
> > > +       return mmap_action_prepare(desc);
> >
> > Ok, so IIUC this uses recursion:
> > mmap_action_prepare(MMAP_SIMPLE_IO_REMAP) -> simple_ioremap_prepare()
> > -> mmap_action_prepare(MMAP_IO_REMAP_PFN).
>
> Yep, it's one level, I think that should be ok? :)

On second thoughts, it's silly not just to call io_remap_pfn_range_prepare()
direct so will change it to do that!

Cheers, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
