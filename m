Received: from mail-db3on0078.outbound.protection.outlook.com ([157.55.234.78]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGitq-0003WT-1n
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2016 07:52:56 +0000
From: Yao Yuan <yao.yuan@nxp.com>
To: Han Xu <han.xu@freescale.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] mtd: spi-nor: fsl-quadspi: add big-endian support
Date: Wed, 6 Jan 2016 07:52:31 +0000
Message-ID: <AM2PR04MB0722319A9E6027EA76EAE81389F40@AM2PR04MB0722.eurprd04.prod.outlook.com>
References: <1450954821-7483-1-git-send-email-yao.yuan@freescale.com>,
 <20160104205830.GA27554@chopperman.am.freescale.net>
In-Reply-To: <20160104205830.GA27554@chopperman.am.freescale.net>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 05, 2015 at 04:58AM, Han Xu wrote:
> On Thu, Dec 24, 2015 at 07:00:18PM +0800, Yuan Yao wrote:
> > Add R/W functions for big- or little-endian registers:
> > The qSPI controller's endian is independent of the CPU core's endian.
> > So far, the qSPI have two versions for big-endian and little-endian.
> >
> > Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> > ---
> > Changed in v3:
> > Update my email to <yao.yuan@nxp.com>
> >
> > Changed in v2:
> > Rebase to the lastest code.
> > ---
> >  drivers/mtd/spi-nor/fsl-quadspi.c | 157 +++++++++++++++++++++++-------=
--------
> >  1 file changed, 97 insertions(+), 60 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fs=
l-quadspi.c
> > index 54640f1..04e8a93 100644
> > --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> > +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> > @@ -275,6 +275,7 @@ struct fsl_qspi {
> >       u32 clk_rate;
> >       unsigned int chip_base_addr; /* We may support two chips. */
> >       bool has_second_chip;
> > +     bool big_endian;
> >       struct mutex lock;
> >       struct pm_qos_request pm_qos_req;
> >  };
> > @@ -300,6 +301,28 @@ static inline int needs_wakeup_wait_mode(struct fs=
l_qspi *q)
> >  }
> >
> >=20
> > @@ -954,6 +990,7 @@ static int fsl_qspi_probe(struct platform_device *p=
dev)
> >       if (IS_ERR(q->iobase))
> >               return PTR_ERR(q->iobase);
> >
> > +     q->big_endian =3D of_property_read_bool(np, "big-endian");

> once again, please document the new property.

Thanks for your review.
I have already send the patch named "Documentation: fsl-quadspi: Add option=
al properties" to community on Dec 24.
Sorry for forget to send this patch to you.
