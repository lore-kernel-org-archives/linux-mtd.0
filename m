Received: from web9906.mail.yahoo.com ([216.136.129.249])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6d0t-0008EF-Ub
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 22:35:32 +0100
Message-ID: <20031006213435.38037.qmail@web9906.mail.yahoo.com>
Date: Mon, 6 Oct 2003 14:34:35 -0700 (PDT)
From: Slim <slimaffi@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E1A6b7A-0004WA-Gx@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Did you copy the kernel image (like bzImage) to your doc and
configure
> the grub settings on your doc correctly?

I copied the entire /boot to the doc.
 
> I put my bzImage in /boot and in grub/menu.lst I have the following:
> 
> title DiskOnChip 2000
> 	root (dc0,0)
> 	kernel /boot/bzImage ro root=/dev/nftla1

This is the part I wasn't sure about.

> When you can boot from doc using grub, that's a good start. You may
> actually edit the boot command line when grub is booted. It supports
> auto-completion for you to easily locate your kernel image.

I've tried now to boot the hard disk based kernel to allow editing to
try
the above, but the doc-grub always loads despite changing the boot
device
in the bios setup.  Now I can't boot from the hard drive unless I
disable
all access to the doc.  Any workaround?

Thanks,
John



__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com
