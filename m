Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVn6y-0008I1-RI
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2004 03:58:07 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: "Zhang, Jian" <jzhang@ti.com>, "David Woodhouse" <dwmw2@infradead.org>,
	<linux-mtd@lists.infradead.org>
Date: Thu, 3 Jun 2004 09:52:30 +0200
References: <BA2832125C3C994384FCC051CDFC73690F4197@dlee2k05.ent.ti.com>
In-Reply-To: <BA2832125C3C994384FCC051CDFC73690F4197@dlee2k05.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406030952.30695.tglx@linutronix.de>
Cc: 
Subject: Re: stable MTD snapshot
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 03 June 2004 00:48, Zhang, Jian wrote:
>
> 20040531:
> Kernel builds but I got I/O error when mounting a partition. The
> underlying MTD NAND driver works since I am able to read/write MTD
> nodes.

Use a more recent snapshot please. There were some issues recently as I=20
reworked a lot.

If the problem persists with a recent snapshot could you please describe in=
=20
detail what happens.

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
