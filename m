Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvmta-0006bi-6T
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 10:40:31 +0000
Message-ID: <1358419318.2731.218.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: m25p80: Flash protection support for STmicro chips
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Austin Boyle <Austin.Boyle@aviatnet.com>
Date: Thu, 17 Jan 2013 12:41:58 +0200
In-Reply-To: <1357257748.31023.12.camel@pc786-ubu.GNET.GLOBAL.VPN>
References: <1357257748.31023.12.camel@pc786-ubu.GNET.GLOBAL.VPN>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-WpyN74ceTYkPetSLAioR"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WpyN74ceTYkPetSLAioR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-01-04 at 13:02 +1300, Austin Boyle wrote:
> This patch adds generic support for flash protection on STmicro chips.
> On chips with less than 3 protection bits, the unused bits are don't care=
s
> and so can be written anyway. The lock function will only change the
> protection bits if it would not unlock other areas. Similarly, the unlock
> function will not lock currently unlocked areas. Tested on the m25p64.
>=20
> From: Austin Boyle <Austin.Boyle@aviatnet.com>
> Signed-off-by: Austin Boyle <Austin.Boyle@aviatnet.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-WpyN74ceTYkPetSLAioR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ99V2AAoJECmIfjd9wqK0H2cP/1Qg0pPTCCqdHB80lTJqZ6iL
/iMPqbH27lCSvgYxBHuz/8TIxfqksHacIE62lFGC7Aptau7wKIpy9Lw+SZZ7jVFl
YBDx+MW6j633FKdUWvpZHQuyd006aFCsYAl/HUFHm1mkm0q5kGJXGU3zAjRsrHr6
2paZ2NCqUZtojcDcBsLabCW908YccN1Lv8f6aST2OtCRmqsGsVVAYXRsoQe8gfsX
8XvWhhtYk8gUbma61s6t2r42XsKsNuBN789qNyFvoVguAfdOpz05D08cWw+I2Cve
OFZxyn58OcV+Gc5guV7r5AP7XbIWZ3+lf51Rf7KmbL5f0ayxXo0ASS+J239yr1gU
vteGsYmuF7Cjlm6o5JDwcf5UQBi0tUqoJLe924rmZhmPgSpCx67WwkNuLobpU3Gi
NW17eBZXIa5xRlMrbJN8NLCyel3TBjSBa5PYCqAmVPJkEfH1V/eHpA9CgPE9bQJL
uVVELnGdQtDCngcdc1LdlbLGmCso5l61rlYcv8AKIeG9Y/yUPmcno3nAEW06lxHu
bO0MBK15rvlDbIuBW0KRr3vAnC8eVrXrLYsg+jPY6APvcstgXwgfhUHNAU0WAVJm
uZ07w7aHMtLudBfduNrE7fB79RLBFfK3Pa6ECGsrdZ/ugAYdCxO6TPztmEJcJ0Et
xF4TzdwkDHWcUAecJSsW
=hKcS
-----END PGP SIGNATURE-----

--=-WpyN74ceTYkPetSLAioR--
