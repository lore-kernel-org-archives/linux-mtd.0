Date: Thu, 8 Aug 2013 14:20:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <zonque@gmail.com>
Message-ID: <20130808132000.GD6427@sirena.org.uk>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-14-git-send-email-zonque@gmail.com>
 <20130807164039.GM6427@sirena.org.uk> <5203676F.6090708@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Jm4NjHtWXfjOIegD"
Content-Disposition: inline
In-Reply-To: <5203676F.6090708@gmail.com>
Subject: Re: [PATCH 13/20] ASoC: pxa: pxa-ssp: add DT bindings
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Jm4NjHtWXfjOIegD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2013 at 11:39:59AM +0200, Daniel Mack wrote:

> Then, we should also allocate the DMA channel from the upstream device
> and pass it down to the DAI. But then again, the pxa-pcm-lib needs some
> rework, as it's currently in charge of obtaining and releasing the channel.

> I wanted to postpone that issue until the rest of the series has settled
> and limit changes to the bare minimum for now. Does that sound feasible?

Yup, the big problem here is the whole DT as ABI thing - what happens in
the code isn't so important but the DT is supposed to be stable.  Or we
could decide that this is one of the cases that's unstable in which case
we should probably flag it up in the DT binding document if nothing else.

--Jm4NjHtWXfjOIegD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSA5r9AAoJELSic+t+oim9TY0QAJEC6KT9kFEO2/hPL88fIE2z
NozOSwnc8Aa/QKP052g0Lt30lkSWJjml2AnX35f0RRrvgsvzm01RVIyBoRFI+m7q
yUsJD9SkcpXcad1myC1BIGIIjFATvD4l6EA/ddxm/Jzr6Nc+3hUruirtetITOVws
FpD1GByDzWmZ+R88+BCypGXPwAIueWOPuQfCBUgeMuEppvMCjR2oUiBsmY05/MgI
2MRdSYyFR9AhTTpAqH3jp3qsFxQWtVxAlh5LIUObMEbkstAfBT24+CFVcCwGuWmF
U1mxehBMAAKFfeZgoHt6gUSBZZiY4/Txdn1G6mCnzNOezI9OnMHXpFVUvt+C91fa
Mkc1ESJQP+sEvhpHI3EAamjMDs0Ljax448DT6pTjvjHb2XT2gZUqfmoo8SUpO4Ze
Mt1L4rF1iBCFZiS/3vVgr228Op8oQK+998uGMQJW1v3EG3WwaytvGp/KlH1uiDyi
xVntT3vk1TuMOb3wZeAmEFjH6ms7bkhac9xcUs2XtaAfDIjv1XxdIry/PY+tNIiK
r1q+S33F05HCo1i06Pc0aoXV5gi0YLQ/Fg9kmkaSVDpvBJqRESiQkcAwLnW57oLN
ppZyAa6yvVfZBWJNe3UndN19ubjrtEosm6qpXukv1Qdd8LWRR9aUbdqeXLi4s1Us
+BcamCwg262/gX36NzhW
=Q2lB
-----END PGP SIGNATURE-----

--Jm4NjHtWXfjOIegD--
