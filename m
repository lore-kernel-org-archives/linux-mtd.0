Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv4zs-0004Xf-FC
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 11:48:05 +0000
Message-ID: <1358250569.2731.127.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Christopher Cordahi <christophercordahi@nanometrics.ca>
Date: Tue, 15 Jan 2013 13:49:29 +0200
In-Reply-To: <loom.20121217T021112-577@post.gmane.org>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
 <1346686544.3061.75.camel@sauron.fi.intel.com>
 <20120904144826.7b9b7518@halley> <5046B504.6000608@freescale.com>
 <loom.20121217T021112-577@post.gmane.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-OeyTQmwXqI1N+lGxtQOu"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-OeyTQmwXqI1N+lGxtQOu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-17 at 01:11 +0000, Christopher Cordahi wrote:
> > > I'd say keep it simple and flexible.
> > yes, it's really simple and flexible.
>=20
> Is it agreed that sorting is not necessary and will not be implemented?
> If so are there objections to me modifying the documentation to indicate
> that out of order partitions is part of the supported design?

I think we agreed not to do this.

--=20
Best Regards,
Artem Bityutskiy

--=-OeyTQmwXqI1N+lGxtQOu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9UJJAAoJECmIfjd9wqK0+zcQAM5E2/HEFEKff3jFd2w3QdhR
pYgDK22TR+wUFZKguG9piSsBix4QX0MGnPbhOjS1158Maes6BRL30z4zvr3ndFs/
Mxu77WQ4Iam9stgPTKMH+ZglH8jowJHhkJDzclf06xfdZt0fHN4845zxXIMhHWta
sWACPX20eVR97xn7JNO9v6gH/Kch2WOu2qhGZjQzowZ/q2qpZ52H+bMNqvNHvgY9
ILwRBS8oJ21NwJrAgNw21VGh9GxaWhlBYrw2pAfHVQNsicgpSZnjELHbdZQF0hfE
9DZv5V//2w7oWZiAzW1TMkYXtr4Zl7IOPLxtSb24GBhNxDIPWamG6KBZ76cWFOzS
2TY8oDMGNFDx9IVkIwPJ1eQeGOBFedXlTzk5SnN0+Sb0UQFAjk88jMS1Zr+0DRqd
aL0U7MrodlDb4w85ZlNs1GNOirzSDqeikhKPL6KGGyV+tfxfoPNAc43BlFKZqJiu
KjtGDYC7M4TlN0wK1BsFySfz9y71myh+kfzoYhC5RGDiiHI/d8mm69Wm0g7CwukU
1mt8KsS4dbPQTVg72i2mLO4qg6xOshTcMAGFwzMdcYZhauwdS/FxzjMssZezUov5
YfgfszkWlMUtafLiGIMG4XaskMcj2fNTIU7osh84o1O5Rnn2XjHIwADDms/mESv8
880+gifndx4oQ9NDJqox
=vdAa
-----END PGP SIGNATURE-----

--=-OeyTQmwXqI1N+lGxtQOu--
