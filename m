Received: from wr-out-0506.google.com ([64.233.184.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1Hms-00009k-Oc
	for linux-mtd@lists.infradead.org; Thu, 21 Jun 2007 04:13:24 -0400
Received: by wr-out-0506.google.com with SMTP id 58so154513wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Jun 2007 01:13:05 -0700 (PDT)
Message-ID: <a781481a0706210113s51078c55p239958c04112b93b@mail.gmail.com>
Date: Thu, 21 Jun 2007 13:43:05 +0530
From: "Satyam Sharma" <satyam.sharma@gmail.com>
To: "Christoph Hellwig" <hch@infradead.org>,
	"Satyam Sharma" <satyam.sharma@gmail.com>,
	"Tom Spink" <tspink@gmail.com>,
	"Toralf F?rster" <toralf.foerster@gmx.de>, linux-kernel@vger.kernel.org,
	"Paolo Giarrusso" <blaisorblade@yahoo.it>,
	"David Woodhouse" <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: build failure due to ROOT_DEV in mtd module (was Re:
	linux-2.6.22-rc5-g7c8545e build #298 failed ...)
In-Reply-To: <20070621065920.GA9792@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a781481a0706202352u1efed48fo5a101f8c015638d7@mail.gmail.com>
	<20070621065920.GA9792@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/21/07, Christoph Hellwig <hch@infradead.org> wrote:
> On Thu, Jun 21, 2007 at 12:22:01PM +0530, Satyam Sharma wrote:
> > >> The build seems to fail because of:
> > >> ERROR: "ROOT_DEV" [drivers/mtd/maps/nettel.ko] undefined!
> > >>
> > >> After taking a quick look at the code, I can't immediately see why
> > >> this would be, since there is an include for linux/root_dev.h at the
> > >> top, there.
> > >>
> > >> There's only one occurrence of ROOT_DEV (line 425), and after a quick
> > >> look at the git history, it seems the include was originally missing,
> > >> but was put back in, in commit
> > >> 6cc449c7d0292cb9b993f0df84fd3225e3099492.
>
> Please just the reference to ROOT_DEV from this driver.  Just because
> someone builds this driver there should be no change in the default root
> device.

I agree, but this (drivers/mtd/maps/nettel.c) isn't the only modular driver
referencing ROOT_DEV. We also have drivers/mtd/maps/pmcmsp-ramroot.c
using ROOT_DEV (in fact the purpose of that driver seems to be precisely
to special-case the root fs and do something with it ...) but considering
that other driver's (tristate) Kconfig option depends on another symbol that
is non-existent in the mainline tree, there is no way someone can build
pmcmsp-ramroot and so we'll never actually  hit that problem even with an
allmodconfig build.

Anyway, I'll leave this up to David / linux-mtd to sort out. [ No other
modular user of ROOT_DEV in the tree other than the two mtd drivers
mentioned here. ]
