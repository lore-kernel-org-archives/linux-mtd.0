Received: from carisma.slowglass.com ([195.224.96.167]
	helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Js0F-0000ts-So
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 10:41:20 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 19JLNp-0006Vd-00
	for linux-mtd@lists.infradead.org; Fri, 23 May 2003 23:51:30 +0100
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with SMTP id 81F16DA59
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 May 2003 22:50:26 +0000 (GMT)
Received: from thistle.bri.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0F9A11845
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 May 2003 22:50:26 +0000 (GMT)
Received: from [164.129.14.5] (helo=ocelot)
	by thistle.bristol.st.com with smtp (Exim 3.03 #6)
	id 19JLMn-00035W-00
	for linux-mtd@lists.infradead.org; Fri, 23 May 2003 23:50:25 +0100
Date: Fri, 23 May 2003 23:50:20 +0100
From: Stuart Menefy <stuart.menefy@st.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20030523235020.3ca198e1.stuart.menefy@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1"; boundary="3,C'=.LT8fCckrnY"
Subject: CFI fixup code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--3,C'=.LT8fCckrnY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Folks

Having been bitten several times now by buggy CFI data in various chips, I
thought I'd try and come up with an generic mechanism for working round
this problem.

The changes come in two parts. The largest change is actually just a tidy
up of the code which reads extended CFI tables, providing a utility
function which can be shared by the various CFI command sets, and ensuring
that the device manufacturer and ID is always available.

The second part of the patch is then very small. Simply provide a table
of fixup routines, which can be called as required, to fixup the CFI data.

The current Intel StrataFlash and AMD boot block location bugs have been
moved to use the new mechanism, and I've added a couple of fixups for ST
Flash devices which have appeared in this list over the last year or so.

The patches are available from:
  ftp://ftp.superhlinux.com/pub/people/stuart/cfifixup/

Any comments welcome.

Stuart

--3,C'=.LT8fCckrnY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (SunOS)

iD8DBQE+zqWw61BlSKQGbXkRAqrqAJ9JizKbhsXavmXTcdFOkCPfx7Xc9wCfeMGJ
smhfM2ioG1tRJU6ToAo5Qlw=
=xNm1
-----END PGP SIGNATURE-----

--3,C'=.LT8fCckrnY--
