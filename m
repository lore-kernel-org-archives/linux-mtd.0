Received: from dev.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UbvKx-0000ci-V8
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 16:10:56 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: dedekind1@gmail.com
Subject: Re: [PATCH [mtd-utils] 3/3] mkfs.ubifs: allow reformatting of devices
Date: Mon, 13 May 2013 12:10:28 -0400
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
 <201305101126.01644.vapier@gentoo.org>
 <1368432848.5360.32.camel@sauron.fi.intel.com>
In-Reply-To: <1368432848.5360.32.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3042482.Q7Ki1PfZhQ";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201305131210.29677.vapier@gentoo.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart3042482.Q7Ki1PfZhQ
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 13 May 2013 04:14:08 Artem Bityutskiy wrote:
> On Fri, 2013-05-10 at 11:26 -0400, Mike Frysinger wrote:
> > On Friday 10 May 2013 03:07:53 Ricard Wanderlof wrote:
> > > On Wed, 8 May 2013, Mike Frysinger wrote:
> > > > Sometimes I want to re-initialize an existing ubifs, but the tool
> > > > currently bails out if the volume is already formatted.  Prompt the
> > > > user instead so they can decide.
> > > >=20
> > > >     {"max-leb-cnt",        1, NULL, 'c'},
> > > >     {"output",             1, NULL, 'o'},
> > > >     {"devtable",           1, NULL, 'D'},
> > > >=20
> > > > +   {"yes",                0, NULL, 'y'},
> > > >=20
> > > >     {"help",               0, NULL, 'h'},
> > > >     {"verbose",            0, NULL, 'v'},
> > > >     {"version",            0, NULL, 'V'},
> > > >=20
> > > > @@ -191,6 +193,7 @@ static const char *helptext =3D
> > > > "-U, --squash-uids        squash owners making all files owned by
> > > > root\n" "-l, --log-lebs=3DCOUNT     count of erase blocks for the l=
og
> > > > (used only for\n" "                         debugging)\n"
> > > > +"-y, --yes                assume the answer is \"yes\" for all
> > > > questions\n" ...
> > >=20
> > > Wouldn't it be better to have a specific option for this specific cas=
e,
> > > rather than a general yes-to-everything option?
> >=20
> > this is the standard that the various mtd tools (including a bunch of U=
BI
> > ones) follow
> >=20
> > > The latter makes sense
> > > with programs such as fsck where the only prompt basically is 'I found
> > > a fault, shall I fix it?', but in this is case it can be difficult to
> > > predict the outcome should the option start to cover more potential
> > > questions in the future.
> >=20
> > if you want to compare to standard tools, then the check would be dropp=
ed
> > entirely.  when i run `mke2fs /dev/sda1`, it doesn't prompt me.
>=20
> I admit I was not careful enough with the options. Feel free to change
> the tools in the more direction of being more consistent with mainstream
> filesystems' tools.

i don't mind having it prompting first as long as there is a flag to overri=
de=20
it.  i'd say let's take a survey of the community, but i think we both know=
=20
that's doomed to go nowhere :).
=2Dmike

--nextPart3042482.Q7Ki1PfZhQ
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRkRB1AAoJEEFjO5/oN/WB8+QP/0PwNIhJDTAgDQAsus/tm89t
QdiKKVg0J0U57oqziZIY8KkOIKmINfhEDrSZ5qryyX0NttgmWRvGz83P8YYhhTZo
OfJnaB/3J/RARVGQBSc9kNJCMU6JrBjJuk4fViJ8vJKyHcmd4coHpgi3BR9a6GjU
itStsMnbCMYeP8HWyXoLHsEjVomqh4aA+kEgbrG5ks84suw4rySrVYJQATDhDgjE
HsrFq2WCP2wdqr04or/6xTQiwL3s/CuXIWAcFb3uRa3a1mivEfC8HahhUG1SvGYD
+VEIwOS3JtrWZFq1zSkd6gfomxUYQpJmBFUdVsjZWGC67xy+Sv9i9ku/yt1u6R8C
+LFK+3LgHtYbvOqKOBk43Goe2F7cMvWfvMixdbEX/Ry/+PSCmPm4G/ErjzGJVq10
Fl2FutHYlkTB6kKi9cl+4RiKdMBNdZRaP2TCnXedT9J/I+fJfmqp8/7jIVmP1+mv
4bRicPsfgx0W1fdDBDmKmm/caw8qwwars/yQzGOaiOREUNaJ/NAjzOZjmbppy2dC
neph4FXHoHgPV6aKNCKa6jNwAkaL+TgzWEU4odFq1V22vuBWnA1zAD9PK8tzL3KU
vyXqY8/YPWn1KDf6Ech9m55WZjGyzWsJN7MBC0BmR+j5BCDcy05e6sHlCBfMu+YP
r3I6PaEhhcNbHcPnaxYL
=KxDU
-----END PGP SIGNATURE-----

--nextPart3042482.Q7Ki1PfZhQ--
