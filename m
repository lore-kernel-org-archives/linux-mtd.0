Received: from anchor-post-36.mail.demon.net ([194.217.242.94])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16yDkk-0005y4-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Apr 2002 16:23:18 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-36.mail.demon.net with esmtp (Exim 3.35 #1)
	id 16yDkg-000DaT-0a
	for linux-mtd@lists.infradead.org; Thu, 18 Apr 2002 16:23:15 +0100
content-class: urn:content-classes:message
Subject: JFFS2 on both Nand and StrataFlash
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Apr 2002 16:23:36 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B952CFF@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
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

I have a board that has Intel StrataFlash as well as a Smartmedia card
slot. I have JFFS2 happily up and running on the Smartmedia card, but
would also like to put JFFS2 on a section of the StrataFlash.

If JFFS2 is configured for Nand flash (CONFIG_JFFS2_FS_NAND), will it
run on the StrataFlash or is it currently one or the other?

On a related note, how do I go about using just a portion of the flash.
Do I need the partitioning support? The amount used will remain static.

Thanks in advance,
John Hall


--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/
