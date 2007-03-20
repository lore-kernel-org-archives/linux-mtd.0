Received: from server37.tchmachines.com ([69.50.193.27])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HTUNb-0001Ld-05
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 22:47:20 -0400
Received: from archite by server37.tchmachines.com with local (Exim 4.63)
	(envelope-from <linux@architechnical.net>) id 1HTUNW-0006qn-P8
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 22:47:14 -0400
Message-ID: <62764.69.30.123.186.1174358834.squirrel@www.architechnical.net>
Date: Mon, 19 Mar 2007 19:47:14 -0700 (PDT)
Subject: ST NAND flash + u-boot + linux
From: "Pete MacKay" <linux@architechnical.net>
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

I've seen two posts in the past month pertaining to problems with these
8-bit NANDs, and I can sympathize after trying to get root to mount on a
512R3A myself.  The first problem seemed to be a non-standard OOB layout
causing the block to be marked bad when formatted for or loaded with
jffs2.  We still battled with mounting a rootfs taking far too long to
mount after writing two custom drivers, and the design was spun to the
16-bit OneNAND that we're debugging now.

I'd love to hear from people who have been successful with the ST NANDs if
they had to write custom drivers?  Did you customize a software ECC layout
too?

Mete, if there's a way you can boot and mount a non-root jffs2 image on
this, first check to see if your file system has no space left after the
clean-marker scan.  Even without Linux you can use u-boot to check the OOB
data in the partition to see if the blocks are being marked bad (I think
it was byte 5, if I remember?  0xFF = good).

Good Luck!
