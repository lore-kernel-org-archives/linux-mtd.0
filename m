Received: from p02c12o144.mxlogic.net ([208.65.145.77])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Phn6n-0003Fi-BW
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 17:55:13 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Cannot see NAND flash in 2.6.36.1
Date: Tue, 25 Jan 2011 11:56:02 -0600
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F10CADE@EXV1.corp.adtran.com>
From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have pulled most of the Board support information from my working
2.6.29 kernel to (at the time) the latest 2.6.36.1 kernel from
Linux-MIPS.  In 2.6.29, nand_scan finds the flash as

NAND device: Manufacturer ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB
3,3V 8-bit)

However, the nand_get_flash_type fails to read _ANYTHING_ from the flash
chip.

What do I need to look for to fix this for my port?  I've gone through
most of the nand_base.c and can find nothing that jumps right out there
as being wrong.

If you have any ideas, please pass it along to me.

Thanks,
Andy
