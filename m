Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Hii6-0006fj-00
	for mtd-list@infradead.org; Thu, 27 Jul 2000 09:08:06 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13Hii3-0006fd-00
	for mtd@infradead.org; Thu, 27 Jul 2000 09:08:04 +0100
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Thu, 27 Jul 2000 11:03:50 +0300 (IDT)
To: MTD <mtd@infradead.org>
Subject: Re: Request: examples of using LILO or GRUB to boot from DOC
In-Reply-To: <397F46EF.417AD6CE@linuxaustria.at>
References: <397F3B15.D420B9AF@zls.de>
	<397F46EF.417AD6CE@linuxaustria.at>
Message-ID: <14719.60525.114219.745805@jodie.lucid>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Karl Pitrich writes ("Re: Request: examples of using LILO or GRUB to boot from DOC"):

> - Generate /root/lilo-doc.conf similar to the following:
> 
> 	boot=/dev/fla
> 	vga = normal  
> 	read-only
> 	prompt
> 	timeout=50
> 	image = /mnt/doc/boot/kernel
> 	root = /dev/fla1
> 	label = linux

You might also want to add a boot = /mnt/doc/boot/boot, and map =
/mnt/doc/boot/map instead of passing them in the command line.

One important thing to remember is that you MUST pass these parameters 
from the mounted flash, and not from copies in your hard disk,
otherwise LILO won't work.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
