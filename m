Received: from mail37.messagelabs.com ([216.82.244.163])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KGTuX-0000QA-Is
	for linux-mtd@lists.infradead.org; Wed, 09 Jul 2008 07:16:21 +0000
Date: Wed, 9 Jul 2008 09:16:15 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: uniform flash using cmdset_0002
Message-ID: <20080709071615.GA15212@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have an AM29LV641DH NOR flash in my machine that results in the following
printks if DEBUG_CFI_FEATURES is defined in
drivers/mtd/chips/cfi_cmdset_0002.c:

	physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
	 Amd/Fujitsu Extended Query Table at 0x0040
	  Silicon revision: 0
	  Address sensitive unlock: Required
	  Erase Suspend: Read/write
	  Block protection: 4 sectors per group
	  Temporary block unprotect: Supported
	  Block protect/unprotect scheme: 4
	  Number of simultaneous operations: 0
	  Burst mode: Not supported
	  Page mode: Not supported
	  Vpp Supply Minimum Program/Erase Voltage: 11.5 V
	  Vpp Supply Maximum Program/Erase Voltage: 12.5 V
	  Top/Bottom Boot Block: Uniform, Top WP
	physmap-flash.0: CFI does not contain boot bank location. Assuming top.

The last message comes from the following code in
cfi_cmdset_0002() (drivers/mtd/chips/cfi_cmdset_0002.c):

	bootloc = extp->TopBottom;
	if ((bootloc != 2) && (bootloc != 3)) {
		printk(KERN_WARNING "%s: CFI does not contain boot "
		       "bank location. Assuming top.\n", map->name);
		bootloc = 2;
	}

For that chip extp->TopBottom is 5.

I wonder what is intended here.  The only other usage of bootloc (which
is a local variable for cfi_cmdset_0002()) is

	if (bootloc == 3 && something_else) {
		...

So if ((bootloc != 2) && (bootloc != 3)) setting bootloc = 2 doesn't
change anything!?

If I didn't oversee something I suggest to delete the if containing the
warning.

Best regards
Uwe

-- 
Uwe Kleine-König, Software Engineer
Digi International GmbH Branch Breisach, Küferstrasse 8, 79206 Breisach, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 13962
