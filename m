Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15KSOL-0008Ei-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2001 23:23:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4CA966.D9B15BF8@ridgerun.com> 
References: <3B4CA966.D9B15BF8@ridgerun.com>  <3B49B4B2.87F7E8A5@ridgerun.com> <18484.994842717@redhat.com> 
To: Steve Kranz <skranz@ridgerun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD/mtdblock.c uclinux 2.0.38? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 11 Jul 2001 23:28:45 +0100
Message-ID: <8610.994890525@redhat.com>
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

skranz@ridgerun.com said:
> MTD depends on these headers which don't exist within the uclinux
> tree.

Touch them. We can sort out the missing stuff later. You might want slab.h 
to include malloc.h instead of just being empty.


> include/linux/mtd/map.h line 65, generates error: "field `list' has
> incomplete type"

Copy include/linux/list.h from a later kernel.


skranz@ridgerun.com said:
> statements __MOD_INC_USE_COUNT() and __MOD_DEC_USE_COUNT() found in
> various locations with the MTD tree generate these compile errors:
> "structure has no member named `uc'" "structure has no member named
> `flags'" 

Fix the definitions in include/linux/mtd/compatmac.h to match the kernel 
you're using.


--
dwmw2
