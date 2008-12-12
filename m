Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LB9i6-0008Vx-3Y
	for linux-mtd@lists.infradead.org; Fri, 12 Dec 2008 15:13:46 +0000
Subject: Re: [PATCH] [MTD] [NAND] : Correcting file name in the header section.
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <20081212100650.2c31279e@zod.rchland.ibm.com>
References: <35044.192.168.10.89.1229077681.squirrel@dbdmail.itg.ti.com>
	<37466.192.168.10.89.1229084724.squirrel@dbdmail.itg.ti.com>
	<20081212100650.2c31279e@zod.rchland.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 12 Dec 2008 17:11:30 +0200
Message-Id: <1229094690.13686.426.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Manasa Gangaiah <x0099189@ti.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-12-12 at 10:06 -0500, Josh Boyer wrote:
> On Fri, 12 Dec 2008 17:55:24 +0530 (IST)
> "Manasa Gangaiah" <x0099189@ti.com> wrote:
>=20
> > This patch corrects the file name in the header section.
> >=20
> > Signed-off-by: Manasa Gangaiah <manasa.gangaiah@ti.com>
>=20
> NAK.
>=20
> It would be better to remove them entirely.  That way they don't need
> to be updated again if the file is renamed or moved.

Agree, there is little point in putting file name and path there.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
