Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFKh7-0003fQ-QF
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 21:51:06 +0000
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9ULnrH22025
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 10:49:53 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9ULnr222019
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 10:49:53 +1300
Received: from tait.co.nz ([172.25.107.17])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HNL00K8KBB348@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Fri, 31 Oct 2003 10:49:51 +1300 (NZDT)
Date: Fri, 31 Oct 2003 10:49:13 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
In-reply-to: <3FA07FFB.4020403@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3FA18759.2070901@tait.co.nz>
MIME-version: 1.0
References: <3FA07FFB.4020403@tait.co.nz>
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: Re: device major/minor attributes corrupt in jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robin Gilks wrote:
> Greetings
> 
> Just trying to put a root filesystem into jffs2 and whilst I can mount 
> the filesystem and copy my /dev directory into it and it looks OK, when 
> I reboot the major/minor numbers have been added together into the minor 
> and the major is always 0
> 
> Anyone any ideas?
> 
> target mpc8xx cross compiled from i386 with gcc-3.3.1
> kernel 2.4.22
> mtd snapshot of 22-10-03
> busybox 1.00-pre3 utils
> uclibc 0.9.20 library
> 

More info - just unmount and remount and the device file attributes are 
  buggered - I assume that the cache is OK but the data written to flash 
is not :-((

Also, it looks like the major/minor numbers not added - can't work out 
exactly what is going on !!

/home # ./MAKEDEV
/home # ls -l /mnt/dev/mtd*
crw-r--r--    1 root     root      90,   0 Jan  1 17:26 /mnt/dev/mtd0
crw-r--r--    1 root     root      90,   2 Jan  1 17:26 /mnt/dev/mtd1
crw-r--r--    1 root     root      90,   4 Jan  1 17:26 /mnt/dev/mtd2
crw-r--r--    1 root     root      90,   6 Jan  1 17:26 /mnt/dev/mtd3
crw-r--r--    1 root     root      90,   8 Jan  1 17:26 /mnt/dev/mtd4
crw-r--r--    1 root     root      90,  10 Jan  1 17:26 /mnt/dev/mtd5
crw-r--r--    1 root     root      90,  12 Jan  1 17:26 /mnt/dev/mtd6
crw-r--r--    1 root     root      90,  14 Jan  1 17:26 /mnt/dev/mtd7
/home # umount /mnt
/home # mount /mnt
/home # ls -l /mnt/dev/mtd*
crw-r--r--    1 root     root       0,  90 Jan  1 17:26 /mnt/dev/mtd0
crw-r--r--    1 root     root       0,  90 Jan  1 17:26 /mnt/dev/mtd1
crw-r--r--    1 root     root       0,  94 Jan  1 17:26 /mnt/dev/mtd2
crw-r--r--    1 root     root       0,  94 Jan  1 17:26 /mnt/dev/mtd3
crw-r--r--    1 root     root       0,  90 Jan  1 17:26 /mnt/dev/mtd4
crw-r--r--    1 root     root       0,  90 Jan  1 17:26 /mnt/dev/mtd5
crw-r--r--    1 root     root       0,  94 Jan  1 17:26 /mnt/dev/mtd6
crw-r--r--    1 root     root       0,  94 Jan  1 17:26 /mnt/dev/mtd7


-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
