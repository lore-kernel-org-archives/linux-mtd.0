Received: from de01egw02.freescale.net ([192.88.165.103])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GrSYv-0002ak-TS
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 00:09:55 -0500
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by de01egw02.freescale.net (8.12.11/de01egw02) with ESMTP id
	kB55O7XQ009931 for <linux-mtd@lists.infradead.org>;
	Mon, 4 Dec 2006 22:24:07 -0700 (MST)
Received: from zin33exm21.fsl.freescale.net (zin33exm21.ap.freescale.net
	[10.232.192.8])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id kB559dGW016260
	for <linux-mtd@lists.infradead.org>;
	Mon, 4 Dec 2006 23:09:41 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: NOR read/write beyond end of flash partition
Date: Tue, 5 Dec 2006 10:39:37 +0530
Message-ID: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD891589C@zin33exm21.fsl.freescale.net>
In-Reply-To: <1164967160.20337.8.camel@sauron>
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

Could you please give the exact reason why this is NOT a bug?

Regards,
Kiran

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
Sent: Friday, December 01, 2006 3:29 PM
To: Tigadi Kiran-r10350c
Cc: linux-mtd@lists.infradead.org
Subject: RE: NOR read/write beyond end of flash partition

On Fri, 2006-12-01 at 15:18 +0530, Tigadi Kiran-r10350c wrote:
> Hi Artem,
>=20
> As write routine implementation has -ENOSPC, I created patch with read =
routine returning same value.
>=20
> So, please let me know which patch is valid?

Pardon? I think there is no need in a patch and mtd_read() is ok as it
is.


--=20
Best regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
