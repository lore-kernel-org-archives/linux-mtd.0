Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN3ub-0007bO-Pl
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 15:13:46 +0000
Received: by lboj14 with SMTP id j14so200270lbo.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 08:13:43 -0700 (PDT)
Subject: Re: [PATCH v3.4-rc3] MTD: NAND: ams-delta: Fix request_mem_region()
 failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
Date: Wed, 25 Apr 2012 18:13:38 +0300
In-Reply-To: <1334670557-25640-1-git-send-email-jkrzyszt@tis.icnet.pl>
References: <1334670557-25640-1-git-send-email-jkrzyszt@tis.icnet.pl>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-wruPd1P8yR95skTx5DEE"
Message-ID: <1335366823.6356.11.camel@koala>
Mime-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-wruPd1P8yR95skTx5DEE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-04-17 at 15:49 +0200, Janusz Krzysztofik wrote:
> A call to request_mem_region() has been introduced in the omap-gpio
> driver recently (commit 96751fcbe5438e95514b025e9cee7a6d38038f40,
> "gpio/omap: Use devm_ API and add request_mem_region"). This change
> prevented the Amstrad Delta NAND driver, which was doing the same in
> order to take control over OMAP MPU I/O lines that the NAND device hangs
> off, from loading successfully.
>=20
> There is another driver, omap-keypad, which also manipulates OMAP MPUIO
> registers, but has never been calling request_mem_region() on startup,
> so it's not affected by the change in the gpio-omap and works correctly.
>=20
> Drop request_mem_region() call and related bits from ams-delta NAND
> driver.
>=20
> Created and tested against linux-3.4-rc3.
>=20
> Signed-off-by: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>

How about race conditions? Where is the guarantee that these 2 drivers
won't affect each other when doing I/O at the same time to the same HW
resources?

--=20
Best Regards,
Artem Bityutskiy

--=-wruPd1P8yR95skTx5DEE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJPmBSiAAoJEJtuLFy+q7felSkIAI6o7Jf26D3n4Z5ar2Fbpz88
lYR7XtaE0wkuCzfwJGqIUodUClIuK9OaLzklXdRXhUGlElW9UO9moF+5jFYsFLcJ
vFc5N0YJIityhRe9I9lkagw2es5bEUw0hiGdSruQWCOYtYpTTxg3cjkpvmg66VXK
C5my7xT+4bWz21xU76vINVXPJPAonmWl949ISgDVY9MtjpPgU4iFnuHuIXcMRVVk
DtzBChj9ZIwYy+SWA2CtYftr/ifRATn/vIZMcqCL7ZiIpm2dkzm/erpvntpQ04C1
MNVUrgbYAzI/Gm1I7h3QAWAogBLBxGe7Th9wJ1LUlYOytqDiCSFvkT8cwvMmstk=
=Q+rG
-----END PGP SIGNATURE-----

--=-wruPd1P8yR95skTx5DEE--
