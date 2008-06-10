Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K64H4-0000Gl-7f
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 13:52:34 +0000
Date: Tue, 10 Jun 2008 14:52:30 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: CFI-0002 NOR flash blocking CPU on status register reads
Message-ID: <20080610135229.GA31112@shareable.org>
References: <20080610130945.GB28565@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080610130945.GB28565@shareable.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jamie Lokier wrote:
> There's a wire from RY/BY# (ready/busy) on the flash to PB_IORDY on
> the CPU.  That's "peripheral bus ready" - it causes I/O wait states
> when deasserted during an I/O cycle to the flash.

> does that mean this board shouldn't have wired RY/BY# on the
> Spansion flash to PB_IORDY on the CPU.
...
> But if I remove that wire, when the CPU is reset (e.g. by watchdog
> chip or other means), the flash might be in the middle of a write or
> erase operation.
...
> Won't the CPU read the initial boot instructions ... get
> programming status bytes...?

Oh, after reading the documentation more closely, I see the Spansion
chip has a reset signal, which aborts any write/erase operation
immediately, and it's safe to read CPU instructions then.

So I don't need the I/O wait states, and it looks like the board
designers should not have connected RY/BY# to PB_IORDY.

It is copied from a Sigma Designs reference design...  I guess they
did it because their boot monitor's write/erase code does not poll the
status register correctly (checking for toggling DQ6), but simply
waits for the read byte to match what's written.  That would cause
unreliable writing, and adding the wire would fix it.

Is that right?

Assuming so, my remaining problem (other than fixing their boot
monitor's flash code) is a few thousand boards which have the wire,
currently deployed.

The hard delay we patched in works, but assumes "typical erase time"
is enough, which may cease to be true as the chips age.  Is that
expected?  Should I use the max erase/write times instead?

(Oh, the joy of board mis-design workarounds!)

-- Jamie
