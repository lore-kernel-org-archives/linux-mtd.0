Received: from ptb-relay01.plus.net ([212.159.14.212])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CeiPg-0005aT-5u
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 18:18:33 -0500
Received: from [80.229.56.123] (helo=central.bult.co.uk)
	by ptb-relay01.plus.net with esmtp (Exim) id 1CeiPd-000Ape-E2
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 23:18:29 +0000
Received: from squizzey.bult.co.uk (squizzey.bult.co.uk [10.1.0.4])
	by central.bult.co.uk (Postfix) with ESMTP id B62AE1F3123
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Dec 2004 00:28:44 +0000 (GMT)
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Wed, 15 Dec 2004 23:19:03 +0000
Message-Id: <1103152743.15913.33.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've been working on the MTD block driver for JFFS2 and now seem to have
a relatively stable environment with a JFFS2 root filesystem on a USB
flash key device. 
(mtd block device speed now approximates actual device speed on both
read and write)

It seems to be much quicker (generally) than the previous ext2
incarnation.

However, I'm looking at 30secs to mount the root filesystem.

I would be very grateful of some advice on the following before I start
digging through the JFFS2 code itself;

a. Is it possible (conceptually) to background the mount scan so the
system can boot while the scan happens ?
b. Is there an easy way to bypass the scan and does JFFS3 do this ? 

Any help/advice would be much appreciated.

Many thanks,
Gareth.
