Received: from cmsout03.mbox.net ([165.212.64.33])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0ilb-0001ei-J4
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 11:35:55 -0400
Message-ID: <045201c48c4b$8407dc40$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc>
Date: Fri, 27 Aug 2004 10:35:42 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> drivers/mtd/mtdlink.o: In function `cfi_intelext_partition_fixup':
> drivers/mtd/mtdlink.o(.text+0x76c6): undefined reference to `__ffs'
> make: *** [vmlinux] Error 1
> 

Hmmm,

Looks like _ffs is defined in :

[root@Smog include]# grep -l -r "__ffs" *
asm-ia64/topology.h
asm-ia64/bitops.h
asm-ppc64/bitops.h

but in asm-i386/bitops.h it is defined as ffs()

So, should there be a macro rule for ffs->__ffs for compiling for i386?

-Brian
