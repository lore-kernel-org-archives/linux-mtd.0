Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmlvE-0004K1-9J
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 12:44:24 +0000
Received: by obcuz6 with SMTP id uz6so1727431obc.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 04:44:23 -0800 (PST)
Message-ID: <1326717967.14299.77.camel@sauron.fi.intel.com>
Subject: Re: Corrupted UBIFS, bad CRC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <arm9263@yahoo.com>
Date: Mon, 16 Jan 2012 14:46:07 +0200
In-Reply-To: <1326717654.83444.YahooMailNeo@web121506.mail.ne1.yahoo.com>
References: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
 <1326630286.2201.3.camel@koala>
 <1326701907.78896.YahooMailNeo@web121503.mail.ne1.yahoo.com>
 <1326709475.14299.34.camel@sauron.fi.intel.com>
 <1326717654.83444.YahooMailNeo@web121506.mail.ne1.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ewCulVT7E6o0LQnAXaH1"
Mime-Version: 1.0
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ewCulVT7E6o0LQnAXaH1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-16 at 04:40 -0800, Karsten Jeppesen wrote:
> Hi Artem,
>=20
> OO something bad happened here. We must have lost track of each other.
>=20
> What I sent you was ***NOT*** produced by our standard 2.6.32.8 kernel.
> I spent quite some efforts in adapting the new 3.2.0  kernel.

Well, ok, does not matter anyway.

> I wrote that in my original email, but you may have drifted off to the em=
ails from November.
> To make life easier for you I assumed you would rather look at data inclu=
ding the newest stuff rather than backported stuff.

There are few fixes for 3.2 in ubifs-v3.2 tree. Namely, they make
UBI/UBIFS print some debugging message which are not printed otherwise,
due to a bug I introduced at 3.0 times. Please, pick them.

Please, just substitute s/2.6.32/3.2/ in my reply.

--=20
Best Regards,
Artem Bityutskiy

--=-ewCulVT7E6o0LQnAXaH1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFBwPAAoJECmIfjd9wqK0B4QP/15kn6TbGMtyMoC/LjTDnSem
mjEqxsvbd6rNBXcNycphhQmqJi73h6c84Br10K3whgmyhyY28lP8CNWCXCeLjKCg
4XkLaCRP9klUzMLMAWcY/0n9nIeMgLXv748NCap7zEkegz9SdSLYNakJ+JNF83MX
SY39NkI8SgjqYLkh+hkTB8Aftp2HXNcBSZtvhVrQYKG4woXLyPjBTCN8gXU65RB0
EJS73K4MznWzH2WVaj3WAyJHKOqMKuO4DJeVu9qQ6e290gGWVjf4MxulxR2hTsMw
ZEjILKNA7Az4pClXlJxDiPOgyFlU8fKHSxOAwPheDdAsY+CDDND7WBAPxGyR+DwE
Zf+4LHR+hs2Gp8UjWseOoSW29h/5+8SIUDtyT0CXUV7d7XJ94GdPIcrZrpmR+WQV
N1H/Fo4cOZrId+1jOxA7d+DarjBA4SVMsDlxplblUW5GME5UzbNR3QwwOwxH2JdF
j+Cfi/xznnlBMSYwlTEzybpPRPzpyO7AiH6EOxHAYj+4gLesaTmr5NDob4xm6GiL
RwwN+qKkeknQhCUJzizEjW7fjpQh3Ay7aTnM+6Wk2bEruo8hq/+25G9hNc+FUBXB
UnA1e2wh+KTxwLiRFxarBAcm0VGtHK2oXvHrH6owQ8/XRyz5XiGGc+xKvZIs7/z3
3/vzeiwNA3Gk6iTu7L0W
=4wAH
-----END PGP SIGNATURE-----

--=-ewCulVT7E6o0LQnAXaH1--
