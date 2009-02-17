Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZP0p-0002Oh-8k
	for linux-mtd@lists.infradead.org; Tue, 17 Feb 2009 12:25:22 +0000
Subject: Re: UBI memory leak after creating and removing volumes
From: Artem Bityutskiy <dedekind@infradead.org>
To: John.Smith@pace.com
In-Reply-To: <F21E92E7B38A1F4D9211341290F7569807EED1AE@salexc1.pace.internal>
References: <F21E92E7B38A1F4D9211341290F7569807EED1AE@salexc1.pace.internal>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 17 Feb 2009 14:23:57 +0200
Message-Id: <1234873437.17790.265.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-17 at 12:01 +0000, John.Smith@pace.com wrote:
> Hello, 
> I am using a 2.6.18 Kernel, patched with MTD from Kernel 2.6.21, and
> UBI from the mainline kernel a few days later on 1 May 2007.  The
> whole is running on an embedded MIPS device.
> 
> I have NAND, and UBI, and gluebi, and jffs2.  I use jffs2, mounted on
> an mtdblock device. Broadly, it all works.
> 
> I am experiencing a memory leak revealed in recent stress tests.  The
> stress tests create and delete many UBI volumes, and are are broadly
> equivelent to the following:

Can you please enable /proc/slab_allocators - it tracks all allocators
and if we have a leak - it may point to the function which is guilty.

To have /proc/slab_allocators, do the following:

1. Enable SLAB, not SLUB. In kernel config menu got to
   "General setup  --->", then
   "Choose SLAB allocator (SLUB (Unqueued Allocator))  --->"
   and choose SLAB.

2. Go to the root menu, then go to
   "Kernel hacking  --->" and enable
   "[*]   Debug slab memory allocations" and
   "[*]     Memory leak debugging"

Recompile the kernel, and you will have a nice instrumentation to find
memory leak - the /proc/slab_allocators file. Please, play with this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
