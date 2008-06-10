Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K63bf-0006Lw-EP
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 13:09:47 +0000
Date: Tue, 10 Jun 2008 14:09:46 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: CFI-0002 NOR flash blocking CPU on status register reads
Message-ID: <20080610130945.GB28565@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Something's been bothering me for a while about a local patch to the
cfi_cmdset_0002.c driver.  What bothers me most is that we're using a
standard NOR chip from Spansion - so why do we need a special patch?

Jörn Engel wrote:
> > I have a particularly crappy one where erase blocks the CPU if the CPU
> > reads from the chip during the erase - so the cfi_cmdset_0002.c file
> > needs a patch to avoid polling the status register for this board.
> > This is topic for another post, though.
> 
> Nothing can prevent bad drivers.  At least they are easy to fix.

It's not a driver problem (as far as I can tell).  The board requires
it - the NOR flash blocks CPU read cycles when reading the status
register.  I didn't find a way to turn it off in CFI-0002 specs.

There's a wire from RY/BY# (ready/busy) on the flash to PB_IORDY on
the CPU.  That's "peripheral bus ready" - it causes I/O wait states
when deasserted during an I/O cycle to the flash.

Let me explain with the aid of a patch, to cfi_cmdset_0002.c:

static inline int do_erase_chip
...
        cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi,
                         CFI_DEVICETYPE_X8, NULL);
        timeo = jiffies + (HZ*20);
        adr = cfi->addr_unlock1;
 
+       /* We need extra delay here since reading bit5/bit6 operation may
+          freeze the chip for some time. */
+       cfi_spin_unlock(chip->mutex);
+       set_current_state(TASK_UNINTERRUPTIBLE);//add by rain
+       schedule_timeout(((1<<cfi->cfiq->ChipEraseTimeoutTyp) * HZ) / 1000);
+       cfi_spin_lock(chip->mutex);

        /* Wait for the end of programing/erasure by using the toggle
         * method.  As long as there is a programming procedure going
         * on, bit 6 of the last written byte is toggling it's state
         * with each consectuve read.  The toggling stops as soon as
         * the procedure is completed.
         *
         * If the process has gone on for too long on the chip bit 5 gets.
         * After bit5 is set you can kill the operation by sending a reset
         * command to the chip.
         */
        dq6 = CMD(1<<6);
        dq5 = CMD(1<<5);
        oldstatus = cfi_read(map, adr);
        status = cfi_read(map, adr);
        while( ((status & dq6) != (oldstatus & dq6)) && 
                ((status & dq5) != dq5) &&
                !time_after(jiffies, timeo)) {
... etc.

If we don't have the explicit time delay (and it's pretty long, about
0.25 to 0.5 seconds), then the cfi_read() below blocks in an I/O wait
state, until the erase is complete.  The Spansion flash outputs a
logic low on RY/BY#, and the CPU blocks when reading.  While the CPU
is blocked, it cannot service interrupts: time gets skewed and other
things that should be serviced don't look pretty.  So, we add the
explicit delay to prevent blocking.

I noticed that mainline sources, even uClinux patches, don't have this
delay.  (The patch is to an old kernel, but I looked for similar in
current).  Does that mean nobody else has this issue?

If true, does that mean this board shouldn't have wired RY/BY# on the
Spansion flash to PB_IORDY on the CPU.  Ok, I can ask for the future
revisions to remove this wire, and only use the delay with boards that
have it.  Then everything else will run smoother while writing flash.

But if I remove that wire, when the CPU is reset (e.g. by watchdog
chip or other means), the flash might be in the middle of a write or
erase operation.  Especially erase, as that's slower than CPU reset.
This is normal, as we often write to JFFS2 on this chip.

Won't the CPU read the initial boot instructions from this flash, get
programming status bytes instead of CPU instructions, and thus get
confused?

What do other designs booting from CFI NOR do about this?

Thanks very much for any insights,
-- Jamie
