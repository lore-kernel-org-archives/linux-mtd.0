Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DWCJa-0004lJ-DF
	for linux-mtd@lists.infradead.org; Thu, 12 May 2005 07:57:19 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j4CBvKP7003043
	for <linux-mtd@lists.infradead.org>; Thu, 12 May 2005 07:57:20 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j4CBvKOE121086
	for <linux-mtd@lists.infradead.org>; Thu, 12 May 2005 07:57:20 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j4CBv9UK004760
	for <linux-mtd@lists.infradead.org>; Thu, 12 May 2005 07:57:10 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
In-Reply-To: <f6d0cd06050512041048406f5c@mail.gmail.com>
References: <f6d0cd06050512041048406f5c@mail.gmail.com>
Content-Type: text/plain
Date: Thu, 12 May 2005 06:57:41 -0500
Message-Id: <1115899061.6079.11.camel@ibm-ptfdj7idx47.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD for Intel Strata L18 Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-05-12 at 16:40 +0530, Niraj Maheshwari wrote:
> After booting the kernel,  when i try to mount the JFFS2 partition
> from flash, it works fine and it's empty.
> 

> Write of 68 bytes at 0x0054000c failed. returned -30, retlen 0
> Not marking the space at 0x0054000c as dirty because the flash driver returned r
> etlen zero
> cp: unable to open `disc/issue': Read-only file system
> *******************************************************************************************
> 
> Pl. note that Same Kernel Image and ramdisk works fine with Intel W18
> (28F128W18) flash but doesn't work with Intel Strata L18 (28F256L18)
> flash.
> 
> Can anyone tell me what could be the issue as both the flashes are CFI
> compliant ?

-30 is -EROFS.  That seems to indicate that the chip(s) is/are write
protected at the time you are trying to do the write.

I don't have the datasheets for those chips around, but there are some
Intel chips that power-on with all the eraseblocks locked.  That is
probably what you are seeing.  You'll need to unlock them before you can
write.

josh
