Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCRd8-00036w-TN
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 19:43:36 -0400
Date: Tue, 28 Sep 2004 16:43:20 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20040928234320.GA8283@slurryseal.ddns.mvista.com>
References: <20040925021907.D14A2A00043@mail.murgatroid.com>
	<1096108415.31730.4411.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1096108415.31730.4411.camel@imladris.demon.co.uk>
Cc: Christopher Hoover <ch@murgatroid.com>, linux-mtd@lists.infradead.org
Subject: Re: Supporting flash that is locked by default
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 25, 2004 at 11:33:36AM +0100, David Woodhouse wrote:
> This locking scheme is daft. My original reaction was to hide it in the
> mapping driver for such idiotic flashes, but they're more common now and
> it really is a function of the flash not of the board. I suspect we
> ought to add a quirk entry for these flashes, and automatically unlock
> them on probe.

Here's a try at automatically unlocking all blocks of Intel CFI flash at
probe time and at system resume time.  The new logic is in the chip
driver, but perhaps it would be better to move it generic, adding a new
chip driver callback for "is unlock needed?"; can rework things that way
if desired (was originally hoping to hide this "feature" from generic
code).

I did not notice a query feature bit that identifies whether the flash
has the "all blocks locked at power on" property in the datasheets, so
the patch checks whether block 0 is locked and assumes its one of those
flashes if so.  I've tried booting a board with K3 StrataFlash (which
powers up locked) and a board with J3 StrataFlash (which does not) and
it seems to do the right thing.

Since all blocks may be unlocked at resume time, it would be up to a
userspace action to relock any previously explicitly locked blocks soon
afterwards.  The chip driver (or generic layer) *could* keep track of
locked blocks and only unlock those not previously locked, can send a
patch for that if there's interest.

Comments?  Thanks. -- Todd

Index: drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.156
diff -u -r1.156 cfi_cmdset_0001.c
--- drivers/mtd/chips/cfi_cmdset_0001.c	17 Sep 2004 11:45:05 -0000	1.156
+++ drivers/mtd/chips/cfi_cmdset_0001.c	28 Sep 2004 22:56:49 -0000
@@ -45,6 +45,12 @@
 #define MANUFACTURER_ST         0x0020
 #define M50LPW080       0x002F
 
+/* 
+ * Block status register bits
+ */
+
+#define BSR_LOCK	0x1	/* Block lock status */
+
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 //static int cfi_intelext_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 //static int cfi_intelext_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
@@ -299,6 +305,41 @@
 	return cfi_intelext_setup(mtd);
 }
 
+static int checklockstatus(struct map_info *map, struct flchip *chip,
+			   unsigned long adr, int len, void *thunk)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ofs_factor = cfi->interleave * cfi->device_type;
+	int ret;
+
+	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	ret =  cfi_read_query(map, adr+(2*ofs_factor)) & BSR_LOCK;
+	chip->state = FL_JEDEC_QUERY;
+	return ret;
+}
+
+static void cfi_intelext_unlock_all(struct mtd_info *mtd)
+{
+	int i, locked;
+
+	locked = cfi_varsize_frob(mtd, checklockstatus,
+				  0, mtd->eraseregions[0].erasesize, 0);
+
+	if (locked != 1)
+		return;
+
+	printk(KERN_DEBUG "Unlocking locked CFI flash blocks.\n");
+	for (i = 0; i < mtd->numeraseregions; i++) {
+		int j;
+
+		for (j = 0; j < mtd->eraseregions[i].numblocks; j++){
+			cfi_intelext_unlock(mtd, mtd->eraseregions[i].offset +
+					    j * mtd->eraseregions[i].erasesize,
+					    mtd->eraseregions[i].erasesize);
+		}
+	}
+}
+
 static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
@@ -358,6 +399,7 @@
 	if (cfi_intelext_partition_fixup(map, &cfi) != 0)
 		goto setup_err;
 
+	cfi_intelext_unlock_all(mtd);
 	__module_get(THIS_MODULE);
 	return mtd;
 
@@ -1756,6 +1798,8 @@
 
 		spin_unlock(chip->mutex);
 	}
+
+	cfi_intelext_unlock_all(mtd);
 }
 
 static void cfi_intelext_destroy(struct mtd_info *mtd)
