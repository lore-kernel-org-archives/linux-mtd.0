Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mb4F-0001T2-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 15:23:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NCBBIINEHIPFGJPLBEIFEEKGDLAA.acurtis@onz.com> 
References: <NCBBIINEHIPFGJPLBEIFEEKGDLAA.acurtis@onz.com> 
To: acurtis@onz.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: 64-bit support..what happened? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 04 Sep 2002 15:23:32 +0100
Message-ID: <31730.1031149412@redhat.com>
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

acurtis@onz.com said:
>  1. The conditional CONFIG_CFI_64 is defined within cfi.h. However not
> all the source modules that use this conditional include the proper
> header file. (all the source modules under drivers/mtd/maps)

You presumably only need to include it for the map drivers on those 
platforms which can actually support 64-bit operation. So that's not 
necessarily a problem.

> 2. drivers/mtd/maps/physmap.c - attempts to reference __raw_readll()
> and __raw_writell() when in 64-bit mode. These functions/macros do not
> exist. They would appear in include/asm/io.h. Nothing exists in the
> MTD tree to patch this file or otherwise provide these functions. 

Correct. Again, this is platform-specific and you need to provide it. Some 
people have to play tricks with transferring all 64 bits into a FP register 
and storing form there, etc. It's probably best to take the stuff in 
physmap.c as merely an example, and provide your own map driver.

--
dwmw2
