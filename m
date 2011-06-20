Received: from p02c11o149.mxlogic.net ([208.65.144.82])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYifZ-0007Rw-C5
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 17:53:54 +0000
From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: NAND OOB data.
Date: Mon, 20 Jun 2011 17:53:41 +0000
Message-ID: <F9C551623D2CBB4C9488801D14F864C6036086@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C6034536@ex-mb1.corp.adtran.com>
	<0A40042D85E7C84DB443060EC44B3FD32A7208F91A@dekaexchange07.deka.local>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD32A7208F91A@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Atlant Schmidt [mailto:aschmidt@dekaresearch.com]
> Sent: Monday, June 20, 2011 6:14 AM
> To: ANDY KENNEDY; linux-mtd@lists.infradead.org
> Subject: RE: NAND OOB data.
>=20
> Andy:
>=20
>   If you don't have the old bad block information saved
>   away somewhere (a bad block table, a scrap of paper,
>   etc.), then you *CAN'T* completely recover from this
>   situation; the original bad block data for that chip
>   is probably irretrievably lost.*

All the other boards apparently are all good (is that normal?), but,
I'm not worried about the NAND having KNOWN bad blocks as this board
is supposed to be mine.

>=20
>   You can mark all the blocks as "good", of course, and
>   then exercise the chip a bit, marking bad blocks as you
>   go. You'll probably never achieve the same depth of
>   testing that the factory was able to achieve using
>   voltage, temperature, and timing margining, of course,
>   but the results may be "good enough".
>=20
>                           Atlant

Okay, so how do I (without the luxury of u-boot), in user or
kernel space, wipe the OOB data?  I'm looking at the code for
u-boot nand_erase_nand right now.  I mean, I'm not above writing
an userspace app that will do kernel level work for me.  I'm okay
with using /dev/mem and screwing with stuff.  Am I on the right
track?  I mean, I hate to go down this road if I'm just heading
for a dead-end.

Andy

>=20
>=20
> * A few chip designs apparently blow fuses for the
>   factory bad sectors and these blown fuses prevent
>   you from ever writing the OOB bits to the state
>   that would indicate a good block. For chips of
>   these designs, you can fully recover the factory
>   bad block data.
>=20
>=20
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-
> bounces@lists.infradead.org] On Behalf Of ANDY KENNEDY
> Sent: Friday, June 17, 2011 18:09
> To: linux-mtd@lists.infradead.org
> Subject: NAND OOB data.
>=20
> I have overwritten my OOB data, to the point where all blocks are
> seen
> as bad.  What do I do to recover from this?
>=20
> Thanks,
> Andy
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
> This e-mail and the information, including any attachments, it
> contains are intended to be a confidential communication only to
> the person or entity to whom it is addressed and may contain
> information that is privileged. If the reader of this message is
> not the intended recipient, you are hereby notified that any
> dissemination, distribution or copying of this communication is
> strictly prohibited. If you have received this communication in
> error, please immediately notify the sender and destroy the
> original message.
>=20
> Thank you.
>=20
> Please consider the environment before printing this email.
