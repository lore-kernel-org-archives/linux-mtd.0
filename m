Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOTRL-0007ng-Ew
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 13:13:40 +0000
Message-ID: <1350479636.5769.156.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3.6.0-] mtd/spear_smi: use module_platform_driver macro
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Date: Wed, 17 Oct 2012 16:13:56 +0300
In-Reply-To: <1349894399-9715-1-git-send-email-srinivas.kandagatla@st.com>
References: <1349894399-9715-1-git-send-email-srinivas.kandagatla@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3CYsrKoekS9cOV91RNPD"
Mime-Version: 1.0
Cc: shiraz.hashim@st.com, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3CYsrKoekS9cOV91RNPD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-10 at 19:39 +0100, Srinivas KANDAGATLA wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@st.com>
>=20
> This patch removes some code duplication by using
> module_platform_driver.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-3CYsrKoekS9cOV91RNPD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfq8UAAoJECmIfjd9wqK0bJMQAMEJidlhFE2MHOUfkuwfGdCA
6vHqLUAFYiKFUDZZp2MoSw9Ue/w/IDKclULjqzI1SjFGnFgjk7VRI7pucNo7QHlt
OYxwZDCpJnSSeiyNCcM0DHRMjMPm5VVitmdBA1aYSbXWO0ID/6Z/wyk8lGL3AdJB
JPpQQZHrNzAAYtivQ7Gue+1hxCFgy1hilFZPAQMRTXq1yjlcYKWZOu2cEBqTa0CM
Ie1VLCq+8c7PuwZrOCOT6+a3Ob81uuekLDbZkckLxnCdhHU5I8TsNVL1E5Kklyq/
rfQcOtUeEpMkHU/5DoOKov+fKipR3nj58Pe/d4nVdYrCaMxQz8LuLeKa7S38l//v
5meylROpmvwv9XN0qdBWIoqAL1LWqIZ3nxWPCGXHMAFm+ZXbsmS/arqPm4/zBhi4
M4rAmANyIaJK381HV9ksPb8sgpUko6F2AROuOeNk1YYhaVcTtSms03XawfBRC14k
VrrxWmixvYC1GrWTVO+LCLD7LlE9a7nh+0BES8NdbTd4LaiPcr9Jk/6+DKJg/HCV
Of9N0h7r2CSeWHMM2vPxyIjBBg5ThJFWONaUP2byl+yzR9+TeF1ePLQqM5s1gLwt
mqRDY06QZIs2xe3lh4rhi1qQlIyBS+vslOarB5+rqZltVOTJzet1wxjNiqLmjjHY
znEtfHY6nd6eajp5bU+g
=cg+v
-----END PGP SIGNATURE-----

--=-3CYsrKoekS9cOV91RNPD--
