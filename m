Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8o1l-0005ty-SE
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 07:58:30 +0000
Message-ID: <1346745803.12610.9.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] jffs2: don't fail on bitflips in OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 04 Sep 2012 11:03:23 +0300
In-Reply-To: <1346450479-22400-1-git-send-email-computersforpeace@gmail.com>
References: <1346450479-22400-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9k+1ZYrKeB9pCEqRxksP"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9k+1ZYrKeB9pCEqRxksP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-31 at 15:01 -0700, Brian Norris wrote:
> JFFS2 was designed without thought for OOB bitflips, it seems, but they
> can occur and will be reported to JFFS2 via mtd_read_oob()[1]. We don't
> want to fail on these transactions, since the data was corrected.
>=20
> [1] Few drivers report bitflips for OOB-only transactions. With such
>     drivers, this patch should have no effect.
>=20
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: stable@vger.kernel.org

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-9k+1ZYrKeB9pCEqRxksP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRbXLAAoJECmIfjd9wqK0l+wQAIrZEeDgEhjJBoMPB+Y9Hasq
5HG6X70aJ5pnJAsXsDN803vKPyX8WzQfhky/SR1/998n+Jaf6x+0XpPF25Y2+n1p
okM3Rce3aIWgDEcBzvT3bJ4PPDZGbSibtAHMXX4OJmia1UJCyuPq1shQeG9F7roN
zg2fSyMhKdieBGBJa4iHxmPfATyB8tC7es1LZlbgGmMmr8X5CN0qplSDn4n/N7FT
SKS4WT8+3PLIzqNo5IPVTC2zFrHy2OEzXxaw+MN+xPMpQoi+F+/1ZhCvpINRS/Gs
jg15bbmC/ri/REBPtIaAomPTmyKZIzn9Vcyw/F5H9b/XOTAhwB8kNuqO/rFZ7FKg
gvfjef4xMdRPMcKGr0WQHx4GMS+cobSN9nmPSEwbX71a+Z54Hi1mhHaxMSUw2IDX
KfQDbIBiga4hSWy9/7b+pqul3pzlFUs1X2yh9kOs2hTP4fYaCFaO+ERPWLW0ZlGF
E2jQyC8Z1uDefF9Fr2Ul6Jf7vZGSt/kCOx6SjTNWXSi9wZRmFmA2ek9XxO/zrJNZ
LGaXIacs0TkbLPrtndk1mdOfoh+euyrsHmMCT9gj0oxXPLJ5RaiiwPHuutzmu6UA
vEsMfarlpfFqrYXmCleiyPLkmUj5f6m26kl0/neqQ/qX8KLMoqOnDg0ZmRA0JgKb
H4wOy+OsWAAzO1J9Byj4
=qzSG
-----END PGP SIGNATURE-----

--=-9k+1ZYrKeB9pCEqRxksP--
