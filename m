Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15I6d4-0004ap-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jul 2001 11:45:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010705124320.A469@cemil.debian-linux.de> 
References: <20010705124320.A469@cemil.debian-linux.de> 
To: Cemil Degirmenci <cemil@cemil.debian-linux.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with GNU/grub bootloader 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 05 Jul 2001 11:50:24 +0100
Message-ID: <26434.994330224@redhat.com>
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

(Redirected to the correct list)

cemil@cemil.debian-linux.de said:
> Hello, I have some problems with the Grub Bootloader.
> root@manuel:/home/cemil/mtd-20000704/grub > ../util/doc_loadbios /dev/fla grub_firmware 
> ioctl(MEMGETINFO): Invalid argument
> root@manuel:/home/cemil/mtd-20000704/grub > 

> I had downloaded grub rom FSF cvs-server.

> How can i fix it? 

Looks like you're using the M-Systems drivers, not the real ones. To load 
Grub onto the device, you need to be able to write to the flash directly, 
which you can't do with those drivers.

You need to either boot a kernel with the proper drivers in, or convert 
your Grub image into the format that M-Systems use for their own firmware 
files.

--
dwmw2
