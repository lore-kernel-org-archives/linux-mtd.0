Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VLIt-00016x-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 23:35:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F501VThKL3XUK99tGKp000144c0@hotmail.com> 
References: <F501VThKL3XUK99tGKp000144c0@hotmail.com> 
To: "=?gb2312?B?1twgyPE=?=" <san_blabla@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Why no kernel message on my DOC system? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 Jan 2002 23:46:14 +0000
Message-ID: <30435.1012261574@redhat.com>
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

san_blabla@hotmail.com said:
>  Because in /dev/nftla1 there is only kernel image and initrd on it,
> so I  have not tested to use 'root=/dev/nftla1' on my harddisk. But I
> do test to  use lilo-mtd on my harddisk and boot from it, the kernel
> messages came out  and the /proc/cmdline is:  auto
> BOOT_IMAGE=blabla-doc rw root=100 console=tty0 console=ttyS0,9600n8 On
> the contrary, if boot from DiskOnChip, the /proc/cmdline is
> unrecognizable strings. 

It's a LILO problem. Why are you installing LILO to /dev/ram0 instead of 
/dev/nftla? Won't that make it look in the wrong place for stuff?

--
dwmw2
