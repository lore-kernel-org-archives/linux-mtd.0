Received: from mail.avantwave.com ([210.17.210.210])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DDZNh-0001cZ-6B
	for linux-mtd@lists.infradead.org; Mon, 21 Mar 2005 21:44:34 -0500
Received: from [172.16.10.215] (chung.avantwave.com [172.16.10.215])
	by mail.avantwave.com (8.12.10/8.12.10) with ESMTP id j2M2cdXb007185
	for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2005 10:38:39 +0800
Message-ID: <423F87CC.10805@avantwave.com>
Date: Tue, 22 Mar 2005 10:49:48 +0800
From: mike <mikelee@avantwave.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1ffb4b0705032109224f2c7805@mail.gmail.com>
In-Reply-To: <1ffb4b0705032109224f2c7805@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: mtd permission denied
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all
    Also when i use jffs2 for data storage, i got these msg when 
mounting mtd. i have tried to erase and unlock the mtd , i got similar msg.

Erase at 0x00080000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00070000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00060000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00050000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00040000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00030000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00020000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00010000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000f0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000e0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000d0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000c0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000b0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x000a0000 failed immediately: -EROFS. Is the sector locked?
Erase at 0x00090000 failed immediately: -EROFS. Is the sector locked?

~ # flash_eraseall /dev/mtd4
flash_eraseall: /dev/mtd4: Permission denied
~ # flash_unlock /dev/mtd4
Could not open mtd device: /dev/mtd4
~ # mtd_debug info /dev/mtd4
mtd.type = MTD_NORFLASH
mtd.flags = MTD_ERASEABLE
mtd.size = 1048576 (1M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0

Thanks for helping
Mike,Lee


Mike Lee wrote:

>Hi all
>  i tried to flash_erase and other flash_* tools to my mtd device, the
>return value is permission denied, but i am already root login. I have
>selected MTD_CHAR and MTD_BLOCK in kernel.  Do i miss somethings?
>
>    My kernel version is 2.6.10, with cvs mtd patched.
>
>Mike,Lee
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  
>
