Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApxJc-0008Jf-Tw
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 22:22:13 +0000
Received: from 192.168.1.100 (bluefire.joshuawise.com [192.168.1.100])
	AA6AEFFB8	for <linux-mtd@lists.infradead.org>;
	Sun,  8 Feb 2004 17:22:24 -0500 (EST)
From: Joshua Wise <joshua@joshuawise.com>
Date: Sun, 8 Feb 2004 17:22:19 -0500
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_barJA/Z081+ib3z"
Message-Id: <200402081722.19858.joshua@joshuawise.com>
Subject: Fwd: Re: JFFS2 NAND support - Mount failure on "good" filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary-00=_barJA/Z081+ib3z
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

<tglx1> joshua_: send a patch to the maillist :)

He asked, so I forwarded his patch.

(this patch adds support for chips that need to be sent a command for each=
=20
page of OOB data requested.)

joshua

=2D ----------  Forwarded Message  ----------

Subject: Re: JFFS2 NAND support - Mount failure on "good" filesystem
Date: Sunday 08 February 2004 4:51 pm
=46rom: Thomas Gleixner <tglx@linutronix.de>
To: Joshua Wise <joshua@joshuawise.com>

On Sunday 08 February 2004 20:38, you wrote:
> On Sunday 08 February 2004 3:58 am, Thomas Gleixner wrote:
> > Seems like you managed to corrupt the OOB area, as all your blocks are
> > marked as bad. Your programming algorithm has to take care of the OOB
> > data ! There are some slightly outdated docs on linux-mtd.infradead.org
>
> My programming algorithm is exactly the same as nandwrite's. I believe th=
at
> the issue is not in JFFS2, but in the NAND driver - do we not need multip=
le
> pages of OOB data, and does the NAND driver not expect the chip to
> automatically "move on"? My chip seems to be the only NAND chip that does
> not automagically move on to the next page of OOB data...
>
> jwise

=2D --
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de

=2D -------------------------------------------------------



=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <RockShox> charge up a 50v 1000uf cap and toss it to someone
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAJrabPn9tWOqA4LMRAgygAKCXyWYBZArBcYyjI2keO8lTCBTvjACgh55h
uLSBge7FMMISVQiVIeAnheI=3D
=3DwwFk
=2D----END PGP SIGNATURE-----

--Boundary-00=_barJA/Z081+ib3z
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="nand.diff"
Content-Transfer-Encoding: 7BIT
Content-Disposition: attachment; filename=nand.diff

--- nand.old.c	2004-02-08 22:46:04.000000000 +0100
+++ nand.c	2004-02-08 22:51:14.000000000 +0100
@@ -641,7 +641,7 @@
 	while (read < len) {
 		
 		/* If we have consequent page reads, apply delay or wait for ready/busy pin */
-		if (read) {
+		if (read && !this->noautoincr) {
 			if (!this->dev_ready) 
 				udelay (this->chip_delay);
 			else
@@ -752,6 +752,11 @@
 		col = 0;
 		/* Increment page address */
 		page++;
+		/* If the chip does not support auto page increment
+		   send new command
+		*/
+		if (this->noautoincr && read < len)
+			this->cmdfunc (mtd, NAND_CMD_READ0, 0x00, page);
 	}
 
 	/* De-select the NAND device */
@@ -820,8 +825,16 @@
 		this->read_buf(mtd, &buf[i], thislen);
 		i += thislen;
 		col += thislen;
-		/* Delay between pages */
-		udelay (this->chip_delay);
+		/* Check, if the chip supports autoincrement */
+		if (this->noautoincr && i < len) {
+		        this->cmdfunc (mtd, NAND_CMD_READOOB, col, ++page);
+		} else {
+			/* Delay between pages */
+			if (!this->dev_ready) 
+				udelay (this->chip_delay);
+			else
+				while (!this->dev_ready(mtd));        
+		}
 	}
 	/* De-select the NAND device */
 	this->select_chip(mtd, -1);

--Boundary-00=_barJA/Z081+ib3z--
