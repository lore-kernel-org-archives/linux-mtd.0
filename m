Received: from finch-post-12.mail.demon.net ([194.217.242.41])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16w0mr-0001AA-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 14:08:21 +0100
content-class: urn:content-classes:message
Subject: Re: Writing JFFS2 image to Nand flash 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Apr 2002 14:09:33 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B952CF6@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Cc: <eclarke@aminocom.com>
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

Elizabeth Clarke <eclarke@aminocom.com> wrote:
> > I'm having problems writing a JFFS2 image to a Nand flash device
> > whose first block is bad. cp and dd fail in this case. Do I need to
> > write a utility that checks for bad blocks and skips them, or am I
> > missing something?
>=20
> What messages is it giving? debug enabled? are you using the JFFS2
> code from the jffs2_nand_branch code from cvs?

>From my understanding, mkfs.jffs2 creates a JFFS2 image without any
reference to the device that is being targeted (with the possible
exception of specifying an erase size if the erase size is bigger than
64K). This image should then be written to the device with cp or dd.
However, if I have bad blocks on the device then dd fails.

This is an example of the erase finding that the first block is bad:

	root@board:/tmp# eraseall /dev/mtd/0
	Erasing nand_erase: attempt to erase a bad block at page
0x00000000
	8 Kibyte @ 0 --  0 % complete.
	eraseall: /dev/mtd/0: MTD Erase failure: Input/output error
	Erased 8192 Kibyte @ 0 -- 100% complete.

Then create a jffs2 image:

	root@board:/tmp# mkfs.jffs2 -d /tmp/files -o /tmp/img

Then write it:

	root@board:/tmp# dd if=3D/tmp/img of=3D/dev/mtd/0
	dd: writing `/dev/mtd/0': Input/output error
	0+1 records in
	0+0 records out


I'm not using the jffs2_nand_branch - I had not realised there was one.
I have the latest CVS code from the trunk. What changes are there to
support nand flash - is it just limiting the number of writes to a page,
or are there other things?
I will switch to the nand branch and try that.

Regards,=20
John Hall
