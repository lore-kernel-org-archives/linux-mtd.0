Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZq5n-0008UF-ET
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 10:39:26 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.12.9/8.12.9/Debian-5local0.1) with ESMTP
	id k9HEclP1021099
	for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2006 16:38:47 +0200
Date: Tue, 17 Oct 2006 16:40:01 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: bad .eccbytes from MEMGETOOBSEL / ECCGETLAYOUT
Message-ID: <Pine.LNX.4.64.0610171631570.25906@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="218815243-1195238451-1161096001=:25906"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--218815243-1195238451-1161096001=:25906
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


When using the now obsolete MEMGETOOBSEL ioctl to get ECC info,=20
the mtd shipped with Linux 2.6.18 seems to return garbage in the=20
nand_oobinfo.eccbytes structure. Looking in the code in the latest GIT=20
source it indeed seems like this field is never filled in.

I tried to obtain similar info from the new ECCGETLAYOUT ioctl, but again=
=20
the nand_ecclayout.eccbytes field appears to contain garbage, as does the=
=20
=2Eeccpos[] array. I've checked that the ioctl code actually copies=20
something to the userspace struct but have not dived deeper into what the=
=20
'something' actually contains.

Is this interface something that is in the process of getting implemented,=
=20
or has something broken along the way?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-1195238451-1161096001=:25906--
