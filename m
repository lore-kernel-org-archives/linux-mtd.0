Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142xnf-00042i-00
	for mtd-list@infradead.org; Mon, 04 Dec 2000 15:45:07 +0000
Received: from caja.ldhs.cetuc.puc-rio.br ([139.82.28.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142xnd-00041j-00
	for mtd@infradead.org; Mon, 04 Dec 2000 15:45:05 +0000
Received: from mamao.cetuc.puc-rio.br (mamao.cetuc.puc-rio.br [139.82.74.2])
	by caja.ldhs.cetuc.puc-rio.br (8.9.3/8.9.3) with ESMTP id NAA12353
	for <mtd@infradead.org>; Mon, 4 Dec 2000 13:42:15 -0200
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: mtd@infradead.org
Date: Mon, 4 Dec 2000 13:44:57 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: DiskOnChip 2000/Millennium driver merge.
Reply-to: miguel@cetuc.puc-rio.br
Message-ID: <F1CBD81818@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ollie Lho wrote:

> > I note you changed DoC_Command() so it no longer finishes with
> > DoC_WaitReady(). Is there a situation in which DoC_Command shouldn't
> > wait for FR_B after sending the command? Does it do any harm to do
> > so, or is the removal just an optimisation?
> >
> 
> The reason that I removed DoC_WaitReady() for DoC_Command() is you are
> using DoC_Command to find how many flash chip on a single DoC. If
> there is no more chip, the ready bit will never get high. And the
> driver hangs.
> 
> Ollie

   Hummm, this is a little off-topic, but you have just explained me 
why my PIC routines to access DOC2000 were hanging!!! I saw 
exactly this with a logic analiser, but when using the same DOC on a 
PC it worked, don't ask me why...(and it never left the WaitReady by 
timeout)


Miguel Freitas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
