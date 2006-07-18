Received: from py-out-1112.google.com ([64.233.166.181])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G2jRB-0006Yg-Hm
	for linux-mtd@lists.infradead.org; Tue, 18 Jul 2006 02:52:16 -0400
Received: by py-out-1112.google.com with SMTP id n25so1819366pyg
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jul 2006 23:52:04 -0700 (PDT)
Message-ID: <f360e3ef0607172352t13dc48h5088fd1dcd6457f7@mail.gmail.com>
Date: Tue, 18 Jul 2006 14:52:04 +0800
From: "ken HP" <kenhp1982@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: yaffs2 and nand_write_ecc problem
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hello everyone

I use yaffs2 on samsung nand flash(2k page 512M) now. I download
latest mtd CVS from ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/
when I umount and remount,  file disappear.I knew about the interface
between yaffs2 and mtd have some problem.but in my yaffs2 source code
this problem seems just fixed.yaffs2 put and read tags just in 2-38
field of oob.

I traced the code and found problem is here. in nand_base.c. I found
that if I use option NAND_ECC_NONE, the function nand_write_ecc would
not read any oob data. However,in yaffs2 side, it suppose
mtd->write_ecc will write data and tags.

code is here

$Id: nand_base.c,v 1.166 2006/03/13 06:09:08 vwool Exp $

 static int nand_write_page (struct mtd_info *mtd, struct
 nand_chip *this, int page,u_char *oob_buf,  struct nand_oobinfo
*oobsel, int cached)
 {
 ......

 switch (eccmode) {
 /* No ecc, write all */
 case NAND_ECC_NONE:
 printk (KERN_WARNING "Writing data without ECC to   NAND-FLASH is
not recommended\n");
 this->write_buf(mtd, this->data_poi, mtd->oobblock);
 break;

nand_write_ecc calls nand_write_page, but if the option is
NAND_ECC_NONE, it just simple writes 2048 byte data, break and return.
so yaffs2'tag is not written to oob.

I change nand_base.c to previous one whose nand_write_page will write
oob, and yaffs2 works perfectly.

Does anyone have the same problem ? and Does this problem(
nand_write_page do not write data to oob with option NAND_ECC_NONE) is
a bug?

apologize for my poor english.
