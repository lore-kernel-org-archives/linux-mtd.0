Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGvaQ-0007yt-Le
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:35:19 +0000
Received: by eye3 with SMTP id 3so3643039eye.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:35:16 -0700 (PDT)
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 20 Oct 2011 19:31:04 +0300
In-Reply-To: <4E9CA204.8000904@newsguy.com>
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<8762jtlx19.fsf@free.fr> <4E9CA204.8000904@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-phDBzV0Hq4+2CLuYKnA9"
Message-ID: <1319128271.20953.14.camel@sauron>
Mime-Version: 1.0
Cc: marek.vasut@gmail.com, Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-phDBzV0Hq4+2CLuYKnA9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-17 at 14:45 -0700, Mike Dunn wrote:
> Not sure.  I'm currently not too knowlegeable on timers, and I'm not usin=
g this
> config option in my kernel.  Will look into this.  Meantime, suggestions,
> pointers to reference docs, etc greatly appreciated!

Jiffies do work fine in NO_HZ.

>=20
>=20
> > Why not use a loop of mdelay() or msleep() or doc_nops() bellow ?
> > I would prefer doc nops, as the time of these is controlled by the chip=
 itself,
> > and thus less dependant on the CPU frequency.
>=20
>=20
> I'm not simply delaying, I'm polling register 0x1038 (I'm calling it
> DOCG4_CONTROL_STATUS).  The diskonchip P3 uses this same register in exac=
tly the
> same way, so it's likely the G3 does as well.  With regard to the diskonc=
hip nop
> register, I was careful to preserve the same number of reads of that regi=
ster in
> the same places as was observed during reverse engineering, to prevent
> timing-related failures.

But use cpu_relax() in the polling loop.


--=20
Best Regards,
Artem Bityutskiy

--=-phDBzV0Hq4+2CLuYKnA9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoEzIAAoJEJtuLFy+q7feZx8IAKQIK/wOebCRyk3VqfpIssml
FAsCAyqFMjGB+SIdgE7MzLImlhv2Ye4Q5YCEsnx90vkf8Cvq/IZUgDRPofgGJuic
vAHPuIQM+upmYBNRZ+IGt6OQS/35G3hESjfh/2Wl2z/GA9Wr7Y4gKU+VCdrG4mjh
3jtR+Q+De1F+lYL9hT78e3YccychFQXE4Hbm158P5o34SmFtDuEnxJt+29A9dMhn
QKEcofT576hs1SBUNtQ47Cs1GP2zbwNZu5C5nkuNLb5X4vJB9j+udGeIvaJEzvIf
HR7T+n7QWPzYGmb7QM2sJwvpVsy81YI+07SiAM3bDCh8mJ0+PYILn/echfxnPFY=
=JPmZ
-----END PGP SIGNATURE-----

--=-phDBzV0Hq4+2CLuYKnA9--
