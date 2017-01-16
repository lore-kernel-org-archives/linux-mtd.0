Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTEQI-0001rz-Cy
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 21:02:39 +0000
Received: by mail-ot0-x22e.google.com with SMTP id f9so50328158otd.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 13:02:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
References: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
 <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 16 Jan 2017 22:02:17 +0100
Message-ID: <CACna6rxGfoaWTMJMkhuOAb0d9DEqdB6FC5+s97y4s4NXAUbaLg@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: add dt support for Everspin MRAMs
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>,
 Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 January 2017 at 22:00, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The MR25 family doesn't support JEDEC, so they need explicit mentioning
> in the list of supported spi IDs. This makes it possible to add these
> using for example:
>
>         compatible =3D "everspin,mr25h40";
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Looks OK to me, thanks!
