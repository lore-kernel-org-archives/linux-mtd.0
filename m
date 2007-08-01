Received: from rv-out-0910.google.com ([209.85.198.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGIXg-0008Eh-Si
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 14:03:31 -0400
Received: by rv-out-0910.google.com with SMTP id g11so208443rvb
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Aug 2007 11:03:27 -0700 (PDT)
Message-ID: <6934efce0708011103u652a7ec6tcbf7b54606ebb06f@mail.gmail.com>
Date: Wed, 1 Aug 2007 11:03:27 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <20070801121800.GB2747@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org>
Cc: dhowells <dhowells@redhat.com>, Carsten Otte <cotte@de.ibm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Neither am I.  My missing puzzle piece is how to zap all page mappings
> for the chip in question.  Maybe the fs/vm meeting at lce will clear
> things up.

I hope so.

> If I started working on this I'd probably want AXFS on one partition and
> JFFS2 on another.  Being able to write to JFFS2 while reading XIP files
> from AXFS without corruptions is the major milestone.  When that works
> we can think about the other 90% of having both write support and XIP in
> the same filesystem.

No problem.  point()'ing to the whole AXFS image lets you do that.
Just turn on XIP support in MTD.

> How serious is Intel about merging AXFS in mainline, btw?

Very.  We've just been super busy helping customers evaluating and I
rearchitected it.  Also I've got lots of these dependancies to work
out.  You think this get_partition_physaddr() was a hack, wait until
you see what I do to mm/memory.c :)

> Maybe another vm person or two.  The vm part is the critical missing
> piece and needs all the brainpower we can get.

Is this worth doing?
