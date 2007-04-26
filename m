Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh5Mi-0000XL-7U
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 10:54:37 -0400
Received: from [10.191.255.159] (dhcp-255-159.norway.atmel.com
	[10.191.255.159])
	by relay.atmel.no (8.13.4/8.13.4) with ESMTP id l3QEsWsR032294
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Apr 2007 16:54:32 +0200 (CEST)
	(envelope-from hcegtvedt@norway.atmel.com)
Subject: corruption of JFFS2 filesystem, csize is set to 0 after moving a block
From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 26 Apr 2007 16:54:19 +0200
Message-Id: <1177599259.18969.111.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

When I stress the JFFS2 filesystem by copying files around on the root
(/) I end up with a corrupted filesystem after a reboot. The system just
hangs after the kernel is done booting:
Freeing init memory: 56K (90000000 - 9000e000)

Where I should get:
init started:  BusyBox v1.4.2 (2007-04-17 15:34:55 CEST) multi-call
binary
etc...

I copy and remove files until I reach "cp: write error: No space left on
device"

I extracted the filesystem from my flash device (Atmel AT49BV642D) and
did a dump. Here I can see that some of the nodes have a csize set to 0
for vital files such as libdl-0.9.28.so.

Any pointers to where I should start debugging, what can go wrong?

I can provide jffs2dump's, logs or images if needed.

-- 
Best regards
Hans-Christian Egtvedt
