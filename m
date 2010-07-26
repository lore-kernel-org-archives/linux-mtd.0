Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OdFgp-0006N7-0b
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2010 04:53:24 +0000
Subject: Re: Bad blocks in a FAT32 partition of MLC nand flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: rednoah <rednoax@gmail.com>
In-Reply-To: <AANLkTim8PxP47Kor9Ryg8vup_h-s1g2x9fkFI4WlBBhP@mail.gmail.com>
References: <AANLkTim8PxP47Kor9Ryg8vup_h-s1g2x9fkFI4WlBBhP@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jul 2010 07:52:35 +0300
Message-ID: <1280119955.14917.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-07-22 at 21:37 +0800, rednoah wrote:
> Hi:
>    I'm using samsung s3c2416 board with a 8G MLC nand flash.A partition
> larger than 7G was reserved for cutomer.They use PC to store files in this
> partition.Since Windows XP was their mainly used OS,there is no other
> file-system choice except FAT32.But FAT32 can't cope with bad blocks in
> nand flash,which may be an easy job for yaffs.So these errors such as
> "path too deep","crc error" are common when copying files to the MLC
> nand flash partition.I refered to the mtd homepage.It seems that there is 2
> solutions:
> 
> 1.use a flash translation layer to deal with wear leveling and bad block.But
> it seems that there is no reliable open source FTL for nand flash.There is no
> FTL for MLC nand flash in main-line kernel.
> 
> 2.use ubi layer,but there is no block device driver on ubi for building FAT32
> or ext2.There is a ubi block device driver.But it doesn't belong main-line mtd
> driver.

There is not public upstream solution for your problem. But you can
develop an FTL layer on top of UBI.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
