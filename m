Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IFuVY-0005DD-VO
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 12:23:45 -0400
Received: from ben by aeryn.fluff.org.uk with local (Exim 4.63)
	(envelope-from <ben@fluff.org.uk>) id 1IFuVP-0001dY-IG
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 17:23:31 +0100
Date: Tue, 31 Jul 2007 17:23:31 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: Re: Unlocking with Intel J3 series flash
Message-ID: <20070731162331.GA31821@fluff.org.uk>
References: <20070731153547.GA24705@marvin.netwinder.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070731153547.GA24705@marvin.netwinder.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 31, 2007 at 11:35:47AM -0400, Ralph Siemsen wrote:
> Greetings,
> 
> When using Intel J3 flash, unlocking operations are horribly slow.
> The reason for this is that the J3 has "Flexible Block-locking" feature
> (to quote that data sheet) which "allows blocks to be individually
> locked and simultaneously unlocked".
> 
> Unlike other flash chips which power up either locked or unlocked,
> the J3 series stores lock status in the flash itself (non-volatile).
> Locking is reasonably fast (~64us) and can be done per-block, but
> unlocking is very slow (~0.5s) and does the whole chip at once.
> 
> Current MTD code makes the situation much worse, because the
> unlock() operation goes via cfi_varsize_frob() and iterates over
> the block lists.  This is of course correct behaviour when the
> cells are indivudually un-lockable, however it results in minute-long
> delays and many needeless erase cycles for the J3 series.
> 
> I am looking for ideas on how to deal with this.  One idea would be
> to introduce a cousin to the existing MTD_STUPID_LOCK, perhaps one
> called MTD_STUPID_UNLOCK, which would then be used to ensure that
> unlocking does not iterate over all flash blocks.

My solution, which I can post the patch for, is to check the lock
status of the page before trying to unlock the device.

| 2621-rc6-trizeps2-mtd-chip-unlock-check2.patch
|
| When migrating from Intel 28F128K3C to 28F128J3D parts,
| it was found that the device unlock command unlocks the
| entire flash.
|
| The 28F128J3D also takes time to unlock, even if the state
| is unlocked, thus an unlock of an partition (which sends the
| unlock command to all sectors) can take 10-15 seconds to
| complete.
|
| To work around this problem, this patch places a check in the
| unlock/lock code to check the status of the sector before issuing
| the command.
|
| Note, we make the assumption that all flashes return the correct
| sector status, and that there is no need to force an lock or
| unlock if the status is the same as the chip is reporting.
|
| Files affected:
|   drivers/mtd/chips/cfi_cmdset_0001.c |   25 	25 +	0 -	0 !
|   1 file changed, 25 insertions(+)
|
| Ben Dooks, Mon, 23 Apr 2007 21:46:45 +0100
|
| Signed-off-by: Ben Dooks <ben-linux@fluff.org> 

diff -urpN -X linux-2.6.21-rc6-mtdfix1/Documentation/dontdiff linux-2.6.21-rc6-teradyne-mtdfix1/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.6.21-rc6/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.6.21-rc6-mtdfix1/drivers/mtd/chips/cfi_cmdset_0001.c	2007-04-10 11:37:40.000000000 +0100
+++ linux-2.6.21-rc6/drivers/mtd/chips/cfi_cmdset_0001.c	2007-04-23 21:44:23.000000000 +0100
@@ -1854,6 +1854,9 @@ static int __xipram do_xxlock_oneblock(s
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
+	unsigned int ofs_factor = cfi->interleave * cfi->device_type;
+	map_word locked = CMD(0x01);
+	map_word status;
 	int udelay;
 	int ret;
 
@@ -1869,6 +1872,27 @@ static int __xipram do_xxlock_oneblock(s
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
+	/* check to see if the block is actually in the right state */
+
+	map_write(map, CMD(0x90), adr + (2 * ofs_factor));
+	chip->state = FL_JEDEC_QUERY;
+
+	status = map_read(map, adr + (2 * ofs_factor));
+
+	/* return the chip to a state */
+	map_write(map, CMD(0xf0), adr);
+	map_write(map, CMD(0xff), adr);
+
+	chip->state = FL_READY;
+
+	if (map_word_andequal(map, status, locked, locked)) {
+		if (thunk == DO_XXLOCK_ONEBLOCK_LOCK)
+			goto already;
+	} else {
+		if (thunk == DO_XXLOCK_ONEBLOCK_UNLOCK)
+			goto already;
+	}
+
 	map_write(map, CMD(0x60), adr);
 	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
 		map_write(map, CMD(0x01), adr);
@@ -1894,6 +1918,7 @@ static int __xipram do_xxlock_oneblock(s
 		goto out;
 	}
 
+already:
 	xip_enable(map, chip, adr);
 out:	put_chip(map, chip, adr);
 	spin_unlock(chip->mutex);
