Received: from f154.law9.hotmail.com ([64.4.9.154] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VXo7-0002Le-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 12:56:15 +0000
From: "=?gb2312?B?1twgyPE=?=" <san_blabla@hotmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: Why no kernel message on my DOC system?
Date: Tue, 29 Jan 2002 13:06:46 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <F154qBIgT3Cl54nw3hf000128c5@hotmail.com>
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

I am considering to use GRUB as my bootloader instead of LILO, but I didn't 
find out any detailed documentation about how to do this, can anyone give 
me some instructions or where can I find a document about this.

My DiskOnChip is DOC Mellennium MD-2810-D08.


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
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/


_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger：
http://messenger.microsoft.com/cn
