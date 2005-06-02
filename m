Received: from dsl-bow-66-18-218-195-cgy.nucleus.com ([66.18.218.195]
	helo=CGY2000.Interalia.ca)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Ddyp6-0006xp-Ck
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 19:10:01 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Jun 2005 17:05:06 -0600
Message-ID: <083AB380E3924D4795740AAE9A27DCAB6BDE06@cgy2000.interalia.ca>
From: "Derek Jones" <DJones@Interalia.ca>
To: <linux-mtd@lists.infradead.org>
Subject: MTD support for Samsung K9K4G08U0M 4G 8bit NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have a Samsung K9K4G08U0M NAND part on my board running linux 2.6.11
that is not handled correctly by the MTD NAND code. Toshiba devices work
fine. I have patched MTD to the June 1, 2005 snapshot and the problem
persists.

The device is detected correctly (ID is EC, DC, C1, 15). However, code
in nand_bbt.c is calling read_oob that issues a read OOB (0x50) command
that is not supported by the Samsung device.

I have poked around in nand_bbt.c, but don't see anything obvious. Any
suggestions?


Regards,

Derek
