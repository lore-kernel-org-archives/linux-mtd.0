Received: from mailout10.sul.t-online.com ([194.25.134.21])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbTUA-0001vV-6F
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 20:13:32 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Dan Brown" <dan_brown@ieee.org>,
 <linux-mtd@lists.infradead.org>
Date: Sat, 19 Jun 2004 02:07:42 +0200
References: <001501c4558c$4e42ce80$4402a8c0@tinker>
In-Reply-To: <001501c4558c$4e42ce80$4402a8c0@tinker>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406190207.42609.tglx@linutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: DOC support update
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 19 June 2004 01:30, Dan Brown wrote:

> The new NAND-subsystem-based DiskOnChip driver should now be fairly close
> to providing proper JFFS2 support, if it doesn't already.  A tricky issue
> with the hardware ECC generator was discovered today, and hopefully solve=
d.

Kudos to Dan for all his efforts.

> - Have a DOC Millenium or DOC2000 TSOP.  Millenium+ is not supported (oth=
er
> folks are hard at work on this).  DOC2000 original does not have BBT
> handling yet (coming soon!) and should not be used with JFFS2 yet.

Please join this effort as it will provide all the benefits of the generic=
=20
mtd/nand subsystem and help us avoid to have redundant and incompatible cod=
e.=20
At least the prospect to run JFFS2 or YAFFS on DoC should convince you of t=
he=20
worthiness of this effort.

I'm positive that the Millenium+ efforts will show up with similar results=
=20
soon. The general problems of DoC support seem to be solved so it should be=
 a=20
straight forward task despite of the device specific oddities to get it=20
running soon.

Please note that we plan to obsolete the DoC drivers in drivers/mtd/devices=
 in=20
the long run and switch the DoC support completely over to mtd/nand. This=20
will affect the (I)NFTL layers too, as they will benefit from the nand =20
functionality too.=20

=2D-=20
Thomas
_____________________________________________________________________
=46rom slash dot org
"When customers are visiting, engineers are not allowed to wear ties.=20
That way the customer can tell who is the engineer and who is the=20
salesman (and therefore whom to believe.). Ties cut off blood flow=20
to the brain, making it easier for the salesmen to do their jobs."=20
_____________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
