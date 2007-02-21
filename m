Received: from 66.238.240.35.ptr.us.xo.net ([66.238.240.35]
	helo=ken-exchange.EONCC.COM)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJtBe-0005LY-SR
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 10:15:21 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Typical bad block counts
Date: Wed, 21 Feb 2007 10:15:16 -0500
Message-ID: <B569801144262942AF60C398F8520878E66CD4@ken-exchange.EONCC.COM>
From: "Dave Kelly" <dkelly@eoncc.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On a 1Gbit single level nand (ST-micro), I have 10 chips all with less
than 6 blocks that are bad originally, a few with none.=20

The chips all bit flip excessively in a few blocks.

I am suspicious that somebody erased the original marks. The few blocks
with 0 for the bad block mark all are stuck on 0 for the entire block,
so could never have been erased anyway.

What is a reasonable number for bad blocks on this size chip as it=20
arrives from the mfg?

=20
Thanks.
