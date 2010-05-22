Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFmLe-0001GW-2J
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 10:54:30 +0000
Received: by fg-out-1718.google.com with SMTP id l26so1155846fgb.0
	for <linux-mtd@lists.infradead.org>;
	Sat, 22 May 2010 03:54:29 -0700 (PDT)
Subject: Re: [PATCH 3/3] MTD: Kconfig cleanups
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1274515603.19696.1.camel@maxim-laptop>
References: <1274490185.15285.22.camel@maxim-laptop>
	<1274490476-16057-3-git-send-email-maximlevitsky@gmail.com>
	<1274514430.11551.13808.camel@macbook.infradead.org>
	<1274515096.19375.2.camel@maxim-laptop>
	<1274515603.19696.1.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 22 May 2010 13:54:21 +0300
Message-ID: <1274525661.20615.2.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-05-22 at 11:06 +0300, Maxim Levitsky wrote: 
> On Sat, 2010-05-22 at 10:58 +0300, Maxim Levitsky wrote: 
> > On Sat, 2010-05-22 at 08:47 +0100, David Woodhouse wrote: 
> > > On Sat, 2010-05-22 at 04:07 +0300, Maxim Levitsky wrote:
> > > > 
> > > > @@ -129,6 +131,7 @@ config MTD_NAND_RICOH
> > > >         default n
> > > >         depends on PCI
> > > >         select MTD_SM_COMMON
> > > > +       select MTD_NAND_ECC_SMC 
> > > 
> > > I thought we had a better solution than this -- weren't we going to make
> > > it a runtime thing? And default to the 'correct' order?
> > > 
> > > Then, only the legacy devices which need to retain the 'wrong' byteorder
> > > for compatibility reasons will need to do it.
> > > 
> > Sure, but I'll need to do several changes to drivers that I can't test.
> > For now this ensures correctness, then I fix all of this.
> In other words, when I get a bit more free time I promise I fix this and
> other problems. For now this ensures correctness at least of this thing.
Thinking again about this, this doesn't help much ether, so lets keep it
as is, except that 'if MTD_NAND' should be moved higher.


Best regards,
Maxim Levitsky
