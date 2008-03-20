Received: from mk-filter-1-a-1.mail.uk.tiscali.com ([212.74.100.52])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JcJOu-0007Bj-8e
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 11:57:40 +0000
Message-ID: <21996.85.118.17.158.1206014214.squirrel@newgolddream.dyndns.info>
In-Reply-To: <20080320100353.GA409@logfs.org>
References: <1205961641.6276.6.camel@localhost.localdomain>
	<20080320100353.GA409@logfs.org>
Date: Thu, 20 Mar 2008 11:56:54 -0000 (UTC)
Subject: Re: [Fwd: Re: [PATCH] 2/2 mtd: Add support for the Dreamcast VMU
	flash]
From: "Adrian McMenamin" <adrian@newgolddream.dyndns.info>
To: =?iso-8859-15?Q?J=C3=B6rn_Engel?= <joern@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Cc: MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, March 20, 2008 10:03 am, Jörn Engel wrote:
> Some details I noticed on first glance.
>
> On Wed, 19 March 2008 21:20:41 +0000, Adrian McMenamin wrote:
>>
>> +/* Interface with maple bus to read bytes */
>> +static int maple_vmu_read_block(unsigned int num, unsigned char *buf,
>> +	struct mtd_info *mtd)
>> +{
>> +	struct memcard *card;
>> +	struct mdev_part *mpart;
>> +	struct maple_device *mdev;
>> +	int partition, error, locking;
>> +	void *sendbuf;
>> +
>> +	mpart = mtd->priv;
>> +	mdev = mpart->mdev;
>> +	partition = mpart->partition;
>> +	card = mdev->private_data;
>> +
>> +	/* wait for the mutex to be available */
>> +	locking = down_interruptible(&(mdev->mq->sem));
>> +	if (locking) {
>> +		printk(KERN_INFO "Maple: VMU at (%d, %d) is locked -"
>> +			" aborting read\n", mdev->unit, mdev->port);
>> +		goto fail_nosendbuf;
>> +	}
>> +	mdev->mq->command = MAPLE_COMMAND_BREAD;
>> +	mdev->mq->length = 2;
>> +
>> +	sendbuf = kzalloc(mdev->mq->length * 4, GFP_KERNEL);
>> +	if (!sendbuf) {
>> +		error = -ENOMEM;
>> +		goto fail_nosendbuf;
>> +	}
>> +
>> +	((unsigned long *)sendbuf)[0] = cpu_to_be32(MAPLE_FUNC_MEMCARD);
>> +	((unsigned long *)sendbuf)[1] = cpu_to_be32(partition << 24 | num);
>
> unsigned long is larger than 32bit on many architectures.  Better
> variant:
> 	__be32 *sendbuf;


No, it's not. This is part of a bus subsystem where different parts of the
incoming packets may or may not be in big endian format. Eg for block
writes the then the opening blocks may be in big endian format but the
data to be written is not.

If you insist on leaving open the possibility that someone might decide to
build the electronics to attach these devices to a 64 bit machine
(unlikely, I'd suggest) then u32 is the way to go - but are you really
concerned that might happen?



>> +fail_buffer:
>> +	return -error;
>
> Yikes.  Errnos greater 127 do exist.  Better return a signed int and
> interpret at error if <0.
>

There is an error here, actually, but not as you describe. However as the
errors defined in errno-base are all positive integers I don't see how
your proposal works.

> You could also combine the two sets of kfree() into one, btw.
>
>> +	do {
>> +		if (pcache->valid &&
>> +		   time_before(jiffies, pcache->jiffies_atc + HZ)) {
>> +			vblock = ofs_to_block(from + index, mtd, partition);
>> +			if (!vblock)
>> +				return -ENOMEM;
>> +			if (pcache->block == vblock->num) {
>> +				/*we have cached it, so do necessary copying */
>> +				leftover = card->blocklen - vblock->ofs;
>> +				if (leftover > len - index) {
>> +					/* only a bit of this block to copy */
>> +					memcpy(buf + index,
>> +						pcache->buffer + vblock->ofs,
>> +						len - index);
>
> Five levels of indentation are a strong indication that this code is
> buggy.  I don't understand how it behaves in all corner cases and I bet
> neither do you.
>

It's not buggy - and it seems pretty clear to me what is happening here.
What's the issue?


>> +	do {
>> +
>> +		/* Read in the block we are to write to */
>> +		if (maple_vmu_read_block(vblock->num, buffer, mtd)) {
>> +			error = -EIO;
>> +			goto fail_io;
>> +		}
>> +
>> +		do {
>> +			buffer[vblock->ofs] = buf[index];
>> +			vblock->ofs++;
>> +			index++;
>> +			if (index >= len)
>> +				break;
>> +		} while (vblock->ofs < card->blocklen);
>> +		/* write out new buffer */
>> +		retval = maple_vmu_write_block(vblock->num, buffer, mtd);
>> +		/* invalidare the cache */
>> +		pcache = (card->parts[partition]).pcache;
>> +		pcache->valid = 0;
>> +
>> +		if (retval != card->blocklen) {
>> +			error = -EIO;
>> +			goto fail_io;
>> +		}
>> +
>> +		vblock->num++;
>> +		vblock->ofs = 0;
>> +	} while (len > index);
>
> And here is an example of essentially the same loop in a fashion mere
> mortals can understand.  Much better. ;)


That's because the writes, for fairly obvious reasons (ie once you've
written to a block you've changed it), are not cached in the same way.

>
>> +MODULE_AUTHOR("Adrian McMenamin, Paul Mundt");
>
> I believe the main use of MODULE_AUTHOR is to figure out who to send bug
> reports/patches to, not to contain every possible copyright holder.  So
> possibly just your name here would be more appropriate.
>
>
fair enough.
