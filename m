Received: from mail-ig0-x242.google.com ([2607:f8b0:4001:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zttzr-0003AW-Gu
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 09:04:48 +0000
Received: by igcg4 with SMTP id g4so4472337igc.3
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 01:04:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
Date: Wed, 4 Nov 2015 10:04:26 +0100
Message-ID: <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Make MTD_BCM47XXSFLASH to depend on MIPS
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 October 2015 at 11:04, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> The bcm47xxsflash driver uses the KSEG0ADDR() function to map an address
> to a certain kernel segment. But that is only defined if the MIPS config
> symbol is enabled. The driver does not have an explicit dependency on it
> and relies on a transitive dependency relation:
>
> MTD_BCM47XXSFLASH -> BCMA_SFLASH -> BCMA_DRIVER_MIPS -> BCMA && MIPS
>
> But BCMA_SFLASH and BCMA_DRIVER_MIPS have only runtime and not buildtime
> dependency with MIPS so can be changed to be built test using the config
> COMPILE_TEST symbol. But that would make MTD_BCM47XXSFLASH be built with
> MIPS not enabled and cause the following build error:
>
> drivers/mtd/devices//bcm47xxsflash.c: In function 'bcm47xxsflash_read':
> drivers/mtd/devices//bcm47xxsflash.c:112:2: error: implicit declaration of function 'KSEG0ADDR' [-Werror=implicit-function-declaration]
>   memcpy_fromio(buf, (void __iomem *)KSEG0ADDR(b47s->window + from),

I think we're not really supposed to use KSEG0ADDR anyway. What about
replacing it with ioremap_nocache?

Sorry for the late reply.
