Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmioA-0008Ef-6o
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 09:24:54 +0000
Received: by iakl21 with SMTP id l21so10063592iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 01:24:53 -0800 (PST)
Message-ID: <1326705996.14299.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] PM / MTD: Fix regressions related to mtd_suspend()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Oliver Neukum <oneukum@suse.de>
Date: Mon, 16 Jan 2012 11:26:36 +0200
In-Reply-To: <201201161023.45321.oneukum@suse.de>
References: <201201151443.30897.rjw@sisk.pl> <201201160018.02305.rjw@sisk.pl>
 <1326705441.14299.10.camel@sauron.fi.intel.com>
 <201201161023.45321.oneukum@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rponj/d/UakxBggZZsJP"
Mime-Version: 1.0
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Linux PM list <linux-pm@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rponj/d/UakxBggZZsJP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 10:23 +0100, Oliver Neukum wrote:
> Am Montag, 16. Januar 2012, 10:17:21 schrieb Artem Bityutskiy:
> > Thanks Rafael!
> >=20
> > I've pushed this patch to l2-mtd-2.6.git (David, would you please merge
> > it upstream?).
>=20
> Does this need to go into stable?

No, this is a regression introduced during this merge window. I'll amend
the commit message to make it clear, thanks.

--=20
Best Regards,
Artem Bityutskiy

--=-rponj/d/UakxBggZZsJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPE+1MAAoJECmIfjd9wqK0oQwP/22Rg+05JAmreWJ2V5ro2RDP
iDwpFom8PUv05IEnMqkOFJ2TxVs9XY4E1QKh9wG105UiPsDYoGKUMuTGFc0bUvRw
Q6S6HnzuO3HCO71sokB8Sexh9JLqaHK0jlUyuvBn6fDJR1hZfUniNXTk/HaMMoz5
7ZPWdZleLBORAAJglC+N13axwgxsKaczaUMtS4QopShV2YE2bMPGprlyaz0PCs/5
t16c1m7MUbOYdtrFiIYXZV9wy9lGe62FjRXfx1T6g2amom3+NVwHtP5QaSeoUuQw
JV7QYaxE92/kT4wKsU//73rT9232uIIGdd7FTk596ckpS0qUMSelNUUOEsGFxLux
aPOzprFwl9ru4WxJgNNy715T/9yQbAaY9ven1SxgTfUhYTuHt1osi87fJgAGBKrs
P/85I+pN/8pmoOD9FTL3GOh+qY4ZS1sBDKGPexZ55L75lY7GfCe338CElzPYzwjm
B5MKLm1/eEEdma+5gMql2EtXa5083tCXEWa8yjkzxQnuRe8kf+uiNWTbJuDMfMvn
N6llwJ+3ZBBmEWbkIJaGC+whVOUgxKhdgyMRxzy4kqr3g5aPlIciTLxPukxZuqrB
/6viSn/IH/VdPpFp9I/SCpCoMa1FdaN63M/ZDKWb6PxZbrleCOp7uZM3Hq0RWpj8
q5y7OnpwCdIQne3ZBUlT
=bzB5
-----END PGP SIGNATURE-----

--=-rponj/d/UakxBggZZsJP--
