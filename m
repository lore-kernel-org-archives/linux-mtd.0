Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KN6Z-0007jJ-Jg
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 19:53:55 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HFI005DYCI944@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 26 May 2003 20:54:10 +0200 (MEST)
Date: Mon, 26 May 2003 21:52:52 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030526182624.GA551@wohnheim.fh-wedel.de>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
 David Wuertele <dave-gnus@bfnet.com>
Message-id: <200305262152.52858.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <m34r3izfvn.fsf@bfnet.com> <m3smr1y71o.fsf@bfnet.com>
 <20030526182624.GA551@wohnheim.fh-wedel.de>
Content-type: text/plain; charset=iso-8859-1
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

On Monday 26 May 2003 20:26, J=F6rn Engel wrote:
> On Mon, 26 May 2003 10:03:15 -0700, David Wuertele wrote:
> > DWMW2> You'll need to make sure that zlib is in your toolchain's
> > DWMW2> sys-root or otherwise available.
> >
> > Apparently that's not all you need.  I haven't been able to get any
> > version to compile due to my kernel's jffs2.h not defining jint16_t
> > and friends.  Unfortunately, I can't patch my kernel because it
> > contains NAND code specific to my board that gets munged by
> > patchin.sh.
>
> Your kernel contains NAND code that is missing from mtd cvs?  Care to
> provide a patch or at least the source files in question?
Would be easy :)

Another possibility. Patch your stuff into mtd/drivers/mtd/nand directory a=
nd=20
run then patchin.sh on your kernel.

=2D-=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
