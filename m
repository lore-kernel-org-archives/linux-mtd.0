Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ApulO-0007k3-Ie
	for linux-mtd@lists.infradead.org; Sun, 08 Feb 2004 19:38:42 +0000
From: Joshua Wise <joshua@joshuawise.com>
To: tglx@linutronix.de
Date: Sun, 8 Feb 2004 14:38:38 -0500
References: <200402080113.36039.joshua@joshuawise.com>
	<200402080958.58584.tglx@linutronix.de>
In-Reply-To: <200402080958.58584.tglx@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200402081438.43118.joshua@joshuawise.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 NAND support - Mount failure on "good" filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sunday 08 February 2004 3:58 am, Thomas Gleixner wrote:
> Seems like you managed to corrupt the OOB area, as all your blocks are
> marked as bad. Your programming algorithm has to take care of the OOB data
> ! There are some slightly outdated docs on linux-mtd.infradead.org
My programming algorithm is exactly the same as nandwrite's. I believe that=
=20
the issue is not in JFFS2, but in the NAND driver - do we not need multiple=
=20
pages of OOB data, and does the NAND driver not expect the chip to=20
automatically "move on"? My chip seems to be the only NAND chip that does n=
ot=20
automagically move on to the next page of OOB data...

jwise

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <RockShox> charge up a 50v 1000uf cap and toss it to someone
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAJpBBPn9tWOqA4LMRAmZFAJ99i7XLldo46XZaa9txIZOixwzlkACglzPI
9tsTGllBx3OpKu3ZYAM0M9g=3D
=3DzlHR
=2D----END PGP SIGNATURE-----
