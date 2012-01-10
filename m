Received: from ovro.ovro.caltech.edu ([192.100.16.2])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkf3L-0004qd-5o
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 17:00:04 +0000
Date: Tue, 10 Jan 2012 08:38:46 -0800
From: "Ira W. Snyder" <iws@ovro.caltech.edu>
To: Florian Fainelli <ffainelli@freebox.fr>
Subject: Re: [PATCH] cfi: AMD/Fujitsu compatibles: add panic write support
Message-ID: <20120110163845.GA30403@ovro.caltech.edu>
References: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
 <4F0C124F.7040807@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F0C124F.7040807@freebox.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 10, 2012 at 11:26:23AM +0100, Florian Fainelli wrote:
> Hello,
> 
> On 01/06/12 20:29, Ira W. Snyder wrote:
> > This allows the mtdoops driver to work on flash chips using the
> > AMD/Fujitsu compatible command set.
> >
> > As the code comments note, the locks used throughout the normal code
> > paths in the driver are ignored, so that the chance of writing out the
> > kernel's last messages are maximized.
> 
> This patch made me looking at the panic code, but should not this be 
> made conditionnal to the enabling/disabling of the MTD oops driver?
> 

It is reasonable to make this code conditional based on CONFIG_MTD_OOPS.
The mtdoops driver is the only user of mtd->panic_write().

I think if we decide to make panic_write conditional for this driver, we
should make it conditional for all the others also. They are:

drivers/mtd/nand/nand_base.c
drivers/mtd/onenand/onenand_base.c

Thanks for the comments,
Ira

> >
> > Signed-off-by: Ira W. Snyder<iws@ovro.caltech.edu>
> > Cc: David Woodhouse<dwmw2@infradead.org>
> > Cc: linux-mtd@lists.infradead.org
> > ---
> >
> > This was tested with a Spansion S29GL512P flash chip. It is identified by
> > the kernel with the following output in the kernel log:
> > Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer ID 0x000001 Chip ID 0x002301
> >
> > Rick, I have CC'd you on this email since I thought you might be
> > interested. While I was attempting to search for others who had written a
> > panic_write() for this chip, I came across your email to the linux-mtd
> > mailing list in April 2011.
> >
> >   drivers/mtd/chips/cfi_cmdset_0002.c |  240 +++++++++++++++++++++++++++++++++++
> >   1 files changed, 240 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> > index 8d70895..e2d94bb 100644
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -59,6 +59,9 @@ static void cfi_amdstd_resume (struct mtd_info *);
> >   static int cfi_amdstd_reboot(struct notifier_block *, unsigned long, void *);
> >   static int cfi_amdstd_secsi_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
> >
> > +static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
> > +				  size_t *retlen, const u_char *buf);
> > +
> >   static void cfi_amdstd_destroy(struct mtd_info *);
> >
> >   struct mtd_info *cfi_cmdset_0002(struct map_info *, int);
> > @@ -443,6 +446,7 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
> >   	pr_debug("MTD %s(): write buffer size %d\n", __func__,
> >   			mtd->writebufsize);
> >
> > +	mtd->panic_write = cfi_amdstd_panic_write;
> >   	mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
> >
> >   	if (cfi->cfi_mode==CFI_MODE_CFI){
> > @@ -1562,6 +1566,242 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
> >   	return 0;
> >   }
> >
> > +/*
> > + * Wait for the flash chip to become ready to write data
> > + *
> > + * This is only called during the panic_write() path. When panic_write()
> > + * is called, the kernel is in the process of a panic, and will soon be
> > + * dead. Therefore we don't take any locks, and attempt to get access
> > + * to the chip as soon as possible.
> > + */
> > +static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
> > +				 unsigned long adr)
> > +{
> > +	struct cfi_private *cfi = map->fldrv_priv;
> > +	int retries = 10;
> > +	int i;
> > +
> > +	/*
> > +	 * If the driver thinks the chip is idle, and no toggle bits
> > +	 * are changing, then the chip is actually idle for sure.
> > +	 */
> > +	if (chip->state == FL_READY&&  chip_ready(map, adr))
> > +		return 0;
> > +
> > +	/*
> > +	 * Try several times to reset the chip and then wait for it
> > +	 * to become idle. The upper limit of a few milliseconds of
> > +	 * delay isn't a big problem: the kernel is dying anyway. It
> > +	 * is more important to save the messages.
> > +	 */
> > +	while (retries>  0) {
> > +		const unsigned long timeo = (HZ / 1000) + 1;
> > +
> > +		/* send the reset command */
> > +		map_write(map, CMD(0xF0), chip->start);
> > +
> > +		/* wait for the chip to become ready */
> > +		for (i = 0; i<  jiffies_to_usecs(timeo); i++) {
> > +			if (chip_ready(map, adr))
> > +				return 0;
> > +
> > +			udelay(1);
> > +		}
> > +	}
> > +
> > +	/* the chip never became ready */
> > +	return -EBUSY;
> > +}
> > +
> > +/*
> > + * Write out one word of data to a single flash chip during a kernel panic
> > + *
> > + * This is only called during the panic_write() path. When panic_write()
> > + * is called, the kernel is in the process of a panic, and will soon be
> > + * dead. Therefore we don't take any locks, and attempt to get access
> > + * to the chip as soon as possible.
> > + *
> > + * The implementation of this routine is intentionally similar to
> > + * do_write_oneword(), in order to ease code maintenance.
> > + */
> > +static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
> > +				  unsigned long adr, map_word datum)
> > +{
> > +	const unsigned long uWriteTimeout = (HZ / 1000) + 1;
> > +	struct cfi_private *cfi = map->fldrv_priv;
> > +	int retry_cnt = 0;
> > +	map_word oldd;
> > +	int ret = 0;
> > +	int i;
> > +
> > +	adr += chip->start;
> > +
> > +	ret = cfi_amdstd_panic_wait(map, chip, adr);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pr_debug("MTD %s(): PANIC WRITE 0x%.8lx(0x%.8lx)\n",
> > +			__func__, adr, datum.x[0]);
> > +
> > +	/*
> > +	 * Check for a NOP for the case when the datum to write is already
> > +	 * present - it saves time and works around buggy chips that corrupt
> > +	 * data at other locations when 0xff is written to a location that
> > +	 * already contains 0xff.
> > +	 */
> > +	oldd = map_read(map, adr);
> > +	if (map_word_equal(map, oldd, datum)) {
> > +		pr_debug("MTD %s(): NOP\n", __func__);
> > +		goto op_done;
> > +	}
> > +
> > +	ENABLE_VPP(map);
> > +
> > +retry:
> > +	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
> > +	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
> > +	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
> > +	map_write(map, datum, adr);
> > +
> > +	for (i = 0; i<  jiffies_to_usecs(uWriteTimeout); i++) {
> > +		if (chip_ready(map, adr))
> > +			break;
> > +
> > +		udelay(1);
> > +	}
> > +
> > +	if (!chip_good(map, adr, datum)) {
> > +		/* reset on all failures. */
> > +		map_write(map, CMD(0xF0), chip->start);
> > +		/* FIXME - should have reset delay before continuing */
> > +
> > +		if (++retry_cnt<= MAX_WORD_RETRIES)
> > +			goto retry;
> > +
> > +		ret = -EIO;
> > +	}
> > +
> > +op_done:
> > +	DISABLE_VPP(map);
> > +	return ret;
> > +}
> > +
> > +/*
> > + * Write out some data during a kernel panic
> > + *
> > + * This is used by the mtdoops driver to save the dying messages from a
> > + * kernel which has panic'd.
> > + *
> > + * This routine ignores all of the locking used throughout the rest of the
> > + * driver, in order to ensure that the data gets written out no matter what
> > + * state this driver (and the flash chip itself) was in when the kernel crashed.
> > + *
> > + * The implementation of this routine is intentionally similar to
> > + * cfi_amdstd_write_words(), in order to ease code maintenance.
> > + */
> > +static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
> > +				  size_t *retlen, const u_char *buf)
> > +{
> > +	struct map_info *map = mtd->priv;
> > +	struct cfi_private *cfi = map->fldrv_priv;
> > +	unsigned long ofs, chipstart;
> > +	int ret = 0;
> > +	int chipnum;
> > +
> > +	*retlen = 0;
> > +	if (!len)
> > +		return 0;
> > +
> > +	chipnum = to>>  cfi->chipshift;
> > +	ofs = to - (chipnum<<  cfi->chipshift);
> > +	chipstart = cfi->chips[chipnum].start;
> > +
> > +	/* If it's not bus aligned, do the first byte write */
> > +	if (ofs&  (map_bankwidth(map) - 1)) {
> > +		unsigned long bus_ofs = ofs&  ~(map_bankwidth(map) - 1);
> > +		int i = ofs - bus_ofs;
> > +		int n = 0;
> > +		map_word tmp_buf;
> > +
> > +		ret = cfi_amdstd_panic_wait(map,&cfi->chips[chipnum], bus_ofs);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* Load 'tmp_buf' with old contents of flash */
> > +		tmp_buf = map_read(map, bus_ofs + chipstart);
> > +
> > +		/* Number of bytes to copy from buffer */
> > +		n = min_t(int, len, map_bankwidth(map) - i);
> > +
> > +		tmp_buf = map_word_load_partial(map, tmp_buf, buf, i, n);
> > +
> > +		ret = do_panic_write_oneword(map,&cfi->chips[chipnum],
> > +					     bus_ofs, tmp_buf);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ofs += n;
> > +		buf += n;
> > +		(*retlen) += n;
> > +		len -= n;
> > +
> > +		if (ofs>>  cfi->chipshift) {
> > +			chipnum++;
> > +			ofs = 0;
> > +			if (chipnum == cfi->numchips)
> > +				return 0;
> > +		}
> > +	}
> > +
> > +	/* We are now aligned, write as much as possible */
> > +	while (len>= map_bankwidth(map)) {
> > +		map_word datum;
> > +
> > +		datum = map_word_load(map, buf);
> > +
> > +		ret = do_panic_write_oneword(map,&cfi->chips[chipnum],
> > +					     ofs, datum);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ofs += map_bankwidth(map);
> > +		buf += map_bankwidth(map);
> > +		(*retlen) += map_bankwidth(map);
> > +		len -= map_bankwidth(map);
> > +
> > +		if (ofs>>  cfi->chipshift) {
> > +			chipnum++;
> > +			ofs = 0;
> > +			if (chipnum == cfi->numchips)
> > +				return 0;
> > +
> > +			chipstart = cfi->chips[chipnum].start;
> > +		}
> > +	}
> > +
> > +	/* Write the trailing bytes if any */
> > +	if (len&  (map_bankwidth(map) - 1)) {
> > +		map_word tmp_buf;
> > +
> > +		ret = cfi_amdstd_panic_wait(map,&cfi->chips[chipnum], ofs);
> > +		if (ret)
> > +			return ret;
> > +
> > +		tmp_buf = map_read(map, ofs + chipstart);
> > +
> > +		tmp_buf = map_word_load_partial(map, tmp_buf, buf, 0, len);
> > +
> > +		ret = do_panic_write_oneword(map,&cfi->chips[chipnum],
> > +					     ofs, tmp_buf);
> > +		if (ret)
> > +			return ret;
> > +
> > +		(*retlen) += len;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >
> >   /*
> >    * Handle devices with one erase region, that only implement
> 
