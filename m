Received: from anchor-post-35.mail.demon.net ([194.217.242.93])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16slQW-0004HR-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 15:07:52 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-35.mail.demon.net with esmtp (Exim 3.35 #1)
	id 16slQT-000PNF-0Z
	for linux-mtd@lists.infradead.org; Wed, 03 Apr 2002 15:07:49 +0100
content-class: urn:content-classes:message
Subject: JFFS2 with NAND flash
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 3 Apr 2002 15:16:13 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B952CE7@OPTEX1.optex.local>
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

Hi,

I'm working with the latest cvs version of jffs2 on NAND flash
(Smartmedia). I've managed to create a filesystem and mount it fine,
except I get a string of messages like this:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005d4000:
0xc0c0 instead

I read in the archive that this might possibly be because an incorrect
erasesize was used with mkfs.jffs2. However, mkfs.jffs2 won't allow an
erasesize of less than 64K. The particular flash I've got has 8K blocks.
Is this the problem, or is there something else I'm missing?

Regards,
John Hall

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/
