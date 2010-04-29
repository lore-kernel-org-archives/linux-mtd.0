Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7MKc-0003Pr-SA
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 05:30:41 +0000
Subject: Re: UBI Errors on DaVinci OMAP L-138/DA850
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Caglar Akyuz <caglarakyuz@gmail.com>
In-Reply-To: <201004210115.18664.caglarakyuz@gmail.com>
References: <201004210115.18664.caglarakyuz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Apr 2010 08:25:41 +0300
Message-ID: <1272518741.7750.65.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kevin Hilman <khilman@deeprootsystems.com>,
	David Brownell <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-04-21 at 01:15 +0300, Caglar Akyuz wrote:
> Hello,
> 
> Today I made my first attempt to try ubifs on a DaVinci processor, OMAP 
> L-138 or DA850 specifically. My board has a Micron SLC 128 MiB NAND chip with 
> part number MT29F1G08ABCHC(chip id is 0xa1)
> 
> I formatted and flashed my partition with commands:
> 
>  $ubiformat /dev/mtd4
>  $ubiformat /dev/mtd4 -f rootfs.ubi
> 
> Then I tried to attach it with:
> 
>  $ubiattach /dev/ubi_ctrl -m 4
> 
> However, I hit the FAQ entry at [1], namely driver returning -EBADMSG. Then I 
> tried to mount an empty flash with following commands in case my image has 
> something wrong:
> 
>  $ubiformat /dev/mtd4
>  $ubiattach /dev/ubi_ctrl -m 4
>  $ubimkvol /dev/ubi0 -N filesytem -s 100MiB
>  $mount -t ubifs /dev/ubi0_0 /mnt/cf
> 
> But this resulted the same error message when I read/write something to/from the 
> flash. (To be honest I do not remember if the error was due to read, write or remount)
> 
> Then I tried formating and attaching my partition with '-s 2048' and -O '2048' 
> parameters respectively and -EBADMSG error went away. So I patched 
> nand_ids.c to add 'NAND_NO_SUBPAGE_WRITE'  option to my NAND flash
> (patch is attached) and after this operation I was able to use ubifs as expected 
> on my board.(Of course re-building my ubi image with new nand parameters)
> 
> I wonder:
> 
> * if this modification has any side effects?

Probably sub-pages are not supported with this change?

> * Is this error due to my NAND flash or DaVinci driver is doing something wrong? 
>   Unfortunately, Micron datasheet is not publically available and I cannot check if it
>   is supporting 512 KiB sub-page operations or not.

Most probably the flash does support sub-pages because of HW ECC
support. I do not know DaVinchi platform at all, but I guess what you
need to do is to set NAND_NO_SUBPAGE_WRITE in chip options in your
platform data. But it is better to talk to DaVinchi guys (CCed some).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
