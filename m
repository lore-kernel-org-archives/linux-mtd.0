Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13DRyO-0001lb-00
	for mtd-list@infradead.org; Sat, 15 Jul 2000 14:27:16 +0100
Date: Sat, 15 Jul 2000 14:26:10 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Juan Gonzo <kayemmess@yahoo.ca>
cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: persistence of files using jffs 
In-Reply-To: <20000714230947.15023.qmail@web5305.mail.yahoo.com>
Message-ID: <Pine.LNX.4.21.0007151422260.1066-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 14 Jul 2000, Juan Gonzo wrote:

> Our system has 4 Intel Strataflash chips that are coupled pairs
> to give us 32MB at 32bits data width.  In the structure 'map_info',
> I set the 'buswidth' field to 4.
> 
> The startup code uses the write32 functions, but when I mount 
> I noticed that write16 functions are being used.  As well, in 
> the file cfi_cmdset_0001.c, only write16 functions are called.  
> Is this causing a problem for our system?

Almost certainly. That geometry isn't supported yet, for the simple reason
that I haven't actually met a board which does it yet.

Copy the cfi_intelext_*_1_by_16 routines and make 2_by_16 versions. It
shouldn't be difficult. We also need to check the geometry in
cfi_intelext_setup() and make the MTD device's methods point to the right
set of functions.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
