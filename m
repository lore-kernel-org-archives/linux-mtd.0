Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUzut-0004AB-AV
 for linux-mtd@lists.infradead.org; Thu, 17 May 2012 12:34:51 +0000
Received: by lbbgg6 with SMTP id gg6so1568057lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 May 2012 05:34:49 -0700 (PDT)
Message-ID: <1337258086.2564.9.camel@koala>
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 17 May 2012 15:34:46 +0300
In-Reply-To: <4FB4E56A.3040009@nod.at>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-2-git-send-email-richard@nod.at>
 <20120516170324.337f2932@pixies.home.jungo.com>
 <1337178457.24809.56.camel@sauron.fi.intel.com>
 <20120517124548.262c132a@pixies.home.jungo.com>
 <1337255093.2564.3.camel@koala> <4FB4E56A.3040009@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lPTimvBXHnlVxpq/vgyl"
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lPTimvBXHnlVxpq/vgyl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-17 at 13:47 +0200, Richard Weinberger wrote:
> Am 17.05.2012 13:44, schrieb Artem Bityutskiy:
>  > I think I meant the compare_lebs() exporting, not this one, replied to
> > wrong e-mail, sorry. Happens when I am in hurry - try to keep everyone
> > happy and make sure Richard is always busy with something :-)
> >
>=20
> Haha.
> No need to keep me busy. :P

By this I meant - give some review feed-back ASAP to make sure you have
something to do and think about. Surely it is better than giving a lot
more feed-back but with a couple of weeks delay?

--=20
Best Regards,
Artem Bityutskiy

--=-lPTimvBXHnlVxpq/vgyl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtPBmAAoJECmIfjd9wqK0Mp8P/1FApMrs45lYv85Oo/Ht/Tg6
F7sU7pFJy5FKnesNKhiHGoXTOD32bzKbuLOeVdUr1vqXNNp1/GtsKmJdAyK6eiJX
AsHKZJE9oM6tvghmNGMGNYSxvnycxAtcjgPkrXgGYf16ILx2Ekt81oQSe9VEw9n/
bKocKnLC+vCacL1kOsI9B2u5tpL6nLucTedalIZROJbvQijBVtVPkot5RLEYaYWK
5fINoilzagCdfVEFYSjzuHwKF9OKM8PYCa/L0Tr+ZnPnOQkCYBOd19DERh14r/vC
a/B0Is7E0bmfpI9ThUoECjJ2/f0+qfWv73y/5qKL38KgW4tB9lLMykkQzuiCxygC
56O+PLmSq+Sn0ru2XugcadPzzyrTvjOWYjUrOPg5qndXR+dPoc0Yv/zLi0y9T9zO
OwT13fglKEiMXkzumuRvZvHY0yksLOBmA28mRAspFz1Y2TFFCN/uY1L+sCoDovHe
5LSLbZB6L7iV7N4O5DZHWZTcNcaK5GptFOO8p+tHujBBr7fjAS7Y/131V+aeWq7J
j915txWG6+2U+AA2p2zyALbeLvzuYuvgixlUnUTeFRaqdSfSAn3lNttskvJWFcxf
fG32GTiEaKWHZbDAj/OVZ/uJC1OdIDoM23hLdZkWKA34jrawj9jiiD9D5pE70Grf
U2/imlAKomelV9bkiVLM
=OxzL
-----END PGP SIGNATURE-----

--=-lPTimvBXHnlVxpq/vgyl--
