Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BXzyO-0005rD-8h
	for linux-mtd@lists.infradead.org; Wed, 09 Jun 2004 06:06:21 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>,
	linux-mtd@lists.infradead.org
Date: Wed, 9 Jun 2004 12:00:50 +0200
References: <EFF9A3506F74924AB5CC77BDC66E79351812B3@atcml01.atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812B3@atcml01.atc.army.mil>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406091200.50583.tglx@linutronix.de>
Cc: 
Subject: Re: Generic nand and DOC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 08 June 2004 16:22, Carlos, John J USAATC wrote:
> Hi All,
>
>   I have been trying to get my DOC Mil plus to work properly.  The code in
> the devices dir that is M-sys specific seems to works for the chip but I
> can't use nandwrite on the chip.  Am I to assume from the lists that the
> goal is to stop using the code in the devices directory and use the gener=
ic
> nand/inftl stuff to work for all devices?=20

The plan is to have a doc driver in drivers/mtd/nand which uses the generic=
=20
nand code and overrides the doc specific functions. On top of this (I)NFTL=
=20
can be used or JFFS2/YAFFS without the (I)NFTL layer.

Dan Brown is actually working on it.

> The code for DoC_IdentChip is
> very specific, is it the plan that nand_scan will replace the later?

No, this will be part of the doc driver in drivers/mtd/nand

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
