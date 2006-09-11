Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GMipP-0007jL-3e
	for linux-mtd@lists.infradead.org; Mon, 11 Sep 2006 11:15:48 +0100
Message-ID: <45053680.1060206@kernelconcepts.de>
Date: Mon, 11 Sep 2006 12:12:16 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: Felix Joussein <felix@joussein.com>
Subject: Re: howto jffs2 + mtd
References: <450534E0.2000405@joussein.com>
In-Reply-To: <450534E0.2000405@joussein.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Felix Joussein schrieb:
> Hello list,
> 
> I would like to create a jffs2 filesystem on to an ordinary fresh- out 
> of the box 512 Kingston Datatraveller USB Stick.
> As I later want to boot from it, I performed the following steps:
> 
> fdisk /dev/sda
> create 2 partitions
> sda1, sda2
> 
> syslinux /dev/sda1
> mount /dev/sda1 /mnt
> cp $allYouNeedToBoot /dev/sda1
> umount /mnt
> 
> Here now the mtd part:
> modprobe block2mtd
> echo "/dev/sda2" > /sys/module/block2mtd/parameters/block2mtd
> cat /proc/mtd
> mtd0: 0f480000 00001000 "block2mtd: /dev/sda2"
> 
> now I read in the internet 2 different commands:
> either flash_eraseall -j /dev/mtd0
> or flash_erase /dev/mtd0 0 00001000

You do not need that on the mtdblock device. This is only useful on real
flash devices, i.e. physicall mapped flash devices, not USB sticks or CF
cards.

[...]
> I would be very thankfull, if anybody could help me with this.

> Thanks,
> Felix Joussein
Cheers
  nils

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--
