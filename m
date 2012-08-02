Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Swou9-0002Fo-QI
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 06:29:06 +0000
Message-ID: <1343889215.25013.14.camel@sauron.fi.intel.com>
Subject: Re: [patch v2] UBIFS: add key state map data structure and accessors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Thu, 02 Aug 2012 09:33:35 +0300
In-Reply-To: <alpine.DEB.2.00.1207081928190.12575@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1206090016010.14953@eristoteles.iwoars.net>
 <1340016236.2420.23.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1207081928190.12575@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lIo4UTj4bt1zr5QRQ9g5"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lIo4UTj4bt1zr5QRQ9g5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-07-08 at 19:30 +0200, Joel Reardon wrote:
> This patch adds the key state map to keymap, a structure that holds the s=
tate
> of all keys in the KSA. The states are defined in an enum, and a get/set
> accessor is added. These accessors are static only: the external interfac=
e
> will simply be "mark used" or "mark deleted" and range checking, along wi=
th
> locking the mutex for the state object, will be done there.
>=20
> The memory is allocated in keymap_init() and keymap_free()
> is added to deallocate the memory. Init is called when mounting is perfor=
med,
> and free is called mounting failed or when unmounting. This was tested us=
ing
> integck along with unit tests for get/set sanity.

Pushed to the joel branch, thanks. I did some amendments on top and
pushed as a separate commit.

--=20
Best Regards,
Artem Bityutskiy

--=-lIo4UTj4bt1zr5QRQ9g5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQGh8/AAoJECmIfjd9wqK0uHoP/ifTH6gA3KygFNZPxWR5GfO7
VPLcaF/JSlzV7MApZWN1V61dqtqVrf1OOxvQObJuclIM7s/5T7tHKA/7WOXpT1VT
vzgnn+It5SibSIipg+dRxHXRQRxzNbuI8aE54G9EH+YCNH0kdJUvsf4/1/e/WJr2
YVLYZgqJQ2w1Cxp97QvECOfGEL8dVuKncb+3T016+FqrWce5rlGEv1nu2ZJ8VBR5
hmy0+KiflUC+Za3B/5Apk2+DVaE/upokawaQxqOMAly7ZI2ntGBPkFjuzeFpvlWv
azd/y+wps3BCi249Kg7eO/1FvTOfESxFZAiclzIvDgU1AkNmux68fbtk87tuaONp
g4GcQV8sGyBapSevyjF+MaKnC4ripDUyIexm7jLuEOEwGFi74cu4vKnR1xkPxDTH
eEN/yCd6o93YNj1qpCkrWqrIVxmksrEcYpMBzypiXrFfrxAy3EAKlSr7zev4SXLP
j0aX+mjW2PC+F80WBPaYng0VK5Vp+SXCFyTJHGH722FN2XObMU2HPIv9MHCb/Ip+
GDZIAcuOSncbDbb/5G/sF8lK91TjnJAJPbcZbVkmvBTY8rbYVy6E9kr3KGchcfau
jfVI3dGfxnDBUXKhqSGWlAM+f2p7QpJgzwb676xTImgda3S/ny6CZ0Pr131lPcok
x2u73oCoMhRY6Sqjr+/w
=Ng+L
-----END PGP SIGNATURE-----

--=-lIo4UTj4bt1zr5QRQ9g5--
