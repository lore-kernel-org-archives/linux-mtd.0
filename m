Received: from cpe-203-51-204-188.qld.bigpond.net.au ([203.51.204.188] helo=august.hainsworth.net.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hhdy-0001IA-00
	for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2002 03:24:18 +0100
Received: from ike.hainsworth.ath.cx (red@ike.hainsworth.net.au [10.0.0.9])
	by august.hainsworth.net.au (8.11.6/8.11.2) with ESMTP id g7M2HR723236
	for <linux-mtd@lists.infradead.org>; Thu, 22 Aug 2002 12:17:27 +1000
Message-Id: <4.3.2.7.2.20020822114908.00c8ee70@10.0.0.8>
Date: Thu, 22 Aug 2002 12:24:14 +1000
To: linux-mtd@lists.infradead.org
From: Andrew Hainsworth <andrew@hainsworth.ath.cx>
Subject: DiskOnChip - not found?
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Good morning/afternoon/evening

I have only just joined this list, so please excuse me if this has been 
asked before (there were a lot of archives to troll through for answers...)

I have a 32 meg DoC2000 sitting in an ISA riser board on an i386 running 
RedHat 7.2 (catch all that?)

When I compile the kernel with MTD support, install it and reboot, I get 
this output:

Possible DiskOnChip with unknown ChipID FF found at 0xfffc8000
Possible DiskOnChip with unknown ChipID FF found at 0xfffca000
Possible DiskOnChip with unknown ChipID FF found at 0xfffcc000
Possible DiskOnChip with unknown ChipID FF found at 0xfffce000
Possible DiskOnChip with unknown ChipID FF found at 0xfffd0000
Possible DiskOnChip with unknown ChipID FF found at 0xfffd2000
Possible DiskOnChip with unknown ChipID FF found at 0xfffd4000
Possible DiskOnChip with unknown ChipID FF found at 0xfffd6000
Possible DiskOnChip with unknown ChipID FF found at 0xfffd8000
Possible DiskOnChip with unknown ChipID FF found at 0xfffda000
Possible DiskOnChip with unknown ChipID FF found at 0xfffdc000
Possible DiskOnChip with unknown ChipID FF found at 0xfffde000
Possible DiskOnChip with unknown ChipID FF found at 0xfffe0000
Possible DiskOnChip with unknown ChipID FF found at 0xfffe2000
Possible DiskOnChip with unknown ChipID FF found at 0xfffe4000
Possible DiskOnChip with unknown ChipID FF found at 0xfffe6000
Possible DiskOnChip with unknown ChipID FF found at 0xfffe8000
Possible DiskOnChip with unknown ChipID FF found at 0xfffea000
Possible DiskOnChip with unknown ChipID FF found at 0xfffec000
Possible DiskOnChip with unknown ChipID FF found at 0xfffee000
No recognised DiskOnChip devices found

All of those addresses are the ones the ISA board will use, but it cannot 
find anything!

Any ideas?  If you need more info, I will get it.

Cheers
Andrew
