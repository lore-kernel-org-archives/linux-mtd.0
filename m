Received: from mk-filter-3-a-1.mail.uk.tiscali.com ([212.74.100.54]
	helo=mk-filter-3-a-4.mail.uk.tiscali.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JcTF9-0001S4-Ao
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 22:28:15 +0000
Subject: Re: [Fwd: Re: [PATCH] 2/2 mtd: Add support for the Dreamcast VMU
	flash]
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080320215807.GC3977@logfs.org>
References: <1205961641.6276.6.camel@localhost.localdomain>
	<20080320100353.GA409@logfs.org>
	<21996.85.118.17.158.1206014214.squirrel@newgolddream.dyndns.info>
	<20080320112029.GB1355@logfs.org>
	<47111.85.118.17.158.1206017802.squirrel@newgolddream.dyndns.info>
	<20080320123139.GE1355@logfs.org>
	<1206043861.6274.8.camel@localhost.localdomain>
	<20080320215807.GC3977@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2008 22:27:57 +0000
Message-Id: <1206052077.6274.21.camel@localhost.localdomain>
Mime-Version: 1.0
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


On Thu, 2008-03-20 at 22:58 +0100, Jörn Engel wrote:
> On Thu, 20 March 2008 20:11:01 +0000, Adrian McMenamin wrote:
> > 
> > You don't seem to have grasped that this is one type of device on a
> > proprietary bus which has other (types of) devices. I keep the code
> > consistent so that the API runs the same across the different devices -
> > makes the code easier to understand and maintain.
> > 
> > And given that this is also the variable that points to the memory block
> > that also includes the 8 bit based date that gets read in for block
> > writes I it makes perfect sense to have this as a void*.
> 
> Maybe this is a misunderstanding.  If you are arguing about this bit
> several mails back:
> ---<snip>---
> > +     mdev->mq->sendbuf = sendbuf;
> 
> Possibly the big-endian annotations need to trickly though the layers
> here as well.
> ---<snap>---
> Then I agree.  For a bus driver that only takes opaque data and moves it
> between device driver and hardware, void* is the type to choose.  But if
> you are arguing about the actual device driver, I couldn't disagree
> more.


I'm sorry, but the comment above <snap> isn't good english. What do you
mean? 

> 
> Please take a look at the function below, maybe it becomes clearer then.
> 
> static int maple_vmu_read_block(unsigned int num, unsigned char *buf,
>        struct mtd_info *mtd)
> {
>        struct memcard *card;
>        struct mdev_part *mpart;
>        struct maple_device *mdev;
>        int partition, error, locking;
>        __be32 *sendbuf;
> 
>        mpart = mtd->priv;
>        mdev = mpart->mdev;
>        partition = mpart->partition;
>        card = mdev->private_data;
> 
>        /* wait for the mutex to be available */
>        locking = down_interruptible(&(mdev->mq->sem));
>        if (locking) {
>                printk(KERN_INFO "Maple: VMU at (%d, %d) is locked -"
>                        " aborting read\n", mdev->unit, mdev->port);
>                return -EIO;
>        }
>        mdev->mq->command = MAPLE_COMMAND_BREAD;
>        mdev->mq->length = 2;
> 
>        sendbuf = kzalloc(mdev->mq->length * 4, GFP_KERNEL);
>        if (!sendbuf)
>                return -ENOMEM;
>        
>        sendbuf[0] = cpu_to_be32(MAPLE_FUNC_MEMCARD);
>        sendbuf[1] = cpu_to_be32(partition << 24 | num);
>   
>        mdev->mq->sendbuf = sendbuf;
>        block_read = 0;
>        
>        maple_getcond_callback(mdev, vmu_blockread, 0, MAPLE_FUNC_MEMCARD);
>        maple_add_packet(mdev->mq);
>        wait_event_interruptible_timeout(vmu_read, block_read, HZ * 4);
>        if (block_read == 0) {
>                printk(KERN_INFO "Maple: VMU read failed on block 0x%X\n", num);
> 	       error = -EIO;
>                goto out;
>        }
>        /* FIXME: we kfree a data structure that was allocated elsewhere.
>         * Either move allocation and freeing to the same function or
> 	* thoroughly document this to avoid subtle bugs after future
> 	* code changes.
> 	*/
>        memcpy(buf, card->blockread, card->blocklen);
>        kfree(card->blockread);
> 
>        error = 0;
> out:
>        kfree(sendbuf);
>        return error;
> }
> 
> And after doing these changes a couple more problems stuck out like sore
> thumbs, f.e. the FIXME above.  But we can discuss those later.



What is the issue? That the code is wrong or the documentation is
inadequate?
