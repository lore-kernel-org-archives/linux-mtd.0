Received: from mail.dot4.com ([216.57.134.36])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bhwfe-0000l4-0A
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 16:36:06 -0400
Received: from [192.168.200.101] (unknown [192.168.200.101])
	by mail.dot4.com (Postfix) with SMTP id 041D64117
	for <linux-mtd@lists.infradead.org>;
	Tue,  6 Jul 2004 16:36:02 -0400 (EDT)
Message-ID: <40EB0D28.60309@dot4.com>
Date: Tue, 06 Jul 2004 16:35:52 -0400
From: "Thomas W. Nelson" <twn@dot4.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: MTD support on Motorola Hawk ASIC-based boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have the somewhat dubious honor of migrating a couple of customer's 
applications environments from VxWorks to TimeSys Linux on obsolete 
Motorola MVME2400 and MCP750 boards (the wheels of progress in certain 
defense and telecomm hardware venues turn *very* slowly).  Everything 
else is working fine except we've been unable to get the MTD subsystem 
to successfully probe and recognize the 8 MB user flash on these boards.

The basic configuration is nothing out of the ordinary: 4 AMD 29LV160BT 
(2 MB) devices in x16 mode, arranged in two 32-bit wide even/odd address 
banks.  The one major quirk in the design is that the Hawk memory 
controller ASIC only permits 32-bit wide aligned writes to this array 
(any other type of write -> /dev/null, reads are unconstrained).  We're 
very confident that we have the registers in the Hawk set up correctly 
and we've spent many hours trying all the chip type/bus width/interleave 
permutations available in the existing MTD implementation with no 
success.  Therefore, before we embark on any inappropriate or 
unnecessary major surgery we wanted to ask the community for any 
suggestions, ideas, or other pearls of wisdom.

Thanks for any assistance...

-- 
Tom Nelson
Sr. Consulting Engineer, Dot4, Inc.
twn@dot4.com <mailto:twn@dot4.com>
