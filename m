Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mAdL-0007N6-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2002 11:10:07 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-31.mail.demon.net with esmtp (Exim 3.35 #1)
	id 17mAdK-0002wy-0V
	for linux-mtd@lists.infradead.org; Tue, 03 Sep 2002 11:10:06 +0100
Subject: Stable cvs version for 2.4
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Sep 2002 11:09:44 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B952D23@OPTEX1.optex.local>
Content-Class: urn:content-classes:message
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

We're currently using ARM Linux 2.4.18-rmk7, and following the 2.4 =
series of the kernel for our product that we're developing. I've been =
using cvs versions of the mtd subsystem since I've needed jffs2 on NAND =
flash, and I currently have code dating back to June. I've just done an =
update since there seem to be a lot of jffs2 changes.

Looking at some of the comments, there seem to be some fairly =
experimental things recently committed (e.g version 1.26 of =
fs/jffs2/read.c). My question is, is there a reasonably stable version I =
can use, and indeed is the current HEAD version suitable for 2.4, or is =
it 2.5 only?

I guess the answer to the first question is to stick with whatever's in =
the stock kernel unless I want to be helping to test the latest code, =
but I would appreciate advice anyway.

Regards,
John Hall

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/
