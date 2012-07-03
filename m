Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sm1YF-0002pl-Ia
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 11:45:52 +0000
Message-ID: <1341316187.2979.55.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd/spear_smi: Move suspend/resume to follow
 dev_pm_ops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shiraz Hashim <shiraz.hashim@st.com>
Date: Tue, 03 Jul 2012 14:49:47 +0300
In-Reply-To: <1341208727-22476-1-git-send-email-shiraz.hashim@st.com>
References: <1341208727-22476-1-git-send-email-shiraz.hashim@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1M0M9+O/7F5oy5AMyU3+"
Mime-Version: 1.0
Cc: Viresh Kumar <viresh.kumar@st.com>, spear--sw-devel@lists.codex.cro.st.com,
 spear-devel@list.st.com, viresh.linux@gmail.com, linux-mtd@lists.infradead.org,
 sr@denx.de, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1M0M9+O/7F5oy5AMyU3+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-02 at 11:28 +0530, Shiraz Hashim wrote:
> From: Viresh Kumar <viresh.kumar@st.com>
>=20
> Use dev_pm_ops to support PM specific callbacks.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-1M0M9+O/7F5oy5AMyU3+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIbBAABAgAGBQJP8txbAAoJECmIfjd9wqK0f8cP+KX+yJzSeULWimbsi9PffLxs
0ayBog8kLkPOEQHB6OjklRmEShIh9L6HwrAJmIzD2iDl+860LC7wfSvkkIFdJjUE
yUxVzd7RjCdosJ/AW5YP9atitRAjOzGaJ8973x+sSxeS3vKOoSoK/MYUHnOMurUA
upyP3OA3iNW/nabf4y0O1gcH1srq3U9429Z3S1eabjGU0uNQFH0gsu3oMVNZlfTP
hI5vbbsxAaJJf/PNKHdKemJwecReMFQOWDPVmWjo0VrlavBR6xpcoCgjCJWi0OlG
dfRqkmA2EhKNswWWjQKIEH41saAQ2d+0eO1y+x3ImKpzrk+CTGtGUIOx9BC045ej
ziZbddHOpJ5AH9FQdZPDRdIbLfEv6Ar8RIhR3kEWyqIZM2DawSvAJ0rLv5iK4nWS
yu33Wt2+ggyO83J3eQw5H1vPMYak1juIyfxb7SFC16AatVmoh51hzFrwR4Ohhsu7
cUFN4yGNHRfuF2cV2cGNgaB6VH+PGiEI95B7cw0GAub17KuRS/RDJzktPYEZU/7u
2eXSd37YaGx26+/buMLmZZ91QmmDtwfXNfWRmmuxEUMOpicCjDyZAFFheW2KGB3H
Aa3dc02axRUgDWj4Urw1TCFBRZikFQvgJwoEACHxdkE9Ueg/P+g7wnbn3IsEKIBT
OcrRGRGDp6yqSk3lqvQ=
=G7hW
-----END PGP SIGNATURE-----

--=-1M0M9+O/7F5oy5AMyU3+--
