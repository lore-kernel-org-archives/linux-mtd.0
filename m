Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNTl7-0004J5-Gu
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2016 23:07:50 +0000
Date: Sun, 24 Jan 2016 23:07:54 +0000
From: "Maciej W. Rozycki" <macro@imgtec.com>
To: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
CC: Brian Norris <computersforpeace@gmail.com>, Ralf Baechle
 <ralf@linux-mips.org>, Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fengguang Wu
 <fengguang.wu@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Luis de
 Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>, Neelesh
 Gupta <neelegup@linux.vnet.ibm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>, Cyril
 Bur <cyrilbur@gmail.com>, "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use devm_ioremap_nocache() instead
 of KSEG0ADDR()
In-Reply-To: <CACna6rx26JEWSvckzzNdZ=XVySW9R6jbH-mkbc2JPxTrwJZWzg@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1601242226010.5958@tp.orcam.me.uk>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
 <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
 <20160107230513.GL109450@google.com>
 <CACna6rw6Q=zaSo91ZK26zgjQ+0j+7=b6C_fPYngaKhnw0OmWeQ@mail.gmail.com>
 <alpine.LFD.2.20.1601081358300.29879@eddie.linux-mips.org>
 <20160108185120.GQ109450@google.com>
 <alpine.LFD.2.20.1601090058430.29879@eddie.linux-mips.org>
 <CACna6rwAfXQxX8o0+DxroB6vOGZax70VVdPOAjeoGGUsDjdNhA@mail.gmail.com>
 <20160123214918.GC24744@localhost>
 <alpine.DEB.2.00.1601242020330.5958@tp.orcam.me.uk>
 <CACna6rx26JEWSvckzzNdZ=XVySW9R6jbH-mkbc2JPxTrwJZWzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 24 Jan 2016, Rafa³ Mi³ecki wrote:

> On 24 January 2016 at 21:26, Maciej W. Rozycki <macro@imgtec.com> wrote:
> > On Sat, 23 Jan 2016, Brian Norris wrote:
> >
> >> IIUC, this could be solved by:
> >> (a) using an uncached mapping or
> >> (b) explicitly invalidating the relevant region after doing flash writes
> >> or erasures
> >
> >  Flash writes are usually much, much less frequent than reads, so
> > optimising for reads is IMO the right direction.  So a cached mapping is a
> > good choice, however invalidation must then be done after a write.
> 
> Can you give me some hint where to look at for cache invalidation?

 There is `flush_data_cache_page' only it would seem, which is also 
supported by the MIPS platform only.  It makes unnecessary writebacks 
before invalidation, however these aren't really supposed to happen as no 
cache line involved is expected to be dirty.

 Implementing `invalidate_data_cache_page', which would avoid these 
unnecessary writebacks, should be straightforward as hardware provides the 
necessary operations and actually the MIPS port has suitable low-level 
helpers already implemented, for use by `dma_cache_inv'.  So that would 
merely be a semi-mechanical copy, paste, rename operation applied to our 
source.

 The bigger problem is the lack of portability of this interface to other 
platforms, although I suspect some hardware may simply fail to provide 
required operations.  For example x86 only defines the sledgehammer 
INVD/WBINVD instructions, which operate on the whole cache hierarchy at 
once rather than on a line-by-line and cache level/part basis.

  Maciej
