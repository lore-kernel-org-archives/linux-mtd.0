Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPjm6-0005PC-Ih
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 19:29:44 +0000
Received: by wa-out-1112.google.com with SMTP id v33so693964wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Feb 2008 11:29:35 -0800 (PST)
Message-ID: <f96d234e0802141129w2a1691dfy949caec909fc25f1@mail.gmail.com>
Date: Thu, 14 Feb 2008 14:29:35 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: "MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: what are correct sumtool and nandwrite options for NAND flash?
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

Hello,

I'm trying to determine the correct sumtool, and nandwrite options for
the following NAND flash device:

root@cm-x270:/usb/tmp$ mtd_debug info /dev/mtd5
mtd.type = MTD_NANDFLASH
mtd.flags = MTD_CAP_NANDFLASH
mtd.size = 67108864 (64M)
mtd.erasesize = 131072 (128K)
mtd.writesize = 2048 (2K)
mtd.oobsize = 64
regions = 0

My question is how do I get the OOB data into the flash image, and
convince nandwrite to use it.  I have been doing the following:

sumtool -i <input_file> -o <output_file> -e  -p;
flash_eraseall -j /dev/mtd5
nandwrite /dev/mtd5 <output_file>

I'm not sure what happens to the OOB data in the input image file when
I use the above method?  Is it simply mixed up in the image and not
actually written to the 64 byte OOB space?  The above method seems to
work, so I have ignored it thus far.

My question is should I be using the nandwrite -o option?  Looking at
the source it does not look like the OOB data gets written to the OOB
region unless this option is used.

if I try:
nandwrite -o /dev/mtd5 <output_file>

I get the following:
Input file is not page aligned
Data was only partially written due to error
: Success

Appreciate any pointers as to the correct way to do this.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com
