Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14OoWp-00046v-00
	for mtd-list@infradead.org; Fri, 02 Feb 2001 22:18:03 +0000
Received: from brand.scrye.com
	([207.174.18.194] helo=scrye.com ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14OoWj-00046n-00
	for mtd@infradead.org; Fri, 02 Feb 2001 22:18:00 +0000
Message-ID: <20010202221735.18790.qmail@scrye.com>
Date: Fri, 2 Feb 2001 15:17:35 -0700 (MST)
From: Kevin Fenzi <kevin@scrye.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: Re: DOC2000 issues...
In-Reply-To: <Pine.LNX.4.30.0102022145040.8902-100000@imladris.demon.co.uk>
References: <20010202214438.18382.qmail@scrye.com>
	<Pine.LNX.4.30.0102022145040.8902-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>>>>> "David" == David Woodhouse <dwmw2@infradead.org> writes:

David> Don't bother, if DOCPROBE_HIGH was on - just turn it off.

David> CONFIG_MTD_DOCPROBE_HIGH turned _off_ too, don't you? Another
David> option which wants hiding.
>>  nope. I think I have it on. Would this be causing it to not detect
>> it?

David> Yep. It probes at different addresses (0xfffc8000-0xfffee000
David> instead of 0xc8000-0xee000). Another LinuxBIOS thing.

ok, here's what the 2.4.0 kernel gives me now: (making progress!)

M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip 2000 found at address 0xE0000                           
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
3 flash chips found. Total DiskOnChip size: 48 Mb                      
mtd: Giving out device 0 to DiskOnChip 2000      
Ignoring DiskOnChip 2000 at 0xE2000 - already configured
Ignoring DiskOnChip 2000 at 0xE4000 - already configured
Ignoring DiskOnChip 2000 at 0xE6000 - already configured
Ignoring DiskOnChip 2000 at 0xE8000 - already configured
Ignoring DiskOnChip 2000 at 0xEA000 - already configured
Ignoring DiskOnChip 2000 at 0xEC000 - already configured
Ignoring DiskOnChip 2000 at 0xEE000 - already configured
ftl_cs: FTL header not found.                           
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: nftl.c,v 1.57 2000/12/01 17:51:54 dwmw2 Exp $          
NFTL_notify_add for DiskOnChip 2000               
mtd->read = c01c66f0, size = 50331648, erasesize = 16384
NFTL_setup                                              
Could not find valid boot record
Could not mount NFTL device     
...

NFTL_open                                          
ENODEV: thisNFTL = 0, minor = 23809, ip = c1173cf0, fp = c111bef8
VFS: Cannot open root device "5d01" or 5d:01                     
Please append a correct "root=" boot option 
Kernel panic: VFS: Unable to mount root fs on 5d:01

I do have the  Probe for 0x55 0xAA BIOS Extension Signature on, should
that also be off? 

David> -- dwmw2

kevin


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
