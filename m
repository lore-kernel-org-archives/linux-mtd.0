Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bckzm-0002Nt-DV
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2004 09:07:27 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 22 Jun 2004 15:01:29 +0200
References: <EFF9A3506F74924AB5CC77BDC66E79351812CB@atcml01.atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812CB@atcml01.atc.army.mil>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200406221501.30299.tglx@linutronix.de>
Cc: 
Subject: Re: FW: DOC Mil Plus 32 question erase size erase shift????
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 22 June 2004 14:49, Carlos, John J USAATC wrote:
> What should the buffer size be for an erase block in memory.  How is that
> value tied to the chip geometry???

Would you please be so kind and answer the questions, if we should be able =
to=20
help you.

1. Is the device running in x16 mode?
If yes, then we have to fix this first, as it is not supported by nand_base=
=2Ec=20
at the moment. nand_scan() has to be made aware of this.

2. What's the output of the chip detection routine including nand_scan() ?

3. What did you change in nand_bbt.c ?=20

4. What's the bbt structure you pass to nand_scan_bbt ?

5. Can you send me your driver code including he modifications to nand_base=
=2Ec=20
and nand_bbt.c, so I can have a look ?

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
