Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TiLVY-0007Lt-TF
 for linux-mtd@lists.infradead.org; Tue, 11 Dec 2012 08:48:10 +0000
Message-ID: <1355215744.2657.70.camel@sauron.fi.intel.com>
Subject: Re: Patch to solve NULL pointer dereference in physmap_of.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Date: Tue, 11 Dec 2012 10:49:04 +0200
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3B057ABA@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3ADE0635@SI-MBX14.de.bosch.com>
 <1353483740.2701.1.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3AF1D4E4@SI-MBX14.de.bosch.com>
 <1354276262.30168.102.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3AFC5168@SI-MBX14.de.bosch.com>
 <1355146279.2657.32.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3B057ABA@SI-MBX14.de.bosch.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lecCRWmCKXKnJsZjoj1M"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lecCRWmCKXKnJsZjoj1M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-12-11 at 09:34 +0100, Prins Anton (ST-CO/ENG1.1) wrote:
> Great, I was not aware I was allowed to sign-off. Thx

You should do this in kernel. The idea is to make the chain of people
the patch went through visible. By putting your signed-off you confirm
that this is your patch. By putting my signed-off I confirm that I took
this patch from you. Sometimes there are long s-o-f chains.

--=20
Best Regards,
Artem Bityutskiy

--=-lecCRWmCKXKnJsZjoj1M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxvOAAAoJECmIfjd9wqK0hZcQAJ8hj+aX1ia2HJM8oPT+Glvw
q6D34FHHDSgP4B6CHfSo/wXEZxGG7BYgJXZAIaXu8Ey2H77j3Yblk8ntDeBNOJzW
tKBZY5Mgaw0t8K+WUclNhBvTF7SVYkQFK461c6rKyPstO5yGlYMviMeUakb+qLE1
y7NOQ8EkVDHNSSkkkHLWJpC2eSUhmVBiqA0XNMq8LMH8XLvUVZTxvnh1eSsxv5SM
9jaUNVZfnUrJaqy3gfcYQHpTD/klz+T7oDDPUfPWrm3VebEjDjVL/eNNw+KF0m7c
HXq+g58PF1lbeLsvluhY3ERVwQ7ZbiNhlkkTjfRimnkYfXs4gg7lCaFzTTONsKlJ
ijhkpulB/W0oRZHtzAqCxcgQV3fNW0JxZgwTzuXou8Gp+EG2FAElD6j7+1FPX/jw
VAr3doX4gdmjgKeeWRFDzuFK2Ow2/uD6pLQ6RHql0CCea+AVmKmHqr9yBJbJ6Ev+
QH1HfXEMo36tp9s4Z8614RGOI6ZVuKi4/CquqDcy47DoEtV6H/iWoY33FJEWybO3
rahHjE7yI7b6mOuma82w0Bj+4p1nM8eZB+ZgDUD/E3r1pB1A/b29WDAYKyOwP2h7
RUN9yPMgnMBh7hs99GyC2VIssTrbTubExjiTGsGajjpa2I8gkoMCAQXUahY54UxV
Unr5cbet3WwSvxvpkUI3
=OVrH
-----END PGP SIGNATURE-----

--=-lecCRWmCKXKnJsZjoj1M--
