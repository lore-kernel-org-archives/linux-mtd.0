Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16vxrV-0000yE-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 11:00:57 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-31.mail.demon.net with esmtp (Exim 3.35 #1)
	id 16vxrS-0005u4-0V
	for linux-mtd@lists.infradead.org; Fri, 12 Apr 2002 11:00:54 +0100
content-class: urn:content-classes:message
Subject: Writing JFFS2 image to Nand flash
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Apr 2002 11:02:22 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B95080502@OPTEX1.optex.local>
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

I'm having problems writing a JFFS2 image to a Nand flash device whose
first block is bad. cp and dd fail in this case. Do I need to write a
utility that checks for bad blocks and skips them, or am I missing
something?

Regards,
John Hall

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/
