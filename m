From: phil@river-bank.demon.co.uk (Phil Thompson)
Date: Thu, 13 Feb 2003 20:20:02 +0000
Subject: Initialising NAND OOB with Software ECC
Message-ID: <200302132020.02330.phil@river-bank.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

What's the standard method for initialising the OOB area for software ECC when 
flashing a new JFFS2 image?

The MEMWRITEDATA ioctl looks at first to be the method to use because it uses 
mtd->write_ecc(). However 0 (ie. NAND_ECC_NONE) is always passed as the last 
parameter which disables writing the ECC data. Wouldn't it be more flexible 
to allow user space to specify the OOB format in the ioctl? Or have another 
ioctl to support writing ECC data?

I know I can use MEMWRITEOOB to write the data, but that means that I have to 
compute it in user space - which seems pointless given the kernel can do it.

Thanks,
Phil
