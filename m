Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SjrwM-00056n-Ff
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 13:05:50 +0000
Message-ID: <1340802593.3070.3.camel@sauron.fi.intel.com>
Subject: Re: mkfs.ubifs: Exclude path arg
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexey <alexey.knyshev@gmail.com>
Date: Wed, 27 Jun 2012 16:09:53 +0300
In-Reply-To: <1365970.7M11Fyf9F7@alexey-desktop.localdomain>
References: <1365970.7M11Fyf9F7@alexey-desktop.localdomain>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qUY8pN4BN2mU/jFPG5V8"
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


--=-qUY8pN4BN2mU/jFPG5V8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-20 at 16:52 +0400, Alexey wrote:
> --exclude PATH (-z PATH) argument for mkfs.ubifs to exclude PATH (relativ=
e to=20
> the root)

Hi, no objections to the feature in general, but please, split you large
patch and send a nice patch-set instead - reviewable and with one step
per patch. Please, also send patches in-line, with a commit message. Use
"git format-patch" and "git send-email". Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-qUY8pN4BN2mU/jFPG5V8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6wYhAAoJECmIfjd9wqK0RXsQALcHCi9mO61XEQ6hzGZVDrCo
/5sbvsb68u4ijoLz5L0FH+eRInDE0jRzuCc2Dh/R1wKInwLpB5JYtdWy4w0PNFyK
7+FE7Mt2J7yJQCGWRPTuAsu6EUmZwUXEtSicWRPRY+X5rxAXRYyLDVnUUCTIy/Ie
IfAPhXEV8sNNENxa+w49rNAYrFXjHX77JUv4cycsYAOvlocvMW8mR2zUuHT7Jknd
/xawxcd5Xe6ZZK0gwqdhjzkh1l5PZCvEHBtjJADeaBzS2wzbq9lySVvEG3EfOery
eDFZdTHHP8B+p8cKV4m5rBRbfvjjX4FHg8nfR2brDnK2b8tPNenq2szvkFgQnIK8
sV2QOEKJzGY18N0VNtLo9LURHWJMRISjdvCzp94qO26NJe4rT33P4+9jzA1oyHtj
G1rsEtObGCh2CRIcC2MPWcuZLBPZyyKfdQitYH0DZUGx8WdFEakdsVPT98/gLlWI
izEogqaoIcjTSJiNYebgfKzJhA8jQhFB3F8A9dgjZ0xVDl3aUBi18pGwMYVVoltw
AdVnLhMR/BnfEFAx8orxbDu+GqsftKBUUawU1S+ejhPiqweShUWpL8gLcg0KJM7k
8PcYoI1Fu1jI7SwHaGyE9LVecrak0Nl7W4t3VxRAaeto0Rs7Fq8XlOdOxHjfsRRK
NkFIrBK1/GRAUf5gndKG
=v2/o
-----END PGP SIGNATURE-----

--=-qUY8pN4BN2mU/jFPG5V8--
