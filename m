Received: from smtp-2.hut.fi ([130.233.228.92])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163waa-00069I-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2001 09:44:12 +0000
Received: from kosh.hut.fi (jlavi@kosh.hut.fi [130.233.228.10])
	by smtp-2.hut.fi (8.9.3/8.9.3) with ESMTP id LAA06981
	for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2001 11:53:35 +0200 (EET)
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id LAA06241
	for linux-mtd@lists.infradead.org; Wed, 14 Nov 2001 11:53:35 +0200 (EET)
Date: Wed, 14 Nov 2001 11:53:35 +0200
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>
Subject: New Intel chip with CFIext version 1.3 not working.
Message-ID: <20011114115334.A29901@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Is anybody using Intel chips with extended CFI query version 1.3?

Current version of the cfi_cmdset_0001.c rejects the chip and accepts
only the extended CFI versions 1.0, 1.1, and 1.2. The chip I am trying
to get working is Intel's 28F640W18 and its datasheet is available
from http://www.intel.com/design/flash/datashts/index.htm. The
extended query is specified at the page 71 of the datasheet.

I tried to modify the driver by allowing also the extemded CFI version
1.3. After that the chip was accepted but sectors were locked and
writes failed The unlock function unlocked only the first sector, not 
the whole region requested.

I modified the function cfi_intelext_unlock() to unlock the whole
region requested. After that it was possible to unlock the chip and 
also erase it with erase_all. Mounting JFFS2, however, fails.

JFFS2 mount seems to fail because the chip has 4mbit partitions and
each of them has their own status. When the mount scans flash chip
contents and proceeds past the partition boundary, the status is not
anymore the same as in the previous boundary.

What happens is that cfi_cmdset_0001.c keeps the chip at state
FL_STATUS and when the mount proceeds to address 0x80000 it fails
because the chip is at read array mode and returns flash contents, not
the partition status.

I have attached the changes I made in cfi_cmdset_0001.c to get to this
point.

Could anyone help me on solving this problem? Suggestions, please?

Jarkko Lavinen

----
Changes in function cfi_cmdset_0001():

                if (extp->MajorVersion != '1' ||
+#if 0
                    (extp->MinorVersion < '0' || extp->MinorVersion > '2')) {
+#else
+                   (extp->MinorVersion < '0' || extp->MinorVersion > '3')) {
+#endif
                        printk(KERN_WARNING "  Unknown IntelExt Extended Query "
                               "version %c.%c.\n",  extp->MajorVersion,
                               extp->MinorVersion);

The function cfi_intelext_unlock() after my changes:

static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	int eraseoffset, erasesize, eraseblocks;
	unsigned long adr;
	int chipnum, ernum, ret = 0;
#ifdef DEBUG_LOCK_BITS
	int ofs_factor = cfi->interleave * cfi->device_type;
	unsigned long temp_adr = adr;
	unsigned long temp_len = len;
#endif

	/* Pass the whole chip through sector by sector and check for each
	   sector if the sector and the given interval overlap */
	for(ernum = 0; ernum < mtd->numeraseregions; ernum++) {
		struct mtd_erase_region_info *erp = &mtd->eraseregions[ernum];

		eraseoffset = erp->offset;
		erasesize = erp->erasesize;
		eraseblocks = erp->numblocks;

#ifdef DEBUG_LOCK_BITS
		printk("Erase offset %08x size %06x blocks %d\n",
		       eraseoffset, erasesize, eraseblocks);
#endif

		if (ofs > eraseoffset + erasesize)
			continue;

		while (eraseblocks > 0) {
			if (ofs < eraseoffset + erasesize &&
			    ofs + len > eraseoffset) {

				chipnum = eraseoffset >> cfi->chipshift;
				adr = eraseoffset -
					(chipnum << cfi->chipshift);

#ifdef DEBUG_LOCK_BITS
				temp_adr = adr;
				temp_len = len;

				cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi,
						 cfi->device_type, NULL);
				while (temp_len) {
					printk("before unlock %x: block "
					       "status register is %x\n",
					       temp_adr, cfi_read_query(map, temp_adr+(2*ofs_factor)));
					temp_adr += mtd->erasesize;
					temp_len -= mtd->erasesize;
				}

				cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi,
						 cfi->device_type, NULL);

#endif
				ret = do_unlock_oneblock(map,
							 &cfi->chips[chipnum],
							 adr);

#ifdef DEBUG_LOCK_BITS
				cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi,
						 cfi->device_type, NULL);
				printk("after unlock: block status register "
				       "is %x\n",
				       cfi_read_query(map, adr+(2*ofs_factor)));
				cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi,
						 cfi->device_type, NULL);
#endif
			}
			eraseoffset += erasesize;
			eraseblocks --;
		}
	}

	return ret;
}
