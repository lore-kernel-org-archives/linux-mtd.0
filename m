Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19xngU-0006UO-NG
	for <linux-mtd@lists.infradead.org>; Fri, 12 Sep 2003 14:09:58 +0100
Received: from localhost (localhost [127.0.0.1])DA7C6F2A3
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Sep 2003 08:06:16 -0400 (EDT)
Date: Fri, 12 Sep 2003 08:06:16 -0400 (EDT)
From: joshua@dashnine.joshuawise.com
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0309120801130.27968-100000@dashnine.joshuawise.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: h1910 NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND flash seems to work on the iPAQ h1910. Things of note:

* h1910 has ALE and CLE muxed on the address lines, and chip select
connected to a real chip select. This means a few things, notably that we
can't cache IO_ADDR_R in a declared register variable any more the way I
have implemented it. It also means that chipselect in hwcontrol is a nop,
as the CPU will manage that for us.

* Not certain what type of ECC we should be using. Had to comment out the
WARNING: Not using ECC is not recommended! message (or something like
that) so that my dmesg wasn't flooded with those when I tried to read from
flash.

Code is in handhelds.org linux/kernel26 CVS.

Have fun,
/j
