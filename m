Received: from 3bit.vector.com.pl ([81.210.9.37])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtR1h-0005lD-LX
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 10:19:26 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 Jul 2005 16:18:34 +0200
Message-ID: <60E856FD577CC04BA3727AF4122D3F161135CD@3bit.vector.com.pl>
From: "Andriy Korud" <a.korud@vector.com.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Please explain bbt_create (problems)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=20
I'm trying to understand how initial bbt_ceate works?=20
I have NAND chip erased for jffs2 (flash_erasall -j) with some data in =
OOB (jffs2 clean masrkers). And bbt_create() calls check_pattern() which =
compare each byte with 0xff, in my case comparision fails (jffs2 =
cleanmarker !=3D 0xff) and I have every block marked as bad.
Should not check_pattern() checks only byte at 0x05 in OOB (according to =
http://www.linux-mtd.infradead.org/tech/mtdnand/x255.html )?=20
Also is it possible to scan chip for bbt starting from certain block =
(not 0) without dirty changes in mtd code?

Thanks in advance,
Andriy Korud
