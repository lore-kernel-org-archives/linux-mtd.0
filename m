Received: from az33egw01.freescale.net ([192.88.158.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K67V3-000737-II
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 17:19:13 +0000
Date: Tue, 10 Jun 2008 10:18:23 -0700 (PDT)
From: Trent Piepho <tpiepho@freescale.com>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: CFI-0002 NOR flash blocking CPU on status register reads
In-Reply-To: <20080610130945.GB28565@shareable.org>
Message-ID: <Pine.LNX.4.64.0806100952240.15519@t2.domain.actdsltmp>
References: <20080610130945.GB28565@shareable.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 10 Jun 2008, Jamie Lokier wrote:
> If we don't have the explicit time delay (and it's pretty long, about
> 0.25 to 0.5 seconds), then the cfi_read() below blocks in an I/O wait
> state, until the erase is complete.  The Spansion flash outputs a
> logic low on RY/BY#, and the CPU blocks when reading.  While the CPU
> is blocked, it cannot service interrupts: time gets skewed and other
> things that should be serviced don't look pretty.  So, we add the
> explicit delay to prevent blocking.
>
> I noticed that mainline sources, even uClinux patches, don't have this
> delay.  (The patch is to an old kernel, but I looked for similar in
> current).  Does that mean nobody else has this issue?
>
> If true, does that mean this board shouldn't have wired RY/BY# on the
> Spansion flash to PB_IORDY on the CPU.  Ok, I can ask for the future
> revisions to remove this wire, and only use the delay with boards that
> have it.  Then everything else will run smoother while writing flash.

We disconnected the RY/BY# line in our design.  It has the flash conected to a
Freescale GPCM local bus, and on that bus de-asserting the LB_READY line is
used to abort a transaction.  So instead of inserting wait states and hogging
the CPU, it aborts the read cycle immediately and frees the CPU, but doesn't
return correct status.  We couldn't think of any good reason to have RY
connected.

> But if I remove that wire, when the CPU is reset (e.g. by watchdog
> chip or other means), the flash might be in the middle of a write or
> erase operation.  Especially erase, as that's slower than CPU reset.
> This is normal, as we often write to JFFS2 on this chip.
>
> Won't the CPU read the initial boot instructions from this flash, get
> programming status bytes instead of CPU instructions, and thus get
> confused?
>
> What do other designs booting from CFI NOR do about this?

The RESET# pin on the flash should take care of that:

     "The RESET# pin provides a hardware method of resetting the device to
     reading array data.  When the RESET# pin is driven low for at least a
     period of tRP, the device immediately terminates any operation in
     progress, Hi-Z all output pins, ...  The RESET# pin may be tied to the
     system reset circuitry.  A system reset would thus also reset the Flash
     memory, enabling the system to read the boot-up firmware from the Flash
     memory."
