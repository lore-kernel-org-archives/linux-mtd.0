Received: from [131.228.20.171] (helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq3eF-0005F6-TA
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 08:21:34 +0000
Subject: Re: jffs2_flash_writev(): Non-contiguous write to 00825300 with
	mtd_dataflash
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200611290921.02293.david-b@pacbell.net>
References: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
	<1164717377.576.29.camel@sauron>
	<20061129142607.7546cbad@dhcp-252-105.norway.atmel.com>
	<200611290921.02293.david-b@pacbell.net>
Content-Type: text/plain; charset=utf-8
Date: Fri, 01 Dec 2006 10:21:15 +0200
Message-Id: <1164961275.576.81.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Haavard Skinnemoen <hskinnemoen@atmel.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-11-29 at 09:21 -0800, David Brownell wrote:
> > -	device->flags =3D MTD_CAP_NORFLASH;
> > +	device->flags =3D MTD_WRITEABLE;
>=20
> That "NORFLASH" flag always seemed bogus to me, but it was at the
> time the only way to make the MTD core behave.

I personally not fond of adding capabilities bits to the mtd_info
structure at all...

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
