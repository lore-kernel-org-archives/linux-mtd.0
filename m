Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OpQX-0004Y0-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 23:15:37 +0000
Received: from brand.scrye.com
	([207.174.18.194] helo=scrye.com ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14OpQV-0004Xt-00
	for mtd@infradead.org; Fri, 02 Feb 2001 23:15:36 +0000
Message-ID: <20010202231525.19299.qmail@scrye.com>
Date: Fri, 2 Feb 2001 16:15:25 -0700 (MST)
From: Kevin Fenzi <kevin@scrye.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <Pine.LNX.4.30.0102022224380.8902-100000@imladris.demon.co.uk>
References: <20010202221735.18790.qmail@scrye.com>
	<Pine.LNX.4.30.0102022224380.8902-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>>>>> "David" == David Woodhouse <dwmw2@infradead.org> writes:

David> That's amusing. you said the latest binary-only driver actually
David> detected four units, didn't you? Looks like our code is doing
David> better alias detection :)

yeah. ;) 

>> M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI $Id:
>> nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $ Could not find valid
>> boot record Could not mount NFTL device

David> Hmmm. Failing to recognise the Media Header. #define ECC_DEBUG
David> in doc2000.c. It may well be the same problem that's causing
David> 72MiB units to fail.

yeah, looks like:

...
DiskOnChip ECC Error: Read at 728000
Errors corrected: ffffffff
...

for all kinds of sectors. ;) 

David> If it complains about ECC errors, go to nftlmount.c. Find the
David> bit which does this:

David>      if ((i & (SECTORSIZE - 1)) == 0) { /* read one sector for
David> every SECTORSIZE of blocks */ if (MTD_READECC(nftl->mtd, block
David> * nftl->EraseSize + i + SECTORSIZE, SECTORSIZE, &retlen, buf,
David> (char *)&oob) < 0) goto ReplUnitTable; }

David> Replace MTD_READECC with MTD_READ and omit the final (&oob)
David> argument.

ok. 

So I have:

                                                /* read one sector for every SECTORSIZE of blocks */
                                                if (MTD_READ(nftl->mtd, block * nftl->EraseSize +
                                                                i + SECTORSIZE, SECTORSIZE,
                                                                &retlen, buf) < 0)

I still get:

tons of these...

DiskOnChip ECC Error: Read at 2fec000
Errors corrected: ffffffff           
DiskOnChip ECC Error: Read at 2ff0000
Errors corrected: ffffffff           
DiskOnChip ECC Error: Read at 2ff4000
Errors corrected: ffffffff           
DiskOnChip ECC Error: Read at 2ff8000
Errors corrected: ffffffff           
Could not find valid boot record
Could not mount NFTL device     
...
NFTL_open                                          
ENODEV: thisNFTL = 0, minor = 23809, ip = c1173cf0, fp = c111bef8
VFS: Cannot open root device "5d01" or 5d:01                     
Please append a correct "root=" boot option 
Kernel panic: VFS: Unable to mount root fs on 5d:01

Should I have to have the DEBUG_ECC off? 

Looks like in find_boot_record() at the top of that file is another
MTD_READECC...should I change that to MTD_READ? 

David> -- dwmw2

kevin


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
