Received: from host11.oneononeinternet.com ([209.239.43.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AeQUH-0007H5-D1
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2004 03:05:33 +0000
Received: from solarwave (pool-151-203-193-28.bos.east.verizon.net
	[151.203.193.28])i0833LbE012599
	for <linux-mtd@lists.infradead.org>; Wed, 7 Jan 2004 22:03:21 -0500
From: "Mark Richards" <markr@massmicro.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 7 Jan 2004 22:03:22 -0500
Message-ID: <002901c3d593$fa1fc240$6e01a8c0@solarwave>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Changing parameters on the fly - possible?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings.

I am so grateful for the MTD drivers for Linux. I've had some problems
getting them established in a Mandrake 9.2 environment, but finally got =
a
successful kernel build completed under the 2.4.22-21mdk kernel version.
That's a few builds later than I had originally planned.  I found out, =
the
hard way, that Mandrake has a special kernel build that mates with their
desktop, etc.  I also had problems loading the drivers as modules using
insmod, so resorted to the custom kernel route.

My problem is that the build I did is not finding the DOC chip.  I get =
the
following from dmesg:

Using configured disk on chip address 0xd400
No recognized DskOnChip devices found.

However using the dInfo utility I can see the chip OK.

I was a bit over-zealous, and set the probe address manually in xconfig
before building the kernel.  Maybe this is my problem?  Is there any way =
to
change the behaviour of the drivers for the DOC 2000 such that, for =
example,
I can remove the fixed probe address, or change other parameters. or do =
I
have to build all over again?
