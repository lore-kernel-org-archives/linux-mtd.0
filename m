Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGNip-0003IL-BT
	for linux-mtd@lists.infradead.org; Wed, 01 Aug 2007 19:35:23 -0400
Date: Thu, 2 Aug 2007 01:31:22 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: carsteno@de.ibm.com
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
Message-ID: <20070801233121.GA8854@lazybastard.org>
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<1185882932.3083.98.camel@pmac.infradead.org>
	<6934efce0707311255k57b60d59y5a07d2812b37ca1a@mail.gmail.com>
	<20070801121800.GB2747@lazybastard.org> <46B083B3.80009@de.ibm.com>
	<6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0708011337g32169212v329c778bb7700aea@mail.gmail.com>
Cc: dhowells <dhowells@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 1 August 2007 13:37:57 -0700, Jared Hulbert wrote:
> 
> > I don't think that one is particular hard to do. All you need is:
> > - count refernces in the driver
> 
> References to what? pages? pfn's?
> 
> > - make the xip code return its references after use
> > - a callback that the driver can call to get its references that are
> >    mapped to userland back which would simply boil down to
> >    filemap_xip_unmap()

How does filemap_xip_unmap() work and what arguments will it take?

The only implementation I can visualize right now would be to go through
all page mappings for all processes and removing the mapping if it
points to the physical address range in question.  Extremely slow and
racing with fork() and clone().

So we would need something better.  Just what?  Do you have a better
idea already, Carsten?

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty
