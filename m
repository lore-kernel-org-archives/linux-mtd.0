Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qHKr-0001vB-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 17:35:45 +0000
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-31.mail.demon.net with esmtp (Exim 3.35 #1)
	id 16qHKm-000HIM-0V
	for linux-mtd@lists.infradead.org; Wed, 27 Mar 2002 17:35:40 +0000
content-class: urn:content-classes:message
Subject: JFFS2 NAND flash support
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Mar 2002 17:42:42 -0000
Message-ID: <541025071C7AC24C84E9F82296BB9B950804C4@OPTEX1.optex.local>
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

I'm wanting to get JFFS2 to go on some NAND flash (it's actually
Smartmedia, but it's pretty much just NAND flash) with a 2.4.17 kernel.
I've adapted the NAND flash driver in the kernel tree and that now seems
to work for me.

The jffs2 stuff in my kernel sources doesn't seem very up to date so
I've got the latest CVS stuff. Which branch of cvs do I need to use?
Should I update the whole of the mtd subsystem or can I just use the
updated jffs2 stuff?

I also came across some problems with the existing NAND flash driver,
especially with erases. It doesn't seem to mark an erase as done,
  i.e. instr->state =3D MTD_ERASE_DONE;

Also, when doing an erase it obtains a spin lock that disables all
bottom halves from running. It holds this lock for the duration of the
erase, which is up to 4ms in the code - is this really a good idea? The
Smartmedia specs say that this delay can be up to 400ms! Definitely not
a good idea.

Regards,
John Hall

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge. UK.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/
