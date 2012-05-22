Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWm83-0000cs-Ex
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 10:15:48 +0000
Message-ID: <1337681963.2483.140.camel@sauron.fi.intel.com>
Subject: Re: Resizing of an existing UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Tue, 22 May 2012 13:19:23 +0300
In-Reply-To: <Pine.LNX.4.64.1205221138410.4247@lnxricardw.se.axis.com>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
 <1337674258.2483.123.camel@sauron.fi.intel.com> <4FBB5B82.8070009@bury.com>
 <Pine.LNX.4.64.1205221138410.4247@lnxricardw.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kerFq2KIZINL7FHZgIms"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Homann <homann@bury.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kerFq2KIZINL7FHZgIms
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 11:40 +0200, Ricard Wanderlof wrote:
> On Tue, 22 May 2012, Robert Homann wrote:
>=20
> > On 05/22/2012 10:10 AM, Artem Bityutskiy wrote:
> >
> >> amend the indexing information. This is not a simple task, but doable.
> >
> > Thank you a lot for the quick answers! Looks like I need to learn a lot=
=20
> > of details about UBIFS, should I really decide to make such a tool. I'l=
l=20
> > think it through again... :)
>=20
> It would also be nice if such a tool could reduce the size of a UBIFS=20
> volume (given that there is enough free space to do so). That could be=
=20
> useful if the contents of a flash at a given point needed to be compacted=
=20
> for make room for an additional volume for instance.

Yeah, if someone wrote such a tool, it would make sense to support
shrinking as well, because it is roughly a similar thin - you need to
relocate data from the end, amend the index and probably some other
UBIFS data-structures.

--=20
Best Regards,
Artem Bityutskiy

--=-kerFq2KIZINL7FHZgIms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu2grAAoJECmIfjd9wqK0PI8P/3/KGrDuuPsUFuM+1FI63M1V
yXUAXWKIsrUtKpOpuatn55AG17uM7Nyh7bMRdhIniOu3Q86nPP4VcWjyz3LvmyyM
szM6WceAZm2hv9Sr8hHRBNtz8v/FKLmxJ0USZx1mmhTFNZCbbxcoHfCHI1YaCD2k
epPw5sqZksMXl68WQmdT3RixLBxCFKqy1ypNkuA2fcIlBGJgPtuH1KX3uObcZhZ3
mG9YoXJQtRKNqBDh/Hw9ko1t/YYvqhhvNeBY9ZsFb8zVIcUMJeDmQf9dE3rTtv8X
0vP/xjCv2CeAP3k+Za2YzT8uJIYuSBHlUrLy0NuxwmLnh3P8pg95nb3qftFzng+n
e25P682ZqU86MI0ljeLCJST+PEKykRZFxxeNFcHAgyLkNXLoBPLwhwJPJpLBqdeR
reXCD5tbieeH4haJK5OTFiIqT5q0cFdROvNj0Awo19PAxOlZ6wERh/8mnnqEnUDi
5lgpbCVl6SCG2qwIkpnJMST5rFJRvf487LWKc6trD5fIubUXgTBikpy8NcfhNsN3
E0+eKMZy7BiMhzOO+PfSfYN7TePFxbotUerO3JcfOU3006gWfaS98vk7lf6Ch5XP
/phkMOfnLp5/HXLJoUrUg5iMgWfdXr5JmUeRvn5M7Cq24NmThdJOZRxOlNXOj6s8
w+c+4si8qNMb2ANbIwZv
=RtmB
-----END PGP SIGNATURE-----

--=-kerFq2KIZINL7FHZgIms--
