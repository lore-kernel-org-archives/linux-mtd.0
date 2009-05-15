Received: from woodchuck.wormnet.eu ([2a01:348:0:6:4d4b:69df:0:1])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4zJg-0007qu-SO
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 15:27:24 +0000
Date: Fri, 15 May 2009 16:27:19 +0100
From: Alexander Clouter <alex@digriz.org.uk>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] [REPOST] mtd: extend plat_nand for (read|write)_buf
Message-ID: <20090515152719.GG32684@woodchuck>
References: <20090511182801.GK32684@woodchuck>
	<1242395460.27996.249.camel@localhost.localdomain>
	<20090515150549.GE32684@woodchuck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090515150549.GE32684@woodchuck>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

* Alexander Clouter <alex@digriz.org.uk> [2009-05-15 16:05:49+0100]:
> 
> * Artem Bityutskiy <dedekind@infradead.org> [2009-05-15 16:51:00+0300]:
> > 
> > On Mon, 2009-05-11 at 19:28 +0100, Alexander Clouter wrote:
> > > This patch adds (write|read)_buf callbacks to plat_nand.
> > > 
> > > The NAND on the TS-7800 provisioned by the FPGA allows readw() and 
> > > readl() to be used which gives a 2.5x speed up.  To be able to use this 
> > > from the plat_nand driver a hook for read_buf (and also write_buf whilst 
> > > we are in there) need to be made available.  This patch adds the hook.
> > > 
> > > This is a repost[1] of a feature asked for before[2], plus other helpful 
> > > patches to plat_nand[3] would be welcomed if at all possible too.
> > > 
> > > [1] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024747.html
> > > [2] http://lists.infradead.org/pipermail/linux-mtd/2007-October/019659.html
> > > [3] http://lists.infradead.org/pipermail/linux-mtd/2009-March/024780.html
> > > 
> > > Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
> > 
> > I think this should be submitted with the user at the same
> > time. Adding hooks without having a user is not very good.
> > E.g., you may find out later that this does not help, or
> > cancel your project, or end up with different call-backs,
> > etc.
> > 
> In the case of read/write_buf...there is no other way, I'm all ears if 
> you know how I can do (read|write)(w|l) with plat_nand *now*?
> 
For those interested, what I'm currently doing is attached inline below, 
this of course goes on top of the existing plat_nand driver hooks going 
mainline now:

http://git.marvell.com/?p=orion.git;a=commitdiff;h=75bb6b9aab3255f440ef4e72a31978d1681105d6;hp=673492a800b14a9aac5d9d1af120334b9578a23c

I probably will be re-writing the platform specific functions to be more 
like:

http://git.marvell.com/?p=orion.git;a=commitdiff;h=b7eafc31c123a0a068c475c1a8690de06de4e36a;hp=9154da39b1da931b60ff380d3172d797ccaed71e

I doubt (read|write)w is worth it for the extra function complexity.  
Feedback welcome on this of course though; I was thinking maybe to leave 
it in as DMA support is just around the corner but on my particular 
board there are no alignment requirements for using the DMA engines.

Cheers

Cheers

-- 
Alexander Clouter
.sigmonster says: Yow!  I want to mail a bronzed artichoke to Nicaragua!

diff --git a/arch/arm/mach-orion5x/ts78xx-setup.c b/arch/arm/mach-orion5x/ts78xx-setup.c
index 5041d1b..263a2db 100644
--- a/arch/arm/mach-orion5x/ts78xx-setup.c
+++ b/arch/arm/mach-orion5x/ts78xx-setup.c
@@ -191,6 +191,75 @@ static int ts78xx_ts_nand_dev_ready(struct mtd_info *mtd)
 	return readb(TS_NAND_CTRL) & 0x20;
 }
 
+/*
+ * FPGA will handle 8/16/32bit reads and writes
+ */
+static void ts78xx_ts_nand_read_buf(struct mtd_info *mtd,
+			uint8_t *buf, int len)
+{
+	struct nand_chip *this = mtd->priv;
+
+	if (len % 2) {
+		*buf++ = readb(this->IO_ADDR_R);
+		len--;
+	}
+	if (len % 4 == 2) {
+		uint16_t *t = (uint16_t *) buf;
+		*t = readw(this->IO_ADDR_R);
+		buf += 2;
+		len -= 2;
+	}
+
+	while (len > 3) {
+		uint32_t *t = (uint32_t *) buf;
+		*t = readl(this->IO_ADDR_R);
+		buf += 4;
+		len -= 4;
+	}
+
+	if (len % 4 == 2) {
+		uint16_t *t = (uint16_t *) buf;
+		*t = readw(this->IO_ADDR_R);
+		buf += 2;
+		len -= 2;
+	}
+	if (len)
+		*buf = readb(this->IO_ADDR_R);
+}
+
+static void ts78xx_ts_nand_write_buf(struct mtd_info *mtd,
+			const uint8_t *buf, int len)
+{
+	struct nand_chip *this = mtd->priv;
+
+	if (len % 2) {
+		writeb(*buf++, this->IO_ADDR_W);
+		len--;
+	}
+	if (len % 4 == 2) {
+		uint16_t *t = (uint16_t *) buf;
+		writew(*t, this->IO_ADDR_W);
+		buf += 2;
+		len -= 2;
+	}
+
+	while (len > 3) {
+		uint32_t *t = (uint32_t *) buf;
+		writel(*t, this->IO_ADDR_W);
+		buf += 4;
+		len -= 4;
+	}
+
+	if (len % 4 == 2) {
+		uint16_t *t = (uint16_t *) buf;
+		writew(*t, this->IO_ADDR_W);
+		buf += 2;
+		len -= 2;
+	}
+	if (len)
+		writeb(*buf, this->IO_ADDR_W);
+}
+
 const char *ts_nand_part_probes[] = { "cmdlinepart", NULL };
 
 static struct mtd_partition ts78xx_ts_nand_parts[] = {
@@ -230,8 +299,10 @@ static struct platform_nand_data ts78xx_ts_nand_data = {
 		 * e6cf5df1838c28bb060ac45b5585e48e71bbc740 so now there is
 		 * no performance advantage to be had so we no longer bother
 		 */
-		.cmd_ctrl		= ts78xx_ts_nand_cmd_ctrl,
 		.dev_ready		= ts78xx_ts_nand_dev_ready,
+		.cmd_ctrl		= ts78xx_ts_nand_cmd_ctrl,
+		.read_buf		= ts78xx_ts_nand_read_buf,
+		.write_buf		= ts78xx_ts_nand_write_buf,
 	},
 };
 
diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 86e1d08..4cdec46 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -61,6 +61,8 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 	data->chip.cmd_ctrl = pdata->ctrl.cmd_ctrl;
 	data->chip.dev_ready = pdata->ctrl.dev_ready;
 	data->chip.select_chip = pdata->ctrl.select_chip;
+	data->chip.write_buf = pdata->ctrl.write_buf;
+	data->chip.read_buf = pdata->ctrl.read_buf;
 	data->chip.chip_delay = pdata->chip.chip_delay;
 	data->chip.options |= pdata->chip.options;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 7efb9be..0e35375 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -584,6 +584,8 @@ struct platform_nand_chip {
  * @select_chip:	platform specific chip select function
  * @cmd_ctrl:		platform specific function for controlling
  *			ALE/CLE/nCE. Also used to write command and address
+ * @write_buf:		platform specific function for write buffer
+ * @read_buf:		platform specific function for read buffer
  * @priv:		private data to transport driver specific settings
  *
  * All fields are optional and depend on the hardware driver requirements
@@ -594,6 +596,10 @@ struct platform_nand_ctrl {
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
 				    unsigned int ctrl);
+	void		(*write_buf)(struct mtd_info *mtd,
+				    const uint8_t *buf, int len);
+	void		(*read_buf)(struct mtd_info *mtd,
+				    uint8_t *buf, int len);
 	void		*priv;
 };
