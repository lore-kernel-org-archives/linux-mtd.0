Received: from mailgw.dash.net ([63.197.86.25])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPl2i-00074H-AS
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 20:50:58 +0000
Subject: Re: what are correct sumtool and nandwrite options for NAND flash?
From: Blair Barnett <bbarnett@dash.net>
To: Cliff Brake <cliff.brake@gmail.com>
In-Reply-To: <f96d234e0802141129w2a1691dfy949caec909fc25f1@mail.gmail.com>
References: <f96d234e0802141129w2a1691dfy949caec909fc25f1@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 14 Feb 2008 12:44:04 -0800
Message-Id: <1203021844.5507.29.camel@bbarnett-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: blair@dash.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-02-14 at 14:29 -0500, Cliff Brake wrote:
> Hello,
> 
> I'm trying to determine the correct sumtool, and nandwrite options for
> the following NAND flash device:
> 
> root@cm-x270:/usb/tmp$ mtd_debug info /dev/mtd5
> mtd.type = MTD_NANDFLASH
> mtd.flags = MTD_CAP_NANDFLASH
> mtd.size = 67108864 (64M)
> mtd.erasesize = 131072 (128K)
> mtd.writesize = 2048 (2K)
> mtd.oobsize = 64
> regions = 0
> 
> My question is how do I get the OOB data into the flash image, and
> convince nandwrite to use it.  I have been doing the following:
> 
> sumtool -i <input_file> -o <output_file> -e  -p;
> flash_eraseall -j /dev/mtd5
> nandwrite /dev/mtd5 <output_file>
> 
> I'm not sure what happens to the OOB data in the input image file when
> I use the above method?  Is it simply mixed up in the image and not
> actually written to the 64 byte OOB space?  The above method seems to
> work, so I have ignored it thus far.
> 
> My question is should I be using the nandwrite -o option?  Looking at
> the source it does not look like the OOB data gets written to the OOB
> region unless this option is used.
> 
> if I try:
> nandwrite -o /dev/mtd5 <output_file>
> 
> I get the following:
> Input file is not page aligned
> Data was only partially written due to error
> : Success
> 
> Appreciate any pointers as to the correct way to do this.
> 
> Thanks,
> Cliff
> 

Hi Cliff,

sumtool doesn't create an image with embedded OOB data by default. You
can check for yourself by doing a hexdump of the image and looking at
the data that is placed at 2049 (1 byte after the first 2k page. If OOB
data is there, it will be obvious. If it's (as I surmise) the next 2k
page, then no oob data is embedded in the image.

I think what you want is 

sumtool -e 131072 -c  -p -i <input_file> -o <output_file>
nandwrite -o -j /dev/mtd5 <output_file>

-blair
