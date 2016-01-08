Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHc8V-0007TW-6l
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 18:51:43 +0000
Received: by mail-pa0-x243.google.com with SMTP id yy13so21852237pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 08 Jan 2016 10:51:22 -0800 (PST)
Date: Fri, 8 Jan 2016 10:51:20 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
Message-ID: <20160108185120.GQ109450@google.com>
References: <1444813494-14985-1-git-send-email-javier@osg.samsung.com>
 <CACna6rwjMfTT4UgbyO=VmLaPic4xGcPxoMEL5yRmLW7hhvhXJQ@mail.gmail.com>
 <20151104185341.GN7274@google.com>
 <alpine.LFD.2.20.1601072006170.29879@eddie.linux-mips.org>
 <20160107230513.GL109450@google.com>
 <CACna6rw6Q=zaSo91ZK26zgjQ+0j+7=b6C_fPYngaKhnw0OmWeQ@mail.gmail.com>
 <alpine.LFD.2.20.1601081358300.29879@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.2.20.1601081358300.29879@eddie.linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 08, 2016 at 02:01:00PM +0000, Maciej W. Rozycki wrote:
> On Fri, 8 Jan 2016, Rafał Miłecki wrote:
> 
> > > This removes some (implicit) MIPS dependencies and makes the code more
> > > portable, whether we need it or not :)
> > 
> > So now we have following forwardtrace:
> > devm_ioremap_nocache
> > ioremap_nocache
> > __ioremap_mode
> > __ioremap
> > CKSEG1ADDR

I just noticed that ioremap() and ioremap_nocache() are the same on
MIPS. So I could just do devm_ioremap_resource() and save myself a few
lines...

> > It results in different address than KSEG0ADDR:
> > [    1.339752] [bcm47xxsflash_bcma_probe] KSEG0ADDR(BCMA_SOC_FLASH2):9c000000
> > [    1.346848] [bcm47xxsflash_bcma_probe] devm_ioremap_nocache:bc000000
> > 
> > But it still works as expected! :)
> > [    1.609426] 6 bcm47xxpart partitions found on MTD device bcm47xxsflash
> > [    1.616169] Creating 6 MTD partitions on "bcm47xxsflash":
> 
>  It is a functional change though and I think the change from a cached to 
> uncached mapping (i.e. from `ioremap' to `ioremap_nocache') has to be a 
> separate patch, so that both changes can be reviewed independently.

As I noted before sending my patch, I don't think this driver should
have been using KSEG0 anyway; it should have been KSEG1, right? I can
note that in the patch description, but I don't really see why it needs
to be a separate patch.

Brian
