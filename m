Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4rvM-0002yC-CE
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 11:19:37 +0000
Message-ID: <1345807465.2848.279.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI:Force ubi driver load after mtd device drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiang Lu <lu.jiang@windriver.com>
Date: Fri, 24 Aug 2012 14:24:25 +0300
In-Reply-To: <1345801261.2848.276.camel@sauron.fi.intel.com>
References: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
 <1345801261.2848.276.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HG/kuBJoYb8qlguulOp6"
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


--=-HG/kuBJoYb8qlguulOp6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-24 at 12:41 +0300, Artem Bityutskiy wrote:
> On Wed, 2012-08-08 at 10:31 +0800, Jiang Lu wrote:
> > diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> > index 0fde9fc..efbcaef 100644
> > --- a/drivers/mtd/ubi/build.c
> > +++ b/drivers/mtd/ubi/build.c
> > @@ -1275,7 +1275,7 @@ out:
> >  	ubi_err("UBI error: cannot initialize UBI, error %d", err);
> >  	return err;
> >  }
> > -module_init(ubi_init);
> > +late_initcall(ubi_init);
>=20
> The problem is that UBIFS, which is usually used on top of UBI, also
> uses 'late_initcall()'. If we do this change, how do we guarantee that
> UBIFS is initialized after UBI?

Although, I think it is not really a problem and UBIFS can be
initialized at any point - it does not depend on UBI being initialized.

--=20
Best Regards,
Artem Bityutskiy

--=-HG/kuBJoYb8qlguulOp6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2RpAAoJECmIfjd9wqK0e8MQANHEiFsEmSFWFm2UoPQSJ9bA
5UzCOlJntczioSIQrvcmAwvbyyIXuDO0akLxI2xeJoU2W5inFITPhZ/eagkBxkoL
pxu9gSN8KFEVfgAPCPsWUDh8LwgcDspth4aP4iTeQapbcX3/yfnhtpmDRM589Ts3
1rFkNDPjV9zoNTCIANil3xQArp3ETYfx0cpcx+hiKN7sUD+84YuIs6BPhZ+OtLLQ
2qPxGNaJQxyDJukoaiK2McuPT+tnPnV6b/MAetZVYQBhkfwGpmZt9QGHn9pTxbnF
3HhiCESNApnHc/qx6cvqMiWVjsMGNgYssE1ZkJe/xVEDYKA4lofnoB/W1Gd3NNb0
O/+YX5AF4JH4BNoccNOX+oVjRgOn9KUldcgEw/1fHylWIdRtfxxjVu7S43kJVKok
LnZHmuquQvRfV2lOwMYeeYyv1aNBvm3/aH6n8c7OM4tt08bORtC5lTl7Svwg0exm
mn3wb8OCm0boLiXT/Mj5eN8l40dLdelIdjlAU0xDUcnc4jBLZMk6CfMazUy59RuK
mw7yOnKTfZ0recp7jnFHieB+i1GrbITmg+Cap0tst8vIW0Ds6ZhQRCpVcjHVs7x0
icwdrJiXitqbYN/a+jsXRiUJaY2TpX5eO19aVX9YSo8YgpdCmIN1cHBRzt0swpV0
K3cv8WAmTvJUF9vaPqmw
=1nsQ
-----END PGP SIGNATURE-----

--=-HG/kuBJoYb8qlguulOp6--
