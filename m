Received: from ms-smtp-02.rdc-kc.rr.com ([24.94.166.122])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6Uwv-0002Jp-SR
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2004 13:31:10 +0000
Received: from 192.168.2.100 (CPE-24-209-184-189.wi.rr.com [24.209.184.189])
	i2PDV6Op013135	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Mar 2004 07:31:07 -0600 (CST)
From: Dan Eisenhut <deisenhut@wi.rr.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1080221409.21277.30.camel@localhost>
Mime-Version: 1.0
Date: Thu, 25 Mar 2004 07:30:10 -0600
Content-Transfer-Encoding: 7bit
Subject: do_erase_oneblock failing to detect lock-bit failure
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Corporate email didn't do references, switching to something nicer)
Now that I've verified my lock-bits are setting and clearing okay, I'm
trying to test that erase fails properly when a block is locked.

We have a strange setup on our custom board.  Data lines 0-7 are swapped
with lines 8-15 going into the CFI flash chip.  This is what the
hardware guys are calling "byte-lane swapping" or reordering.  To
compensate for this, I had to enable CONFIG_MTD_CFI_LE_BYTE_SWAP.  This
appears to be working for reading and writing data.  (Is there a better
way to handle this?)

But because of this, do_erase_oneblock fails to handle a failure when a
block is locked.  Starting at line 1372 of cfi_cmdset_0001.c, cfi_read
returns a value of 0xa200 into status (a short) indicating ready, error
in block erasure, and block lock-bit detected.  chipstatus (a unsigned
char) is assigned the value 0x00 since the 0xa2 portion is chopped off
in the implicit type conversion.  My interleave is 1 so chipstatus is
not modified (only one chip for this bank).

Then when it gets down to checking for the protection bit it compares
against "chipstatus & 0x20" instead of "status & CMD(0x20)" so it
automatically fails.  Eventually a zero is returned indicating erase
success.

Is byte-lane swapping common?  Wouldn't this code fail for someone
without byte-lane swapping but requiring little endian enabled?  By
changing the if statements with (chipstatus & 0xNN) with (status &
CMD(0xNN)) appears to correct my problem, but I sure this is not the
best solution.

Dan

Line#1372 - cfi_cmdset_0001.c
-----------------------------
status = cfi_read(map, adr);

/* check for lock bit */
if (status & CMD(0x3a)) {
        unsigned char chipstatus = status;
        if (status != CMD(status & 0xff)) {
                int i;
                for (i = 1; i<CFIDEV_INTERLEAVE; i++) {
                              chipstatus |= status >> (cfi->device_type
* 8);
                }
                printk(KERN_WARNING "Status is not identical for all
chips: 0x%llx. Merging to give 0x%02x\n", (__u64)status, chipstatus);
        }
        /* Reset the error bits */
        cfi_write(map, CMD(0x50), adr);
        cfi_write(map, CMD(0x70), adr);

        if ((chipstatus & 0x30) == 0x30) {
                printk(KERN_NOTICE "Chip reports improper command
sequence: status 0x%llx\n", (__u64)status);
                ret = -EIO;
        } else if (chipstatus & 0x02) {
                /* Protection bit set */
                ret = -EROFS;
        } else if ....
