Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qwhO-0008OG-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 14:13:30 +0100
Date: Tue, 9 Oct 2001 15:22:39 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: partt partition table parser
Message-ID: <20011009152238.A15708@wohnheim.fh-wedel.de>
References: <20010925220426.B9581@wohnheim.fh-wedel.de> <6763.1002054054@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6763.1002054054@redhat.com>; from dwmw2@infradead.org on Tue, Oct 02, 2001 at 09:20:54PM +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> In general, it looks relatively sane. Can you justify the use of 
> CONFIG_MTD_PARTT_INDIRECT? 

During development, this makes it easier to move the partition table
around without recompiling the kernel. I might get rid of it if i
find/someone shows me a better solution. But work is still in
progress, even if the parser is already useable (and used).

> > +++ mtd/util/mkpartt.c	Tue Sep 25 20:15:58 2001
> > +#include "/usr/src/linux/include/linux/mtd/ibmpartt.h"
> 
> No. Pull the definitions into the C file or take a copy. Don't look too 
> hard at the mkfs.jffs2 code - do as I say, not as I do :)

That was a relic I missed. Fixed it now.

> > +void x_order_32 (__u32 *old32)
> > +{
> > +	__u32 new32;
> > +	__u8 *new8 = (__u8*)&new32;
> > +	__u8 *old8 = (__u8*)old32;
> > +	new8[0] = old8[3];
> > +	new8[1] = old8[2];
> > +	new8[2] = old8[1];
> > +	new8[3] = old8[0];
> > +	*old32 = new32;
> > +}
> 
> That's going to break. In the kernel, we compile with -fno-strict-aliasing 
> just because we've always had evil code there and nobody's yet looked too 
> hard at cleaning it up. For userspace, we need to write real C code.

True. I was still unaware of the correct way to handle endianness. Now
the partition table is big endian. Always. It feel good to reduce
error possibilities. :)

> > +		columns = sscanf (buf, " %20s %x %x %x", /* FIXME: Replace 20 with NAME_MAX_LEN */
> 
>  "%" #NAME_MAX_LEN "s %x %x %x"

It was a little more complicated than that. See the c faq.
http://www.eskimo.com/~scs/C-faq/q11.17.html

> How about making big-endian and little-endian options too, instead of just 
> cross-endian?

I chose a different approach (see above) that will cost some
nanoseconds on little endian machines but saves some people minutes
and hours by not messing up endianness again. Any objections?

The new patch can be found here:
http://wh.fh-wedel.de/~joern/software/kernel/partt.patch

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
