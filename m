Received: from auriga.auriga.ru ([80.240.102.100])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19p8iB-0001GP-R1
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2003 16:47:55 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 19 Aug 2003 19:47:37 +0400
Message-ID: <5B439D84E6653F4AA2E14A5D8898A7E163D758@auriga.auriga.ru>
From: "Eugeny Mints" <eugeny.mints@auriga.ru>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

> -----Original Message-----
> From: Eugeny Mints
> Sent: Monday, August 18, 2003 3:37 PM
> To: samoutin@hotbox.ru
> Cc: David Woodhouse; linux-mtd@lists.infradead.org
> Subject: Fw: corrupt my NAND flash device
>=20
> Alex, all,
>=20
> >Alex Samoutin samoutin at hotbox.ru
> >Wed Jul 2 11:43:11 BST 2003
>=20
> >Previous message: 2nd try: [PATCH] jffs2 on DOC
> >Next message: Fw: corrupt my NAND flash device
> >Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]
>=20
> >Hi Thomas,
> >Sorry for big delay with answer - I had no hardware to test. Now I=20
> >got
> my
> >CerfCube 405ep back and can play with it.
> >So I had two problems
>=20
> >  1.. Write verify sometimes fail
> >  2.. Write operation during erase sometimes cause data corruption
>=20
> Could you please describe you test which detects the first problem? I=20
> have the same, but it arises very seldom and unstable. I'd like to be=20
> able to reproduce the bug predictably.
>=20
> >Hardware details :
> >- NAND chip Toshiba TC58256AFT
> >- ALE/CLE and CE connected to GPIO
> >- R/B pin connected to GPIO and I use ready function which reads it
> pin.
> >- I played with different timings - even slowest setting gets  me the
> same
> >result
>=20
> >1-st problem was solved by applying new MTD snapshot  (Jun 26). It's
> look
> >like nand_deselect(); nand_select() fixes the problem.
>=20
> It is interesting - this fix doesn't help me:( (I have MIPS Au1100 and

> Toshiba TC58256AFTI ) More over, I discovered that fix proposed by=20
> David in the latests
> (august) snapshots (reset before write command) hangs my system during

> eraseall:(

Ok, eventually I discovered the core of the problems. In fact, there are
several problems.=20

Problem 1.

In all snapshots, in which there is no auxiliary routine
nand_write_bufer there is the bug in nand_command (in RESET command
implementation):

----code---
...
case NAND_CMD_STATUS:
                return;

        case NAND_CMD_RESET:
                if (this->dev_ready)
                        break;
                this->hwcontrol(mtd, NAND_CTL_SETCLE);
                writeb (NAND_CMD_STATUS, NAND_IO_ADDR);
                this->hwcontrol(mtd, NAND_CTL_CLRCLE);
                while ( !(this->read_byte(mtd) & 0x40));
                return;

        /* This applies to read commands */
        default:
...
---end code---

should be:

---code----

...
case NAND_CMD_STATUS:
                return;

        case NAND_CMD_RESET:
                if (this->dev_ready)
                        break;
                this->hwcontrol(mtd, NAND_CTL_SETCLE);
+               NAND_IO_ADDR =3D this->IO_ADDR_W;
                writeb (NAND_CMD_STATUS, NAND_IO_ADDR);
                this->hwcontrol(mtd, NAND_CTL_CLRCLE);
                while ( !(this->read_byte(mtd) & 0x40));
                return;

        /* This applies to read commands */
        default:
...
---end code---

Problem 2.

My board falls in the infinite loop at (!(this->read_byte(mtd) & 0x40));
even with the latest snapshot 18.08.2003 on RESET command. Interesting,
that it happens not from the very begging but just when write_oob has
executed (during eraseall) for about a half of the flash.=20

I found that insertion of udelay() before issuing STATUS command helps.
Any suggestions?

>=20
>=20
> >However  after applying new MTD release the 2-nd problem still
> remained.
> >Then I comment out erase abort in nand_get_chip (as you suggested)=20
> >and
> it
> >fixes my second problem!
> >Could you remove this erase abort from MTD source? I think it will=20
> >not affect much on efficiency.

Possibly second Alex's problem may be solved by udelay() also? And there
is no need to comment out erase abort?=20

>=20
> My second problem is that system hangs if the device is filled once=20
> and an attempt to re-use previously used sectors is made. Comment out=20
> erase abort in nand_get_chip fixes my second problem too.
>=20

Regards,
 		Eugeny
