Received: from tele-post-20.mail.demon.net ([194.217.242.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16x7PW-0006YU-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 15:24:50 +0100
content-class: urn:content-classes:message
Subject: RE: Writing JFFS2 image to Nand flash
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Apr 2002 15:23:06 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B95080519@OPTEX1.optex.local>
From: "John Hall" <John.Hall@optionexist.co.uk>
To: "Tino Keitel" <tino.keitel@innominate.com>
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

On 15 April 2002 14:51 Tino Keitel <tino.keitel@innominate.com> wrote:

> > > > This image should then be written to the device with cp or dd.
> > > > However, if I have bad blocks on the device then dd fails.
> > >=20
> > > Not sure about dd, I've just been using cp. But the main issue...
> >=20
> > Even with the correct branch of JFFS2, I think this problem will
> > still exist. Using cp or dd to write the initial filesystem image
> > takes no account of bad blocks near the beginning of the NAND flash.
>=20
> What about the seek option of dd?

That's is how I have got around it, but it involves knowing where the
bad blocks are. What if the first and third blocks are bad? I think a
utility is needed that recognises bad blocks and skips them when writing
a filesystem image to a blank device.

Regards,
John Hall
