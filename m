Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IXz0p-00072A-9r
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 08:50:42 -0400
Subject: Re: mkfs.jffs2 and mksum
From: Artem Bityutskiy <dedekind@infradead.org>
To: Timo Piiroinen <timo.piiroinen@tut.fi>
In-Reply-To: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>
References: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Sep 2007 15:50:17 +0300
Message-Id: <1190206217.14370.155.camel@sauron>
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

Hi,

On Wed, 2007-09-19 at 15:45 +0300, Timo Piiroinen wrote:
> I have done jffs2 image with --pad option to match my flash size and it=20
> works fine. However, if I want to use summary, the sumtool creates smalle=
r=20
> image than original padded jffs2 image and the flash isn't fully used.=20
> I write the jffs2 image using bootloader, where I set the size of the=20
> flashing length match the filesize. Is there any way to pad summed=20
> image to larger so that i can fully occupy flash?
> sumtool -p option doesn't allow to set filesize.

If your flash is NAND flash I do not recommend you to pad it because
writing FFs may have side-effects.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
