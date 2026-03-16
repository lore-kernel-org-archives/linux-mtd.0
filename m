Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA94CF506D9
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+kLI4hi+/v0xRJiCJ1WBJjnPig5KCgNB1b9OMPSx9E=; b=yDPSEDCBxUo/aV
	uOI+nOH3G0dX9+QBh4M76/zfqDAoqDXuXk4SJultmtnPcJSz+PVl5k/gF3NWElSn+yEGtb6KZRLEO
	Dp6qqAZLYyzkvvOrKoVDX+cCnWcqSF0xQvOsvutg47sA7OANVGaBU2v3HYoLJv4fLGLh/Fig5yfiQ
	7pU1TFcXwL80g07aJM2zFhEQH8d8fM7oOK92mm+2I8qPgoToll5UMUQp+otHZr7Hjk0tp3iaIl0+i
	jJ0NW8jlDIkHlHAdxLYx8uyJNOcGRFCxND73QMGPE6ijSaXaSOYuvnwtuLTvg7XGjiVEkBeu7Ebnu
	f6TQA+T8slwxK19m/gGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29LD-00000004Fp9-1z8s;
	Mon, 16 Mar 2026 14:54:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29LB-00000004Fod-2fy4;
	Mon, 16 Mar 2026 14:54:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD8B860018;
	Mon, 16 Mar 2026 14:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6787C19421;
	Mon, 16 Mar 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672884;
	bh=151f3cWiR6axiSpyETGy2809glU/p+Thfrb+WhG7his=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IiVlA9K5MR2pm/vVWcjl3jHa1ZLppG/xkVDg4LYhSHBo7tILA3oKU7/VyDtSsg2Kg
	 kQqyeUnfpOlDxu6AfhX2DKeTc56qG3sgVr8cRvArcJDPpB7MtB8+8m/W1CGm4DXnWU
	 /IAV35ajExH6TG7ujNjLHJy8C1NUnuOmNHMTs/CZoSJyL1gIEFWKuYKmUapF57E+52
	 QtJhwAwyYFC0d6NKgO01Zvw7BDFPVjqf+FrFODQ4Cqwr/bAXtOkwM5wsRJqmso1ekz
	 dUhxuwzJMFbfz9arxSyuA8RSwOjRWaOSv5ZVSyJ0pPvwE3EtZ56ZowEAdLjTcvuW1x
	 yQ/B9jgOXn+mA==
Date: Mon, 16 Mar 2026 14:54:33 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
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
Subject: Re: [PATCH 15/15] mm: add mmap_action_map_kernel_pages[_full]()
Message-ID: <b9474609-4c7e-4cbe-8e6c-d55baa689430@lucifer.local>
References: <cover.1773346620.git.ljs@kernel.org>
 <21d8899bb1f4db61203072fb3a56a6c98a61e23d.1773346620.git.ljs@kernel.org>
 <4fd15134-ae1e-4233-8d5a-9d1e0b9f94dc@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fd15134-ae1e-4233-8d5a-9d1e0b9f94dc@infradead.org>
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

On Thu, Mar 12, 2026 at 04:15:26PM -0700, Randy Dunlap wrote:
>
> On 3/12/26 1:27 PM, Lorenzo Stoakes (Oracle) wrote:
>
> > Finally, we update the VMA tests accordingly to reflect the changes.
>
> IMO we could omit the word "we" 5 times above.
> (but no change is required)
>
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 88f42faeb377..88ad5649c02d 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
>
> > +/**
> > + * range_is_subset - Is the specified inner range a subset of the outer range?
> > + * @outer_start: The start of the outer range.
> > + * @outer_end: The exclusive end of the outer range.
> > + * @inner_start: The start of the inner range.
> > + * @inner_end: The exclusive end of the inner range.
> > + *
> > + * Returns %true if [inner_start, inner_end) is a subset of [outer_start,
>
>     * Returns:
> (for kernel-doc)

Ack

>
> > + * outer_end), otherwise %false.
> > + */
> > +static inline bool range_is_subset(unsigned long outer_start,
> > +				   unsigned long outer_end,
> > +				   unsigned long inner_start,
> > +				   unsigned long inner_end)
> > +{
> > +	return outer_start <= inner_start && inner_end <= outer_end;
> > +}
> > +
> > +/**
> > + * range_in_vma - is the specified [@start, @end) range a subset of the VMA?
> > + * @vma: The VMA against which we want to check [@start, @end).
> > + * @start: The start of the range we wish to check.
> > + * @end: The exclusive end of the range we wish to check.
> > + *
> > + * Returns %true if [@start, @end) is a subset of [@vma->vm_start,
>
>     * Returns:

Ack

>
> > + * @vma->vm_end), %false otherwise.
> > + */
> >  static inline bool range_in_vma(const struct vm_area_struct *vma,
> >  				unsigned long start, unsigned long end)
> >  {
> > -	return (vma && vma->vm_start <= start && end <= vma->vm_end);
> > +	if (!vma)
> > +		return false;
> > +
> > +	return range_is_subset(vma->vm_start, vma->vm_end, start, end);
> > +}
> > +
> > +/**
> > + * range_in_vma_desc - is the specified [@start, @end) range a subset of the VMA
> > + * described by @desc, a VMA descriptor?
> > + * @desc: The VMA descriptor against which we want to check [@start, @end).
> > + * @start: The start of the range we wish to check.
> > + * @end: The exclusive end of the range we wish to check.
> > + *
> > + * Returns %true if [@start, @end) is a subset of [@desc->start, @desc->end),
>
>     * Returns:

Ack, I think in general I've seen (or believe I've seen :) other cases without
the colon, so was kinda imitating, but I may also be imagining that ;)

>
> > + * %false otherwise.
> > + */
> > +static inline bool range_in_vma_desc(const struct vm_area_desc *desc,
> > +				     unsigned long start, unsigned long end)
> > +{
> > +	if (!desc)
> > +		return false;
> > +
> > +	return range_is_subset(desc->start, desc->end, start, end);
> >  }
>
> --
> ~Randy
>

Will also fold these changes into the respin!

Cheers, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
