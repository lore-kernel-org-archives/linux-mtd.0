Received: from rv-out-0910.google.com ([209.85.198.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGKxI-0001hE-SP
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 16:38:09 -0400
Received: by rv-out-0910.google.com with SMTP id g11so239744rvb
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Aug 2007 13:38:02 -0700 (PDT)
Message-ID: <6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
Date: Wed, 1 Aug 2007 13:37:57 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: carsteno@de.ibm.com
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <46B083B3.80009@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
Cc: dhowells <dhowells@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I don't think that one is particular hard to do. All you need is:
> - count refernces in the driver

References to what? pages? pfn's?

> - make the xip code return its references after use
> - a callback that the driver can call to get its references that are
>    mapped to userland back which would simply boil down to
>    filemap_xip_unmap()

Hmm.  See problem is we don't always want to just 'zap' pages, as
such.  Though that would be the brute force straight forward approach.
 I think there is an optimization to target.

Assume we need to erase a block, this definately requires that all
pages in that block be 'zapped'.

With most flashes the erase operation takes chunks of the array larger
than the effected block offline temporarily.  Right now XIP support in
MTD just spins waiting for an interrupt.  When one is recieved the
erase is suspended and normal execution continues with just the block
being erased in an unknown state.  Then when the coast is clear the
erase is resumed.

So we have a large number of pages that are not being changed but that
are not availiable for some time.  I think it would be much better to
identify those pages that will be taken offline and change the page
tables such that a fault can be directed to the FS and then to the MTD
to do the suspend.

The reason would be fault avoidance.  See once the erase completes all
the old valid pages should be mapped back as they were.  Why not allow
the kernel to continue (assuming it isn't taken offline!) executing as
normal and why interrupt the erase until you know for sure you need to
access effected pages?

> - the driver should stop handing out new references for file
> operations when calling the callback, and the reference count should
> become zero pretty soon.
> I'd be happy to do the xip infrastructure parts of this.

Great!
