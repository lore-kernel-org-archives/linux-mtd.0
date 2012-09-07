Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TA7sv-0006j1-UP
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2012 23:22:50 +0000
Received: by pbbrq8 with SMTP id rq8so321225pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2012 16:22:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Mike Turquette <mturquette@linaro.org>
To: "Karicheri, Muralidharan" <m-karicheri2@ti.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1346350624-27291-1-git-send-email-m-karicheri2@ti.com>
 <20120907212853.20289.86031@nucleus>
 <3E54258959B69E4282D79E01AB1F32B7041B73E9@DFLE12.ent.ti.com>
In-Reply-To: <3E54258959B69E4282D79E01AB1F32B7041B73E9@DFLE12.ent.ti.com>
Message-ID: <20120907232241.20289.38511@nucleus>
Subject: Re: RE: [PATCH] mtd:nand:clk: preparation for switch to common clock
 framework
Date: Fri, 07 Sep 2012 16:22:41 -0700
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting Karicheri, Muralidharan (2012-09-07 14:56:22)
> Mike,
> =

> How do these patch get to upstream? Does this get merged through davinci =
maintainer or through individual subsystem maintainers? =

> =


What does scripts/get_maintainer.pl tell you?

Also feel free to make my Acked-by into a Reviewed-by.  I always ge
those two confused.

Regards,
Mike

cant never remembr =


> Thanks.
> =

> Murali Karicheri
> Software Design Engineer
> =

> =

> >> -----Original Message-----
> >> From: Mike Turquette [mailto:mturquette@linaro.org]
> >> Sent: Friday, September 07, 2012 5:29 PM
> >> To: Karicheri, Muralidharan; dwmw2@infradead.org; artem.bityutskiy@lin=
ux.intel.com;
> >> dbaryshkov@gmail.com; computersforpeace@gmail.com; linux-mtd@lists.inf=
radead.org;
> >> linux-kernel@vger.kernel.org
> >> Cc: Karicheri, Muralidharan
> >> Subject: Re: [PATCH] mtd:nand:clk: preparation for switch to common cl=
ock framework
> >> =

> >> Quoting Murali Karicheri (2012-08-30 11:17:04)
> >> > As a first step towards migrating davinci platforms to use common cl=
ock
> >> > framework, replace all instances of clk_enable() with clk_prepare_en=
able()
> >> > and clk_disable() with clk_disable_unprepare(). Until the platform is
> >> > switched to use the CONFIG_HAVE_CLK_PREPARE Kconfig variable, this j=
ust
> >> > adds a might_sleep() call and would work without any issues.
> >> >
> >> > This will make it easy later to switch to common clk based implement=
ation
> >> > of clk driver from DaVinci specific driver.
> >> >
> >> > Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> >> =

> >> Acked-by: Mike Turquette <mturquette@linaro.org>
> >> =

> >> > ---
> >> >  drivers/mtd/nand/davinci_nand.c |    6 +++---
> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davi=
nci_nand.c
> >> > index d94b03c..6b8cf27 100644
> >> > --- a/drivers/mtd/nand/davinci_nand.c
> >> > +++ b/drivers/mtd/nand/davinci_nand.c
> >> > @@ -656,7 +656,7 @@ static int __init nand_davinci_probe(struct plat=
form_device
> >> *pdev)
> >> >                 goto err_clk;
> >> >         }
> >> >
> >> > -       ret =3D clk_enable(info->clk);
> >> > +       ret =3D clk_prepare_enable(info->clk);
> >> >         if (ret < 0) {
> >> >                 dev_dbg(&pdev->dev, "unable to enable AEMIF clock, e=
rr %d\n",
> >> >                         ret);
> >> > @@ -767,7 +767,7 @@ syndrome_done:
> >> >
> >> >  err_scan:
> >> >  err_timing:
> >> > -       clk_disable(info->clk);
> >> > +       clk_disable_unprepare(info->clk);
> >> >
> >> >  err_clk_enable:
> >> >         clk_put(info->clk);
> >> > @@ -804,7 +804,7 @@ static int __exit nand_davinci_remove(struct pla=
tform_device
> >> *pdev)
> >> >
> >> >         nand_release(&info->mtd);
> >> >
> >> > -       clk_disable(info->clk);
> >> > +       clk_disable_unprepare(info->clk);
> >> >         clk_put(info->clk);
> >> >
> >> >         kfree(info);
> >> > --
> >> > 1.7.9.5
