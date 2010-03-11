Received: from mail-fx0-f217.google.com ([209.85.220.217])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NppTj-00050h-1I
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2010 20:59:39 +0000
Received: by fxm9 with SMTP id 9so586098fxm.4
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Mar 2010 12:59:32 -0800 (PST)
Subject: Re: [PATCH -next] mtd/nand/r852: fix build for CONFIG_PCI disabled
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <4B992408.7040608@oracle.com>
References: <20100301210210.c6f465e6.sfr@canb.auug.org.au>
	<4B8C378B.2090400@oracle.com> <1267531329.10734.1.camel@maxim-laptop>
	<4B991A6F.1080006@oracle.com> <4B991B9B.8070809@oracle.com>
	<4B992408.7040608@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Mar 2010 22:59:29 +0200
Message-ID: <1268341169.9708.6.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	LKML <linux-kernel@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-03-11 at 09:10 -0800, Randy Dunlap wrote:
> > 
> > Sorry, it's there, but there are still build errors.
> > I will look at those...
> > 
> 
> 
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> r852 fails to build when CONFIG_PCI is not enabled since it uses
> pci_*() calls and is a PCI driver, so it should depend on PCI
> to prevent build errors.
> It should also #include <linux/pci.h>.


Folks, sorry for Kconfig mess, I didn't test it well enough it seems...

However, I #include the <linux/pci.h> in r852.h, so I don't think it is
necessary here.


Also, I disagree with the unconditional dependency on nand in sm_ftl.
The purpose of CONFIG_SM_FTL_MUSEUM is solely to make it independent of
nand. I'll look at how to fix that properly.



Best regards,
	Maxim Levitsky
