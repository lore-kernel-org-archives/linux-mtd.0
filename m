Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfW3m-0007Pa-0B
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 13:27:47 +0000
Message-ID: <1354541302.11583.11.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Kconfig: drop utf8 characters
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <wolfram@the-dreams.de>
Date: Mon, 03 Dec 2012 15:28:22 +0200
In-Reply-To: <1353971245-26735-1-git-send-email-wolfram@the-dreams.de>
References: <1353971245-26735-1-git-send-email-wolfram@the-dreams.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-PqL+wXkvFGr73sK8TWqR"
Mime-Version: 1.0
Cc: Martin Walch <walch.martin@web.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PqL+wXkvFGr73sK8TWqR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-11-27 at 00:07 +0100, Wolfram Sang wrote:
>  config MTD_NAND_CAFE
> -	tristate "NAND support for OLPC CAF=C3=89 chip"
> +	tristate "NAND support for OLPC CAFE chip"

Wolfram, despite of all of my respect, I have to Nack this patch. We are
livin in 21st century and the world switched to UTF-8. If a lkc has
issues with UTF8 - it is lkc issues - it should rather be fixed.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-PqL+wXkvFGr73sK8TWqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvKj2AAoJECmIfjd9wqK080UQAJNXrw9cbTbyMEfiXfFfGS1F
6P7XMCRvuqFc2n+2vueONQDwN93UX6LJSXIVhv9v2ureXgDi5Bv6NmqOzTPjQBy5
ICH8b0Z8mV3i/uPJAx9igzlP5Ye7LDwTTnLG+vOCwgivHdbzQOCw2inhZkG12Umc
IT0qKY4E5L6Qcrhct6qIM7us7CizIYZEtYVykHFjEZuV8OGfDq/bU/1G2mg+hl7+
g8kkc73PEzgpnfTtEXl4cqK6RgqSVh+oQ/sg+JbCk9H5TnuVyKqCBzAUoPaP/Clf
nOJATpmqNwn7kfWYhfe2XJAWC0NPn32IMfZxknWgbgxYVA7DwkWwcfUAysoaoFHl
aGJWtUglel2VEtrnkaVq7BGVH3RIQEYz968Efppe0u3EjZ3TTJnM4qChIa+LLl9m
LXMc6IYuCzpm0rP+MJ1fgme3aptTu06TFj7Pzo7KQwZGKODqejnFubmy6sBdGBXy
TwTjQjlq5T7z4BJqnETMgvssEoUmXDp+LE1+ddQ+gQrvUFf8/oUhaFL8l0r5i8mQ
AXO6moTLuyu/ehqjsPZR+pKUWe7YU4DsTHMRNXIkJzFnEy7YAZvfL400edlkrhJK
jKOgYJuLEAMvXuhEGoM0F1RZ2sV736bi5rJnLG+mTDACJ/UCG5VNAC4Ki9elfa/o
cmZDgT4HWy0Bw4fjHsTx
=oSuS
-----END PGP SIGNATURE-----

--=-PqL+wXkvFGr73sK8TWqR--
