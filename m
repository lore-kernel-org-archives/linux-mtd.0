Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZ0M6-0001rw-UX
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 14:23:48 +0000
Message-ID: <1352989463.2221.59.camel@sauron.fi.intel.com>
Subject: Re: ubifs  can not be mounted rw : could not find an empty LEB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Thu, 15 Nov 2012 16:24:23 +0200
In-Reply-To: <5098D625.7050103@parrot.com>
References: <5098D625.7050103@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-aW5dahkjHy2YktWFqoov"
Mime-Version: 1.0
Cc: Artem Bityutskiy <dedekind@infradead.org>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-aW5dahkjHy2YktWFqoov
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-11-06 at 10:19 +0100, Matthieu CASTET wrote:
> Hi,
>=20
> on some of our product, when we try to mount a partition rw, we got the e=
rror :
> could not find an empty LEB and mount return "No space left on device".

The symptoms are the same as the symptoms of the problem I recently
fixed. Please, see the following 2 patches in linux-ubifs.git:

UBIFS: introduce categorized lprops counter
UBIFS: fix mounting problems after power cuts

I'll send them to Linus for 3.7 shortly.

--=20
Best Regards,
Artem Bityutskiy

--=-aW5dahkjHy2YktWFqoov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpPsXAAoJECmIfjd9wqK0K08QALWD7UvDA7SXRNDpEIg3kUxK
4grVXk06wiO4jbY6logpkx/VeHuDpPnnJiUZyqCw0jOWFJBzw1DrXnb2KAnH2inA
a1BsGBdFAO+f8G3dej9aPTpZPfOMsi/lLQFCw0LXWc+/wf6Q5Wf+jHM0ZtnosA20
nSSB3GQv/zwbeBiW+ztQixNfGUXumCileJyqa9Lgrk023C1rc4X90OChxYj4vebd
e+epm+SHvW3bmQppEEpylPeSILXIgE96S9iapyvFWEi2l3vsJSS8KoM4pZO+fHsE
OUgPRAd4WKceYPUIaXp28IHge2WrVIOCSKuF6IyscuH7NifLWA9pB9zUQq8RZsPr
In9rcycYup27BKBXeDVhp5+AXOQnqrWEq8GKLsVtyjhzhD3posMJ2HA1vUIy7Dpp
VMbXqON4GBAOBz9eESamd/umxO9+1n6Vggji8MU8q9RHBvZ0ml8AXUmiKQ7YAeF7
DgKzxyRCE6NV0Wff89HESan6K5JECLpYYtvXqC2mLoWK+ReqKkdQO5M0cpuW2q+l
DQs/tOgSpAMtNrsC4pRcCYMdNLvvoDHNqzD+OokewBsp977YSq9MigKjE2mfXnG7
RRbthhqylOr2XfiTorja720WW15PhgVkypB6BKFicYXudf7S+cn0HF8sz38JegNg
bmRLPyE8edWTMowittuJ
=FNcj
-----END PGP SIGNATURE-----

--=-aW5dahkjHy2YktWFqoov--
