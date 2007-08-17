Received: from smtp-1.sys.kth.se ([130.237.32.175])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IM8TD-0000b0-FK
	for linux-mtd@lists.infradead.org; Fri, 17 Aug 2007 16:31:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp-1.sys.kth.se (Postfix) with ESMTP id 166F115596C
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Aug 2007 22:02:11 +0200 (CEST)
Received: from smtp-1.sys.kth.se ([127.0.0.1])
	by localhost (smtp-1.sys.kth.se [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TUpfs4N0DF72 for <linux-mtd@lists.infradead.org>;
	Fri, 17 Aug 2007 22:02:09 +0200 (CEST)
Received: from webmail.sys.kth.se (unknown
	[IPv6:2001:6b0:1:1300:214:38ff:fec5:5a2d])
	by smtp-1.sys.kth.se (Postfix) with ESMTP id B237C15591D
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Aug 2007 22:02:09 +0200 (CEST)
Message-ID: <53923.212.247.11.6.1187380929.squirrel@webmail.sys.kth.se>
Date: Fri, 17 Aug 2007 22:02:09 +0200 (CEST)
Subject: cfi_cmdset_0001: Use max value for block erase timeout?
From: Anders =?iso-8859-1?Q?Grafstr=F6m?= <grfstrm@users.sourceforge.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am experiencing a problem with a failing erase block on
Intel J3 Strataflash. After receiving the block erase command,
the chip returns to ready state after 25 seconds (see errata #2).
The status register says 0xA0.

The MTD block erase timeout is set to the typical value which is 1 second.
So the 1 second timeout happens. JFFS2 puts the block on the bad_list and
continues, but all operations on the chip within the next 24 seconds will fail
since get_chip() will timeout. JFFS2 is not happy.

Increasing the block erase timeout to 32 seconds solves the problem for me.
A couple of warnings about the failed block erase is printed but JFFS2 has
no errors.

This brings the question of which timeout value should be used for block erase
(and word write and buffer write), typical or max?

/Anders
