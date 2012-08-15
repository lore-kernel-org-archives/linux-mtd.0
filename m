Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1cHM-0007jB-Af
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 12:00:53 +0000
Message-ID: <1345032317.3393.135.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 15 Aug 2012 15:05:17 +0300
In-Reply-To: <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1N5TP3ENM0yQ4GPwFE/b"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-1N5TP3ENM0yQ4GPwFE/b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-22 at 16:35 -0700, Brian Norris wrote:
> scan_read_raw_oob() is used in only in places where the MTD_OPS_PLACE_OOB
> mode is preferable MTD_OPS_RAW mode, so use MTD_OPS_PLACE_OOB instead.
> MTD_OPS_PLACE_OOB provides the same functionality with the potential[1]
> added bonus of error correction.

Amended the commit message to satisfy Smulik's request, and pushed to
l2-mtd.git, thanks Brian!

You are doing great job de-mystifying the NAND/BBT code! Sometimes I
feel like you are playing too safe and you could be a bit more
aggressive removing half-baked or obviously broken stuff.

--=20
Best Regards,
Artem Bityutskiy

--=-1N5TP3ENM0yQ4GPwFE/b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK5B9AAoJECmIfjd9wqK0dqUP/jLx84K0ThnY72aPogmbkrI6
fvGQOuqRYmIKUTL5EorTVdX3JvlK4okp5x7k2+sI92cEiaerQ14/8U1QyxVl6yiH
4l91Ct7MFGqX9b6DraS85H1lyYjB3NVx6Vgn/eVwxqpsygvaNKHUCZgYheLKVzq/
wzJBhMbmkhFlIVXxK2cydAFIcom/ZLj4rJ58epafGyssyb2C0qxdnYWukhb1RIk9
D3RSXBkK5IAJaYNzl6j4VE+J978Cpku3gxfFG/elKCFfoSOJLyNEm5qxwNXkkprP
c7zlzjLNN0NvEbCryVHFqBwrf7farUJ6gXBx1UvbujVoEB+ftm0khmoXH9uDndOL
AXQrSf13xVoNn1Z7e4CzgU+p5wA/VPRj9Nn3lb2e4iGT+0WMQdPTHWp8/LLkwzyN
b7B6ruQTZ00fv6cVxOeYr5s4hQjata//B/pV3wWEDuY74M626y6vL55eAr2S43cp
DpAj9L1fGnyjxcZeip/KLlZZaoVuBAaqp+jPzbG8M9vuj1WfwqfXyGtG0m0fFB+b
lInKH37BRU8fQE459HV/p6dgbiJEW3LVn+4gaiKPVz0MrERTKFqZpzsMNhJ1PRoh
xJaM2dNWoucd3rwDbQtrpq3AtlakH+SDPddRWO4Rhe6dGpPyJ2blsRq9XYk36hH/
E0V2b6LS73YeUTDywiho
=1tor
-----END PGP SIGNATURE-----

--=-1N5TP3ENM0yQ4GPwFE/b--
