Received: from cpe-203-51-197-227.qld.bigpond.net.au ([203.51.197.227] helo=august.hainsworth.net.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lTzL-0003gl-00
	for <linux-mtd@lists.infradead.org>; Sun, 01 Sep 2002 13:38:00 +0100
Received: from ike.hainsworth.ath.cx (red@ike.hainsworth.net.au [10.0.0.9])
	by august.hainsworth.net.au (8.11.6/8.11.2) with ESMTP id g81CUsE30221
	for <linux-mtd@lists.infradead.org>; Sun, 1 Sep 2002 22:30:54 +1000
Message-Id: <4.3.2.7.2.20020901223306.00cd3f08@10.0.0.8>
Date: Sun, 01 Sep 2002 22:37:54 +1000
To: linux-mtd@lists.infradead.org
From: Andrew Hainsworth <andrew@hainsworth.ath.cx>
Subject: Frustration.
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

Howdy folks

I've been trying to get my DoC2000 to boot for the last couple of 
weeks.  First I tried the drivers from m-sys themselves, but they didn't 
work.  Now I'm trying the MTD drivers and hopefully GRUB.

The DoC is being recognised:

DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: EC, Chip ID: 75 (Samsung KM29U256T)
1 flash chips found. Total DiskOnChip size: 32 MiB

NFTL driver loads:

NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
  nftla: nftla1

But where is the DoC for me to mount and have my merry way with?  I would 
be much appreciative of any help/hints/suggestion/HOWTOs/walkthroughs 
anyone might have.

Cheers.

Andrew 
