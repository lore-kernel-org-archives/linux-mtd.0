Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTDAe-0006Lh-BJ
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 19:42:26 +0000
Date: Mon, 16 Jan 2017 20:41:54 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: add dt support for Everspin MRAMs
Message-ID: <20170116194154.v2p2gbyvvfb5bwe6@pengutronix.de>
References: <20170116133503.13887-1-u.kleine-koenig@pengutronix.de>
 <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 16, 2017 at 02:55:01PM +0100, Rafał Miłecki wrote:
> On 16 January 2017 at 14:35, Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> > The MR25 family doesn't support JEDEC, so they need explicit mentioning
> > in the list of supported spi IDs. This makes it possible to add these
> > using for example:
> >
> >         compatible = "everspin,mr25h40";
> >
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >
> > independent of the decision if -nonjedec is ok for m25p, this is needed
> > to make Everspin's MRAMs work.
> >
> > Best regards
> > Uwe
> >
> >  drivers/mtd/devices/m25p80.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -305,6 +305,11 @@ static const struct spi_device_id m25p_ids[] = {
> >         {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonjedec"},
> >         {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonjedec"},
> >
> > +       /* Everspin MRAMs without JEDEC support */
> > +       { "mr25h256" }, /* 256 kib, 40 MHz */
> 
> A trivial thing: I think it should be Kib
> https://en.wikipedia.org/wiki/Binary_prefix

Oh, really? 10^3 = k and 2^10 = Ki, stange. Should I resend for that?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
