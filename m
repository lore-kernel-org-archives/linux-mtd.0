Received: from [131.228.20.171] (helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq40m-0005yj-LX
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 08:44:50 +0000
Subject: RE: NOR read/write beyond end of flash partition
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tigadi Kiran-r10350c <R10350C@freescale.com>
In-Reply-To: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD89155AB@zin33exm21.fsl.freescale.net>
References: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD89155AB@zin33exm21.fsl.freescale.net>
Content-Type: text/plain; charset=utf-8
Date: Fri, 01 Dec 2006 10:44:22 +0200
Message-Id: <1164962662.20337.7.camel@sauron>
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

On Thu, 2006-11-30 at 21:23 +0530, Tigadi Kiran-r10350c wrote:
> Hi Artem,
>=20
> Please find attached patch for drivers/mtd/mtdchar.c file to fix NOR read=
 beyond flash. Let me know whether it is valid fix.

I've looked at the code. Your patch is incorrect as mtd_read() should
return EOF if *ppos =3D=3D mtd->size, not -ENOSPC.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
