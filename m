Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JS7se-0007iU-2I
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 09:38:16 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JWL0034B1FNZ8@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 18:38:11 +0900 (KST)
Received: from [107.108.214.146] by mmp1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTPA id <0JWL00EPU1FLPI@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 18:38:11 +0900 (KST)
Date: Thu, 21 Feb 2008 15:10:09 +0530
From: Indraneel <indraneel.m@samsung.com>
Subject: Re: Block devices
In-reply-to: <47BD22D0.9060008@dlasys.net>
To: "David H. Lynch Jr." <dhlii@dlasys.net>
Message-id: <47BD46F9.9000708@samsung.com>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
References: <47BD22D0.9060008@dlasys.net>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,
First things first. Don't post to multiple mailing lists at the same time.

David H. Lynch Jr. wrote:
>     Sometime recently it seems to have become possible to disable the
> whole block device subsystem.

Yes it is possible. Works for me on 2.6.22-rc5.

>     Though in my tests I can't quit build with it disabled.
> 
>      Anyway, for an embedded device this might be appealing.
>     how does this interact with initramfs and flash ?
>    
>     Can I boot an initramfs kernel without a block device ?

Yes this is also possible. And that's why initramfs is fast.

>     Can I write a filesystem driver for a flash device that does not
> require a block device ?

AFAIK, for a flash file system you need a Block Device. But you can 
write a character driver to access the flash without a Block Device.

>     Are their any examples of something even close ?

  drivers/mtd/mtdchar.c

Regards,
Indro

> 
>    
> 
>       
> 
> 
> 
> 
> 
> 
> 
