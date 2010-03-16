Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NrRRt-0003MW-BD
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 07:44:26 +0000
Received: by gyg10 with SMTP id 10so1403449gyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Mar 2010 00:44:18 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 16 Mar 2010 15:44:18 +0800
Message-ID: <2c3b11251003160044q26412f11pdda0b90acc2ef27f@mail.gmail.com>
Subject: Does the soft ecc mode of nandsim work?
From: Liu Hui <onlyflyer@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I found nandsim use NAND_ECC_SOFT mode, but after I write sth. to the
nand page and read the oob of this page, I found the oob is full of
'0xFF'. In NAND_ECC_SOFT, mtd layer should write ECC to oob
automatically, but I can find nothing.

Here is the example code which run on nandsim:

    mtd->write(mtd, offs, len, &retlen, buf);

    oob = kmalloc(mtd->oobsize, GFP_KERNEL);
    memset(oob, 0, mtd->oobsize);
    ret = wnftl_read_oob_place(mtd, offs, mtd->oobsize, &retlen,
                                (uint8_t *)oob);
    if (wnftl_check_data_emtpy(oob, mtd->oobsize))
        {
        kfree(oob);
        BUG(); // the oob is always full of 'OxFF', so the code always run here.
        }

My kernel is 2.6.27, could you please give me some clues?

-- 
Thanks & Best Regards
Liu Hui
--
