Received: from f143.law9.hotmail.com ([64.4.9.143] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VVbn-0001tH-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 10:35:23 +0000
From: "=?gb2312?B?1twgyPE=?=" <san_blabla@hotmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: Why no kernel message on my DOC system?
Date: Tue, 29 Jan 2002 10:45:57 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <F143OYspJXTrtApTai500012772@hotmail.com>
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

Because I want to use an initrd as my root device so that I can put more 
things in the fiel system. Below is my lilo.conf:

boot=/dev/nftla 
map=/boot/map 
install=/boot/boot.b-mtd 
default=doc-full 
serial=0,9600n8 
image=/boot/bzImage-2.4.17 
       label=doc 
       root=/dev/ram0 
       read-write 
       initrd=/boot/initrd.img.gz 
       append="console=ttyS0,9600n8" 
image=/boot/bzImage-2.4.17-full 
       label=doc-full 
       root=/dev/ram0 
       read-write 
       initrd=/boot/initrd.img.gz 
       append="console=ttyS0,9600n8"

So I think I am installing LILO on /dev/nftla, only use /dev/ram0 to mount 
my root file system.


>From: David Woodhouse <dwmw2@infradead.org>
>To: "周 锐" <san_blabla@hotmail.com>
>CC: linux-mtd@lists.infradead.org
>Subject: Re: Why no kernel message on my DOC system?
>Date: Mon, 28 Jan 2002 23:46:14 +0000
>
>
>san_blabla@hotmail.com said:
> >  Because in /dev/nftla1 there is only kernel image and initrd on it,
> > so I  have not tested to use 'root=/dev/nftla1' on my harddisk. But I
> > do test to  use lilo-mtd on my harddisk and boot from it, the kernel
> > messages came out  and the /proc/cmdline is:  auto
> > BOOT_IMAGE=blabla-doc rw root=100 console=tty0 console=ttyS0,9600n8 On
> > the contrary, if boot from DiskOnChip, the /proc/cmdline is
> > unrecognizable strings.
>
>It's a LILO problem. Why are you installing LILO to /dev/ram0 instead of
>/dev/nftla? Won't that make it look in the wrong place for stuff?
>
>--
>dwmw2
>
>


_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger：
http://messenger.microsoft.com/cn
