Received: from motgate.mot.com ([129.188.136.100])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AoI73-0006NY-9p
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2004 08:10:21 +0000
Received: from az33exr03.mot.com (pobox3.mot.com [10.64.251.242])
	by motgate.mot.com (Motorola/Motgate) with ESMTP id i148AI46013655
	for <linux-mtd@lists.infradead.org>;
	Wed, 4 Feb 2004 01:10:18 -0700 (MST)
Received: from zch07exm04.corp.mot.com (ZCH07EXM04.corp.mot.com [200.3.1.210])
	by az33exr03.mot.com (Motorola/az33exr03) with ESMTP id i1488YUY024750
	for <linux-mtd@lists.infradead.org>; Wed, 4 Feb 2004 02:08:35 -0600
From: Li Yang <leoli@motorola.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1074583969.14499.100.camel@imladris.demon.co.uk>
References: 
	 <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
	 <1074503876.14499.40.camel@imladris.demon.co.uk>
	 <1074509881.14564.3.camel@Gundam>
	 <1074510244.14499.49.camel@imladris.demon.co.uk>
	 <1074572447.14559.23.camel@Gundam>
	 <1074583969.14499.100.camel@imladris.demon.co.uk>
Content-Type: text/plain
Message-Id: <1075882281.14564.108.camel@Gundam>
Mime-Version: 1.0
Date: 04 Feb 2004 16:11:23 +0800
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2+mtd+big endian problem
Reply-To: leoli@motorola.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-20 at 15:32, David Woodhouse wrote:
> On Tue, 2004-01-20 at 12:20 +0800, Li Yang wrote:
> > > This sounds like you're using byte-swapping operations in your map
> > > driver. You should be using __raw_write*() not write*(). You said you
> > > were 'at the very beginning'... are you still doing that now?
> > 
> > I have verified my maps/ file.  I'm using __raw_write*() now.  Here is
> > part of my maps file, I don't know if the memcpy_toio() matters.
> 
> It doesn't -- it'll never get used. All you need are read32, write32 and
> copy_from. Try this...
>                                                                       
> __u32 ads_read32(struct map_info *map, unsigned long ofs)
> {
>         return *(volatile __u32 *)(map->map_priv_1 + ofs);
> }
>                                                                                                        
> void ads_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
> {
>         memcpy(to, (void *)(map->map_priv_1 + from), len);
> }
>                                                                                                        
> void ads_write32(struct map_info *map, __u32 d, unsigned long adr)
> {
>         *(volatile __u32 *)(map->map_priv_1 + adr) = d;
>         mb();
> }
>  
> 
> Did you try reading and writing chunks of 1, 2 and 4 bytes directly
> to/from /dev/mtd0?

It's very strange even when I use the complex mapping as you given above
the write is still 32bit swapped.  And I tried writing 1, 2 and 4 bytes
using cp.  For block device, write is successful but still swapped.  For
char device, the following error message is given.

# cp u16 /dev/mtd1
MTD_open
MTD_ioctl
Invalid ioctl 402c7413 (MEMGETINFO = 40204d01)
MTD_write
MTD_close
# cp u16 /dev/mtdblock1
mtdblock_open
ok
mtdblock: read on "JFFS" at 0x0, size 0x200
mtdblock: write on "JFFS" at 0x0, size 0x200
mtdblock_release
mtdblock: writing cached data for "JFFS" at 0x0, size 0x40000
ok
#


-- 
Li Yang <leoli@motorola.com>
Metrowerks
