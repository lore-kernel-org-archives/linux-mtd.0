Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CEVr4-0001AG-Sr
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 12:38:32 -0400
Received: from yagoo.io.ssji.net ([2001:7a8:3030:0:240:5ff:fe35:fead]
	helo=yagoo) by zorglub.ssji.net with smtp (Exim 4.24)
	id 1CEVr1-000280-8m
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 18:38:27 +0200
Date: Mon, 4 Oct 2004 18:38:27 +0200
From: Nicolas Pouillon <nipo@ssji.net>
Cc: linux-mtd@lists.infradead.org
Message-Id: <20041004183827.7bcc5071.nipo@ssji.net>
In-Reply-To: <1096877111.21297.208.camel@thomas>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
	<20041001162705.5873dc7c.nipo@ssji.net>
	<20041002155505.083d8440.nipo@ssji.net>
	<1096749729.21297.54.camel@thomas>
	<20041003030653.2e0452a7.nipo@ssji.net>
	<1096768161.21297.129.camel@thomas>
	<20041003221827.7bea56fc.nipo@ssji.net>
	<1096877111.21297.208.camel@thomas>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
Subject: Re: Patch !
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Mon, 04 Oct 2004 10:05:11 +0200]
Thomas Gleixner <tglx@linutronix.de> eut le bonheur d'=E9crire:

> If you can start something like a kernel or a repairtool via JTAG you
> should have access.

Hm, sould document more on JTAG ;)

> > > #define. The code runs on 2.4 too. See compatmac.h
> >=20
> > I'll have a look at it ;)

Ok, it does compile.
I still have problems like oops when accessing MTD (same than before).
error is "Unhandled fault: imprecise external abort (0xcf6) at
0x20800014", which seems a blur.
I cant understand why Xscale complains, but I saw this issue has been
addressed some times on arm-linux ML, without fix (at least not in same
threads)

> Is the chip configured for 16-bit interface mode ?=20

PXA boots of it and its BOOT_SEL is configured to "Asynchronous 16bit
ROM", elsewhere, in mem controller, it is configured as "16bit fast
flash or rom, non burst read". so I assume it is.

> If yes, there are more tweaks neccecary.

I can see some NAND_BUSWIDTH_16 options, but how can this be enabled at
probe time ?

--=20
Nipo <nipo@ssji.net>
Gnu-PGP: 1024D/1DBF658F
http://nipo.ssji.net/nipo.asc
