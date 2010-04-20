Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O41i4-0003TK-0H
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 00:53:04 +0000
From: "Darwin Rambo" <drambo@broadcom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Mon, 19 Apr 2010 17:52:52 -0700
Subject: UBI - disable subpage verify and use
	CONFIG_MTD_NAND_VERIFY_WRITE possible?
Message-ID: <B125D8217ABC4B43826503DE00A2D44910FDDFB4E6@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,

Can you please clarify something for me?

http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage_verify_fail=20

I read this note and still, CONFIG_MTD_NAND_VERIFY_WRITE is very useful for=
 me. The question is, if I don't mind wasting a bit of flash, and configure=
 UBI to not do subpage writes and put the EC and VID headers on separate pa=
ges (for example ubi.mtd=3D6,4096), does UBI then always do page writes and=
 would CONFIG_MTD_NAND_VERIFY_WRITE then work reliably for me? Or are there=
 other places in the code that might do subpage writes? So far it seems to =
work well for me with the verify on and no subpages for the headers.=20

By the way, the standard nand_verify_buf() function in nand_base.c uses rea=
db(chip->IO_ADDR_R) and doesn't use something like chip->ecc.read_page() to=
 correct the data so this sounds like a bug to me. But I override this to d=
o corrected reads anyways, which works better for SLC/MLC flash which can s=
how one or more bit errors in a page read.

I apologize in advance if this is already documented somewhere.

Thanks.

Best regards,
Darwin


Disclaimer - Any views or opinions presented in this e-mail are solely thos=
e of the author=20
and do not necessarily represent those of the company.=20
