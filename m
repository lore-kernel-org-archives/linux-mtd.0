Received: from mailout08.sul.t-online.com ([194.25.134.20])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BTgzg-0004Ps-1c
	for linux-mtd@lists.infradead.org; Fri, 28 May 2004 09:01:57 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: rschmitt@bluepeach.com,
 linux-mtd@lists.infradead.org
Date: Fri, 28 May 2004 14:56:34 +0200
References: <65335.10.0.1.2.1085744407.squirrel@mail.bluepeach.com>
In-Reply-To: <65335.10.0.1.2.1085744407.squirrel@mail.bluepeach.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200405281456.34587.tglx@linutronix.de>
Cc: 
Subject: Re: NAND Bad Block Algorithm, JFFS2, and CRAMFS
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 28 May 2004 13:40, Richard Schmitt wrote:
> We are using JFFS2 on NAND devices and are currently running into a
> problem that I was hoping to get some guidance on.
>
> We've created a 14MB partition.  We've configured the NAND driver to -
> Verify Writes
> - Enable ECC
> - Disable Bad Block Checking

Which version of NAND are you using ? Where do you disable bad block checki=
ng=20
=2D in nand_erase I assume ?

> We've disabled Bad Block checking because as we understand it, this must
> be disabled in order to support JFFS2.  I have a question on this that
> I'll raise a bit further on.

Why so ?

> We can copy a 64K jffs2 image onto the flash and mount it without problem.
>  When we try to copy a 7MB image onto the flash, the copy will fail with a
> generic 'input/output error'.

You _CANNOT_ copy with cp xyz /dev/mtdx, therefor we have mtdutils, nandwri=
te=20
is your friend, buit it relies on the intact bad block information.

> Our hypothesis is that there is a bad block somewhere in the flash that is
> not hit with the 64K image but is hit with the 7MB image.  Because of this
> and with Verify Writes enabled, the copy will fail.

By disabling the bad block check in erase you have managed to destroy the b=
ad=20
block info. Hopefully you remember which blocks were bad so you can try to=
=20
mark them as bad again.=20

> This brings us back to the question introduced earlier.  If we need to
> disable bad block checking with NAND in order to support JFFS2, then how
> do we copy a JFFS2 image onto the flash if the flash has a bad block in
> it?

Who said that ?

> The second piece of this question is that we really wanted to support two
> partitions, one with a JFFS2, and another with CRAMFS.  We wanted to run
> with the bad block algorithm on CRAMFS and without it on the JFFS2 one.
> We've heard rummblings that this is not supported. Is that true or is
> there some way that we can get that to work.

Trusting rumblings is almost not a good idea.

There are some efforts to make CRAMFS work on top of NAND with respect to b=
ad=20
blocks. Other efforts are on the way to provide a SSFDC compatible glue=20
layer.
The recent changes in NAND provide extended bad block support including fla=
sh=20
based bad block tables. I really have no clue where this information comes=
=20
from.

=2D-=20
Thomas
________________________________________________________________________
Steve Ballmer quotes the statistic that IT pros spend 70 percent of their=20
time managing existing systems. That couldn=E2=80=99t have anything to do w=
ith=20
the fact that 99 percent of these systems run Windows, could it?
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
