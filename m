Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bOt8-0004OB-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 16:37:38 +0000
Date: Thu, 14 Feb 2002 17:48:13 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: acurtis@onz.com, linux-mtd@lists.infradead.org
Subject: Re: patch for 64 bit wide flash
Message-ID: <20020214174813.A22706@wohnheim.fh-wedel.de>
References: <NCBBIINEHIPFGJPLBEIFEEEFDEAA.acurtis@onz.com> <3C6BE2D4.2B771561@comdev.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3C6BE2D4.2B771561@comdev.cc>; from adam.wozniak@comdev.cc on Thu, Feb 14, 2002 at 08:16:20AM -0800
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

> in my physmap.c (I should probably check this in):
> 
> __u64 physmap_read64(struct map_info *map, unsigned long ofs)
> {
> #ifndef __raw_readll
> #error Your architecture needs a __raw_readll in asm/io.h
> #endif
>         return __raw_readll(map->map_priv_1 + ofs);
> }

It is already checked in. As a result, I hit your #error and was 
really happy. ;-)

David said, he fixed that, but I haven't checked yet.

> #define __raw_readll(addr)      (*(volatile unsigned long long*)(addr)) 
> #define __raw_writell(v, addr)  (*(volatile unsigned long long*)(addr) = (v))

> > I have another version of 64-bit bus support which does not change any of
> > the variable types and only changes one function prototype. It probably is
> > not as fast as this 64-bit version, assuming that it is really doing 64-bit
> > bus accesses, but it is a very low impact solution.
> 
> Whether or not you really do 64 bit bus accesses is going to be compiler
> dependant.  If it does, then everything is good.  If it doesn't, it most
> likely won't be any worse than anything you come up with by hand. IMHO
> it would be a shame to break this for people who have tools which really
> do 64 bit accesses on architectures that can benefit from it.

I agree. This solution appears quite sound and solid. It only has to
have a little more testing, as there is propably only one user, to
this moment. Adam, count me in, as soon as I find a little free time.

-- 
Remember that not getting what you want is sometimes a wonderful
stroke of luck.
-- reputely from the Dalai Lama, unverified
