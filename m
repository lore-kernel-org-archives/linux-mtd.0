Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GOXG-0000s9-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 19:04:46 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H65002KTD1XNS@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 25 Nov 2002 20:34:46 +0100 (MET)
Date: Mon, 25 Nov 2002 20:32:45 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: JFFS2 Config / FAQ
In-reply-to: <20021125183858.GA26478@wohnheim.fh-wedel.de>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
 David Woodhouse <dwmw2@infradead.org>
Cc: joakim.tjernlund@lumentis.se,
 Herman Oosthuysen <Herman@wirelessnetworksinc.com>,
 linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200211252032.45725.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
References: <IGEFJKJNHJDCBKALBJLLOEENFIAA.joakim.tjernlund@lumentis.se>
 <5807.1038241193@passion.cambridge.redhat.com>
 <20021125183858.GA26478@wohnheim.fh-wedel.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Monday 25 November 2002 19:38, J=F6rn Engel wrote:
> On Mon, 25 November 2002 16:19:53 +0000, David Woodhouse wrote:
> > joakim.tjernlund@lumentis.se said:
> > >  I think it's 5 blocks currently. It should be possible to lower th=
at
> > > count, but that needs testing.
> >
> > It was tested. It broke. http://mhonarc.axis.se/jffs-dev/msg01495.htm=
l
>
> Yes, it broke with a smaller number. But wether that smaller number
> was 4, 1 or 0 is unknown.
>
> I would expect 3 or 4 to be fine, but not bet more than a beer on it.

In August this year I made some cleanup in the GC algorithms, as they wen=
t=20
into an endless GC loop, when the fs was filling up to 100%. I tried also=
 to=20
reduce blocks, 4 worked sometimes, 3 broke always.=20

It depends on the filesizes you have on your fs (deleted or overwritten).=
 But=20
with 5 I was not able to break it again.

--=20
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
