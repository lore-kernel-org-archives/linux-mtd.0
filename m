Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19knh2-0002U0-QA
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 17:32:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Chuck Meade <chuckmeade@mindspring.com>
In-Reply-To: <IIEEICKJLNEPBBDJICNGOEHADMAA.chuckmeade@mindspring.com>
References: <IIEEICKJLNEPBBDJICNGOEHADMAA.chuckmeade@mindspring.com>
Message-Id: <1060273956.25209.267.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Aug 2003 17:32:36 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DOC filesystem questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-07 at 17:09, Chuck Meade wrote:
> It looks like nftldump sees the bad unit table as being the 7680 
> bytes starting at byte offset 512 into the device. 

Er, there's a copy of the Bad Unit Table in each of the two eraseblocks
containing an NFTL Media Header, at offset 512 within each block. It's
not unconditionally offset 512 in the device.

The Bad Unit Table is one byte per logical erase unit, where the
relationship from physical to logical erase units (UnitSizeFactor) is
given in the Media Header itself (i.e. in the struct in the first 512
bytes). It's _normally_ 1:1 but that isn't mandatory.

In devices with 16KiB erase size, the Bad Unit Table can also be
16384-512 bytes, not 7680 (8192-512)

> nftl_format actually creates a bad unit table at offset 512
> beyond the offset that the user provides on the command line.  The
> size of the bad unit table it creates is based on the actual number
> of erase units in the device, so I suppose it will not always be
> 7680.

That's correct. I believe that if it would be more than would fit then
we have to change the UnitSizeFactor though.

>   It looks for blocks marked bad in their oob data to create
> this table.  It also (by default) will do read/write/erase checking
> on each block not already marked bad in its oob data, and any
> failures are added to the bad unit table as well.

The OOB check isn't necessarily correct. I have in front of me a Toshiba
TC58V64AFT datasheet which says...

	"At the time of shipment, all data bytes in a Valid Block
	 at FFh.  For Bad Blocks, all bytes are not in the FFh
	 state. Please don't perform erase operation to Bad Blocks."

Basically a block is bad if it contains anything but 0xFF when it
_arrives_ but obviously if the device has been subsequently used, many
other blocks could be in that state.

Likewise, the custom of setting the 5th byte of the OOB area to
something other than 0xFF gives you false positives on used DiskOnChip
devices, since we use the first six OOB bytes for DiskOnChip hardware
ECC. 

We _must_ retain the bad block table which was on the device when it
arrived from the factory. 

> So it seems the news isn't that bad.  If we always leave the oob
> data alone when the oob is marked bad for a block at the factory,
> then nftl_format will include it in the BadUnitTable it creates.
> Then preserving the factory-set bad block table would only be
> critical if it marks blocks bad that are not marked bad in their
> oob data.

It is critical, because it _does_ mark blocks bad which are not marked
bad in their oob-data, and because there are blocks which would
_apparently_ be marked bad in their oob-data which _aren't_ actually
bad.

I've fixed up the generic NAND code to allow the board code to register
a 'nand_block_bad()' function, and the DiskOnChip driver needs to hook
into that correctly, using the BBT as appropriate.

And I need to come up with a solution for the JFFS2-on-DiskOnChip
situation, where we don't have the NFTL Media Header block which would
contain a BBT. I'll probably end up with an INFTL header with its
'partition table' instead. 

-- 
dwmw2
