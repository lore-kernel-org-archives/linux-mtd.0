Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140xS1-0006kl-00
	for mtd-list@infradead.org; Wed, 29 Nov 2000 02:58:29 +0000
Received: from modemcable248.137-200-24.mtl.mc.videotron.ca ([24.200.137.248] helo=xanadu.gn.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140xRz-0006ke-00
	for mtd@infradead.org; Wed, 29 Nov 2000 02:58:28 +0000
Date: Tue, 28 Nov 2000 21:59:04 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Alice Hennessy <ahennessy@mvista.com>
cc: <mtd@infradead.org>
Subject: Re: Big Endian issues
In-Reply-To: <3A244346.12F3235B@mvista.com>
Message-ID: <Pine.LNX.4.30.0011282151430.914-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 28 Nov 2000, Alice Hennessy wrote:

> In dealing with data, however, map->write32 is used in writes but
> map->copy_from is used in reads.
> So, the assumption I assume is that map->copy_from will also swap bytes.
> But in my environment,
> map->copy_from (memcpy_fromio) doesn't swap bytes.  I don't think it needs to
> if we make use of
> map->copy_to (memcpy_toio)  when writing data (in amd_write_val and in the
> immediate data check). In this case, copy_from and copy_to functions just
> need to be consistent.

Neither of the write nor copy map methods is supposed to swap bytes.

Bytes might be swapped in cfi_build_cmd so you actually write commands and
compare with status in the device's endianness.  However data shouldn't be
swapped at all.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
