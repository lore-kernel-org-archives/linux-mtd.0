Received: from f50.law9.hotmail.com ([64.4.9.50] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16UgKm-0005Eo-00
	for <linux-mtd@lists.infradead.org>; Sun, 27 Jan 2002 03:50:24 +0000
From: "=?gb2312?B?1twgyPE=?=" <san_blabla@hotmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: Why no kernel message on my DOC system?
Date: Sun, 27 Jan 2002 04:00:58 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <F501VThKL3XUK99tGKp000144c0@hotmail.com>
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

Because in /dev/nftla1 there is only kernel image and initrd on it, so I 
have not tested to use 'root=/dev/nftla1' on my harddisk. But I do test to 
use lilo-mtd on my harddisk and boot from it, the kernel messages came out 
and the /proc/cmdline is: 
auto BOOT_IMAGE=blabla-doc rw root=100 console=tty0 console=ttyS0,9600n8
On the contrary, if boot from DiskOnChip, the /proc/cmdline is 
unrecognizable strings.

>From: David Woodhouse <dwmw2@infradead.org>
>To: "周 锐" <san_blabla@hotmail.com>
>CC: linux-mtd@lists.infradead.org
>Subject: Re: Why no kernel message on my DOC system?
>Date: Sat, 26 Jan 2002 10:45:04 +0000
>
>
>san_blabla@hotmail.com said:
> > I've build up an X86 Linux system using MTD DiskOnChip driver, using
> > serial  port as my console. The Linux system can boot form DOC and I
> > can also login  into the system, the problem is that I can't see any
> > kernel printk  messages. But if I put the same kernel on my harddisk
> > and boot up using  harddisk, I can see all kernel messages, still
> > using serial port as my  console. my lilo.conf for DOC is:
>
>I suspect it's a LILO problem - when you log in after it's booted from the
>DiskOnChip, what are the contents of /proc/cmdline?
>
>
> > I don't know why it output "invalidate: busy buffer", but as I said
> > before,  the DOC can boot up and I can even login.
>
>LILO is asking the kernel to invalidate a buffer of the ramdisk. But on a
>ramdisk, the buffer is the _only_ copy of the data, so it's marked busy 
and
>cannot be invalidated. I think this is harmless.
>
>
> > My lilo.conf for my harddisk is :
>
> > The command to put lilo on harddisk is simple: #lilo and the output is
> > normal.
>
>If you boot using LILO on the hard disk, but with 'root=/dev/nftla', do
>you see the console messages then?
>
>
>--
>dwmw2
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/


_________________________________________________________________
享用世界上最大的 Web 电子邮件系统 —— MSN Hotmail。
http://www.hotmail.com/cn
