Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195mbx-0004sV-Nd
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 14:06:01 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HDF00MULTPDJ8@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 16 Apr 2003 15:05:38 +0200 (MEST)
Date: Wed, 16 Apr 2003 16:05:33 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030416111353.GE25858@wohnheim.fh-wedel.de>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Message-id: <200304161605.33119.tglx@linutronix.de>
MIME-version: 1.0
References: <20030415171123.GH7721@wohnheim.fh-wedel.de>
 <200304161335.50367.tglx@linutronix.de>
 <20030416111353.GE25858@wohnheim.fh-wedel.de>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: esn@cotas.dk
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: Database on JFFS2?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 16 April 2003 13:13, J=F6rn Engel wrote:
> On Wed, 16 April 2003 13:35:50 +0200, Thomas Gleixner wrote:
> > [lots of good information]
> >
> > JFSS2 does no write on fsync, as data are already written.
>
> This is true for NOR, but how about the wbuf for NAND? How does that
> respond to sync/fsync?
Sync triggers flush_wbuf.=20
NAND uses a writebuffer of page_size, which is 256 / 512 Byte depending o=
n the=20
chip type.

> iirc it used to ignore sync completely so people could potentially get
> into trouble if they write-sync-poweroff with <2s between write and
> poweroff.
write - sync -poweroff works on NAND. flush_wbuf is also triggered on umo=
unt.

--=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
