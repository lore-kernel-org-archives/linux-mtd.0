Received: from el-out-1112.google.com ([209.85.162.180])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPkmZ-0005cb-UQ
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 20:34:18 +0000
Received: by el-out-1112.google.com with SMTP id r27so476867ele.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Feb 2008 12:34:10 -0800 (PST)
Message-ID: <45e8e6c40802141234u23331420yd865322ae7bf02bc@mail.gmail.com>
Date: Thu, 14 Feb 2008 12:34:08 -0800
From: "Andrey Yurovsky" <andrey@cozybit.com>
To: "Cliff Brake" <cliff.brake@gmail.com>
Subject: Re: what are correct sumtool and nandwrite options for NAND flash?
In-Reply-To: <f96d234e0802141129w2a1691dfy949caec909fc25f1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <f96d234e0802141129w2a1691dfy949caec909fc25f1@mail.gmail.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You don't want OOB data written (-n) in this case.  For this chip, you
have 128KiB erase blocks.  You can make your image:

$ mkfs.jffs2 -e 128KiB -n -p -d somedir -o image-tmp.jffs2

sum it:

$ sumtool  -e 128KiB -n -p -i image-tmp.jffs2 -o image.jffs2

...and write it:

# flash_erase_all /dev/mtdX
# nandwrite /dev/mtdX image.jffs2

  -Andrey

On 2/14/08, Cliff Brake <cliff.brake@gmail.com> wrote:
> Hello,
>
>  I'm trying to determine the correct sumtool, and nandwrite options for
>  the following NAND flash device:
>
>  root@cm-x270:/usb/tmp$ mtd_debug info /dev/mtd5
>  mtd.type = MTD_NANDFLASH
>  mtd.flags = MTD_CAP_NANDFLASH
>  mtd.size = 67108864 (64M)
>  mtd.erasesize = 131072 (128K)
>  mtd.writesize = 2048 (2K)
>  mtd.oobsize = 64
>  regions = 0
>
>  My question is how do I get the OOB data into the flash image, and
>  convince nandwrite to use it.  I have been doing the following:
>
>  sumtool -i <input_file> -o <output_file> -e  -p;
>  flash_eraseall -j /dev/mtd5
>  nandwrite /dev/mtd5 <output_file>
>
>  I'm not sure what happens to the OOB data in the input image file when
>  I use the above method?  Is it simply mixed up in the image and not
>  actually written to the 64 byte OOB space?  The above method seems to
>  work, so I have ignored it thus far.
>
>  My question is should I be using the nandwrite -o option?  Looking at
>  the source it does not look like the OOB data gets written to the OOB
>  region unless this option is used.
>
>  if I try:
>  nandwrite -o /dev/mtd5 <output_file>
>
>  I get the following:
>  Input file is not page aligned
>  Data was only partially written due to error
>  : Success
>
>  Appreciate any pointers as to the correct way to do this.
>
>  Thanks,
>  Cliff
>
>
>  --
>  =======================
>  Cliff Brake
>  http://bec-systems.com
>
>  ______________________________________________________
>  Linux MTD discussion mailing list
>  http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
