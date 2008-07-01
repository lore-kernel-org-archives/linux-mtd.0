Received: from yw-out-1718.google.com ([74.125.46.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KDeQG-0006Kt-Id
	for linux-mtd@lists.infradead.org; Tue, 01 Jul 2008 11:53:24 +0000
Received: by yw-out-1718.google.com with SMTP id 5so1250713ywm.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Jul 2008 04:53:20 -0700 (PDT)
Date: Tue, 1 Jul 2008 15:53:09 +0400
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Nand driver for TMIO devices
Message-ID: <20080701115309.GB7238@doriath.ww600.siemens.net>
References: <20080627094340.GA2748@doriath.ww600.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080627094340.GA2748@doriath.ww600.siemens.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 27, 2008 at 01:43:40PM +0400, Dmitry Baryshkov wrote:
> Add support nand controller part of toshiba mobile i/o controllers
> and some custom ASIC found in some PDAs.
> 
> Respective parts which handle platform device registration are merged
> via Russell's arm:devel tree.
> 
> Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
> ---
>  drivers/mtd/nand/Kconfig     |    7 +
>  drivers/mtd/nand/Makefile    |    1 +
>  drivers/mtd/nand/tmio_nand.c |  534 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 542 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/nand/tmio_nand.c
> 

Any comments regarding this patch?

-- 
With best wishes
Dmitry
