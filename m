Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsDXb-0002Bm-Lw
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 13:14:32 +0000
Received: by pbdx9 with SMTP id x9so178894pbd.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 05:14:29 -0800 (PST)
Message-ID: <1328015763.28171.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/3] platform: add platform_devm_request_and_ioremap()
 common API
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Barry Song <21cnbao@gmail.com>
Date: Tue, 31 Jan 2012 15:16:03 +0200
In-Reply-To: <CAGsJ_4yVTaZQOE2dB4A3L6WCLE78b4eBPaOcDDJ7RH+0LN=R_A@mail.gmail.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328008455.956.30.camel@sauron.fi.intel.com>
 <CAGsJ_4yVTaZQOE2dB4A3L6WCLE78b4eBPaOcDDJ7RH+0LN=R_A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-5YXVZEynsY7kl5lhKV7v"
Mime-Version: 1.0
Cc: workgroup.linux@csr.com, Greg Kroah-Hartman <gregkh@suse.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Barry Song <Barry.Song@csr.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-5YXVZEynsY7kl5lhKV7v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-31 at 20:57 +0800, Barry Song wrote:
> > If yes, I think it would be nice of you to give a credit to coccinelle
> > and its authors for developing this awesome tool in every commit
> > message.
>=20
> devm_request_and_ioremap() is still something new by commit

Ah, ok. But it would be cool if you could create a coccinell semantic
patch for this, although I should admit this is not very easy, but a lot
of fun.

--=20
Best Regards,
Artem Bityutskiy

--=-5YXVZEynsY7kl5lhKV7v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPJ+mTAAoJECmIfjd9wqK0XNsQAJ35UJFcm7hjzUfAouJhXEy8
NlG0keuOUgucZ8pgJg8ujbyn+NXzjjuVgr10JgvGycYwlyCf/VQcapcI1Hgc0V2l
+LitNRS9BJ+uttzJddkFJ86/91fgOAXa4/h1Lqe1BdqfCx8kmic0WFUq6syW1uHL
R9ijv4eBJCnEe16EQtwDkJg9gkLQzJs490pjyKF3RXna90Jft6A8OKVRdKgf741P
VVSuvKrL0yK+vwqV/InV3XzeIzLHOMKaezEyHHRAeiipOprQhdYgcV3rQSdiuTbA
1hE31pYnOXktRm/UAT7iXfcPgZHAl6g3frIakQCnpNzeh0EXIeyKV7s/nOrz6TWW
0hSLnHinoFLy1xuQVQVScNayz8h5HWQW7MvdB1Wx0DxOH/ujn+LFWEo12V0mRaYM
/bG0KAFPSYx2bCdlbwAA6ZRiXWKcu5kdlygSZqKj0ZeZWS0ak3sbsbFzBKmjJjSs
kXdUuR3ljKm0sJn2kQn0UV0j1ibDTc9t2hVayoMc5Ct4Po01Rr3dRTFqDjoFnNRn
PMSOQMkQ8d1OPi5pYsscnNJCnlxCqwASO5XVL9W/fRLC0ZCOsqoymzxVrOIcU6mR
4MAKgPs6FTIIHccp7x9iUbuzAkKGgEu/vNP6+vFefS5TZ59zWpUEuGyOKT5/LRPb
JyxJNUbMkSzIuYz0mZwK
=F0QH
-----END PGP SIGNATURE-----

--=-5YXVZEynsY7kl5lhKV7v--
