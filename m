Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uUeq-0005RJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 10:10:04 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-31.mail.demon.net with esmtp (Exim 3.35 #1)
	id 17uUeq-0008hg-0V
	for linux-mtd@lists.infradead.org; Thu, 26 Sep 2002 10:10:04 +0100
Content-Class: urn:content-classes:message
Subject: mtdchar.c in cvs doesn't compile
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Sep 2002 10:09:49 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B950806E4@OPTEX1.optex.local>
From: "John Hall" <john.hall@optionexist.co.uk>
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

I grabbed mtd from cvs yesterday and found mtdchar.c didn't compile. =
Today I see someone has committed a fix, but it still doesn't compile.

It seems write_ecc and read_ecc have gained an extra argument for =
specifying the oob scheme that is being used. The change has added =
NAND_ECC_NONE as the oobsel argument when I think it should be =
NAND_NONE_OOB. To make it compile I think #include <linux/mtd/nand.h> =
needs adding.

If this is correct then I can submit a patch.

regards,
John Hall

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/
