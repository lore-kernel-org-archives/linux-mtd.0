Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JcIXZ-00050Z-IR
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 11:02:34 +0000
Date: Thu, 20 Mar 2008 11:03:53 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [Fwd: Re: [PATCH] 2/2 mtd: Add support for the Dreamcast VMU
	flash]
Message-ID: <20080320100353.GA409@logfs.org>
References: <1205961641.6276.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1205961641.6276.6.camel@localhost.localdomain>
Cc: MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some details I noticed on first glance.

On Wed, 19 March 2008 21:20:41 +0000, Adrian McMenamin wrote:
> 
> +/* Interface with maple bus to read bytes */
> +static int maple_vmu_read_block(unsigned int num, unsigned char *buf,
> +	struct mtd_info *mtd)
> +{
> +	struct memcard *card;
> +	struct mdev_part *mpart;
> +	struct maple_device *mdev;
> +	int partition, error, locking;
> +	void *sendbuf;
> +
> +	mpart = mtd->priv;
> +	mdev = mpart->mdev;
> +	partition = mpart->partition;
> +	card = mdev->private_data;
> +
> +	/* wait for the mutex to be available */
> +	locking = down_interruptible(&(mdev->mq->sem));
> +	if (locking) {
> +		printk(KERN_INFO "Maple: VMU at (%d, %d) is locked -"
> +			" aborting read\n", mdev->unit, mdev->port);
> +		goto fail_nosendbuf;
> +	}
> +	mdev->mq->command = MAPLE_COMMAND_BREAD;
> +	mdev->mq->length = 2;
> +
> +	sendbuf = kzalloc(mdev->mq->length * 4, GFP_KERNEL);
> +	if (!sendbuf) {
> +		error = -ENOMEM;
> +		goto fail_nosendbuf;
> +	}
> +
> +	((unsigned long *)sendbuf)[0] = cpu_to_be32(MAPLE_FUNC_MEMCARD);
> +	((unsigned long *)sendbuf)[1] = cpu_to_be32(partition << 24 | num);

unsigned long is larger than 32bit on many architectures.  Better
variant:
	__be32 *sendbuf;
	...
	sendbuf[0] = cpu_to_be32(MAPLE_FUNC_MEMCARD);
	sendbuf[1] = cpu_to_be32(partition << 24 | num);

Sparse would have noticed this problem as well.  Might be a good idea to
$ make C=1 drivers/mtd/maps/vmu_flash.o
and take a look what other problems show up.

> +	mdev->mq->sendbuf = sendbuf;

Possibly the big-endian annotations need to trickly though the layers
here as well.

> +/* mtd function to simulate reading byte by byte */
> +static unsigned char vmu_flash_read_char(unsigned long ofs, int *retval,
> +	struct mtd_info *mtd)
> +{
> +	struct vmu_block *vblock;
> +	struct memcard *card;
> +	struct mdev_part *mpart;
> +	struct maple_device *mdev;
> +	unsigned char *buf, ret;
> +	int partition, error;
> +
> +	mpart = mtd->priv;
> +	mdev = mpart->mdev;
> +	partition = mpart->partition;
> +	card = mdev->private_data;
> +	*retval =  0;
> +	buf = kmalloc(card->blocklen, GFP_KERNEL);
> +	if (!buf) {
> +		*retval = 1;
> +		error = ENOMEM;
> +		goto fail_buffer;
> +	}
> +
> +	vblock = ofs_to_block(ofs, mtd, partition);
> +	if (!vblock) {
> +		*retval = 3;
> +		error = ENOMEM;
> +		goto invalid_block;
> +	}
> +
> +	error = maple_vmu_read_block(vblock->num, buf, mtd);
> +	if (error) {
> +		*retval = 2;
> +		goto failed_block;
> +	}
> +	ret = buf[vblock->ofs];
> +	kfree(buf);
> +	kfree(vblock);
> +	return ret;
> +
> +failed_block:
> +	kfree(vblock);
> +invalid_block:
> +	kfree(buf);
> +fail_buffer:
> +	return -error;

Yikes.  Errnos greater 127 do exist.  Better return a signed int and
interpret at error if <0.

You could also combine the two sets of kfree() into one, btw.

> +	do {
> +		if (pcache->valid &&
> +		   time_before(jiffies, pcache->jiffies_atc + HZ)) {
> +			vblock = ofs_to_block(from + index, mtd, partition);
> +			if (!vblock)
> +				return -ENOMEM;
> +			if (pcache->block == vblock->num) {
> +				/*we have cached it, so do necessary copying */
> +				leftover = card->blocklen - vblock->ofs;
> +				if (leftover > len - index) {
> +					/* only a bit of this block to copy */
> +					memcpy(buf + index,
> +						pcache->buffer + vblock->ofs,
> +						len - index);

Five levels of indentation are a strong indication that this code is
buggy.  I don't understand how it behaves in all corner cases and I bet
neither do you.

> +	do {
> +
> +		/* Read in the block we are to write to */
> +		if (maple_vmu_read_block(vblock->num, buffer, mtd)) {
> +			error = -EIO;
> +			goto fail_io;
> +		}
> +
> +		do {
> +			buffer[vblock->ofs] = buf[index];
> +			vblock->ofs++;
> +			index++;
> +			if (index >= len)
> +				break;
> +		} while (vblock->ofs < card->blocklen);
> +		/* write out new buffer */
> +		retval = maple_vmu_write_block(vblock->num, buffer, mtd);
> +		/* invalidare the cache */
> +		pcache = (card->parts[partition]).pcache;
> +		pcache->valid = 0;
> +
> +		if (retval != card->blocklen) {
> +			error = -EIO;
> +			goto fail_io;
> +		}
> +
> +		vblock->num++;
> +		vblock->ofs = 0;
> +	} while (len > index);

And here is an example of essentially the same loop in a fashion mere
mortals can understand.  Much better. ;)

> +MODULE_AUTHOR("Adrian McMenamin, Paul Mundt");

I believe the main use of MODULE_AUTHOR is to figure out who to send bug
reports/patches to, not to contain every possible copyright holder.  So
possibly just your name here would be more appropriate.

Jörn

-- 
A victorious army first wins and then seeks battle.
-- Sun Tzu
