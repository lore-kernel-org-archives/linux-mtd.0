Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Skyax-0006ev-SU
 for linux-mtd@lists.infradead.org; Sat, 30 Jun 2012 14:24:21 +0000
Received: by wibhq4 with SMTP id hq4so1463607wib.0
 for <linux-mtd@lists.infradead.org>; Sat, 30 Jun 2012 07:24:17 -0700 (PDT)
Message-ID: <1341066255.2115.11.camel@koala>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Sat, 30 Jun 2012 17:24:15 +0300
In-Reply-To: <4FEEDAA4.30105@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
 <1341052998.2115.3.camel@koala> <4FEEDAA4.30105@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hanPIbi4WpDE1CixyZsI"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hanPIbi4WpDE1CixyZsI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-06-30 at 12:53 +0200, Richard Weinberger wrote:
> So basically you want me to get rid of any vmalloc()'ed buffer?
> That's not easy.

Yeah, I guess it is difficult, we probably can let it be vmalloc() since
we already have plenty...

--=20
Best Regards,
Artem Bityutskiy

--=-hanPIbi4WpDE1CixyZsI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7wwPAAoJECmIfjd9wqK0+PAP/1LClWFUYFoHdjEamkDV+d6E
F+KFtmC3s0ayD8bMa4nlcbnmGTpu0gqrdakS+WIARsVVRdwJM+Ni4izWeMfRG4P6
jwTmFuG6gDI2alFvy3ThZ2yhH/6ZpjMFtt/Ut6LruogMKymupgGQhai272LWXN8T
3vTxMlXKdhunK21YrY5ZuP1l2xYRuuhsSeWcvOzTiImOsIz71dCHqI9fGYERImhH
hczssMxXSm0T44nH/kusLo3rzRO7rHE+H3MD99xHLyfVWIyKi96ru7O0gBjtY7TL
tcylSbX9HHjJSTHo+ziK7v0EzceOPG8TEaiJxML1BR6reAVd2iQt+4Ug8qKyViyq
K7S9043OzSUUqIIsSH/vXXOWNu8lcSvSL4DcXGjWKss55NWu0s91HPb13KIiJIsQ
41DRr17D/j4z4qY+2JuEimoctXrfdTAGgltHABnTfAB8UtMUp+EnI4v2IAM9Xbme
bilYKDy212+ZKVGlmzLTQdSC0wlc0JemmCCdfTjsS8wEhwaqFHKhDJOR9Wo0xBAq
3Fiab877K0bPCbFK0GTjJWlXmHN7jGMEaxCiGK3LU6+V7mWsIcO3Li476o6y+tpC
ajyRcpDvG2eYcR1arKiQXMz9nmsuLpPl7DeuiqHoG7GKZoMyQG0KMVW4nt3wURC+
pN31D1YV3x5EEBO0JNRR
=EDFu
-----END PGP SIGNATURE-----

--=-hanPIbi4WpDE1CixyZsI--
