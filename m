Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 154oOp-0006wR-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 May 2001 19:39:23 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D995470@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Frederic Giasson
	 <fgiasson@mediatrix.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Found a potential bug in MTD 
Date: Tue, 29 May 2001 14:38:48 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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







-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, May 29, 2001 2:26 PM
To: Frederic Giasson
Cc: linux-mtd@lists.infradead.org
Subject: Re: Found a potential bug in MTD 



fgiasson@mediatrix.com said:
> 
> 	I compiled and tested the change with my board, and it works OK.  It
> also make sense since CFI_DEVICETYPE_X8 is an hardcoded value for 8
> bits type devices, and cfi->device_type holds the buswidth specified
> in xconfig. 

The addr_unlock values set in cfi_probe_chip() are supposed to compensate
for that. We can't do it by shifting by the device_type, because sometimes 
we need to put an odd address value on the bus for 16-bit chips. 

But the actual _detection_ of CFI chips shouldn't be affected by that 
anyway, unless it's falling back to the JEDEC probe.

--
dwmw2


	Maybe but the actual code does not work if you specify a 1x16
geometry with an actual single 16 bits chip on the memory bus.  Also, either
specifying 2x8 geometry or letting MTD autodetect the geometry leads to a
wrong sector organization detection on my board.  I don't know know if it is
the case with other board with 16 bits flash on it (does somebody else
already experienced that problem?), but with 2x8 I come out with bad sizes
and of course bad offset for my sectors.

	I understand that one may want to address a byte at a time, but many
flash chips has a pin called BYTE to specify byte (8 bits) or word (16 bits)
addressing.  If BYTE is set to 8 bits, then it serves nothing to wire all 16
I/O pins because all MSB pins would be don't care.  If it has not been done
yet, maybe someone should check in CFI standard specifications to see if
this is right.  

	But despite of that, doesn't cfi->device_type hold the right
devicetype specified by xconfig?  If someone wants to address the chip in
byte mode, then he will be able to do so (as if CFI_DEVICETYPE_X8 would have
been hardcoded), and if 16 bits (word mode) is specified in xconfig, then it
will work right too.  What do you think?
