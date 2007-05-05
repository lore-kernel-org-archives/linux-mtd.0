Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkIne-0000Bf-VS
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 07:51:44 -0400
Subject: Re: UBI: Can I boot with an UBI volume holding a root file system?
From: Artem Bityutskiy <dedekind@infradead.org>
To: John Smith <john@arrows.demon.co.uk>
In-Reply-To: <Pine.LNX.4.33.0705042323250.30567-100000@arrows.demon.co.uk>
References: <Pine.LNX.4.33.0705042323250.30567-100000@arrows.demon.co.uk>
Content-Type: text/plain; charset=utf-8
Date: Sat, 05 May 2007 14:51:37 +0300
Message-Id: <1178365897.3659.91.camel@sauron>
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

On Fri, 2007-05-04 at 23:42 +0100, John Smith wrote:
> I am hoping to build a root file system and store it as a squashfs
> image in a static UBI volume. What command line should I should pass
> to the kernel at boot time?
I am not sure which kernel line to use.

If you have a mtd device mtd0, and want to feed it to ubi, use ubi.mtd=3D0
command. See modinfo ubi. For kernel command line it is the same, but
you should use 'ubi.mtd=3D' instead of 'mtd=3D'.

After the mtd is attached, and if mtd device emulation is enabled, ubi
will create MTD devices corresponding to your volumes.


> There are likely to be other UBI volumes in the UBI partition which
> will each get mapped to a /dev/mtdblock device. Is it going to be
> difficult to identify the major/minor numbers of the device which will
> mapped to my squashfs image?
You may use device names. Majors are dynamic and may change.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
