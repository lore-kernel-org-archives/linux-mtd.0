Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2H0q-0006WE-Bf
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 07:30:33 +0000
Message-ID: <1345188896.27859.4.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 17 Aug 2012 10:34:56 +0300
In-Reply-To: <CACQ1gAhRYSYehym1qA_Oj71KU4fB2+1MEUGi5Wfnb+E=t3jcxA@mail.gmail.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-5-git-send-email-richard.genoud@gmail.com>
 <20120816115713.726da8f2@pixies.home.jungo.com>
 <1345123718.3393.235.camel@sauron.fi.intel.com>
 <20120816165027.6520c4f4@pixies.home.jungo.com>
 <CACQ1gAhRYSYehym1qA_Oj71KU4fB2+1MEUGi5Wfnb+E=t3jcxA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NkLWXl0n8sfCP++pTx84"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-NkLWXl0n8sfCP++pTx84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-16 at 16:30 +0200, Richard Genoud wrote:
> > (there's one platform known to do so in its defconfig, that's
> > sam9_l9260_defconfig, which uses 3% instead of the "standard" 2%).
> I found the board:
> https://www.olimex.com/dev/sam9-L9260.html
> and the nand datasheet:
> http://www.rockbox.org/wiki/pub/Main/LyrePrototype/K9xxG08UXM.pdf
> page 11, we can see that the max_bad_bebper1024 is 25 (100 for 4096)

OK, thanks for the research!

--=20
Best Regards,
Artem Bityutskiy

--=-NkLWXl0n8sfCP++pTx84
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLfQgAAoJECmIfjd9wqK0k0sP/2f50N4v+cRPDIM8lvIsqZrD
Dx3YZMzhp8QrBLeky3XvaVNwfj6r702duhhbIHUpBrhCoTQ5q5czZogw6s3qLlt1
ji2aG+j/psO8LtW8iMe3xvdmaQdNPGwLmDf0sWnpX8Pjn9/wDr9aTMervYiyjVsU
7qEpdB2SXICGf1U8BvSY+ITHmtmgUG/L60g5y1xgKIGrDC1xo4RBy3/JN+/IXOZP
zjuYH13aD3WwuBthyHRSvJWOOzmNBTPI6v7CszmXqzjZPzbfaAXPvu8FBuwtucVb
XcJCu+Dp7VMYzMwedEFe1RCoTaUMc+4FUPgJ4FSMPHWqrrBxSdKSSd+aCE0v/r/b
6GDOHgMMXvEu7pBHd5d0gnhL6wniIl1egZSTMN/MvngZCF6lJefYmvop9U2w6Ofp
sHMJauJC7vguOSroZaoGX3TO4sKncbmQfQssJeAchM4Y6dXD0Hbdi5soBm1N/yJR
K4OyymmIlyTm8wZ0Wtip6nvSJ2q4F7XyiN4Fu5wdX/9lvo5h/KBZLoJ91lYeg4+h
bfXh9aFwne8xErLm8QoFkkWbu56VTvoO0fTXouFOxmeDm3fpm4Ozl4lSkwbSXzLo
C1RbvxJyqMPoW86Dd9Tm5NhFee725kMFFP8syzDDZ+I6lOMUbitIQMjQ3GAhJKNH
p4D0qfEoHoEojm7sl1wz
=AH0o
-----END PGP SIGNATURE-----

--=-NkLWXl0n8sfCP++pTx84--
