Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EbB3-0007f5-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 18:01:21 +0000
Date: Fri, 5 Jan 2001 13:01:18 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>, <Russ.Dill@asu.edu>,
        <mtd@infradead.org>
Subject: Re: Supported flash memory 
In-Reply-To: <12049.978714204@redhat.com>
Message-ID: <Pine.LNX.4.30.0101051257060.535-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 5 Jan 2001, David Woodhouse wrote:

>
> kenneth.johansson@inn.ericsson.se said:
> >  Well with SRAM you can intercange any data pin with another data pin
> > and likewise with the adress bus and nothing would notice. Doing this
> > with ROM or FLASH makes things quite interesting. This would mean that
> > anything trying to program the device has to do translation.
>
> For address lines, this is fixed up by the 'map' driver. For data lines it's
> a little more annoying. But include/linux/cfi_endian.h could theoretically
> at least do any form of swapping you desire.

This is required only for flash in command mode, so cfi_build_cmd() is the
best place to shuffle bits.  Everything is likely to be shuffled at compile
time and raw reads/writes aren't impacted.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
