Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bORa-0004MH-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 16:09:11 +0000
Message-ID: <3C6BE2D4.2B771561@comdev.cc>
Date: Thu, 14 Feb 2002 08:16:20 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: acurtis@onz.com
CC: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Subject: Re: patch for 64 bit wide flash
References: <NCBBIINEHIPFGJPLBEIFEEEFDEAA.acurtis@onz.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

in my physmap.c (I should probably check this in):

__u64 physmap_read64(struct map_info *map, unsigned long ofs)
{
#ifndef __raw_readll
#error Your architecture needs a __raw_readll in asm/io.h
#endif
        return __raw_readll(map->map_priv_1 + ofs);
}

void physmap_write64(struct map_info *map, __u64 d, unsigned long adr)
{
#ifndef __raw_writell
#error Your architecture needs a __raw_writell in asm/io.h
#endif
        __raw_writell(d, map->map_priv_1 + adr);
        mb();
}

from my include/asm/io.h (this will vary from architecture to
architecture)

#define __raw_readll(addr)      (*(volatile unsigned long long *)(addr)) 
#define __raw_writell(v, addr)  (*(volatile unsigned long long *)(addr)
= (v))

(right next to __raw_writel and all those guys)

Allen Curtis wrote:
> 
> I have another version of 64-bit bus support which does not change any of
> the variable types and only changes one function prototype. It probably is
> not as fast as this 64-bit version, assuming that it is really doing 64-bit
> bus accesses, but it is a very low impact solution.

Whether or not you really do 64 bit bus accesses is going to be compiler
dependant.  If it does, then everything is good.  If it doesn't, it most
likely won't be any worse than anything you come up with by hand.  IMHO
it would be a shame to break this for people who have tools which really
do 64 bit accesses on architectures that can benefit from it.

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
