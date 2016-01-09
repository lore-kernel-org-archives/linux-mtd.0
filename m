Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHizl-00073s-Km
 for linux-mtd@lists.infradead.org; Sat, 09 Jan 2016 02:11:10 +0000
Received: from localhost.localdomain ([127.0.0.1]:58364 "EHLO localhost"
 rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
 id S27010472AbcAICKob585N (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Sat, 9 Jan 2016 03:10:44 +0100
Date: Sat, 9 Jan 2016 02:10:44 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Brian Norris <computersforpeace@gmail.com>,
 Ralf Baechle <ralf@linux-mips.org>
cc: =?ISO-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Luis de Bethencourt <luisbg@osg.samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Cyril Bur <cyrilbur@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use devm_ioremap_nocache() instead
 of KSEG0ADDR()
In-Reply-To: <20160108185120.GQ109450@google.com>
Message-ID: <alpine.LFD.2.20.1601090058430.29879@eddie.linux-mips.org>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
 <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
 <20160107230513.GL109450@google.com>
 <CACna6rw6Q=zaSo91ZK26zgjQ+0j+7=b6C_fPYngaKhnw0OmWeQ@mail.gmail.com>
 <alpine.LFD.2.20.1601081358300.29879@eddie.linux-mips.org>
 <20160108185120.GQ109450@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 8 Jan 2016, Brian Norris wrote:

> > > > This removes some (implicit) MIPS dependencies and makes the code more
> > > > portable, whether we need it or not :)
> > > 
> > > So now we have following forwardtrace:
> > > devm_ioremap_nocache
> > > ioremap_nocache
> > > __ioremap_mode
> > > __ioremap
> > > CKSEG1ADDR
> 
> I just noticed that ioremap() and ioremap_nocache() are the same on
> MIPS. So I could just do devm_ioremap_resource() and save myself a few
> lines...

 My bad, I wrote from memory and didn't double check what the caching mode 
for plain `ioremap' is.  You need to use `ioremap_cache' for a cached 
mapping.  Unfortunately the MIPS port is missing this generic interface 
and defines `ioremap_cachable' instead.  I've just posted an obvious fix 
for this problem.

 Ralf, can you pick this fix for 4.5?  It qualifies as obvious I believe, 
similar to a recent `ioremap_uc' addition.

> > > It results in different address than KSEG0ADDR:
> > > [    1.339752] [bcm47xxsflash_bcma_probe] KSEG0ADDR(BCMA_SOC_FLASH2):9c000000
> > > [    1.346848] [bcm47xxsflash_bcma_probe] devm_ioremap_nocache:bc000000
> > > 
> > > But it still works as expected! :)
> > > [    1.609426] 6 bcm47xxpart partitions found on MTD device bcm47xxsflash
> > > [    1.616169] Creating 6 MTD partitions on "bcm47xxsflash":
> > 
> >  It is a functional change though and I think the change from a cached to 
> > uncached mapping (i.e. from `ioremap' to `ioremap_nocache') has to be a 
> > separate patch, so that both changes can be reviewed independently.
> 
> As I noted before sending my patch, I don't think this driver should
> have been using KSEG0 anyway; it should have been KSEG1, right? I can
> note that in the patch description, but I don't really see why it needs
> to be a separate patch.

 You did mention that, but didn't actually justify why an uncached mapping 
is required here.

 This code is in a function called `bcm47xxsflash_read' and reads from an 
MMIO region, presumably flash memory which behaves like ordinary memory on 
reads (i.e. no side effects).  Therefore using a cached mapping will in 
most cases result in much better performance as the CPU will load 
(prefetch) data in cacheline-sized quantities rather than hitting the 
external bus every time with a word-sized quantity transferred only.

 Switching to an uncached mapping would invalidate this optimisation and 
is independent from a build error fix.  Therefore it requires a separate 
patch and review.  Perhaps `memremap' should be used instead (possibly 
with the MEMREMAP_WT policy), but this is exactly why a separate review is 
required for that part.

  Maciej
