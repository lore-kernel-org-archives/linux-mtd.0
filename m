Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E45E95A8E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Oct 2023 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXq6gBdhn8xNwm/ifSfhtp8DeYyhGWHKB0gPIZ/sAlc=; b=mGpM2SkOYVbXPCBohAajwdOR2M
	trJXppluOGyPHcBEwtOY3nyVBfniRUprUCdJYPzJ40TRTgeSdP/dWl1Q1gkcS4wmuzg36Y3ad25Q2
	EMuFSRUebmu/ATOdjsuCqXazFAv3ataOp4KB6TJBe3IN5BZcsADSnbPEGVD+i7ePWgYaX+uPDOE9Q
	yCgf1Y+JEqS3rVyrTnW29J/VKBjfdIYRh5NgdJateZ439NDVFGIpNbCvsPz8qYCraCWjysjx/FV7t
	GoJ5KIsjyfZQ5gGs3e/kiJvlIUf3FgorvWq9B2TgLbqhQVI2vMfx3RbKdcQ9OE3xmVAz7wTLR/NOP
	gmcodp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpnXL-00ADed-2z;
	Mon, 09 Oct 2023 10:30:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpnXG-00ADdg-33
	for linux-mtd@lists.infradead.org;
	Mon, 09 Oct 2023 10:30:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpnX6-00029v-Pt; Mon, 09 Oct 2023 12:30:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpnX4-000OLd-4m; Mon, 09 Oct 2023 12:30:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qpnX3-00C8Mz-RZ; Mon, 09 Oct 2023 12:30:37 +0200
Date: Mon, 9 Oct 2023 12:30:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-kbuild@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-mtd@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_033050_986328_69C0D04B 
X-CRM114-Status: GOOD (  29.22  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5318577639634316164=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5318577639634316164==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eyfmrlif4aeodefl"
Content-Disposition: inline


--eyfmrlif4aeodefl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[Changed email address for David Woodhouse from intel to infradead]

On Mon, Oct 09, 2023 at 10:43:46AM +0200, Arnd Bergmann wrote:
> On Mon, Oct 9, 2023, at 09:22, Masahiro Yamada wrote:
> > On Mon, Oct 9, 2023 at 5:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig <u.kleine-=
koenig@pengutronix.de> wrote:
> >>
> >> As described in the added code comment, a reference to .exit.text is ok
> >> for drivers registered via module_platform_driver_probe(). Make this
> >> explicit to prevent a section mismatch warning with
>=20
> >
> > We have thousands of module_platform_drivers.
> > I would be scared if they started to add __refdata.
> >
> > I am not sure if this is the right direction.
>=20
> For a normal module_platform_driver(), this would indeed be
> wrong, but as Uwe said above there is a special case for
> module_platform_driver_probe(), which implicitly sets the
> drv->driver.suppress_bind_attrs=3Dtrue flag.
>=20
> > In my understanding of the current DT overlay,
> > there is no way to create/remove a platform device dynamically.
> > I do not know if that will happen in the future.
>=20
> For drivers without suppress_bind_attrs, you can manually
> unbind the device from a driver, which in case of a loadable
> module ends up calling the .remove callback (this is fine),
> but in a built-in driver this would use a NULL pointer for
> .remove and cause unexpected behavior.

only a slight correction: As not having a remove callback can be fine
and platform_remove() only calls .remove (or .remove_new) when non-NULL
we're not hitting a NULL pointer dereference in the presence of

	.remove =3D __exit_p(somefunc),

But a problem can arise later if some resource isn't properly freed and
so it might be used at a later point in time which then most likely
oopses.

I didn't double check Arnd's list, but otherwise I agree to his
analysis.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eyfmrlif4aeodefl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUj1kwACgkQj4D7WH0S
/k6PWAf/U6JPgHawgWRjbbvmzteonFhuvNF2GMdSZ9xtW5chIxo+H2g0Zwvic4hx
2ZwF3ewJ9ZtSeMq2JZXlC8WV0RwE+zYoig5IDtf/73kVGS48oFPf7u7bppOaVWAG
5pCoCYa9p2c3BcXP21362rCufNKiqSNxVpuETfbIWaUYqCV8T+/5mKweFEuJ2TT1
3gauZoDBNKTNFUvZ3eV1u2m8dFWiqbvLeR1YfS6neIpup2caScqNxsTx+cT2rAJu
4+HimdiMvjB0oKI8gHOvdbYtbWLp6fM1olaiAYen0Gi7TtBXqKhPrY8OrkCayNOj
t5xetLTIRPMyd5H1jwQzvHCQTGUy+A==
=jxi7
-----END PGP SIGNATURE-----

--eyfmrlif4aeodefl--


--===============5318577639634316164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5318577639634316164==--

