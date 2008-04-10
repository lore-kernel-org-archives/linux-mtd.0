Received: from [218.249.31.180] (helo=mailbj.augustatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjpBe-00008o-1E
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 05:19:02 +0000
Message-ID: <42335.10.1.16.2.1207804422.squirrel@mailbj.augustatek.com>
In-Reply-To: <001501c89ac6$019bd0d0$7d10010a@desktopsz32>
References: <20080409194417.1EA9872AED@usa.augustatek.com>
	<001501c89ac6$019bd0d0$7d10010a@desktopsz32>
Date: Thu, 10 Apr 2008 13:13:42 +0800 (CST)
Subject: bug report about nand flash id table and the way to identify chips
From: bhsong@augustatek.com
To: linux-mtd@lists.infradead.org, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: bhsong@augustatek.com, cfan@augustatek.com, chenjiang@augustatek.com,
	pfeng@augustatek.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all&Thomas,
There is a bug in the way to identify nand chips.
At the array nand_flash_ids[]  of nand_ids.c, there is a line like that:
 {"NAND 4MiB 3,3V 8-bit",        0xd5, 512, 4, 0x2000, 0},
There is another line like that:
{"NAND 2GiB 3,3V 8-bit",        0xD5, 0, 2048, 0, LP_OPTIONS},
Both Id is 0xd5.
So for  those chip with chip id=0xd5, for example K9LAG08U0,it will be
identified as an  old chip with page size=512 by the nand_get_flash_type()
in nand_base.c like:
         /* Lookup the flash id */
         for (i = 0; nand_flash_ids[i].name != NULL; i++) {
                 if (dev_id == nand_flash_ids[i].id) {
                         type =  &nand_flash_ids[i];
                         break;
                 }
         }

         /* Newer devices have all the information in additional id bytes */
         if (!type->pagesize) {
        ...

        } else {
                 /*
                  * Old devices have chip data hardcoded in the device id
table
                  */
                 mtd->erasesize = type->erasesize;
                 mtd->writesize = type->pagesize;
                 mtd->oobsize = mtd->writesize / 32;
                 busw = type->options & NAND_BUSWIDTH_16;
         }
We should change the way to get page size, block size and so on. For the
beginning some chips in nand_flash_ids[],  it is not always reliable for
us to get all information through only one ID byte.

Thanks
Barry Song
