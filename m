Received: from nf-out-0910.google.com ([64.233.182.186])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kv8h6-00013Z-Je
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 10:54:32 +0000
Received: by nf-out-0910.google.com with SMTP id d21so1158740nfb.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Oct 2008 03:54:31 -0700 (PDT)
Message-ID: <57afda040810290354wa56e1ccg90b32dd4388d5a94@mail.gmail.com>
Date: Wed, 29 Oct 2008 19:54:31 +0900
From: "unsik Kim" <donari75@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Question about mtd flags
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hello?

I am writing the "mflash" mtd driver and it works good. But I want to
improve more ... (speed).

Mflash is fusion memory just like sandisk's mdoc.

It contains nand flash, nand flash controller, ecc engine, etc.

Mflash has SRAM interface and uses ATA protocol. (but not 100% compatible)

So, user just read, write sector like hard-disk.

My question is what is the most suitable mtd flag for mflash ? (file
system is ext2)

Currently I'm using

mtd.type = MTD_OTHER;
mtd.flags = MTD_CLEAR_BITS | MTD_SET_BITS;
mtd.ecctype = MTD_ECC_RS_DiskOnChip;
mtd.erasesize = 4096;

I see mtd stack always call mtd erase function even though mflash doesn't need.

How can I fix that ?

p.s. Sorry for my poor english skill.
