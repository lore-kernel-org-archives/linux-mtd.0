Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L2bBH-0002jM-DK
	for linux-mtd@lists.infradead.org; Wed, 19 Nov 2008 00:44:31 +0000
Received: from az33smr01.freescale.net (az33smr01.freescale.net [10.64.34.199])
	by az33egw02.freescale.net (8.12.11/az33egw02) with ESMTP id
	mAJ0iF6p003777 for <linux-mtd@lists.infradead.org>;
	Tue, 18 Nov 2008 17:44:17 -0700 (MST)
Received: from iconoclast.sgtl.sigmatel.com ([10.1.28.112])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id mAJ0iE5p000138
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Nov 2008 18:44:14 -0600 (CST)
Date: Tue, 18 Nov 2008 18:43:55 -0600
To: linux-mtd@lists.infradead.org
Subject: A question about nand_read()
From: "Patrick Turley" <patrick.turley@freescale.com>
Content-Type: text/plain; format=flowed; delsp=yes; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <op.ukucbhx54yuz67@iconoclast.sgtl.sigmatel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My tree is up-to-date as I'm writing this message.

I'm looking at nand_read() in nand_base.c, starting at line 1175, quoted  
here for your convenience:


static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
                      size_t *retlen, uint8_t *buf)
{
         struct nand_chip *chip = mtd->priv;
         int ret;

         /* Do not allow reads past end of device */
         if ((from + len) > mtd->size)
                 return -EINVAL;
         if (!len)
                 return 0;

         nand_get_device(chip, mtd, FL_READING);

         chip->ops.len = len;
         chip->ops.datbuf = buf;
         chip->ops.oobbuf = NULL;

         ret = nand_do_read_ops(mtd, from, &chip->ops);

         *retlen = chip->ops.retlen;

         nand_release_device(mtd);

         return ret;
}


In particular, I'm looking at the preparation to call nand_do_read_ops(),  
where the chip->ops structure is filled in.

Here's a small excerpt from nand_do_read_ops() that concerns me:


     /* Now read the page into the buffer */
     if (unlikely(ops->mode == MTD_OOB_RAW))
             ret = chip->ecc.read_page_raw(mtd, chip, bufpoi);
     else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
             ret = chip->ecc.read_subpage(mtd, chip, col, bytes, bufpoi);
     else
             ret = chip->ecc.read_page(mtd, chip, bufpoi);
     if (ret < 0)
             break;


Note that nand_do_read_ops() will look at the mode field of the ops  
structure, but this field hasn't been set by nand_read().

On the face of it, this looks like a bug. Is there something I don't know  
that makes this not a bug? For example, is the value in the mode field  
intended to persist across operations?
