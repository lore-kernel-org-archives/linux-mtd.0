Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12YUvf-0007q5-00
	for mtd-list@infradead.org; Fri, 24 Mar 2000 14:19:11 +0000
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12YUve-0007pz-00
	for mtd@infradead.org; Fri, 24 Mar 2000 14:19:10 +0000
Message-ID: <38DB79C1.7115DD91@zentropix.com>
Date: Fri, 24 Mar 2000 14:20:49 +0000
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: jyllyj <jyllyj@buaa.edu.cn>
CC: MTD <mtd@infradead.org>
Subject: Re: can't open /dev/nftla1 (kernel 2.2.14)
References: <004701bf958c$4bedd0e0$5800a8c0@pita>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

jyllyj wrote:
> 
> hello friend,
>     I compile MTD into kernel 2.2.14.at begin .i can deal with /dev/nftla
> (fdisk mount...).
> but when i copy some file into it
> like it
> mount -t ext2 /dev/nftla1 /mnt
> cp somefile /mnt
> umount /mnt
> reboot
> now i can't fdisk /dev/nftla1 .it show me that can't open /dev/nftla1
> why?
> 
> regards.
>     jiang yue long
This could be due to a faulty DiskOnChip device, have you got a new one
to try?
What is the exact error message?
Try rebooting after fdisk before you mke2fs, mount, cp...

Sorry I can't be more helpful

Cheers

Trevor
-- 
Trevor Woolven - Director of Customer Applications Engineering
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
