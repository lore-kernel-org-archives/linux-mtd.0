Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQW3p-0007ez-Rb
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 16:54:15 -0400
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IX500I6DZDZUMT0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 16:53:59 -0400 (EDT)
Date: Mon, 03 Apr 2006 16:53:58 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <39CC97884CA19A4D8D6296FE94357BCB04E5B18C@swsmsx404>
To: "Kolakowski, Mikolaj" <Mikolaj.Kolakowski@intel.com>
Message-id: <Pine.LNX.4.64.0604031651590.2550@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <39CC97884CA19A4D8D6296FE94357BCB04E5B18C@swsmsx404>
Cc: linux-mtd@lists.infradead.org
Subject: RE: erase suspend functionality
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 3 Apr 2006, Kolakowski, Mikolaj wrote:

> >> Hi,
> >>
> >> Anybody can explain how erase suspend should work from the macro
> >> perspective?
> >> I assume that when I delete huge file and JFFS2 starts erasing
> sectors
> >> then when I try to write small amount of data I shouldn't wait until
> all
> >> the sectors on a erase pending list will be erased? The write should
> >> stop erasing. Is it true?
> >
> >Only if the write is going to happen in a sector not scheduled for
> >erase.
> >
> So if there was no clean space to execute the write, then even if the
> driver will erase one sector from the pending list it won't allow write
> until all the sectors from the pending list will be erased? 
> If this is true then what must have happen to do erase suspend?

erase suspend may occur if the sector to be written to is not being 
erased but some other sectors are.


Nicolas
