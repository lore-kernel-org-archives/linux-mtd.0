Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbUiD-0000ok-TG
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2011 10:08:22 +0000
Received: by ghrr15 with SMTP id r15so308222ghr.36
 for <linux-mtd@lists.infradead.org>; Fri, 16 Dec 2011 02:08:19 -0800 (PST)
Message-ID: <1324030184.15774.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 16 Dec 2011 12:09:44 +0200
In-Reply-To: <4EE90B28.7030708@newsguy.com>
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
 <1323009827.9400.75.camel@sauron.fi.intel.com>
 <4EDB89E9.6070306@newsguy.com> <1323065234.2316.2.camel@koala>
 <4EDCF840.7050107@newsguy.com> <4EDCFAAC.90709@bitbox.co.uk>
 <4EDD142B.6090303@newsguy.com> <87hb1de5b6.fsf@free.fr>
 <4EDECC7A.1080202@newsguy.com>
 <Pine.LNX.4.64.1112070848340.32119@lnxricardw.se.axis.com>
 <4EDFB142.6050208@newsguy.com>
 <1323694138.24509.21.camel@sauron.fi.intel.com>
 <4EE90B28.7030708@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YEv3GBcXPBzdWyVc0mpo"
Mime-Version: 1.0
Cc: Peter Horton <phorton@bitbox.co.uk>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YEv3GBcXPBzdWyVc0mpo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-12-14 at 12:46 -0800, Mike Dunn wrote:
> Here's a proposed patch set:
>=20
> 1. mtd api changed so that read() and read_oob() return bitflip info (LAR=
GE,
> essentially the previous patch)
> 2. Unpartitioned devices go through the partitioning code (small patch)
> 3. Add ecc_strength to struct mtd_info, backport to drivers (moderate pat=
ch)
> 4. Implement functionality to intelligently decide whether to return -EUC=
LEAN or
> 0; add sysfs controls (moderate patch)

Sounds good. Send patches :) You could already have done step 1 at
least :-) Remember, you have less and less time to get into 3.3, let's
make sure at least the big step 1 gets there and gets tested.

--=20
Best Regards,
Artem Bityutskiy

--=-YEv3GBcXPBzdWyVc0mpo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO6xjoAAoJECmIfjd9wqK05C0QALnSN0fYxvJs7reMYqglUiBs
p3KuY/Vd1gpH0RIwlvWUAaC0OrdKW+vTjxp1V5gq0dAcRCuBsG//42BIJRqJ5oTY
f1pBmgoCe2fhWZVv0wBXRtdhUVLjVDmsVrFyMzGxj1MF0fAol+je3AFm4ccshazr
lgekZuwqy6FMqjoZXxULzAM+kojQTLohP9VBFG2fZOa7Re8so723LfVC33YNfwd9
p7QADcnZ5h0OcyuvqWpmjx2vz8AK96M08vOaYcvjyiwgPFLZECQItm2kTXkfq36G
jNNXbD2EkuG9SJSXpat1pO+Viwf8KMYECd0MyrAwiLdAPBiE8XWIPNYOZlSYeYBo
T9yXpuUx02FD3fSLrWBaDnCC00dsclVlysc6pGV3+WLXWoqhwWmZlMQ6fD5EK5KP
s/W8CShxyf1W7UnaPGxSR/mQkgOGJxuZS5o6wlWh/0qA4QodvEzStc9BLfEO3Yg0
cGjVG7GOZD/DPiD2dQy494qzLjaCNZxvNdGvvI2G+GZu4t1eyMGwbuywN5ySETK6
JP5t0GKVGgETejQdJuZUBFxRk1YnLw0DplktW5PXUqolVN3kllmb0XtYAXAQVMVn
RHHP5r5rH3ygibgrvz/vIFmAqK8LR9coo4SfaL8i2KeRFKT/yzPDxCLoD/jgea9b
tpBhBB+GZYVIYcYb1iSx
=H3Az
-----END PGP SIGNATURE-----

--=-YEv3GBcXPBzdWyVc0mpo--
