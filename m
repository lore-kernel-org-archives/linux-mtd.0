Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142BIZ-0005yE-00
	for mtd-list@infradead.org; Sat, 02 Dec 2000 11:57:47 +0000
Received: from laxmls02.socal.rr.com ([24.30.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142BIX-0005y8-00
	for mtd@infradead.org; Sat, 02 Dec 2000 11:57:45 +0000
Received: from smtp.socal.rr.com (sc-24-130-154-218.socal.rr.com [24.130.154.218])
	by laxmls02.socal.rr.com (8.10.1/8.10.1) with SMTP id eB2BvfZ00792
	for <mtd@infradead.org>; Sat, 2 Dec 2000 03:57:42 -0800 (PST)
Date: Sat, 2 Dec 2000 05:01:32 +0000
From: Shane Nay <shane@agendacomputing.com>
To: mtd@infradead.org
Subject: Problems with cfi_cmdset_0001
Message-ID: <20001202050132.B4457@www.easysolutions.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Okay, I've been reading the PDF for Strataflash, by Intel.  And I've traced
my problems with the write routines in MTD down to two problems, the Block
address, and the word write problem.  The command address isn't properly
interpretted for this chip.  I'm not sure what the CFI spec is, but I
think:
cmd_adr=adr & ~(wbufsize-1);
is wrong.  (Well, maybe it's different chip to chip, but I know it's wrong
for this chip)

It should compute the top of the block via the erasesize and size.
cmd_adr=mtd->erasesize*((int)(adr/mtd->erasesize));

Now, this fixes the Block address.  The other problem though is
significantly nastier.

Okay, MTD seems to think that it can write twice as much data as it can to
a device at a time in write_buffer mode, which is all together wrong.  My
configuration is two x8 chips interleaved on a 16 bit bus.  Basically...,
its thinking we have two x16 chips on a 32 bit bus before streaming, but
then streams the data the right way, but twice as much as it said it would.
 (It says, I'm sending 16 words, then sends 32 of them instead, which as
you could imagine, is quite confusing to the poor flash chips)

In any event.  I've got the block address problem fixed up in the code with
the afore mentioned code.  The other problem I'm still working on. 
However, my code is so removed at this point from MTD base since I had too
many other things at play with MTD code to properly trace my problem, and
now I have a cleaner version of the code for XIP.  So I'm not sure I'm
going to roll all my changes into cfi_cmdset_0001.  Who is the maintainer
of this file BTW?  I'll try to make patches for him/her to fix these
problems.

Thanks,
Shane.

(Or maybe my extremely tired brain is mis-interpretting..., if I'm wrong,
tell me so :)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
