Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KZhj-0002Di-AO
	for <linux-mtd@lists.infradead.org>; Tue, 27 May 2003 09:21:07 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HFJ0089HDVLEJ@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 27 May 2003 10:21:22 +0200 (MEST)
Date: Tue, 27 May 2003 11:20:01 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <m3k7cdy0yg.fsf@bfnet.com>
To: David Wuertele <dave-gnus@bfnet.com>,
 =?utf-8?q?J=C3=B6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Message-id: <200305271120.01358.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <m34r3izfvn.fsf@bfnet.com>
 <20030526182624.GA551@wohnheim.fh-wedel.de> <m3k7cdy0yg.fsf@bfnet.com>
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/utils automake attic?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 26 May 2003 21:14, David Wuertele wrote:
> J=C3=B6rn> Your kernel contains NAND code that is missing from mtd cvs?
> J=C3=B6rn> Care to provide a patch or at least the source files in
> J=C3=B6rn> question?
>
> Of course I don't mind, it is GPL after all.  But I doubt it will be
> useful to you: it is specifically for my vendor's CPU, and if you have
> their CPU you have this code already.
It's not a problem, that it's specifically for this CPU.=20
The problem is that it's totaly incompatible to MTD stuff. It's based on 2=
=20
year old MTD code and does not match the current MTD-CVS implementation. A=
=20
lot of stuff like bad block mapping ... is in there, which is likely to be =
a=20
PITA, if you try to run current JFFS2 code on top of it.

=2D-=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
