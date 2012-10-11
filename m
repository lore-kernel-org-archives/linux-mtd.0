Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMJov-0004MN-8p
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 14:33:06 +0000
Message-ID: <1349965985.12014.16.camel@sauron.fi.intel.com>
Subject: Re: [bug reportish] UBI_MAX_ERASECOUNTER not used consistently
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2012 17:33:05 +0300
In-Reply-To: <20121005065704.GA26466@elgon.mountain>
References: <20121005065704.GA26466@elgon.mountain>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kMSNymOF8X0/75kYviWn"
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


--=-kMSNymOF8X0/75kYviWn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-10-05 at 09:57 +0300, Dan Carpenter wrote:
> Hi Artem,
>=20
> I normally audit for underflows and I had a question about this code.
>=20
> mtd/ubi/attach.c
>    665  static int early_erase_peb(struct ubi_device *ubi,
>    666                             const struct ubi_attach_info *ai, int =
pnum, int ec)
>    667  {
>    668          int err;
>    669          struct ubi_ec_hdr *ec_hdr;
>    670 =20
>    671          if ((long long)ec >=3D UBI_MAX_ERASECOUNTER) {
>=20
> Casting to long long doesn't serve any purpose.  We normally say that
> "> UBI_MAX_ERASECOUNTER" is invalid but "=3D=3D UBI_MAX_ERASECOUNTER" is =
Ok.
> The "ec" variable is signed and negative values are missed on this
> check.

Yes, the cast is bogus. I can fix it by removing the cast, but would
like to give you a chance to send the patch so that you get the credit
being the author in the git history. Let me know what you prefer.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-kMSNymOF8X0/75kYviWn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdtihAAoJECmIfjd9wqK0CtcQAMUlvFbKMdyVnEUNIZUC9u6y
Fvm499frt7qstZ6ZkA6TWE/Wu9BKIxmG2aczQ+WIsTW6hp+39CUZyAJeOpnxAqRy
1xuDmeL1jACLda50b1bZs4IxOzW2NcHD6q+nZ75nJp1QoaptxpnN0hNgDi75tdg/
LRLD3T0sIKOJA0juVYJtbPo4RtdfSV9LQLgtpS73b6uIz4ndJeu+WQBHUs8kPY+c
NG+18KPkv6uR5aOYtfbIHJauMPpbmOkIwxIWSIARVpTtqAXl6Uy0JmaceQEEoakf
EtEdspGZWFEpB0/nayXv2IR6W1nFcvprBdA0OGMBZx3BceveYx6ScmkZIFGtOBo6
SoyEXRUS+5k3Chsjuei41tbRkB3AGvHFD5C2p7if3AsnRjdMr6oXZkSmE9dhfq6r
lqOm8r1X2nd/Y7nR2X9mB5D+eY0JB9PaMxWQO5u9luugEMzlrwjw1Wn40oQDSu2W
hj+yaeIVd1Fa8m3njqZwoiJ54btNMtVpSbbicSbdBY1KPfKxQSC1qouFET7OhpU/
IdsDl7S1ZYabLHT6yWqD6sMSEIprr+mlE0BnXuQbfrbAKxRWJYNOqio/gq3am389
JNBUsrEzvQMWGkH8ySHtZbuYpSSgcaYGaOP0OLjNfKjNVWt7c/As9XNQWt7dPB2N
SndcjzTeW4Gqlw0jbFYC
=ElfW
-----END PGP SIGNATURE-----

--=-kMSNymOF8X0/75kYviWn--
