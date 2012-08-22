Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4BKa-0001dE-An
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 13:50:48 +0000
Message-ID: <1345643706.2848.191.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 16:55:06 +0300
In-Reply-To: <CACQ1gAipH5gfTwOmrhGeESuSju01my_pfA8=sfP5QVCWmbvL9g@mail.gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
 <1345635197.2848.152.camel@sauron.fi.intel.com>
 <CACQ1gAithQd0RMk16atkaaSWZs1CoLnXDe801BP6SvAdVCSKwg@mail.gmail.com>
 <1345636258.2848.156.camel@sauron.fi.intel.com>
 <CACQ1gAipH5gfTwOmrhGeESuSju01my_pfA8=sfP5QVCWmbvL9g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-WZKLpm6zAZLihskDun98"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WZKLpm6zAZLihskDun98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 15:31 +0200, Richard Genoud wrote:
> 2012/8/22 Artem Bityutskiy <dedekind1@gmail.com>:
> > Good. But please, implement this double 'attach' invocation inside
> > 'ubi_attach_mtd()'. Please, introduce a special return code to indicate
> > the 'attached but max_beb_per1024 was ignored' case (say, 1). Add
> > comments explaining the trick.
>=20
> one question:
> - does the call:
> ubiattach -m 2 -b 0
> should fail on an old kernel ?

No, no need to complicate the thing with handling this case.
Let's keep it simple.

--=20
Best Regards,
Artem Bityutskiy

--=-WZKLpm6zAZLihskDun98
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNOS6AAoJECmIfjd9wqK0sbMQAImjRcjbysYkJ8aAYhWi90Ye
71fpd3piDEnXosvJcObfvwg9YrDPzkU50UCsYY/c0d9s7YpqxUaCLeQLQ/ET+Bf7
wzTa4cvGSAZAsTwxeQkSX9vfmFajBPVhGMlzJ3Vz8LWb3nN+R+s2GqsWgL3IzngQ
YYSFSKopLAHc7ol+I+82xg1wiIz1UaBvj1MEB3ByfOFAtLMdu1a93wyERun0gwM4
jCxghRvUrTEwTXgZMrYyCv8QuCeAq2ji4P8htlsdZVydgup1HNwMzQ8X7bxvyDV+
4l1MrQIi2Zr0Jv8D9vfMtkuK701Bf/pbFhPxssjR2ajyD4cf81Ipg1NZRYh6t/tn
3OMSc2J5kQ9dBVfKtup41KSuediQwDC6Cbkl3R7b2L9GUsaZuLAfiFO3aTc3DKjT
zXEo0FCFmhOQFFJJ1TGFfBKYJXxWSJlCCUMZNj9TBVHTnnzQ3X94M1MdwJ8W5S+n
wuWKdgvEzkdKPtFcjNTZrSYX1Na8yuiwdxbiTlUWxtUbG7kU7AjOjajr0sxVr1/f
ZdY0akphuLgJWC/SK3oCpO/iMbMfhYdEKczOQuQLXBj9eyd7XVmGPs2SssWJgaFF
1XmMDT+0vBTEf4LyYvGdSGeiBmVMM7JjVCPUkZ5zO7FBXiArbNDTIZF/O1R4qhou
k5104JAAESfttYeMpdRp
=RVkM
-----END PGP SIGNATURE-----

--=-WZKLpm6zAZLihskDun98--
