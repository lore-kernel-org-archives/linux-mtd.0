Date: Wed, 28 May 2008 13:41:46 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org, tglx@linutronix.de, joern@logfs.org,
	dedekind@infradead.org, linux-mtd@lists.infradead.org
Subject: [RFC/PATCH 1/3] NAND multiple plane feature 
Message-ID: <alpine.LFD.1.10.0805281332280.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
This patch provides identification of planes number on NAND device.
According to NAND datasheets the 5th byte of id contains info about
number of planes.

Thanks,
Alexey


Signed-off-by: Vasiliy Leonenko <vasiliy.leonenko@mail.ru>
Signed-off-by: Alexey Korolev <akorolev@infradead.org>
--------
 drivers/mtd/nand/nand_base.c |    5 +++++
 include/linux/mtd/nand.h     |    2 ++
 2 files changed, 7 insertions(+)

diff -Nurp linux-2.6.24.3/drivers/mtd/nand/nand_base.c linux-2.6.24.3-dp/drivers/mtd/nand/nand_base.c
--- linux-2.6.24.3/drivers/mtd/nand/nand_base.c	2008-02-26 03:20:20.000000000 +0300
+++ linux-2.6.24.3-dp/drivers/mtd/nand/nand_base.c	2008-05-28 02:06:01.000000000 +0400
@@ -2259,10 +2367,15 @@ static struct nand_flash_dev *nand_get_f
 	/* Newer devices have all the information in additional id bytes */
 	if (!type->pagesize) {
 		int extid;
+		int planeid;
 		/* The 3rd id byte holds MLC / multichip data */
 		chip->cellinfo = chip->read_byte(mtd);
 		/* The 4th id byte is the important one */
 		extid = chip->read_byte(mtd);
+		/* The 5th id byte contains number of planes */
+		planeid = chip->read_byte(mtd);
+		/* Number of planes*/
+		chip->numplanes = 1 << ((planeid >> 2) & 0x03);
 		/* Calc pagesize */
 		mtd->writesize = 1024 << (extid & 0x3);
 		extid >>= 2;
diff -Nurp linux-2.6.24.3/include/linux/mtd/nand.h linux-2.6.24.3-dp/include/linux/mtd/nand.h
--- linux-2.6.24.3/include/linux/mtd/nand.h	2008-02-26 03:20:20.000000000 +0300
+++ linux-2.6.24.3-dp/include/linux/mtd/nand.h	2008-05-28 02:11:51.000000000 +0400
@@ -343,6 +344,7 @@ struct nand_buffers {
  * @options:		[BOARDSPECIFIC] various chip options. They can partly be set to inform nand_scan about
  *			special functionality. See the defines for further explanation
  * @badblockpos:	[INTERN] position of the bad block marker in the oob area
+ * @numplanes:		[INTERN] number of ident planes on NAND device
  * @cellinfo:		[INTERN] MLC/multichip data from chip ident
  * @numchips:		[INTERN] number of physical chips
  * @chipsize:		[INTERN] the size of one chip for multichip arrays
@@ -399,6 +400,7 @@ struct nand_chip {
 	int		subpagesize;
 	uint8_t		cellinfo;
 	int		badblockpos;
+	int		numplanes;
 
 	nand_state_t	state;
 
