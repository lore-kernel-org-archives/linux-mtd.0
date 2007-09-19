Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IY0JD-0008JM-Bj
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 10:13:47 -0400
Subject: Re: mkfs.jffs2 and mksum
From: Artem Bityutskiy <dedekind@infradead.org>
To: Timo Piiroinen <timo.piiroinen@tut.fi>
In-Reply-To: <46F12C4D.9060204@tut.fi>
References: <Pine.LNX.4.64.0709191538050.1701@assari.cc.tut.fi>
	<1190206217.14370.155.camel@sauron>  <46F12C4D.9060204@tut.fi>
Content-Type: text/plain; charset=utf-8
Date: Wed, 19 Sep 2007 17:13:12 +0300
Message-Id: <1190211192.14370.166.camel@sauron>
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

On Wed, 2007-09-19 at 17:03 +0300, Timo Piiroinen wrote:
> Yes it is NAND flash. I tried to add dummy file to my filesystem to=20
> increase the size of image and after that remove that dummy file to free=20
> space, unfortunately I couldn't remove the file cause the filesystem was=20
> 100% full,
> and that's the real problem.

Just do not pad FS image at all. You do not have to. Just leave the rest
of the flash to contain all 0xFF, i.e., erase it before flashing.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
