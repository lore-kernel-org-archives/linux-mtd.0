Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16x7d1-0006Zj-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 15:38:47 +0100
content-class: urn:content-classes:message
Subject: RE: Writing JFFS2 image to Nand flash
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Apr 2002 15:37:57 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B9508051A@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: "Elizabeth Clarke" <eclarke@aminocom.com>
Cc: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
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

On 15 April 2002 15:06 Elizabeth Clarke <eclarke@aminocom.com> wrote:

> > fs/fs.o: In function `jffs2_check_nand_cleanmarker':
> > fs/fs.o(.text+0x6040c): undefined reference to
> > `jffs2_flash_read_oob'
> > fs/fs.o: In function `jffs2_write_nand_cleanmarker':
> > fs/fs.o(.text+0x60520): undefined reference to=20
> > `jffs2_flash_write_oob'
> > Where are these two functions defined?
>=20
> You should find a grep has them in wbuf.c. Are you setting
> CONFIG_JFFS2_FS_NAND?

Yes, CONFIG_JFFS2_FS_NAND is set. wbuf.c doesn't contain these
functions. I had grepped fs/jffs2/*.[ch] for them.

This is the version of wbuf.c that I have:

[john@morgan jffs2]$ cvs stat wbuf.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
File: wbuf.c            Status: Up-to-date

   Working revision:    1.1.2.2
   Repository revision: 1.1.2.2 /home/cvs/mtd/fs/jffs2/wbuf.c,v
   Sticky Tag:          jffs2-nand-branch (branch: 1.1.2)
   Sticky Date:         (none)
   Sticky Options:      (none)


Regards,
John Hall
