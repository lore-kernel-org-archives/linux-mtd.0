Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17I6bR-0000qb-00
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2002 12:47:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020611110129.25556.qmail@linuxmail.org> 
References: <20020611110129.25556.qmail@linuxmail.org> 
To: "xyz xyz" <watsup@linuxmail.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: linux on a DOC-2000 without a RAMDISK(HDD kind of install) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 Jun 2002 12:47:36 +0100
Message-ID: <30829.1023882456@redhat.com>
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

watsup@linuxmail.org said:
> is it possible to use mtd drivers to boot from a DOC 2000 chip without
> a RAMDISK based linux install,i mean a HDD type of install which reads
> from a DOC like a HDD?

The MTD drivers are part of Linux, and you can't use them until Linux has 
booted. So they can't be used for booting Linux. But they can be used to 
allow Linux to use a DiskOnChip for its root file system without having to 
use a ramdisk, yes.

For booting, there's a version of Grub which can drive the DiskOnChip
directly and replace its built-in firmware, or you could use LILO, which 
should work fine, using the INT 13h disk BIOS services which are provided
by the default firmware.

> i want to put my own small distribution which
> works on a HDD, is it necessary to go 4 a RAMDISK based distribution?
> if its possible(a HDD type of install),how should i go abt it? 

Build the DiskOnChip drivers into your kernel, install a boot loader. Boot.

--
dwmw2
