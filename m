Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ZF45-0006nB-00
	for mtd-list@infradead.org; Sat, 03 Mar 2001 16:39:29 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14ZF43-0006n5-00
	for mtd@infradead.org; Sat, 03 Mar 2001 16:39:28 +0000
Date: Sat, 3 Mar 2001 16:39:22 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Florian Schirmer / TayTron <schirmer@taytron.net>
cc: <mtd@infradead.org>
Subject: Re: Some bugs
In-Reply-To: <BKEKLBIBFPNGJKJDEODFKEBIEIAA.schirmer@taytron.net>
Message-ID: <Pine.LNX.4.30.0103031611200.6520-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Mar 2001, Florian Schirmer / TayTron wrote:

> 1. CFI-Intel P_ID 3 not supported
> 
> We have 2 interlaced Intel TE28F320 chips. They report P_ID = 3 which isnt
> handled by mtd. After forcing this value to 1 by hand everything works very
> well.

Sensible workaround for now. We need to make sure the cfi_cmdset_0001
code doesn't try to use any commands from the extended command set, but I 
don't think it supports any yet, so it's not an issue.

We need to rework the loading of submodules anyway, so we can fix this 
properly at that time.

> 2. CFI-Intel 16 Bit mode broken
> 
> Intel 16 bit wide access is broken because the extended query table is read
> via read8() calls. Using cfi_read_query instead solves this issue.

OK, applied. Thanks.

> 3. Write support is broken on ppc because of endianess problem
> 
> cat bla.img > /dev/mtd/0
> cat /dev/mtd/0 > bla2.img
> 
> Results in a swapped file. I can only _guess_ where the problem is exactly.
> Reading is done via read_fromio() while writing is done by using writew()
> calls. One of these funtions seem to swapp the bytes. Maybe it isnt really a
> mtd isse. Maybe it's my fault. I've read something in one of the include
> files about the endianess issue but did not find the information again.

Once upon a time, the PPC map drivers were doing byte-swapping in write8 
but not in the copy_{to,from} calls. This was wrong - the chip driver 
needs to handle the correct endianness for the commands, and the map 
driver should do no byteswapping at all.

Sounds like there's still an element of confusion somewhere.

> cfi_write(map, ___arch__swab16(datum), adr);  <--- added swab16

>    map->write16 (map, ___arch__swab16(*((__u16*)buf)++), adr+z);  <--- added swab16 (only for 16 bit type chips)

That's not a generic solution. There should be no byteswapping of data 
anywhere. What map driver are you using? It sounds like it's byteswapping 
on write8(), which is wrong. Make it stop doing that and define 
CFI_HOST_ENDIAN or CFI_BIG_ENDIAN in include/linux/mtd/cfi_endian.h

> 4. Erase size is wrong
> 
> Chip is an CFI-Intel F640. Erase size is 128KB (reported correctly by mtd
> while probing for the chip (DEBUG_CFI)!).
> 
> cfi_probe.c ~ 583:
> 
> printk("  Erase Region #%d: BlockSize 0x%4.4X bytes, %d blocks\n",
>               i, (cfi.cfiq->EraseRegionInfo[i] >> 8) & ~0xff,
>               (cfi.cfiq->EraseRegionInfo[i] & 0xffff) + 1);
> 
> Works corretly.
> 
> cfi_cmd_set.c ~ line 223:
> 
> mtd->erasesize = cfi16_to_cpu( (u16)(cfi->cfiq->EraseRegionInfo[0]
>                                         >> 16) )*256 * cfi->interleave;
> 
> Calculates the wrong size (0x2000 instead of 0x20000) as far as i correctly
> remember.

That is very very strange. Either something is changing EraseRegionInfo[0] 
or cfi->interleave, despite being an integer datatype, contains 1/16.

Can you print the contents of EraseRegionInfo[0] at both locations?


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
