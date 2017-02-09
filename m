Received: from 10.mo53.mail-out.ovh.net ([87.98.189.210])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cblW8-0006dE-KN
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 09:59:58 +0000
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id 3B699384E2
 for <linux-mtd@lists.infradead.org>; Thu,  9 Feb 2017 10:59:33 +0100 (CET)
Subject: Re: [PATCH] mtd: aspeed: fix compile warning in
 aspeed_smc_read_from_ahb()
To: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
References: <1484817198-22477-1-git-send-email-clg@kaod.org>
 <20170208233728.GN94627@google.com>
 <19aa7cbb-8691-36d3-47a3-7a1029e66ecf@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <19bcab6c-baf6-d34c-67bb-a5e655241e5e@kaod.org>
Date: Thu, 9 Feb 2017 10:59:25 +0100
MIME-Version: 1.0
In-Reply-To: <19aa7cbb-8691-36d3-47a3-7a1029e66ecf@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/09/2017 10:05 AM, Marek Vasut wrote:
> On 02/09/2017 12:37 AM, Brian Norris wrote:
>> On Thu, Jan 19, 2017 at 10:13:18AM +0100, Cédric Le Goater wrote:
>>> The first argument of ioread32_rep() and ioread8_rep is not
>>> const. Change aspeed_smc_read_from_ahb() prototype to fix compile
>>> warning :
>>>
>>>    drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_read_from_ahb':
>>>    drivers/mtd/spi-nor/aspeed-smc.c:212:16: warning: passing argument 1 of 'ioread32_rep' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>>       ioread32_rep(src, buf, len >> 2);
>>
>> But why isn't that param constant? Seems like that's a bug in the
>> ioread* APIs. Some of their implementations are const, but some are not.
>>
>> I see for instance that the implementation in lib/iomap.c is not const,
>> where there's zero reason it shouldn't be (if we also fix, e.g., its
>> mmio_insl()).
> 
> Maybe it's worth fixing the ioread*_rep then ? Then again, that seems to
> be way far off the scope of this patch.

Looking closer at where this comes from, the compile warning was 
reported on x86 which pulls a different file for the definitions 
of the ioread routines.

On x86, arch/x86/include/asm/io.h includes <asm-generic/iomap.h>
which contains prototypes of the ioread routines without 'const'.

On ARM, arch/arm/include/asm/io.h includes <asm-generic/io.h>
which contains the 'const' definitions.


So may be, we should just drop that patch and fix iomap.h instead,
but quite a few arches use it :

arch/sh/include/asm/io.h:#include <asm-generic/iomap.h>
arch/mips/include/asm/io.h:#include <asm-generic/iomap.h>
arch/ia64/include/asm/io.h:#include <asm-generic/iomap.h>
arch/cris/include/asm/io.h:#include <asm-generic/iomap.h>
arch/x86/include/asm/io.h:#include <asm-generic/iomap.h>
arch/alpha/include/asm/io.h:#include <asm-generic/iomap.h>
arch/powerpc/include/asm/io.h:#include <asm-generic/iomap.h>
arch/m68k/include/asm/io_mm.h:#include <asm-generic/iomap.h>
arch/m68k/include/asm/io_no.h:#include <asm-generic/iomap.h>
arch/parisc/include/asm/io.h:#include <asm-generic/iomap.h>
include/asm-generic/io.h:#include <asm-generic/iomap.h>

Thanks,

C.
