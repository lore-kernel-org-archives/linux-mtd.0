Received: from dialup.rama.com.au ([202.0.186.166] helo=gateway.perth.rama.com.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15a6U8-0002GM-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 03:14:14 +0100
Received: from willhart-tech.com (IDENT:alex@[192.156.249.82])
	by gateway.perth.rama.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA16469
	for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2001 11:47:35 +0800
Message-ID: <3B85B8C1.66A0EEEC@willhart-tech.com>
Date: Fri, 24 Aug 2001 10:15:29 +0800
From: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>
MIME-Version: 1.0
To: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: Re: BLKRRPART bug in NFTL?
References: <E15ZVks-00081M-00@pentafluge.infradead.org> <1776086221.20010823164242@mail.ru>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm not sure about that, but I think DOC should be formated/partitioned
with nftl_format, not *fdisk.

Best Regards,
Alex.

ASA wrote:
> 
> Hello all,
> 
> tried anybody to use *fdisk on DiskOnChip2000 from ramdisk
> and got expected results?
> 
> I'm automating linux installation, so such thing is needed...
> 
> My system consists of:
> hardware:
>   special embedded motherboard with AMD 486DX4-100
>   8 MB RAM
>   DiskOnChip 2000 (8 MB flash)
> software:
>   linux kernel 2.4.1 with MTD 20010730 snapshot
>   root filesystem on /dev/ram0 (loaded via cmdline: initrd=inird.gz root=/dev/ram0)
> 
> All is based on debian potato (2.2; glibc 2.1; some utils, including
>   sfdisk, are upgraded in order to proper work with 2.4 kernel)
> 
> Symptoms are:
> after executing
> 
>   #deleting any partition for sanity
>   dd if=/dev/zero of=/dev/nftla bs=512 count=1
>   # BLKRRPART ioctl (reread partition information)
>   sfdisk -R /dev/nftla
> 
>   # making 5 and 3 megs partitions on 8 MiB DOC
>   echo ",5000,L,*;,,L;;" | sfdisk -f /dev/nftla
> 
>   # make sure partition information is reread
>   sfdisk -R /dev/nftla
> 
> the root filesystem (ramdisk) is screwed up!
> 
> again, after clean reboot only invoking
> BLKRRPART ioctl is enough to break ramdisk
> 
> in the same configuration, operating with hard disks instead of DOC
> is absolutely .
> 
> Also, to reproduce this bug in other environment (only the kernel is
> the same) I tried to put my kernel (2.4.1+MTD-20010730) on the debian
> installation diskette and after using cfdisk ramdisk was screwed again...
> 
> --
> Best regards,
>  ASA                            mailto:atris@mail.ru
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
