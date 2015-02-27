Received: from nm50-vm6.bullet.mail.bf1.yahoo.com ([216.109.115.237])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRKTW-0007QY-8z
 for linux-mtd@lists.infradead.org; Fri, 27 Feb 2015 12:57:03 +0000
From: Instigate | Narine Hovhannisyan <narine@instigatedesign.com>
Reply-To: Instigate | Narine Hovhannisyan <narine@instigatedesign.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-ID: <1632876944.1769841.1425041798415.JavaMail.yahoo@mail.yahoo.com>
In-Reply-To: <793411697.1734417.1425041462753.JavaMail.yahoo@mail.yahoo.com>
References: <770859846.1704718.1425039219150.JavaMail.yahoo@mail.yahoo.com>
 <793411697.1734417.1425041462753.JavaMail.yahoo@mail.yahoo.com>
Subject: nand_do_write_ops: attempt to write non page aligned data
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Fri, 27 Feb 2015 12:57:03 -0000

Hello Everyone,


I have a question about writing data to NAND flash device and will appreciate
your comments about it.

Our device has NAND Flash type memory and we are able to mount the flash (as
/dev/mtd4) with jffs2.  
We are able to erase the flash using flash_eraseall without any errors. 
But when we try to write data on it, we get the following error:

> cat uImage > /dev/mtd4
nand_do_write_ops: attempt to write non page aligned data
cat: write error: Invalid argument

The goal is to write the uBoot image to the mtdchar device directly without mounting it as file system. 

In our case the last block of the data is not aligned to page size (4096).
As I understand I need to pad the image with some garbage to align it to 4K
border. And if I add padding to the image (e.g. with dd), the command works
fine.

However I did take a look at kernel sources and found the following lines:

drivers/mtd/nand/nand_base.c:


    /* Reject writes, whichare not page aligned */
    if (NOTALIGNED(to) || NOTALIGNED(ops->len)) {
        pr_notice("%s: attempt to write non page aligned data\n", __func__);

        return -EINVAL;
    }

that's the place, where I assume the error comes from.

Below the check I see the code which handles the partial page write 
(fills the page with 0xFFs and then writes the data).


    /* Partial page write? */    if (unlikely(column || writelen < (mtd->writesize - 1))) {
        cached = 0;
        bytes = min_t(int, bytes - column, (int) writelen);
        chip->pagebuf = -1;
        memset(chip->buffers->databuf, 0xff, mtd->writesize);
        memcpy(&chip->buffers->databuf[column], buf, bytes);
        wbuf = chip->buffers->databuf;
    }

So I'd expect that this part should handle the partial page write. Also I tried
to remove the above check of NOTALIGNED(ops->len) data and it worked fine.

Can please someone describe the intention of the check and handling of partial
page write? Can I just remove the NOTALIGNED(ops->len) check and leave the
padding to kernel? What is the risk in this case?

Thanks,
Narine.
