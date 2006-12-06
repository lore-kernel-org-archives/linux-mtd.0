Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gs2ql-0006s4-7w
	for linux-mtd@lists.infradead.org; Wed, 06 Dec 2006 14:54:41 -0500
Subject: Re: nandwrite v1.0.1 seg faults
From: Artem Bityutskiy <dedekind@infradead.org>
To: Allen Curtis <acurtis@onz.com>
In-Reply-To: <1165433370.3400.0.camel@barja>
References: <fb088a1db743546bf466829c5e7b2656@onz.com>
	<1165433370.3400.0.camel@barja>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Dec 2006 21:54:31 +0200
Message-Id: <1165434871.20337.50.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-12-06 at 22:29 +0300, Vitaly Wool wrote:
> Allen,
>=20
> > I have compiled mtdutils-1.0.1 for the ARM, with the ACL patch provided=
=20
> > on this mailing list. When I run this I get a segmentation fault.=20
> > Version 1.0.0 of the nandwrite utility works fine.
>=20
> Can you please try gdb'ing/stracing/whatever nandwrite?

And try the latest one from mtd-utils.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
