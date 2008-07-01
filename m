Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KDf64-000356-Ac
	for linux-mtd@lists.infradead.org; Tue, 01 Jul 2008 12:36:36 +0000
Subject: Re: Bootloader support for UBI images
From: Artem Bityutskiy <dedekind@infradead.org>
To: Richard Titmuss <richard_titmuss@logitech.com>
In-Reply-To: <1214915164.6573.75.camel@sauron>
References: <486A184B.3080708@logitech.com> <1214915164.6573.75.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Tue, 01 Jul 2008 15:34:11 +0300
Message-Id: <1214915651.6573.78.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-07-01 at 15:26 +0300, Artem Bityutskiy wrote:
> >  Also I need support for=20
> > renaming multiple volumes atomically when switching images after the=20
> > upgrade. If these sound sensible and useful changes I can look at=20
> > creating patches to add these features.
> Also sounds as a good and useful idea. And implementation should not
> difficult - it is just about changing the volume table. You may count on
> my assistance.
>=20
> I'm just not sure about the interface. Renaming one volume is fine. But
> you need to rename 2, so the interface should be more complex. And if 2,
> why not 3, or 5? Or 16? Or any amount from 1 to UBI_MAX_VOLUMES?

Just a note: I was talking about how would the corresponding UBI
ioctl(s) interface(s) look like. Kernel people are very picky at this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
