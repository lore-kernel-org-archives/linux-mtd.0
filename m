Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFqtY-000531-9i
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 13:04:34 +0000
Subject: Re: question about node creation /dev/mtd*
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <20080118064432.19233a37@zod.rchland.ibm.com>
References: <479097B7.9050401@gmail.com>
	<20080118064432.19233a37@zod.rchland.ibm.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 18 Jan 2008 14:56:42 +0200
Message-Id: <1200661002.6934.23.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, vicky <vicky.irobot@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-01-18 at 06:44 -0600, Josh Boyer wrote:
> On Fri, 18 Jan 2008 17:42:39 +0530
> vicky <vicky.irobot@gmail.com> wrote:
>=20
> > Hi,
> >=20
> > I have enabled mtd in my config. When I boot from the updated kernel I=20
> > find that /dev/mtdblock is not created?
> >=20
> > How does the /dev/mtdblock get created? I didn't find this in the=20
> > init/rcs script. I am under an impression that once the mtd is enabled=20
> > in the linux
> > config file the creation of the corresponding node is taken care in som=
e=20
> > script.
>=20
> You need to either have udev running, or create it manually yourself
> with mknod (which can be done via a script you write). This is, of
> course, assuming you have the mtdblock module loaded or compiled into
> your kernel.

udev will not help because MTD is not Linux Device Model-enabled, so
only ancient manual device node creation method may be used. There is a
MAKEDEV script in mtd-utils.git which may help.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
