Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190px2-0007JC-5C
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 22:39:20 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HCQ003EDK4PB4@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 02 Apr 2003 23:38:50 +0200 (MEST)
Date: Thu, 03 Apr 2003 00:39:18 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030402201233.GA17890@wohnheim.fh-wedel.de>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>,
 Siddharth Choudhuri <choudhri@cs.tamu.edu>
Message-id: <200304030039.18812.tglx@linutronix.de>
MIME-version: 1.0
References: <Pine.GSO.4.44.0304021225270.18949-100000@unix.cs.tamu.edu>
 <20030402201233.GA17890@wohnheim.fh-wedel.de>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
Subject: Re: newbie: struct flchip in flashchip.h...
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 02 April 2003 22:12, J=F6rn Engel wrote:
> On Wed, 2 April 2003 12:28:47 -0600, Siddharth Choudhuri wrote:
> > What are the members of the structure <mtd/flashchip.h>
> > struct flchip {
> > ...
> > =09int word_write_time;
> > =09int buffer_write_time;
> > =09int erase_time;
> > }
> > used for ?
>
> I don't know, but you can figure it out yourself. Try
> http://lxr.linux.no/
grep -r word_write_time *
would help too :)

--=20
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
