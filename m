Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19A3XD-0003ra-TO
	for <linux-mtd@lists.infradead.org>; Mon, 28 Apr 2003 08:58:47 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HE100CI9NHGSC@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 28 Apr 2003 09:58:29 +0200 (MEST)
Date: Mon, 28 Apr 2003 10:57:55 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030426101840.GA31391@wohnheim.fh-wedel.de>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
 Alex Samoutin <samoutin@hotbox.ru>
Message-id: <200304281057.55422.tglx@linutronix.de>
MIME-version: 1.0
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
 <000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
 <20030426101840.GA31391@wohnheim.fh-wedel.de>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Fw: corrupt my NAND flash device
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 26 April 2003 12:18, J=F6rn Engel wrote:
> On Fri, 25 April 2003 15:23:36 -0700, Alex Samoutin wrote:
> > This is diff file for drivers/mtd/nand.c
>
> Thanks!
>
> > (I made to many changes to create a patch)
>
> Does that mean you cannot "diff -u"? I looked briefly at checking your
> changes in, but the non-uniform format means a lot more work.
>
> David, Thomas, any objections against Alex' changes?

Yes, as I can't see any neccecarity for an additional lock.

I'm not willing to buy, that a global lock is the solution for something,=
 what=20
breaks a per chip lock. If there is an issue with the chip locking, then =
this=20
issue has to be solved and nothing else.

Can anybody please explain how you manage to break the locking and the co=
mmand=20
order ?

--=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
