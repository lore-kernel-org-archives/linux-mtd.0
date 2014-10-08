Received: from mail-vc0-f176.google.com ([209.85.220.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbopD-0006Hd-T7
 for linux-mtd@lists.infradead.org; Wed, 08 Oct 2014 10:50:32 +0000
Received: by mail-vc0-f176.google.com with SMTP id hq11so6393409vcb.35
 for <linux-mtd@lists.infradead.org>; Wed, 08 Oct 2014 03:50:10 -0700 (PDT)
Date: Wed, 8 Oct 2014 11:50:05 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 8/9] mtd: nand: stm_nand_bch: add support for ST's BCH
 NAND controller
Message-ID: <20141008105005.GH20647@lee--X1>
References: <1409143344-22458-1-git-send-email-lee.jones@linaro.org>
 <1409143344-22458-9-git-send-email-lee.jones@linaro.org>
 <20141006064030.GA20598@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20141006064030.GA20598@norris-Latitude-E6410>
Cc: pekon@pek-sem.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 05 Oct 2014, Brian Norris wrote:

> On Wed, Aug 27, 2014 at 01:42:23PM +0100, Lee Jones wrote:
> > Reviewed-By: Pekon Gupta <pekon@pek-sem.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/mtd/nand/Kconfig        |    7 +
> >  drivers/mtd/nand/Makefile       |    1 +
> >  drivers/mtd/nand/stm_nand_bch.c | 1616 +++++++++++++++++++++++++++++++++++++++
> >  drivers/mtd/nand/stm_nand_dt.c  |  110 +++
> >  drivers/mtd/nand/stm_nand_dt.h  |   24 +
> >  include/linux/mtd/stm_nand.h    |  147 ++++
> >  6 files changed, 1905 insertions(+)
> >  create mode 100644 drivers/mtd/nand/stm_nand_bch.c
> >  create mode 100644 drivers/mtd/nand/stm_nand_dt.c
> >  create mode 100644 drivers/mtd/nand/stm_nand_dt.h
> >  create mode 100644 include/linux/mtd/stm_nand.h
> 
> One more thing: you never answered my question from [1]: 
> 
> Does your driver pass the MTD tests? (drivers/mtd/tests/)

It does.  Apart from the ones which insist on reading the OOB area,
which isn't allowed via the normal call-backs supplied.

> [1] http://lists.infradead.org/pipermail/linux-mtd/2014-August/055084.html

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
