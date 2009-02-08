Received: from mail.oksatcom.it ([83.216.172.7] helo=mail.satcom.it)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LWJ0z-0004GC-UA
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2009 23:24:44 +0000
Received: from localhost.localdomain (83.216.178.43) by mail.satcom.it
	(7.3.117) id 497CE606001E13A1 for linux-mtd@lists.infradead.org;
	Mon, 9 Feb 2009 00:24:39 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (Postfix) with ESMTP id D03D8400E9B
	for <linux-mtd@lists.infradead.org>;
	Mon,  9 Feb 2009 00:24:38 +0100 (CET)
Received: from localhost.localdomain ([127.0.0.1])
	by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KwfcoxdmSLqT for <linux-mtd@lists.infradead.org>;
	Mon,  9 Feb 2009 00:24:38 +0100 (CET)
Received: from [192.168.0.74] (unknown [192.168.0.74])
	by localhost.localdomain (Postfix) with ESMTP id 6DFD6400E9A
	for <linux-mtd@lists.infradead.org>;
	Mon,  9 Feb 2009 00:24:38 +0100 (CET)
Message-ID: <498F69B7.6010404@tecnasrl.com>
Date: Mon, 09 Feb 2009 00:24:39 +0100
From: Francesco Lodi - Tecna Srl <francesco.lodi@tecnasrl.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND with an OOB size of 128
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I am trying to make this Micron NAND flash to work:
http://www.micron.com/products/partdetail?part=MT29F32G08QAAWP
it is a 32 gigabit divided into two 16 gigabit device and now, for
simplicity, I am working only on the first one.
The kernel I am using is the last 2.6.28.4.
The flash has a spare area of 218 bytes so the MTD driver calculate an
OOB size of 128 bytes and then it throws a BUG in the function
nand_scan_tail ("no oob scheme defined for oobsize 128").
I have tried to add this schema at the beginning on nand_base.c:

static struct nand_ecclayout nand_oob_128 = {
    .eccbytes = 48,
    .eccpos = {
    80,  81,  82,  83,  84,  85,  86,  87,
    88,  89,  90,  91,  92,  93,  94,  95,
    96,  97,  98,  99, 100, 101, 102, 103,
    104, 105, 106, 107, 108, 109, 110, 111,
    112, 113, 114, 115, 116, 117, 118, 119,
    120, 121, 122, 123, 124, 125, 126, 127},
    .oobfree = {
        {.offset = 2,
         .length = 78}}
};

and then adding:
        case 128:
            chip->ecc.layout = &nand_oob_128;
in nand_scan_tail.

Doing that resolve the kernel BUG but flash_eraseall claims that it
can't read oobinfo.
I have resolved also this problem by expanding the array eccpos in the
structure nand_oobinfo to 64 even in the kernel than in the user space
utility.

Now flash_eraseall -j works fine but when I mount the device it ends with:
Cowardly refusing to erase block on filesystem with no valid JFFS2 node

After erasing the flash without the -j option I was able to mount the
device but whenever I copy a file into it I have a kernel BUG at
fs/jffs2/file.c:251

Now I am stuck at this point and I am asking if you have any suggestion
on how to use this flash.

Thanks,
Francesco
