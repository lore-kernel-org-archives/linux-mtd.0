Message-ID: <1349954121.12014.9.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] mtd: st fsmc_nand: pass the ale and cmd resource
 via resource
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Thu, 11 Oct 2012 14:15:21 +0300
In-Reply-To: <1349356456-13371-1-git-send-email-plagnioj@jcrosoft.com>
References: <1349356456-13371-1-git-send-email-plagnioj@jcrosoft.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mmD2qDIgIXUqRamvHdzi"
Mime-Version: 1.0
Cc: Vipin Kumar <vipin.kumar@st.com>, devicetree-discuss@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mmD2qDIgIXUqRamvHdzi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-10-04 at 15:14 +0200, Jean-Christophe PLAGNIOL-VILLARD
wrote:
> Do not use the platform_data to pass resource and be smart in the drivers=
.
> Just pass it via resource
>=20
> Switch to devm_request_and_ioremap at the sametime
>=20
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-mmD2qDIgIXUqRamvHdzi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdqpJAAoJECmIfjd9wqK0sAEP/0RmpdhuUygucA+ZlF9HufDS
BYSmUJVMkuKZoZuAlHhFGxgGWNdCVbp0lnZ9DjkAQTVbszT9ECzOBlwJee/cAcPZ
UZQMQ4CbwWQx0nR5tjWMNa2JnB04hn7ciE8VxtftX4CGur6/d2HwajLDfn2h1ylF
bSHxu09YCZkvmfcmAenecQWCn3zFiqK9dMrP1N+ZQFMdnJDgeN20MPaVts5VVwxd
lcAh3OV+I+wIca2z3RDNqVwo4+WQ7qYys+HKUWl8cc1gkw/H9lArgi07Dz4V2Bvc
RIXWys6qb7uBJq6coVR62r3GJNHC+n/RoTsiWcdpago3Wspz3Rf4VVja4qfQCK55
qqgTSDzhxQXTQIeVVQ5XIWt+9n0cLzhExJjpneIkyqh+9GRZRRbHbBrDzK9lBcMl
TEJLH42eWWZicqdZOzbOpaF6j9WjLlHoUwpmbKcKdoHeubGD/R1x7hTm4YfAGZDL
YwWYBinLA55g9a3Z7At6fEoWGa/Mmo2KtFfpLZ/xzXgYVw7hhFeRei3ujFLK/ts1
2ItCNYlhKeDNJGuDawj3/odPE05IRC+etwdqzpYkv7elucWhruV92DrLLgGpEeK/
naXNeFE6xxqeiRiXd4wo/fWVMnQtTsHSJWLaMafDtLKiEddXs7oZuZTZbY5B+V+a
sagquHKHOVB39cRbC/mf
=v4C9
-----END PGP SIGNATURE-----

--=-mmD2qDIgIXUqRamvHdzi--
