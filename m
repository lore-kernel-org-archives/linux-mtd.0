Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1757J9-0004k0-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 16:55:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020507155052.GA31070@buici.com> 
References: <20020507155052.GA31070@buici.com>  <20020507152652.GA30979@buici.com> <20020507022357.GC17041@buici.com> <20020505002518.GA3665@buici.com> <10076.1020715656@redhat.com> <25429.1020783875@redhat.com> <27957.1020785387@redhat.com> 
To: elf@buici.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Latest CVS and 2.2.x 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 May 2002 16:55:17 +0100
Message-ID: <30590.1020786917@redhat.com>
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

elf@buici.com said:
> 
>   The first problem was that the spinlock types were defined twice
>   incompatibly.  In compactmac.h, the inclusion of linux/spinlock.h at
>   line 362 pulls the file from /usr/include instead of the linux source
>   tree version.  Changing this include to asm/spinlock.h eliminated the
>   problem, though I'm not confident that this is the right way to fix
>   it.

That's very broken. Are you sure that include/linux/spinlock.h exists in 
your 2.2 kernel tree?

>   Then, the pci.c driver in mtd/maps failed to build, but for a reason I
>   couldn't deduce.  The compiler complains that the ioremap_noncache
>   symbol is missing. 

That's probably been introduced since 2.2. Add something like...

	#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0)
	#define ioremap_noncache ioremap
	#endif

... to compatmac.h and then if it works, send me the diff.



--
dwmw2
