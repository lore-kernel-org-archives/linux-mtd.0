Received: from tele-post-20.mail.demon.net ([194.217.242.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t8uo-0005rX-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 16:12:42 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by tele-post-20.mail.demon.net with esmtp (Exim 3.35 #1)
	id 16t8u9-0008qQ-0K
	for linux-mtd@lists.infradead.org; Thu, 04 Apr 2002 15:12:01 +0000
content-class: urn:content-classes:message
Subject: RE: JFFS2 with NAND flash
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Apr 2002 16:11:36 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B952CE9@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On 03 April 2002 15:16, I wrote

> I'm working with the latest cvs version of jffs2 on NAND=20
> flash (Smartmedia). I've managed to create a filesystem and=20
> mount it fine, except I get a string of messages like this:
>=20
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at=20
> 0x005d4000: 0xc0c0 instead
>=20
> I read in the archive that this might possibly be because an=20
> incorrect erasesize was used with mkfs.jffs2. However,=20
> mkfs.jffs2 won't allow an erasesize of less than 64K. The=20
> particular flash I've got has 8K blocks. Is this the problem,=20
> or is there something else I'm missing?

Using nanddump I've found that this is because I have some bad blocks on
the Smartmedia card I'm testing with. After an erase the block mentioned
above is stuck at c0c0.

Is there a utility around that will go through and test blocks, marking
bad ones as bad using the bad block flag in the oob? If not, would it be
useful to others if I wrote one?

Regards,
john
