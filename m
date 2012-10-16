Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TO13y-0004Sg-Is
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2012 06:55:39 +0000
Message-ID: <1350370552.5769.31.camel@sauron.fi.intel.com>
Subject: Re: Unstable bits CEWG project
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 16 Oct 2012 09:55:52 +0300
In-Reply-To: <CALF0-+XMSfxrXDM0GiEfu0jtDHKv7O0hFPtsZ2=LGUcGz-ctVQ@mail.gmail.com>
References: <CALF0-+XMSfxrXDM0GiEfu0jtDHKv7O0hFPtsZ2=LGUcGz-ctVQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+4N5x8xYs3u0rvZiYLPx"
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


--=-+4N5x8xYs3u0rvZiYLPx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-10-15 at 18:28 -0300, Ezequiel Garcia wrote:
> Hello all,
>=20
> I'm considering to propose myself as a candidate for the CEWG funded
> "Unstable bits" project [1].
>=20
> I'd like to know if anyone has considered the posibility of adding
> power-cut emulation to nandsim driver;
> or if this is just a stupid idea.

I'd suggest to add this in UBI instead.

1. nandsim is quite unreadable already and difficult to deal with
2. UBI is cleaner and all the I/O goes through functions in the io.c
   file.
3. By having it in UBI it is possible to force p-c emulation in
   interesting places, like when we are updating the volume table,
   or recovering from a failed write, or torturing a PEB, or writing
   EC/VID headers, or doing something fastmap-related.

   If you do this in nandsim, you will get 99% of power cuts when
   writing data, so you will mostly test this, and very rarely cover
   other places, unless you run for days.

   We passes through this when developing UBIFS, and this is why we
   put the power-cut emulation to UBIFS. I guess nowadays you can move
   it down to UBI.

Also, FYI, we have the integck test which supports emulated power-cut
testing for UBIFS.

--=20
Best Regards,
Artem Bityutskiy

--=-+4N5x8xYs3u0rvZiYLPx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfQT5AAoJECmIfjd9wqK0TesP/1KWeKlpJOOUcGU0VSD2tZHQ
KPeURaHLmBWWTuqLcQIVRIL9XC0sRSh/CEe/+fMI9HRmWxWgSMOaKbFKOE+JjGPI
qh9PkX4N9QP0IyZtwZs/5FWJQT3EaKzajjHyzVRmkxClrvd57R5cMztftVz8ExYO
LG8ZpiED41M1ha6TtdL7gSb24lrA1PTLTSLnmGSkKaKyUPhG2C7habOP50oIc4mH
AoSugwVAMQrkbFY7E43vmYomvk68JbcFmiOd7D1UOCvROJrHNS2Do4XbPdfkS78Z
0J+YGTo9ygoCXMAUBZogUNmLKaZ0T8OuiLRNo2EBc49qFXJZpcZANOyjk2J5Av0y
bVI3aOKu/LBKBqqSb6MqFMXtt9NHuGzV77EtlycM52CcSHc7VUguXT3v0iwpjbrj
8UAfSvqLPIS8uvLyLsFvWcNGHlsMazX9P2/kp8eSIH19StLjLs1kYWY2/VI0aYxn
FAA+QayG8QemN2gBKBWoj3htA61PvrJgvJJ2K7K3sE5aOzbo1cbpZqwaCgwWEBHE
V8sWnKLkYyTV9MKIV9chuVwXle7/YFmhM5JetIbFp5j+G1kKqeTNl+QZMa2lYFIG
HkmmDM02JmURahLWStr+zkvs7EuTyXf/jttLEnP//UB4Z5DmOoqISpRA+W5rSlrH
pU4i8+rrBuVWWVO8KEXc
=2gOb
-----END PGP SIGNATURE-----

--=-+4N5x8xYs3u0rvZiYLPx--
