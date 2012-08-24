Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4qer-00061A-0M
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 09:58:29 +0000
Message-ID: <1345802597.2848.278.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI:Force ubi driver load after mtd device drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiang Lu <lu.jiang@windriver.com>
Date: Fri, 24 Aug 2012 13:03:17 +0300
In-Reply-To: <1345801261.2848.276.camel@sauron.fi.intel.com>
References: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
 <1345801261.2848.276.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-aZIPGmNpMMlICSSpvOGT"
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


--=-aZIPGmNpMMlICSSpvOGT
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

It looks like the right way to fix the issue is to change the way UBI
initializes. We should not try to open the MTD device, scan it and
attach in the initcall. We should instead delay this till the first
open. So when you open the device for the firs time, you actually end up
with the scanning, etc.

--=20
Best Regards,
Artem Bityutskiy

--=-aZIPGmNpMMlICSSpvOGT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN1FlAAoJECmIfjd9wqK0laAQAJCnJOKqCk+JFa7IgS2Mx7Xm
184pOfDBwoNCJjfSTZmQMKE2xWmCxJgua+pqZDa4cYQxrhDBJQakXaLjXJkq/PyU
fWKWQj6mgfdU+3gfa9YDNnSq/SZTPQDxLOTWUlp0QZMz4p9qGgKmFTAVFL6wBd9A
39FWEhiIKyGzuJFoq1CpK5DmoMDvm0rRuD1/ObhIxK+dpV3gQX71ZFv3RV1sE1Tv
MsDO162oRD+EqWf5sJdTRtL+pS0V+FjxjPujPqj3epkgR39rjKnWKuNVDvPcF70D
nrJvRPvVINEysj+wkmZvVr5EnUci8jgJf09E21aQLozdUycuyMVQfvch7lzqn8Fh
I3gZMWn0VpCs4N7C114RvHN1yrqM/237BxRbUzJI0q5T68+dPLkXUS0A8VXRjEWB
C4G5j8OZsb0Q+nTAdI+EjE2IOTMQayHZCjQXOoceO8Kek4FsXO0+HnN0QXyDZS23
LdmY3O8aG0Duz94Gaz+Vl9LmrCeQGRL4tGylKde7hHJmNtJS2ioHehqN2YMLOiCr
VFQW1a3HCNMKOD8Ow5kk9Sv/hUhn1LQ/vK6f5f1ve5N+FOtoGwMLto5BqCVw2ArE
uZFLrXQ6riGSs1SVFR4FjUkL4RFFar98nkAFxSBD3r38s+3LAoQvzlFzQQnSmvUw
7UDznbk5tmf6OlkOcrvP
=dOOp
-----END PGP SIGNATURE-----

--=-aZIPGmNpMMlICSSpvOGT--
