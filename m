Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from smtprch1.nortelnetworks.com ([192.135.215.14] helo=smtprch1.nortel.com)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11btrl-0000BX-00
	for mtd@infradead.org; Fri, 15 Oct 1999 00:00:57 +0100
Message-ID: <38065F6F.AABCDC@americasm01.nt.com>
Date: Thu, 14 Oct 1999 17:55:43 -0500
From: "Mark Ferrell" <mferrell@nortelnetworks.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: New low level driver
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


I am working on a low level driver for the PMC551 PCI Memory
module from Ramix Inc. (http://www.ramix.com) to be used in a
telecommunications project here at Nortel Networks.  Originally
I had planned on implementing the entire driver as the lowlevel
driver and the block device driver as well untill someone on the
kernel mailing list pointed me to this project.

Anyway .. The PMC551 PCI Memory module is for cPCI
(CompactPCI) systems.  Basicly it's a PCI device with a bank
of dram/sdram that can be accessed just like normal memory
once you have initialized the device.

Since the memory on this device is crossing the PCI bus we
chose not to implement it in a fashion where it got mapped into
system memory for performance reasons and decided it would
be better suited to to be used as a block device and mapped off
as either swap space or as a ram drive for use in the project, as
the systems in the project have no hard drives.

Anyway .. I have downloaded the mtd tarball and been looking
through the documentation, and about to hit the source, and was
curious if anyone had some pointers as to where I should start in
hooking the low level module into the rest of the system so as to
short-cut a headache.

Any information (docs, hints, tricks, chickens I can sacrifice
over the cards and voodo rituals) that would help  to get this
going quickly would be much appriciated

- - --
 Mark Ferrell  : mferrell@nortelnetworks.com
(972) 685-7868 : Desk
(972) 685-4210 : Lab
(972) 879-4326 : Pager



To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
