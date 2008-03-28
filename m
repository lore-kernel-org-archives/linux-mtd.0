Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JfGaA-0002aq-2U
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 15:33:31 +0000
Subject: Re: [PATCH] ubi_create_gluebi: Initialize static volumes with
	vol->used_bytes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jan Altenberg <jan.altenberg@linutronix.de>
In-Reply-To: <1206717233.5461.31.camel@jan-laptop>
References: <1206717233.5461.31.camel@jan-laptop>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2008 17:29:04 +0200
Message-Id: <1206718144.3856.77.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-03-28 at 16:13 +0100, Jan Altenberg wrote:
> Hi all,
>=20
> I came across a problem which seems to be present since:
>=20
> commit 941dfb07ed91451b1c58626a0d258dfdf468b593
> UBI: set correct gluebi device size
>=20
> ubi_create_gluebi() leaves mtd->size =3D 0 for static volumes. So even
> existing static volumes are initialized with a size of 0.
> See attached patch (applies on top of latest git).

Fair enough, applied, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
