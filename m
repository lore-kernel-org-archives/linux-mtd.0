Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12MboO-00078O-00
	for mtd-list@infradead.org; Sun, 20 Feb 2000 19:14:32 +0000
Received: from [208.146.216.98] (helo=vrcwebserver.vrcomm.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12MboN-00078I-00
	for mtd@infradead.org; Sun, 20 Feb 2000 19:14:31 +0000
Message-ID: <38B03CE9.4E893ED1@vrcomm.com>
Date: Sun, 20 Feb 2000 11:13:46 -0800
From: Whai Lim <wlim@vrcomm.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: PowerPC and DiskOnChip
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hello:

Mr. David Woodhouse suggested that I inquiry about if anyone in your
group is doing DiskOnChip stuff with PowerPC.

We have a new design using the Motorola MPC860 (PowerPC) processor and
we also designed in with the DiskOnChip.  What we learned so far was
that there is not a whole lot of info of how to do it with the PowerPC
as far as "initial hardware test", "boot loader" and running "Linux".

Our hardware config is as follow:

1. Motorola MPC860
2. boot flash (512K bytes)
3. static RAM (2M bytes)
4. 1 DIMM socket for PC100 type of SDRAM
5. 1 32 pin socket for DiskOnChip (DOC-Millennium or DOC-2000)

We got good info from David as how to "peek and poke" the DiskOnChip for
hardware interface test and he suggested that we check with you folks
for some sort of loader for PowerPC. Any suggestions will be greatly
appreciated.

Regards,

Whai Lim



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
