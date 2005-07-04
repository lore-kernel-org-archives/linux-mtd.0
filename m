Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DpNn5-00073k-8l
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2005 06:03:05 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <0IJ200CBRX00K2@mmp2.samsung.com>
References: <0IJ200CBRX00K2@mmp2.samsung.com>
Content-Type: text/plain
Date: Mon, 04 Jul 2005 12:05:00 +0200
Message-Id: <1120471500.18862.65.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "'Woodruff, Richard'" <r-woodruff2@ti.com>, "'Johnson,
	Steve-OMAP'" <stevej@ti.com>, 'Dongjun Shin' <d.j.shin@samsung.com>,
	linux-omap-open-source@linux.omap.com, "'Zhang,
	Jian'" <jzhang@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] OneNAND MTD support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-07-04 at 10:19 +0900, Kyungmin Park wrote:

> This patch is based on latest linux 2.6 kernel from linux-omap-2.6.git

Please provide a patch against MTD-CVS

> Note: The bad block handling is not yet implemented.
> since we want to use NAND BBT routine and NAND BBT routine has NAND-specific
> code, then 
> At first we want to split BBT code into BBT core and NAND-specific code then
> we will merge with OneNAND

Makes sense.

tglx

Some remarks:

Kconfig and Makefile need references in drivers/mtd/Kconfig and
drivers/mtd/Makefile !!!


+menu "OneNAND Flash Device Drivers (EXPERIMENTAL)"
+	depends on MTD != n && EXPERIMENTAL
+
+config MTD_ONENAND
+	tristate "OneNAND Device Support"
+	depends on MTD
+	select MTD_ONENAND_INFO

Why do you need a seperate config option, which is just a mirror of
MTD_ONENAND ?

+
+        /* try the first address */
+	omap_onenand_flash_base = ioremap(OMAP_ONENAND_FLASH_START1, SZ_128K);

Why a seperate static variable ? Please use the base member of the
private structure.

+static int onenand_wait(struct mtd_info *mtd, int state)
+{
+	struct onenand_chip * this = mtd->priv;
+	unsigned long timeout;
+	unsigned int flags = ONENAND_INT_MASTER;
+	unsigned int interrupt = 0;
+	unsigned int ctrl, ecc;
+
+	/* The 10 msec is enough */
+	timeout = jiffies + msecs_to_jiffies(10);
+	while (time_before(jiffies, timeout)) {
+		interrupt = onenand_readw(this->base + ONENAND_REG_INTERRUPT);
+
+		if (interrupt & flags)
+			break;
+		yield();

Please use cond_resched() instead of yield()

+	}
+	/* To get correct interrupt status in timeout case */
+	interrupt = onenand_readw(this->base + ONENAND_REG_INTERRUPT);
+
+	if (!interrupt)
+		BUG();

A timeout should be handled gracefully by the driver. Use BUG() to catch
errors, which are caused by invalid arguments to a function,
uninitialized data structures or calling from a wrong context. 


+static int onenand_dataram(struct mtd_info *mtd, int write,
+		unsigned char *buffer, int offset, int count)
+{
+	struct onenand_chip *this = mtd->priv;
+	void __iomem *src, *dest;
+	void __iomem *dataram;
+
+	dataram = this->base + ONENAND_DATARAM;
+
+	if (ONENAND_CURRENT_BUFFERRAM(this))
+		dataram += mtd->oobblock;
+
+	if (write) {
+		src = buffer;
+		dest = dataram + offset;
+	} else {
+		src = dataram + offset;
+		dest = buffer;
+	}
+
+	memcpy(dest, src, count);


Can the read/write functions be seperate please ?
Only the hardware access should be replaceable by the board driver.
Calculations which are valid for every implementation should be done in
generic code. This reduces the code size and the error sources for
hardware specific implementations


+static int onenand_spareram(struct mtd_info *mtd, int write,
+		unsigned char *buffer,  int offset, int count)

Same as above.

+static void onenand_get_device(struct onenand_chip *this, int new_state)
+{
+	struct onenand_chip *active = this;
+	DECLARE_WAITQUEUE(wait, current);
+
+	/*
+	 * Grab the lock and see if the device is available
+	 */
+retry:
+	if (active == this) {

That's bogus, as active is never changed.

+#ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE
+/**
+ * onenand_verify_page - [GENERIC] verify the chip contents after a write
+ * @param mtd		MTD device structure
+ * @param buf		the databuffer to verify
+ * @param block		block address
+ * @param page		page address
+ *
+ * Check DataRAM area directly
+ */
+static int onenand_verify_page(struct mtd_info *mtd, u_char *buf,
+	loff_t addr, int block, int page)
+{
<SNIP>
+	dataram1 = dataram0 + mtd->oobblock;
+
+	if (memcmp(dataram0, dataram1, mtd->oobblock))
+		return -EBADMSG;

See onenand_dataram()


+static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
<SNIP>
+		/* There's no return value */
+		this->wait(mtd, FL_UNLOCKING);

Why not ?

+		/* Sanity check */
+		while (onenand_readw(this->base + ONENAND_REG_CTRL_STATUS)
+		    & ONENAND_CTRL_ONGO)
+			continue;

What happens if the condition is not met ? 

<SNIP>
+		/* Sanity check */
+		while (onenand_readw(this->base + ONENAND_REG_CTRL_STATUS)
+		    & ONENAND_CTRL_ONGO)
+			continue;

Same as above

+		/* Set block address for read block status */
+		value = onenand_block_address(this->device_id, block);
+		onenand_writew(value, this->base + ONENAND_REG_START_ADDRESS1);
+
+		/* Check lock status */
+		status = onenand_readw(this->base + ONENAND_REG_WP_STATUS);
+		if (!(status & ONENAND_WP_US))
+			printk(KERN_ERR "block = %d, wp status = 0x%x\n", block, status);
+	}
+	
+	return 0;

The function returns unconditionally success, even if the status is not
correct !



+/**
+ * onenand_scan - [OneNAND Interface] Probe the OneNAND device
+ * @param mtd		MTD device structure
+ *
+ * OneNAND detection method:
+ *   Compare the the values from command with ones from register
+ */
+static int onenand_probe(struct mtd_info *mtd)

Please make comment and function name consistent.



+/*
+ *  linux/drivers/mtd/onenand/onenand_info.c

<SNIP>

+EXPORT_SYMBOL_GPL(onenand_print_device_info);
+EXPORT_SYMBOL_GPL(onenand_print_maf_info);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Kyungmin Park <kyungmin.park@samsung.com>");
+MODULE_DESCRIPTION("Display OneNAND device and manufacturer ID's");


Please link this with onenand_base.c. It's overkill to have those
exports and a seperate module. The seperate nand_ids file in
drivers/mtd/nand is solely there to make it reusable by the legacy
DiskOnChip drivers. Once those are gone the id table will be linked to
nand_base.c unconditionally.


+	FL_ERASING,
+	FL_SYNCING,
+	FL_UNLOCKING,
+} onenand_state_t;

Shouldnt there be a LOCK counterpart to UNLOCK ?


+/*
+ * Functions to access the OneNAND IO region
+ */
+#define onenand_readw(a)		readw(a)
+#define onenand_writew(v,a)		writew(v, a)

Please make onenand_readw/writew functions accessible by function
pointers along with default implementations, so the board driver can
override them if necessary.
