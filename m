Received: from mail.eink.com ([160.79.204.3] helo=webmail2.eink.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19f3MW-00050C-Hj
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2003 21:03:52 +0100
Received: from mailbox.eink.com (mailbox.eink.com [192.168.28.203])
	by webmail2.eink.com (8.11.6/8.11.6) with ESMTP id h6MK3rH00401
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2003 16:03:53 -0400
Message-ID: <3F1D98F4.8060904@eink.com>
Date: Tue, 22 Jul 2003 16:05:08 -0400
From: Holly Gates <hgates@eink.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Smartmedia block mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all, I'm hoping someone can give me some advice on a smartmedia 
issue. Here is the deal: I'm working on a display controller based on an 
FPGA, some lookup table data is stored on a smartmedia card. The FPGA 
just pulls data from the card sector by sector in incrementing order.

The cards I am using are samsung 32MB, and I was kind of hoping to find 
some cards with no bad blocks in the area I care about, but we could 
write VHDL to skip bad blocks if need be.

I've been writing the card using a linux laptop running redhat with a 
PQI USB smartmedia adapter which just worked when I plugged it in, by 
executing:

sh> dd if=table.bin of=/dev/sda bs=512c count=64000

When I read back the card using dd, all the data is in order. However 
the problem comes when I read the card with the FPGA. First I noticed 
that my binary file didn't show up until about sector 0x42, and also 
occasionally data would come out that was supposed to be written 
thousands of sectors away. Same thing happens if I do the 
writing/reading using a PCMCIA/smartmedia adapter.

Having done all the work so far with just the data sheet, I started 
poking around the web and it seems like I am running into the 
logical->physical mapping inherent in most uses of smartmedia. However I 
don't want this mapping since it would be a major pain in the ass to 
build and maintain a RAM translation table in the FPGA part of the 
system. I'm still not sure exactly how the translation table is made and 
stored either; is it on the card somewhere? Maybe in those first 0x42 
sectors?

Maybe I could see using the mapping table if it was on the card 
somewhere, but ideally I could just write the binary file to the sectors 
in true, physical, incrementing order. Anyone know of a utility I could 
use to do this?

One thing I tried already was using the "raw" utility:

sh> raw /dev/raw/raw1 /dev/sda

and then using a C program to read out the sectors, however the raw 
utility must be plugging in to a level that is above the mapping since 
when I watch what sectors the computer requests from the card on a logic 
analyzer, it still just jumps around for no apparent reason.

I suppose I could build a parallel port adapter and write some software 
or something, but that is annoying since I know the computer is capable 
of doing what I want if I could get at the right layer of the driver 
stack...

Thanks for any help! (Please cc me on any reply since I am not subscribed)

-Holly Gates
