Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BcWEA-0000XM-Tp
	for linux-mtd@lists.infradead.org; Mon, 21 Jun 2004 17:21:21 -0400
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>,
	linux-mtd@lists.infradead.org
Date: Mon, 21 Jun 2004 23:15:21 +0200
References: <EFF9A3506F74924AB5CC77BDC66E79351812C9@atcml01.atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E79351812C9@atcml01.atc.army.mil>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406212315.21856.tglx@linutronix.de>
Cc: 
Subject: Re: DOC Mil Plus 32 question erase size erase shift????
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 21 June 2004 20:44, Carlos, John J USAATC wrote:
> Hello all,
>
>   Trying to get the bbt stuff working for diskonchip Mil Plus 32.  Questi=
on
> in nand_scan_bbt, I pass a erasesize of 8000 (32k bytes).  Is this the

Where do you pass erasesize ? Erasesize is an autodetected value inside=20
nand_scan() and _must not_ be modified.

> correct size???  If so then I get 256 bytes of mem allocated for this->bbt
> but then it fails (out of memory) when I try to allocate 88ooo bytes for
> the buffer.  Is this correct?  544K bytes for that buffer.  My proc/memin=
fo
> shows much more memory

Ooops !

It fails as kmalloc max. allocation size is 128K.=20

But why does anything there try to allocate 544K for a buffer ?????  What d=
id=20
you change in nand_bbt.c ? What's the bbt structure you pass to=20
nand_scan_bbt ?

Can you send me your driver code so I can have a look ?

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
