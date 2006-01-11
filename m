Received: from mail.gw-instruments.de ([82.144.60.34]
	helo=redbean.intranet.gw-instruments.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EwcxZ-0003ca-Ug
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 05:12:09 -0500
Date: Wed, 11 Jan 2006 11:11:44 +0100 (CET)
From: Peter Wippich <pewi@gw-instruments.de>
To: alfred hitch <alfred.hitch@gmail.com>
In-Reply-To: <29f916510601102154i4935a716g7ee1751465e21c3d@mail.gmail.com>
Message-ID: <Pine.LNX.4.33.0601111107380.26443-100000@redbean.intranet.gw-instruments.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: sector locks handling for J3 flashes?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Alfred,

the original MTD driver unlocks all flash sector during initialization.
However, this is a lenghty operation. Took about 2..3 seconds, depending
on flash size. Uli Luckas has supplied a patch which does "lazy"
unlocking. Each time a write / erase operation fails it unlocks the sector
and retries the operation. But this is only available for the latest 2.6
kernel. You may have a look there and / or check Russel's patch history
for the ARM linux kernel.

Ciao,

Peter



On Wed, 11 Jan 2006, alfred hitch wrote:

> Hi,
>
> I am trying to understand how it works for flash'es which have
> Hardware flash protection.
> Bootloader say locks say 1 partition, then linux kernel / MTD while coming up
> reads / probes flash (sector by sector) for locked sectors ?
> If yes, and it maintain this in an internal software structure. Using
> it when writes to partitions is done ?
>
> I hope linux kernel arm-linux2.4.25-x (snapgear 3.1) has support for
> ixdp425 and Intel J3 Strata flash for automatic detection and working
> with locked flashes ?
>
> Any one already tried this ?
>
> Regards,
> Alfred
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

|	Peter Wippich 			Voice: +49 30 46776411		|
|	G&W Instruments GmbH		fax:   +49 30 46776419		|
|	Gustav-Meyer-Allee 25, Geb. 12	Email: pewi@gw-instruments.de	|
|	D-13355 Berlin  / Germany					|
