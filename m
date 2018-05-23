Date: Wed, 23 May 2018 11:52:44 -0700
From: Tony Lindgren <tony@atomide.com>
To: Mark Brown <broonie@kernel.org>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Richard Weinberger <richard@nod.at>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fbdev@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 3/6] ASoC: ams_delta: use GPIO lookup table
Message-ID: <20180523185244.GT98604@atomide.com>
References: <20180518210954.29044-1-jmkrzyszt@gmail.com>
 <20180518210954.29044-3-jmkrzyszt@gmail.com>
 <20180521100503.GA24638@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20180521100503.GA24638@sirena.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Mark Brown <broonie@kernel.org> [180521 10:07]:
> On Fri, May 18, 2018 at 11:09:51PM +0200, Janusz Krzysztofik wrote:
> > Now as the Amstrad Delta board provides GPIO lookup tables, switch from
> > GPIO numbers to GPIO descriptors and use the table to locate required
> > GPIO pins.
>=20
> Acked-by: Mark Brown <broonie@kernel.org>

Thanks applying patches 1 and 3 of this series into omap-for-v4.18/soc.
It's kind of getting late for v4.18, but let's see if we can still make
it.

Seems the others can be applied to the driver trees after no more
comments, then once all that is done we can apply the last patch
in this series.

Regards,

Tony
