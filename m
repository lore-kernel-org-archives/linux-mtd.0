Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142SI0-0008Ny-00
	for mtd-list@infradead.org; Sun, 03 Dec 2000 06:06:20 +0000
Received: from itidev1.wte.net ([206.98.206.71] helo=itidev1.cachier.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142SHz-0008Ns-00
	for mtd@infradead.org; Sun, 03 Dec 2000 06:06:19 +0000
From: Levi Khatskevitch <LKhatskevitch@cachier.com>
Reply-To: LKhatskevitch@cachier.com
To: Adam Agnew <agnew@glue.umd.edu>
Subject: Re: including doc2001 and docprobe into the kernel
Date: Sun, 3 Dec 2000 00:52:34 -0500
Content-Type: text/plain
References: <Pine.GSO.4.21.0012022229390.14865-100000@z.glue.umd.edu>
In-Reply-To: <Pine.GSO.4.21.0012022229390.14865-100000@z.glue.umd.edu>
Cc: mtd@infradead.org
MIME-Version: 1.0
Message-Id: <00120301032208.00983@itidev1>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Adam,

You can add inter_module_xxx support by applying
patches/inter-module-2.2.17.patch on 2.2.17 kernel source. But if you didn't
apply patches/mtd-patch-2.2.17-20001130 please do so *before* adding any mtd
code to kernel tree. If you do everything correctly you shouldn't need
inter-module-xxx-2.2.17.patch. And don't forget to drivers/mtd/*.[ch],
include/linux/jffs.h and include/linux/mtd/*.h with the fresh ones from mtd cvs
tree *after* you've applied mtd-patch-2.2.17-20001130.

- Levi

On Sat, 02 Dec 2000, Adam Agnew wrote:
> when I try to include the millenium code right into the kernel along with
> the ntfl layer, etc i get errors 
> drivers/mtd/mtdlink.o: In function `DoC_Probe':
> drivers/mtd/mtdlink.o(.text+0x26da): undefined reference to
> `inter_module_get_request'
> drivers/mtd/mtdlink.o(.text+0x26f9): undefined reference to
> `inter_module_put'
> drivers/mtd/mtdlink.o: In function `init_doc2001':
> drivers/mtd/mtdlink.o(.text.init+0x75): undefined reference to
> `inter_module_register'
> make: *** [vmlinux] Error 1
> 
> I included all the module support etc... any ideas? The error goes away
> when i compile the millenium driver as a module of course.
> - adam agnew
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
-- 
Levi Khatskevitch
CTO
Cachier, Corp
575 Grand St., Suite E306
New York, NY 10002


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
