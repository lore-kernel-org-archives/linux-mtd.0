Received: from cc60549-a.deven1.ov.nl.home.com ([217.120.142.92] helo=server.wielewaal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175aJw-0006Za-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 23:54:04 +0100
From: "Pieter Grimmerink" <mailinglists@grimmerink.nl>
To: <linux-mtd@lists.infradead.org>
Cc: <gleixner@autronix.de>
Subject: RE: Current status JFFS2 on DOC
Date: Thu, 9 May 2002 00:52:56 +0200
Message-ID: <MPBBIIEFELAEABNCNHMMAELCDAAA.mailinglists@grimmerink.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200205081822.g48IMck11634@thomas.tec.autronix.de>
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

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Thomas Gleixner
> Sent: woensdag 8 mei 2002 20:23
> To: Pieter Grimmerink; linux-mtd@lists.infradead.org
> Subject: Re: Current status JFFS2 on DOC
>
>
> On Wednesday, 8. May 2002 18:37, Pieter Grimmerink wrote:
> > From a design point of view, DiscOnChip looks nice with
> > it's feature to boot from it.
> > SmartMedia looks a bit cheaper, but that would require
> > a separate NOR device, large enough to hold a compressed
> > kernel, total price going up above the DOC prices again.
> The minimum requirement is 1MB for a compressed kernel image
> and a bootloader. That's affordable and working :)

Well, it's still something like up to 10 $ extra. Might not sound
much for a few devices, but when numbers get higher...

> The DOC solution is not workable, because it's not available, but you are
> heartly invited to join the club and hack the neccecary drivers.
> There are
> some more people around, who are interrested.

I'd be happy to contribute, though this won't be the first thing I'll
be working on, there are a few devicedrivers to implement first.
I'll probably start off with a different fs, or even with a different
flash device, to get the main functionality right.
But judging by the information I've got so far, I think JFFS2 on DOC
is what I'll eventually go for.

Best regards,

Pieter
