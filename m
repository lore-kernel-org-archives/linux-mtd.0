Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K250d-00053a-4r
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 13:51:07 +0000
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
From: Artem Bityutskiy <dedekind@infradead.org>
To: KeunO Park <lastnite@gmail.com>
In-Reply-To: <5ed5c4730805300600v33e9c2d1hada32b24953cfaf7@mail.gmail.com>
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
	<1212129223.31023.106.camel@sauron>
	<5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
	<1212148942.31023.135.camel@sauron> <1212149102.31023.138.camel@sauron>
	<5ed5c4730805300600v33e9c2d1hada32b24953cfaf7@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 30 May 2008 16:49:50 +0300
Message-Id: <1212155390.31023.140.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-30 at 22:00 +0900, KeunO Park wrote:
> > But I have to add that of course, YAFFS/JFFS2 are more light-weight
> > file-system, because they do not maintain the FS index on the flash
> > media. UBIFS does and this costs extra CPU cycles and extra I/O.
> >
>=20
> actually I did write & fsync the file during test. :-)
> anyway thank you for your comment.

Could you please send your test? And how you measure the load average?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
