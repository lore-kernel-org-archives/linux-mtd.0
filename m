Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnR1-000796-ON
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:41:20 +0000
Message-ID: <1362472908.2943.30.camel@sauron>
Subject: Re: Re[2]: [PATCH 02/12] mtd: remove museum NAND ID's support
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Tue, 05 Mar 2013 10:41:48 +0200
In-Reply-To: <1362472344.590520456@f357.mail.ru>
References: <1362416362.801083474@f211.mail.ru>
 <1362471499.2943.24.camel@sauron> <1362472344.590520456@f357.mail.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-03-05 at 12:32 +0400, Alexander Shiyan wrote:
> > On Mon, 2013-03-04 at 20:59 +0400, Alexander Shiyan wrote:
> > > >From: Artem Bityutskiy <artem.bityutskiy at linux.intel.com>
> > > >
> > > >It is probably OK to remove support for really old NAND chips of 8MiB or
> > > >smaller size. We had a separate configuration option for them:
> > > >CONFIG_MTD_NAND_MUSEUM_IDS, which we remove along with this patch.
> > > >
> > > >Signed-off-by: Artem Bityutskiy <artem.bityutskiy at linux.intel.com>
> > > >---
> > > > drivers/mtd/nand/Kconfig    |    8 --------
> > > > drivers/mtd/nand/nand_ids.c |   19 -------------------
> > > > 2 files changed, 27 deletions(-)
> > > 
> > > Hello.
> > > This change break systems with these NAND-chips, for example
> > > these IDs is used in old DiskOnChip devices.
> > 
> > Do you have one of those and use them with modern kernels ? Which one is
> > that?
> 
> Yes. ID used in the MD2800-D08. I specifically included a configuration option
> to support this chip ;) Unfortunately, I can not say the exact device ID now because
> all of such devices sent in production, and I have no more now.
> Of course, these devices are not in production at the moment, but they are still
> being sold.

OK, probably we can cut on 4MiB boundary then? I mean kill support for
4MiB NANDs and less?

-- 
Best Regards,
Artem Bityutskiy
