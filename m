Received: from smail2.alcatel.fr ([64.208.49.57])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZLIq-0005xW-0I
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 11:09:01 +0000
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Wed, 22 Jun 2011 13:08:44 +0200
Subject: RE: [PATCH upstream] nand: nand_base: Always initialise oob_poi
	before writing OOB data
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DDB3@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AACE12D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1308722112.18119.36.camel@sauron>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059AB4DD8D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1308740228.18119.70.camel@sauron>
In-Reply-To: <1308740228.18119.70.camel@sauron>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem wrote:

> I did not figure out why you sent 2 separate patches. Usually=20
> it is one patch which goes upstream, then GregKH and others=20
> pick it up and back ports to various stable trees. If they=20
> have issues, they may come and ask for help. So there should=20
> be 1 patch.
>=20
> >  That patch version (v3)did
> > not remove the final memset from nand_do_write_oob, as you=20
> requested.
>=20
> Did I request so? I thought I just expressed a thought that=20
> the memset is redundant and should be killed, and I thought=20
> you'd take a deeper look and decide whether it is safe to do or not.
>=20
> > Named both patches the same as they were pretty much indentical,=20
> > except for the memset. Didn't know the convention for patch naming=20
> > where one was going to stable, and the other to the latest=20
> so marked=20
> > the latest as upstream to differentiate.
>=20
> So do we need that memset or not? :-)

The original request was for a stable patch, and that would be accepted
if I provided a proper tidy fix also. To be fair it was a few weeks ago
now that that mail was sent. :-) Anyway, as it turns out the tidy fix was
almost identical, and we don't need the memset as far as I can tell
from reviewing code and from testing. Will run up your patch today to
verify your additional change, but should be fine.

>=20
> --
> Best Regards,
> Artem Bityutskiy
>=20
>=20

Thanks

Adam=
