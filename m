Received: from mailout11.sul.t-online.com ([194.25.134.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BQ3q3-0003sl-Bh
	for linux-mtd@lists.infradead.org; Tue, 18 May 2004 13:36:55 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: "Teuling, Sieme" <Sieme.Teuling@echostar.com>,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 18 May 2004 14:31:03 +0200
References: <C86A9402F6A07E47B2F50A302DFA9BAE044C58@alm-exch.europe.echostar.com>
In-Reply-To: <C86A9402F6A07E47B2F50A302DFA9BAE044C58@alm-exch.europe.echostar.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200405181431.03242.tglx@linutronix.de>
Subject: Re: patch for nand support linux-2.4.21 jffs2?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 18 May 2004 13:42, Teuling, Sieme wrote:
> Hi,
>
> I'm working with a linux 2.4.21 port and I just found out jffs2 has no
> nand support (bad block handling) in this version.
> Is there a patch available to solve this?, or if not, what is the best
> thing to do to get the 2.4.21 to work with nand flashes?

Use current MTD CVS code.=20

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
