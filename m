Received: from zorglub.ssji.net ([2001:7a8:3030::face])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CEZjd-0002lo-0F
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 16:47:06 -0400
Date: Mon, 4 Oct 2004 22:47:00 +0200
From: Nicolas Pouillon <nipo@ssji.net>
To: tglx@linutronix.de
Message-Id: <20041004224700.422a9f2c.nipo@ssji.net>
In-Reply-To: <1096912750.21297.433.camel@thomas>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
	<20041001162705.5873dc7c.nipo@ssji.net>
	<20041002155505.083d8440.nipo@ssji.net>
	<1096749729.21297.54.camel@thomas>
	<20041003030653.2e0452a7.nipo@ssji.net>
	<1096768161.21297.129.camel@thomas>
	<20041003221827.7bea56fc.nipo@ssji.net>
	<1096877111.21297.208.camel@thomas>
	<20041004183827.7bcc5071.nipo@ssji.net>
	<1096912750.21297.433.camel@thomas>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patch !
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Mon, 04 Oct 2004 19:59:11 +0200]
Thomas Gleixner <tglx@linutronix.de> eut le bonheur d'=E9crire:

> The configuration register reflects the state of the IF_CFG pin.

I assume this is an hardware configuration.
Would it be possible to change 16bit access to 32bit in MTD chip while
running?

I tried to reconfigure PXA bank mode to 32 bit mode: probing no more
works, and mmio transfers dont crash any more...
So if I understood well, PXA just makes kernel crash if accessing a
16bit mapped zone with 32bits words (quite normal, in fact, but not
straightforward for me as I'm learning at the same time ;)

As I saw different bug reports/issues on MLs with this kind of thing
(PXA kernel crashing while probing mtd), shouldn't a #warning, or a
printk just before probing annoucing the issue could be added ?

Cheers !

--=20
Nipo <nipo@ssji.net>
Gnu-PGP: 1024D/1DBF658F
http://nipo.ssji.net/nipo.asc
