Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J5dTc-0002Dm-58
	for linux-mtd@lists.infradead.org; Fri, 21 Dec 2007 08:43:34 +0000
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <200712202234.56859.arnd@arndb.de>
References: <20071219154137.23264.28116.sendpatchset@golum>
	<200712191657.24027.arnd@arndb.de> <1198086060.18962.120.camel@sauron>
	<200712202234.56859.arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Date: Fri, 21 Dec 2007 10:43:11 +0200
Message-Id: <1198226591.18962.144.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Frank Haverkamp <haver@vnet.ibm.com>, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-12-20 at 22:34 +0100, Arnd Bergmann wrote:
> > Err, why should MTD know something about what sits on top of it? Today
> > it is UBI, tommorrow it is something new and better, e.g., more
> > scalable.
>=20
> The way you would implement this is to have the UBI code grab hold of all
> the MTD devices, and create the ubi-probe attribute in them. This is
> something that is easily possible with the device model, provided that
> we can get a 'struct device' embedded into 'struct mtd_info'. I just real=
ized
> that this is currently missing.

Ok, now I see what you mean. Well, may be some day we make MTD
LDM-enabled. But apart of this, I really do not see any benefit in
ubi-probe stuff. It's about closer integration of 2 separate things,
which does not sound good for me.

> > Yeah, user-space tools could format media. But it is so much appropriat=
e
> > facility to have UBI being able to format it itself. It is really very
> > convenient. Flashes have special state - empty flash, and if the flash
> > is empty - UBI make it UBI-formatted. If the flash has some garbage -
> > UBI does not format it.=20
>=20
> Ok, another idea: just create an UBI device for every MTD device, but don=
't
> probe until the UBI device is first accessed. That way, you don't need
> any dynamic registration, and you can use an ioctl on the device itself
> in order to do the initial formatting with new parameters.

Well, it is technically possible, but requires a lot of code which does
not really worth it. I still think having a control "misc" device is
quite elegant solution.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
