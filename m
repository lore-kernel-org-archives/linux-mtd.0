Received: from tele-post-20.mail.demon.net ([194.217.242.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16x6ix-0006Uo-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 14:40:51 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by tele-post-20.mail.demon.net with esmtp (Exim 3.35 #1)
	id 16x6il-000JkP-0K
	for linux-mtd@lists.infradead.org; Mon, 15 Apr 2002 13:40:39 +0000
content-class: urn:content-classes:message
Subject: Re: Writing JFFS2 image to Nand flash
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Apr 2002 14:42:39 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B952CF8@OPTEX1.optex.local>
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

> > This image should then be written to the device with cp or dd.
> > However, if I have bad blocks on the device then dd fails.
>=20
> Not sure about dd, I've just been using cp. But the main issue...

Even with the correct branch of JFFS2, I think this problem will still
exist. Using cp or dd to write the initial filesystem image takes no
account of bad blocks near the beginning of the NAND flash.

> > I'm not using the jffs2_nand_branch - I had not realised there was
> > one.
>=20
> ...is that. Get that branch and it should work. At least, it works
> here :)

OK, I've got the jffs2-nand-branch of fs/jffs2/* and
include/linux/jffs2*. I found that this branch doesn't use the shared
zlib, so I've worked around that. However, I still get these errors
when compiling the kernel:

fs/fs.o: In function `jffs2_check_nand_cleanmarker':
fs/fs.o(.text+0x6040c): undefined reference to `jffs2_flash_read_oob'
fs/fs.o: In function `jffs2_write_nand_cleanmarker':
fs/fs.o(.text+0x60520): undefined reference to `jffs2_flash_write_oob'

Where are these two functions defined?

Regards,
John Hall
