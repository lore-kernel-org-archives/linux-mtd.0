Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143SgY-0002xa-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 00:43:50 +0000
Received: from hinet123.sis.com.tw ([210.242.182.251] helo=maillog.sis.com.tw)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143SgV-0002xU-00
	for mtd@infradead.org; Wed, 06 Dec 2000 00:43:48 +0000
Message-ID: <3A2D8B4E.BBF15715@sis.com.tw>
Date: Wed, 06 Dec 2000 08:41:50 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Ian <Relativity@HumanHeuristic.com>
CC: Ronald G Minnich <rminnich@lanl.gov>, mtd@infradead.org,
        linuxbios@lanl.gov
Subject: Re: Problems with r/w on mtdblock0
References: <200012060019.KAA19472@singularity.tronunltd.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ian wrote:
> 

> However!  If you *then* do a dd and transfer any_other_file
> into /dev/mtd0,  the new contents are logically "and"ed with
> the old contents of /dev/mtd0.  Ie;
> 
> 
> So if I take a hexdump of the first line of the "doc_loadbios" binary;
>   #hexdump -v doc_loadbios | more
>   0000000 457f 464c 0101 0001 0000 0000 0000 0000
> 
> ..  the first line of my bios image;
>   #hdexdump -v bios | more
>   0000000 69b0 80e6 0000 0000 0000 0000 0000 0000
> 
> .. and  "and" the two;
>   0110100110110000  = 69b0h
>   0100010101111111  = 4575h
>   ================
>   0100000100110000
> 
> ... I get the first word displayed by /dev/mtd0 after the dd (see above)
>   0100000100110000  = 4130h
> 
> Is /dev/mtd0 supposed to behave like this, or have I just rediscovered a
> deliberate "feature" ... ?
> 


Of course it WILL BEHAVIOR THIS WAY !!!!

The DoC has an NAND flash chip in side. For NAND flash chip
you can only turn each bit form 1 to 0 by WRITE operation,
not the other way around. The only way to turn a 0 bit to 1
is by a ERASE operation. This is why I have to erase the first
few Erase Blocks befor writing the DoC in my loaddoc script.

# Erase the first 128 pages of the DoC,
# 128 pages == 128 page * 512 bytes per page == 1 MB
./erase /dev/mtd0 0 128

# Use dd to (zero) pad linuxbios.strip to 63 KB
dd conv=sync bs=63k if=$LINUXBIOS/util/config/winfast/linuxbios.strip \
of=linuxbios.block

# Use dd to wrtie IPL to the first and second pages (page 0, 1) on the DoC
# N.B. if you are using 2.4.0-test10 and later kernel, the conv=notrunc
# is neceressary.
dd if=$LINUXBIOS/util/config/winfast/docipl of=/dev/mtd0 conv=notrunc
dd if=$LINUXBIOS/util/config/winfast/docipl of=/dev/mtd0 seek=1 conv=notrunc


Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
