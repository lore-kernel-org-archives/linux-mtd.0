Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lIi0-0008Ro-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 23:58:32 +0100
Message-ID: <1072F1A27E99D3119747005004B9A380EB98A6@MAIL>
From: Brett Carswell <BrettC@nulec.com.au>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
Date: Fri, 6 Apr 2001 08:58:21 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> BrettC@nulec.com.au said:
> >  The board has four AMD 29LV160 chips which are in x8 mode. These
> > chips can also be in x16 mode but aren't in this case. 
> 
> > My first question is am I correct in expecting that I 
> should see these
> > chips detected as 4 x8 Devices in 32-bit mode? I can get 
> them working
> > in this mode only by shifting all the offset addresses in my mapping
> > functions right by one.
> 
> Shouldn't that be 4 x16 devices in 8-bit mode? 
> 

I think I wasn't clear enough or my understanding of MTD is totally broken
(which is possible). I'm referring to the output of the line:

	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit
mode\n", map->name, 
	       cfi->interleave, cfi->device_type*8, base, map->buswidth*8);

I have four flash chips in parallel on a 32 bit bus so my impression is that
I have an interleave of 4, a device type of 1 (8 bits) and a buswidth of 4
(32bits). However, the CFI probe is detecting the flash chips as device type
2 (16bit). This is fine except when the second address for the write command
is generated as 0x1550  (0x2AA << 8) instead of 0x1554 (0x555 << 4). I'm
trying to work out whether the detection or the program address generation
is wrong or whether by interpretation of buswidth, interleave etc is wrong.

Brett


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
