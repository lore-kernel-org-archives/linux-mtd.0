Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrWyH-0006Yo-SS
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 16:19:32 +0000
Received: by lbbgg6 with SMTP id gg6so2397623lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 09:19:24 -0700 (PDT)
Message-ID: <1342628031.9105.6.camel@brekeke>
Subject: Re: [PATCH 1/3] mtd: m25p80: add support for Spansion s25sl064p chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marex@denx.de>, Rob Herring <rob.herring@calxeda.com>
Date: Wed, 18 Jul 2012 19:13:51 +0300
In-Reply-To: <201207181808.15833.marex@denx.de>
References: <1341555027-17462-1-git-send-email-marex@denx.de>
 <1342627074.9105.0.camel@brekeke> <201207181808.15833.marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+oLFRuQbZlBDmCk3PFJS"
Mime-Version: 1.0
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+oLFRuQbZlBDmCk3PFJS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-18 at 18:08 +0200, Marek Vasut wrote:
> Dear Artem Bityutskiy,
>=20
> > On Fri, 2012-07-06 at 08:10 +0200, Marek Vasut wrote:
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > > Cc: David Woodhouse <david.woodhouse@intel.com>
> >=20
> > Pushed 1/3 and 2/3 to l2-mtd.git, thanks!
>=20
> Thanks, Artem. Could you please suggest where to document the property ad=
ded in=20
> 3/3 please?

Rob Herring responded to me last time, let's try to ask him. Rob, the
question is here:

http://lists.infradead.org/pipermail/linux-mtd/2012-July/042752.html

"NOTE: I'm not sure where to document this property, as m25p80 is
      a simple DT device. Any hints please?"

--=20
Best Regards,
Artem Bityutskiy

--=-+oLFRuQbZlBDmCk3PFJS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBuC/AAoJECmIfjd9wqK0peoQALKZfnb/j1N7O9exukLQhsaB
EqD1ix+D7Ribk+5Q3rYfa1eDP4gfKz1PZYy8Di5rvpHUo1XAO2gihoB7jDToCQF7
tXJj//pXYUrkG9FS12dCLJQ9gqO0ob30ADsjqhwlHUbnP99G+TTlEVaVO/EbWnaV
kkja5jKRxTQ6HqafvFnvoiD+tOPmyeKSzpV8Y7NL7i8A1OZMigGWlF0qOUz1YVtQ
kbdN0T0FOrixxmnvGbuMYb1Od87Jx2cg6qEe9VKdAlqek2a+SotN5wbYXwC5SD88
cvS9ZkM8I9KzP0Eyan6qRyztk7vRL+fne2pznrswBD3iZ672SMXXrMcrwZn2v4fs
X7dEddYk4xQ1HDJXlrrAU2KEubTad0RSRQEsA8cF2uf3z8W4SWdbMM84tf2z7bdj
vKt3TJjYYOmD8E6loVufi2dh4liyUF1zHaakX+Oe/tPjVV/zasFW/ErwjmoJ2K5T
oflNphoHzIxWef0lH7UX+bflcGw9slB6bWKidvNut49hNhp/cEHbAt3pBAbrHey6
W0KZkANAZP7ocEqW6N+XKCmsOt/021Hd8jjrtcvnVQT6a2DU51fqqfoV+oqzRNPG
2UMgDGKVVngS1AeeqzEEE3LAbyd6cQCdDtbRA2XbFOdNrp5CmDWJnscKfSh21t3k
qjdnpg7fPcfTM4svu8oH
=c8+S
-----END PGP SIGNATURE-----

--=-+oLFRuQbZlBDmCk3PFJS--
