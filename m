Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bMXJ-0004DS-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 14:06:57 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
        "Adam Wozniak" <adam.wozniak@comdev.cc>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: patch for 64 bit wide flash
Date: Thu, 14 Feb 2002 06:16:50 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFEEEFDEAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020214133223.A26200@wohnheim.fh-wedel.de>
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

I have another version of 64-bit bus support which does not change any of
the variable types and only changes one function prototype. It probably is
not as fast as this 64-bit version, assuming that it is really doing 64-bit
bus accesses, but it is a very low impact solution.

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Jörn Engel
> Sent: Thursday, February 14, 2002 4:32 AM
> To: Adam Wozniak
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: patch for 64 bit wide flash
>
>
> Hi!
>
> > I've got a 64 bit wide flash consisting of eight 8bit wide chips.
> > Here's a patch against the 2.4.16 kernel
> >
> > I think I've added enough code to support all 64 bit wide
> > configurations,
> > but somebody whould probably check me on it.
>
> After merging with current cvs again, I found an issue with your code
> and my kernel:
>
> > diff -urbBN --exclude=.*depend --exclude=*.flags --exclude=*.o
> linux-original/drivers/mtd/maps/physmap.c linux/drivers/mtd/maps/physmap.c
> > --- linux-original/drivers/mtd/maps/physmap.c	Thu Oct  4
> 15:14:59 2001
> > +++ linux/drivers/mtd/maps/physmap.c	Tue Dec 18 14:06:06 2001
> > @@ -10,6 +10,7 @@
> >  #include <asm/io.h>
> >  #include <linux/mtd/mtd.h>
> >  #include <linux/mtd/map.h>
> > +#include <linux/mtd/partitions.h>
> >  #include <linux/config.h>
> >
> >
> > @@ -34,6 +35,11 @@
> >  	return __raw_readl(map->map_priv_1 + ofs);
> >  }
> >
> > +__u64 physmap_read64(struct map_info *map, unsigned long ofs)
> > +{
> > +	return __raw_readll(map->map_priv_1 + ofs);
> > +}
>
> __raw_readll is not defined in our kernel (2.4.2 based). Worse, I
> couldn't find that definition in the 2.4.17 kernel, either. Is this
> specific to your private kernel?
>
> Joern
>
> PS: The same applies to __raw_writell, of course.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
