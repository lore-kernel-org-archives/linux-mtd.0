Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu3CA-0002ZL-5p
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 18:54:07 +0000
Received: by pabfh17 with SMTP id fh17so60575088pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 10:53:45 -0800 (PST)
Date: Wed, 4 Nov 2015 10:53:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Cyril Bur <cyrilbur@gmail.com>
Subject: Re: [PATCH] mtd: Make MTD_BCM47XXSFLASH to depend on MIPS
Message-ID: <20151104185341.GN7274@google.com>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 04, 2015 at 10:04:26AM +0100, Rafał Miłecki wrote:
> On 14 October 2015 at 11:04, Javier Martinez Canillas
> <javier@osg.samsung.com> wrote:
> > The bcm47xxsflash driver uses the KSEG0ADDR() function to map an address
> > to a certain kernel segment. But that is only defined if the MIPS config
> > symbol is enabled. The driver does not have an explicit dependency on it
> > and relies on a transitive dependency relation:
> >
> > MTD_BCM47XXSFLASH -> BCMA_SFLASH -> BCMA_DRIVER_MIPS -> BCMA && MIPS
> >
> > But BCMA_SFLASH and BCMA_DRIVER_MIPS have only runtime and not buildtime
> > dependency with MIPS so can be changed to be built test using the config
> > COMPILE_TEST symbol. But that would make MTD_BCM47XXSFLASH be built with
> > MIPS not enabled and cause the following build error:
> >
> > drivers/mtd/devices//bcm47xxsflash.c: In function 'bcm47xxsflash_read':
> > drivers/mtd/devices//bcm47xxsflash.c:112:2: error: implicit declaration of function 'KSEG0ADDR' [-Werror=implicit-function-declaration]
> >   memcpy_fromio(buf, (void __iomem *)KSEG0ADDR(b47s->window + from),
> 
> I think we're not really supposed to use KSEG0ADDR anyway. What about
> replacing it with ioremap_nocache?

I'm not really a MIPS expert, but isn't KSEG0 actually *cached*? (And is
that correct, then?)

AIUI, ioremap_nocache() will actually get you a KSEG1 address here, I
think.

Also (a bit of a tangent) couldn't "window" be better passed as a second
resource by drivers/bcma/driver_chipcommon_sflash.c? Seems like that
would fit the device/resource model better, and then you wouldn't have
to do any __iomem casts in bcm47xxsflash.c.

Brian
