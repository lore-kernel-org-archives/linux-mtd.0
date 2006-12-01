Received: from de01egw01.freescale.net ([192.88.165.102])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq50H-0001GQ-BB
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 04:48:23 -0500
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by de01egw01.freescale.net (8.12.11/de01egw01) with ESMTP id
	kB1BALbG018124 for <linux-mtd@lists.infradead.org>;
	Fri, 1 Dec 2006 04:10:21 -0700 (MST)
Received: from zin33exm21.fsl.freescale.net (zin33exm21.ap.freescale.net
	[10.232.192.8])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id kB19mDCh024042
	for <linux-mtd@lists.infradead.org>;
	Fri, 1 Dec 2006 03:48:15 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: NOR read/write beyond end of flash partition
Date: Fri, 1 Dec 2006 15:18:12 +0530
Message-ID: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD89156A1@zin33exm21.fsl.freescale.net>
In-Reply-To: <1164962662.20337.7.camel@sauron>
From: "Tigadi Kiran-r10350c" <R10350C@freescale.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

As write routine implementation has -ENOSPC, I created patch with read =
routine returning same value.

So, please let me know which patch is valid?

Regards,
Kiran

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
Sent: Friday, December 01, 2006 2:14 PM
To: Tigadi Kiran-r10350c
Cc: linux-mtd@lists.infradead.org
Subject: RE: NOR read/write beyond end of flash partition

On Thu, 2006-11-30 at 21:23 +0530, Tigadi Kiran-r10350c wrote:
> Hi Artem,
>=20
> Please find attached patch for drivers/mtd/mtdchar.c file to fix NOR =
read beyond flash. Let me know whether it is valid fix.

I've looked at the code. Your patch is incorrect as mtd_read() should
return EOF if *ppos =3D=3D mtd->size, not -ENOSPC.

--=20
Best regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
