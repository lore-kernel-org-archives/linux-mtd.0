Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIbZv-00024y-4v
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 07:37:44 +0000
Received: by wyg8 with SMTP id 8so214199wyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2011 00:37:40 -0700 (PDT)
Subject: Re: [PATCH] phram: make kernel boot command line arguments work
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Fache, Herve" <h-fache@ti.com>
Date: Tue, 25 Oct 2011 10:37:31 +0300
In-Reply-To: <CA+Xn3W3iUxumMqBELbah_uScMza-jAwMFuXewWdnJOs2sPkZow@mail.gmail.com>
References: <1318866038-11781-1-git-send-email-h-fache@ti.com>
	<1319127421.20953.5.camel@sauron>
	<CA+Xn3W3iUxumMqBELbah_uScMza-jAwMFuXewWdnJOs2sPkZow@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-9uTN4/kG2CN60zCjBNi2"
Message-ID: <1319528259.14178.3.camel@golum>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, joern@logfs.org, joern@lazybastard.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9uTN4/kG2CN60zCjBNi2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-10-21 at 10:51 +0200, Fache, Herve wrote:
> Hi again,
>=20
> On Thu, Oct 20, 2011 at 18:16, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> > Could you please make checkpatch.pl happy?
>=20
> Would you mind posting the errors/warnings you get? I did run
> checkpatch.pl before submitting and got none...

Yeah, I thought checkpatch.pl would blame you for improper comments
style. The standard way to write comments is described in
Documentation/CodingStyle.

--=20
Best Regards,
Artem Bityutskiy

--=-9uTN4/kG2CN60zCjBNi2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOpmc7AAoJEJtuLFy+q7feMk0H/RrBFzLwuFfFnqLqNlzHrPem
NpettZpznBR5crbjF+GYWLqUSLk6HTRYx9lxoYO91YuOI++HEzrDrgSA09KswKAt
z8B1pUYahPthOsCYjzIMYqwvLj0qcACGK4gJLG/lL1t9cA+6TMU2LTu3vBSuz1mT
X+nZ2IeexwZ58OBqFDxL63v2eRs2bYcjeeVYnt8EUqwVcP0KI9Sb74H/oBRjr9gv
Qb2UT0ImlDLptI6AuCrmtlSzx+HE62CLvhQI9vxOi30MeyFKBfWSBewmOzVO7I+P
wH5bipwuuOmMrImp9bWpzAv+S/8lBsGo3lg4lHBDsFxP7Uy9k4HVv/FT0Of7Fxo=
=T1Qa
-----END PGP SIGNATURE-----

--=-9uTN4/kG2CN60zCjBNi2--
