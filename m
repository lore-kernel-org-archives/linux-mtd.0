Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnXtb-0003pg-K1
	for linux-mtd@lists.infradead.org; Mon, 14 May 2007 06:35:17 -0400
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
In-Reply-To: <1179133533.21753.13.camel@localhost.localdomain>
References: <1179133533.21753.13.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Mon, 14 May 2007 13:34:52 +0300
Message-Id: <1179138892.3642.5.camel@sauron>
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

On Mon, 2007-05-14 at 11:05 +0200, Hans-Christian Egtvedt wrote:
> Hello,
>=20
> I am trying to mount an JFFS2 image made with mkfs.jffs2 on my x86
> laptop. The image is made with --big-endian set.

I think you cannot do this without re-compiling JFFS2. I am not sure,
just glance to the code (to je32_to_cpu and the like macros).

> I do the following:
> modprobe mtdram total_size=3D8192 erase_size=3D64
> modprobe mtdchar
> modprobe mtdblock
> modprobe jffs2
> dd if=3Djffs2.image of=3D/dev/mtd0
> mount -t jffs2 /dev/mtdblock0 /some/mount/point

FYI, mtdblock is not needed and is ancient and confusing way to mount
jffs2.=20

http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
