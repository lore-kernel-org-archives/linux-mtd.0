Received: from mailout07.sul.t-online.com ([194.25.134.83])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVdve-0006Zl-Ez
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 18:09:52 -0400
From: tglx@linutronix.de (Thomas Gleixner)
To: Pantelis Antoniou <panto@intracom.gr>
Date: Thu, 3 Jun 2004 00:04:12 +0200
References: <200406020023.02262.tglx@linutronix.de>
	<40BD6EE4.5010805@intracom.gr>
In-Reply-To: <40BD6EE4.5010805@intracom.gr>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200406030004.12864.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 02 June 2004 08:08, Pantelis Antoniou wrote:
> Thomas Gleixner wrote:
> >Hi all,
> >
> >the NAND driver has some more new features
> >
> >- support for AG-AND chips (currently tested with HN29V1G91T-30)
> >- bad block table support (memory and flash based)
> >- a new API documentation (online version is available on MTD homepage)
>
> Sounds interesting...
>
> I'll test when I have some spare time available.
>
> Just a question.
>
> Does it do the automatic bad block skipping on read-only
> like my patch did, so I can mount CRAMFS?
>
> That is, is something like my patch still required,
> or it is no longer necessary?

No, it does not. This is the job of a translation layer. So your patch os n=
ot=20
obsolete

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
