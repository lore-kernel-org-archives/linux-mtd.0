Received: from bm-1a.paradise.net.nz ([202.0.58.20]
	helo=linda-1.paradise.net.nz)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUG7V-0003Kq-CT
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2004 22:04:34 -0500
Received: from smtp-2.paradise.net.nz (smtp-2b.paradise.net.nz [202.0.32.211])
	by linda-1.paradise.net.nz (Paradise.net.nz)
	with ESMTP id <0I7A001UJZ6U3V@linda-1.paradise.net.nz> for
	linux-mtd@lists.infradead.org; Wed, 17 Nov 2004 16:04:24 +1300 (NZDT)
Received: from hayes.bluewaternz.com
	(203-96-159-182.paradise.net.nz [203.96.159.182])	by
	smtp-2.paradise.net.nz
	(Postfix) with ESMTP id 5B8869E876	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Nov 2004 16:04:06 +1300 (NZDT)
Received: from emma.bluewaternz.com ([192.168.2.44] helo=bluewatersys.com)
	by hayes.bluewaternz.com with esmtp (Exim 3.35 #1 (Debian))
	id 1CUG73-0007EH-00	for <linux-mtd@lists.infradead.org>; Wed,
	17 Nov 2004 16:04:05 +1300
Date: Wed, 17 Nov 2004 16:06:12 +1300
From: Brad Beveridge <bbeveridge@bluewatersys.com>
To: linux-mtd@lists.infradead.org
Message-id: <419AC024.1060202@bluewatersys.com>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7bit
Subject: Removable flash storage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all.
I am working with a device that has 3 nand flash slots, two are internal 
and not removable, one is external and is removable.
We currently have a single driver that registers partitions on each card 
at kernel boot time.  All three cards work, and we use yaffs as a 
filesystem on top of MTD.
I am trying to come up with a clean way of allowing the external card to 
be inserted/removed at runtime.
One solution is to have a seperate nand driver for that card & build it 
as a module, then simply modprobe/rmmod.  However, that solution isn't 
so great because we then have two driver source files that are 
essentially the same.
We also thought that a /proc based solution might work, where you write 
"eject 3" or something to /proc/mtd.

What will play nicest with MTD as it stands?  If I need to break the 
driver up, is there any suggestions for minimising code duplication?

Cheers
Brad
