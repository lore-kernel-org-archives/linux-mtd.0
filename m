Received: from [195.205.16.233] (helo=dgt-lab.com.pl)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15dsbz-0007K2-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 13:13:56 +0100
Received: from dgt-lab.com.pl (unknown [192.168.6.66])
	by dgt-lab.com.pl (Postfix) with ESMTP id 801A547A0
	for <linux-mtd@lists.infradead.org>; Mon,  3 Sep 2001 13:22:50 +0200 (CEST)
Message-ID: <3B937537.D636406C@dgt-lab.com.pl>
Date: Mon, 03 Sep 2001 14:19:03 +0200
From: Wojciech Kromer <krom@dgt-lab.com.pl>
MIME-Version: 1.0
To: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:(
References: <3B8CB316.4A421C81@dgt-lab.com.pl>  <999074214.32409.1.camel@russ> <3B8B87A9.2F622A89@dgt-lab.com.pl> <999014039.27952.2.camel@russ> <3B8C86BD.5C4FBCF9@dgt-lab.com.pl> <999069428.31681.12.camel@russ> <3B8C9DC5.F3185B18@dgt-lab.com.pl> <21505.999075348@redhat.com> <25302.999077097@redhat.com>
Content-Type: text/plain; charset=iso-8859-2
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

>
> It won't make your mount any faster. You have a sane CPU which can handle
> having both a cached and uncached mapping of a physical region - try doing
> that in your map driver (see ocelot.c for inspiration) and see if it helps.
>

OK, now I'm testing the ocelot's trick. But I do not understand it.

........................

        ocelot_flash_map.map_priv_1 =
        (unsigned long)ioremap_nocache(FLASH_WINDOW_ADDR, FLASH_WINDOW_SIZE);

        ocelot_flash_map.map_priv_2 =
         (unsigned long)__ioremap(FLASH_WINDOW_ADDR, FLASH_WINDOW_SIZE, 0);

^^^^^^^^ so we have chached version in map_priv_2

..........................


__u8 ocelot_read8(struct map_info *map, unsigned long ofs)
{
        return __raw_readb(map->map_priv_1 + ofs);
}

void ocelot_write8(struct map_info *map, __u8 d, unsigned long adr)
{
        cacheflush = 1;
        __raw_writeb(d, map->map_priv_1 + adr);
        mb();
}

^^^^^ and now we're using uncached version for reading and wrining
!!!!!!!!!!!!!!!!!!!!!!!!! ?????????????????

void ocelot_copy_from_cache(struct map_info *map, void *to, unsigned long from,
ss
{
        if (cacheflush) {
                dma_cache_inv(map->map_priv_2, map->size);
                cacheflush = 0;
        }
        memcpy_fromio(to, map->map_priv_1 + from, len);
}

^^^^^^^ and flushing chache after some writes !!!! ???


Q1 What is cahed version usef for?
Q2 Is it a bug?


--
* * * * * * * * * * * *
* per pedes ad astra! *
* * * * * * * * * * * *    mailto:krom@dgt-lab.com.pl
