Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1amyeW-0002EZ-Tb
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 07:10:25 +0000
Received: by mail-pf0-x22a.google.com with SMTP id 184so38261328pff.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2016 00:10:02 -0700 (PDT)
Date: Mon, 4 Apr 2016 00:09:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, "Maciej W. Rozycki" <macro@linux-mips.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Cyril Bur <cyrilbur@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH V2] mtd: bcm47xxsflash: use ioremap_cache() instead of
 KSEG0ADDR()
Message-ID: <20160404070958.GF13995@localhost>
References: <1452991370-20121-1-git-send-email-zajec5@gmail.com>
 <1456483828-5583-1-git-send-email-zajec5@gmail.com>
 <20160305005459.GH55664@google.com>
 <CAKv+Gu8UAugShB0jR_D_2kqwbPsG6KTSaha9auUTC_QgfCry3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv+Gu8UAugShB0jR_D_2kqwbPsG6KTSaha9auUTC_QgfCry3Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 18, 2016 at 12:22:05PM +0100, Ard Biesheuvel wrote:
> On 5 March 2016 at 01:54, Brian Norris <computersforpeace@gmail.com> wrote:
> > + others
> >
> > On Fri, Feb 26, 2016 at 11:50:28AM +0100, Rafał Miłecki wrote:
> >> From: Brian Norris <computersforpeace@gmail.com>
> >>
> >> Using KSEG0ADDR makes code highly MIPS dependent and not portable.
> >> Thanks to the fix a68f376 ("MIPS: io.h: Define `ioremap_cache'") we can
> >> use ioremap_cache which is generic and supported on MIPS as well now.
> >>
> >> KSEG0ADDR was translating 0x1c000000 into 0x9c000000. With ioremap_cache
> >> we use MIPS's __ioremap (and then remap_area_pages). This results in
> >> different address (e.g. 0xc0080000) but it still should be cached as
> >> expected and it was successfully tested with BCM47186B0.
> >>
> >> Other than that drivers/bcma/driver_chipcommon_sflash.c nicely setups a
> >> struct resource for access window, but we wren't using it. Use it now
> >> and drop duplicated info.
> >>
> >> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> >> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> >> ---
> >> V2:
> >> 1) Use ioremap_cache as we already have commit a68f376 in l2-mtd
> >> 2) Add iounmap to the error path
> >> 3) Update commit message
> >
> > Hmm, I'm a bit out of the loop on some things here, but it looks like
> > ioremap_cache() is going away. See kernel/memremap.c:
> >
> > /* temporary while we convert existing ioremap_cache users to memremap */
> > __weak void __iomem *ioremap_cache(resource_size_t offset, unsigned long size)
> >
> > Are we supposed to move to using memremap() here? (If so,
> > devm_memremap() can help us.)
> >
> 
> I don't think that ioremap_cache() necessarily has to go away, but
> what we do need to address is its abuse to map things like firmware
> tables that reside in normal memory that may not be owned/tracked by
> the kernel. So for that case, we now have memremap() which should just
> give you a mapping of the requested region, either via the linear
> mapping if it happens to be mapped already, or via the vmalloc region
> if it is highmem or otherwise unavailable directly.
> 
> However, memory mapped NOR flash remains a special case, since the
> __iomem annotation may or may not be appropriate depending on context
> (i.e., reads and writes may both have either memory or strongly
> ordered semantics)

OK, pushed to l2-mtd.git.
