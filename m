Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Ooiy-0004CA-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 22:30:36 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14Ooiw-0004C4-00
	for mtd@infradead.org; Fri, 02 Feb 2001 22:30:35 +0000
Date: Fri, 2 Feb 2001 22:30:27 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Fenzi <kevin@scrye.com>
cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <20010202221735.18790.qmail@scrye.com>
Message-ID: <Pine.LNX.4.30.0102022224380.8902-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 2 Feb 2001, Kevin Fenzi wrote:

> M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
> DiskOnChip 2000 found at address 0xE0000                           
> Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
> 3 flash chips found. Total DiskOnChip size: 48 Mb                      
> mtd: Giving out device 0 to DiskOnChip 2000      
> Ignoring DiskOnChip 2000 at 0xE2000 - already configured
> Ignoring DiskOnChip 2000 at 0xE4000 - already configured
> Ignoring DiskOnChip 2000 at 0xE6000 - already configured
> Ignoring DiskOnChip 2000 at 0xE8000 - already configured
> Ignoring DiskOnChip 2000 at 0xEA000 - already configured
> Ignoring DiskOnChip 2000 at 0xEC000 - already configured
> Ignoring DiskOnChip 2000 at 0xEE000 - already configured

That's amusing. you said the latest binary-only driver actually detected 
four units, didn't you? Looks like our code is doing better alias 
detection :)

> M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
> $Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $          
> Could not find valid boot record
> Could not mount NFTL device     

Hmmm. Failing to recognise the Media Header. #define ECC_DEBUG in
doc2000.c. It may well be the same problem that's causing 72MiB units to
fail.

If it complains about ECC errors, go to nftlmount.c. Find the bit which 
does this:

     if ((i & (SECTORSIZE - 1)) == 0) {
	/* read one sector for every SECTORSIZE of blocks */
	if (MTD_READECC(nftl->mtd, block * nftl->EraseSize +
		i + SECTORSIZE, SECTORSIZE,
		&retlen, buf, (char *)&oob) < 0)
		goto ReplUnitTable;
     }


Replace MTD_READECC with MTD_READ and omit the final (&oob) argument.

> I do have the  Probe for 0x55 0xAA BIOS Extension Signature on, should
> that also be off? 

No, on is good.


-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
