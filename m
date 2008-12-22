Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LEeBt-0001ol-WD
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2008 06:22:58 +0000
Subject: Re: UBIFS option to make volume not do compression
From: Artem Bityutskiy <dedekind@infradead.org>
To: Philip Rakity <prakity@yahoo.com>
In-Reply-To: <509116.73555.qm@web58907.mail.re1.yahoo.com>
References: <mailman.11.1229706002.1545.linux-mtd@lists.infradead.org>
	<509116.73555.qm@web58907.mail.re1.yahoo.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 22 Dec 2008 08:23:59 +0200
Message-Id: <1229927039.2756.18.camel@sauron>
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

On Sun, 2008-12-21 at 10:47 -0800, Philip Rakity wrote:
> >From Documentation/filesystems/ubifs.txt:
>=20
> >compr=3Dnone              override defoult comressor and set it to "none=
"
> >compr=3Dlzo               override defoult comressor and set it to "lzo"
> >compr=3Dzlib              override defoult comressor and set it to "zlib=
"
>=20
> >Just make sure you use up-to-date UBIFS, because this was added
> >recently. And I guess this should also be mentioned somewhere on the web
> >site.
>=20
> Source browsed the mtd git on the mtd website.  No references to the abov=
e in
> the documentation.  Did I look at wrong git ?
>=20
> An FAQ edit would be nice.

You may find the up-to-date ubifs.txt in the ubifs-2.6.git
(see http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source) or
in the current Linus's tree.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
