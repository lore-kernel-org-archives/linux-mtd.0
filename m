Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBfGR-0005Ia-C2
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2004 20:32:39 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
 Steven Scholz <steven.scholz@imc-berlin.de>
Date: Thu, 8 Apr 2004 21:28:23 +0200
References: <40742192.5030901@imc-berlin.de> <407553A5.5010702@imc-berlin.de>
	<20040408143717.GA1921@wohnheim.fh-wedel.de>
In-Reply-To: <20040408143717.GA1921@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200404082128.23060.tglx@linutronix.de>
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: kernel oops in cfi_cmdset_0002.c:do_write_one()...
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 08 April 2004 16:37, J=F6rn Engel wrote:
> On Thu, 8 April 2004 15:29:09 +0200, Steven Scholz wrote:
> > I just notice that in my old 2.4.20 kernel tree I have a
> >
> > 	* $Id: cfi_cmdset_0002.c,v 1.67 2003/04/15 22:32:13 thayne Exp $
> >
> > and in a _new_ 2.4.25 tree I have
> >
> > 	 * $Id: cfi_cmdset_0002.c,v 1.62 2003/01/24 23:30:13 dwmw2 Exp $
> >
> > How could that be !?!?
> >
> > Is the MTD code not pushed up into the main kernel sources???
>
> It is, whenever David finds the time for it.
>
> Don't blame him, this is the result of using CVS, which is designed
> around the assumption of a single central repository.  If current sync
> speed is to slow for you, try to make it easier for him to send
> patches forward.

I don't know, if he is really happy, if everybody starts to send patches=20
upstream. He does a good job on this and he focussed more on 2.6 in the las=
t=20
months. But I'm sure that he can be convinced to bring 2.4 to the same stat=
e=20
as 2.6 at least. On the other hand we live very well with the MTD patches=20
since long, so what :) I never trust the kernel stuff of subsystems, which=
=20
have a active development team :)

=2D-=20
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concep=
t,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
