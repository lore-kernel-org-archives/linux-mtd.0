Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178Njv-0003mZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 17:04:27 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF39@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Kernel oops after sync command in jffs2
Date: Thu, 16 May 2002 12:04:23 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

	I am having a kernel oops when I do a sync command right after a
file erase in jffs2.  It have setup a test which copies a bunch of big =
files
into my jffs2 drive, then erase them and does a sync before doing =
another
loop.  My test program never fails at the first loop, but only after a =
few
tens of loops.

	The test I am running fills jffs2 to 99% full.  I have a 4MB AMD
AM29DL323 CFI flash device, therefore I am using cfi_cmdset_002 chip =
driver.
Right before the kernel oops message pops, I get this error message =
from the
chip driver: "waiting for erase to complete timed out.  Erase at =
0x320000
failed immediately: errno -5".  Peering down into the chip driver code, =
I
found that the following contition occurs: 	=09

		/* The erasing didn't stop?? */
		if ((status & dq5) =3D=3D dq5) {
			/* dq5 is active so we can do a reset and stop the
erase */

			printk( "Erase internally timed out in flash
device!!!\n" ); // temp by FG

			cfi_write(map, CMD(0xF0), chip->start);
		}

	I know that the sync command triggers pending erases in jffs2.  This
is especially why I use it, because it proved that the "rm" / "cp" =
cycle of
my files is faster much more constant when I use sync between the "rm" =
and
the "cp" command.  Is sync command correctly supported by JFFS2?  =
Anyone
else experienced problems similar to mine?

Thanks in avance,

Fr=E9d=E9ric Giasson=20
