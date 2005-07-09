Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DrBJO-0003Mb-7B
	for linux-mtd@lists.infradead.org; Sat, 09 Jul 2005 05:07:57 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <0IJC000IV8UBB4@mmp2.samsung.com>
References: <0IJC000IV8UBB4@mmp2.samsung.com>
Content-Type: text/plain
Date: Sat, 09 Jul 2005 11:10:40 +0200
Message-Id: <1120900240.26713.191.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND MTD support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Kyungmin

On Sat, 2005-07-09 at 11:13 +0900, Kyungmin Park wrote:

> It's new patch as your request
> and I append some bufferram function to reduce unnecessary read
> access.
> It's similay page buf in NAND.
> 
Thanks, looks much better now.


> >	select MTD_ONENAND_INFO
> 
> >Why do you need a seperate config option, which is just a mirror of
> MTD_ONENAND ?
> I don't understood. What's meaning?

MTD_ONENAND_INFO is a seperate config option, which gets turned on when
MTD_ONENAND is selected. This does not make much sense as you have only
MTD_ONENAND which can select MTD_ONENAND_INFO. Its superfluid anyway as
you merged the info code into the base code now.


> > +static int onenand_unlock(struct mtd_info *mtd, loff_t ofs, 
> There's no status check in locking mechanism

Hmm. So all the status errors checked in onenand_wait() will never
happen here ?

> > 
> > +		/* Sanity check */
> > +		while (onenand_readw(this->base + 
> > ONENAND_REG_CTRL_STATUS)
> > +		    & ONENAND_CTRL_ONGO)
> > +			continue;
> > 
> > What happens if the condition is not met ?
> 
> I think it's board bug. For safety I check it. 

Then some kind of timeout is definitely appropriate. You will endup in a
dead loop when the condition is not met due to the bug.

> > +/*
> > + * Functions to access the OneNAND IO region
> > + */
> > +#define onenand_readw(a)		readw(a)
> > +#define onenand_writew(v,a)		writew(v, a)
> > 
> > Please make onenand_readw/writew functions accessible by function
> > pointers along with default implementations, so the board driver can
> > override them if necessary.
> > 
> 
> It's just memory access function. I think no need to make a function.

Yes, on your board. It turned out to be a good choice to turn _all_ the
functions which access hardware into function pointers. People design
weird hardware and the overhead of the function pointer based access is
minimal. Keeping it your way, one has to replace 4 complex functions
(command, wait, read/ write) instead of providing 4 small and simple
ones.




+config MTD_ONENAND_OMAP
+	tristate "OneNAND Flash device on OMAP board"
+	depends on ARM && ARCH_OMAP && MTD_ONENAND

"depends on ARCH_OMAP && MTD_ONENAND" is enough, as ARCH_OMAP already
depends on ARM


+++ uncommitted/drivers/mtd/onenand/omap-onenand.c  
+	default:
+		printk(KERN_WARNING "Unsupported OneNAND device\n");
+		err = -ENXIO;
+		goto out_buf;
+	}
+
+	goto out;

	return 0; 
This is the normal return path. Below is error exit (cleanup)

+
+out_buf:
+	onenand_release(omap_onenand_mtd);
+	iounmap(this->base);
+out_mtd:
+	kfree(omap_onenand_mtd);
+out:
+	return err;

+++ uncommitted/drivers/mtd/onenand/onenand_base.c  (mode:100644)
+static int onenand_read_bufferram(struct mtd_info *mtd, int area,
+		unsigned char *buffer, int offset, size_t count)
+{
+	struct onenand_chip *this = mtd->priv;
+	void __iomem *bufferram;
+
+	if (area == DATARAM)
+		bufferram = this->base + ONENAND_DATARAM;
+	else if (area == SPARERAM)
+		bufferram = this->base + ONENAND_SPARERAM;
+	else  
+		bufferram = this->base + ONENAND_BOOTRAM;
+
+	if (ONENAND_CURRENT_BUFFERRAM(this)) {
+		if (area == DATARAM)
+			bufferram += mtd->oobblock;
+		else if (area == SPARERAM)
+			bufferram += mtd->oobsize;
+	}
+
+	memcpy(buffer, bufferram + offset, count);
+
+	return 0;
+}

area can be a direct offset (ONENAND_DATARAM, ONENAND_SPARERAM,
ONENAND_BOOTRAM), so you can just write: bufferram = this->base + area;


+static int onenand_write_bufferram(struct mtd_info *mtd, int area,
+		const unsigned char *buffer, int offset, size_t count)
+{

Same as onenand_read_bufferram

+	if (ONENAND_CURRENT_BUFFERRAM(this)) {
+		if (area == DATARAM)
+			bufferram += mtd->oobblock;
+		else if (area == SPARERAM)
+			bufferram += mtd->oobsize;
+	}

Please make this a inline function used in read/write_bufferram

+EXPORT_SYMBOL(onenand_scan);
+EXPORT_SYMBOL(onenand_release);

Would you mind to change those exports to EXPORT_SYMBOL_GPL ?

+++ uncommitted/include/linux/mtd/onenand_regs.h  (mode:100644)

+/* Memory Address Map Translation (Word order) */
+#define ONENAND_MEMORY_MAP(x)		((x) << 1)

Is this considered to be a general rule, i.e. is this the only valid way
to address the chip ? 


+struct onenand_chip {
+	void __iomem		*base;
+	unsigned int		chipsize;
+	unsigned int		device_id;
+	unsigned int		version_id;
+	unsigned int		options;

Are device_id and version_id necessary for anything else than scan ? If
no, please remove.
