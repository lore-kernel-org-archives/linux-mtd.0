Received: from cpe-203-51-197-227.qld.bigpond.net.au ([203.51.197.227] helo=august.hainsworth.net.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lpcT-0005Xw-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2002 12:43:49 +0100
Received: from ike.hainsworth.ath.cx (red@ike.hainsworth.net.au [10.0.0.9])
	by august.hainsworth.net.au (8.11.6/8.11.2) with ESMTP id g82BahE32167
	for <linux-mtd@lists.infradead.org>; Mon, 2 Sep 2002 21:36:43 +1000
Message-Id: <4.3.2.7.2.20020902213847.00cb8908@10.0.0.8>
Date: Mon, 02 Sep 2002 21:43:46 +1000
To: linux-mtd@lists.infradead.org
From: Andrew Hainsworth <andrew@hainsworth.ath.cx>
Subject: Mounting Read-only
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

Hello again,

I now have the DoC detecting and mountable, but it is mounting read-only 
and I can't seem ot make it mount read-write.  Any ideas?

Also, I think the geometry, or pseudo-geometry or whatever of the chip is 
out of whack.  This is what fdisk is telling me:

Disk /dev/nftla: 1 heads, 64064 sectors, 1 cylinders
Units = cylinders of 64064 * 512 bytes

      Device Boot    Start       End    Blocks   Id  System
/dev/nftla1             1         1     32031+  83  Linux
Partition 1 has different physical/logical endings:
      phys=(256, 0, 0) logical=(0, 0, 64064)
Partition 1 does not end on cylinder boundary:
      phys=(256, 0, 0) should be (256, 0, 64064)

Help would be much appreciated, as per usual.

Andrew
