Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Jzi9-0002PD-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2002 17:22:53 +0000
Date: Thu, 5 Dec 2002 11:53:23 -0600
Subject: Re: Problem: 51MB partition max size on jffs2
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v548)
Cc: LinuxMTD <linux-mtd@lists.infradead.org>
To: tglx@linutronix.de
From: Ken Offer <koffer@arlut.utexas.edu>
In-Reply-To: <200212050020.44734.tglx@linutronix.de>
Message-Id: <72BCF9F0-087A-11D7-971A-000393467F1A@arlut.utexas.edu>
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wednesday, December 4, 2002, at 05:20  PM, Thomas Gleixner wrote:

> On Thursday 05 December 2002 00:08, Ken Offer wrote:
>> On Wednesday, December 4, 2002, at 04:02  PM, Thomas Gleixner wrote:
>>> On Wednesday 04 December 2002 23:00, Ken Offer wrote:
>>>> On Wednesday, December 4, 2002, at 11:47  AM, Thomas Gleixner wrote:
>>>>> Latest CVS code ?
>>>>
>>>> I tried it with an older version (circa 20020819) and the latest 
>>>> code
>>>> (20021202).  Same result.  I am going to try the change Dave Ellis
>>>> <DGE@sixnetio.com> suggested.
>>>
>>> Strange. Could you please tell me, what output the latest CVS code
>>> produces
>>
>> Well, I was getting a mount failure.  There wasn't much info other 
>> than
>> that.  If you look in the latest (20021202) jffs2 build.c file, you 
>> can
>> see if the kmalloc of c->blocks fails in jffs2_do_mount_fs, no debug
>> message is printed.  Only a non-mem error is returned.  That is
>> consistent with what I was seeing, even with the highest verbosity
>> debugging on.
>>
>> I made the change to use vmalloc/vfree for c->blocks and that seemd to
>> fix the problem.  kmalloc is indeed limited to 128KB.  Of course, I
>> made the change to the 20020819 code.  I'll try the vmalloc change 
>> with
>> the latest CVS code as well and see how that holds up.
> Please wait.
> Could you please verify, if the code in fs. c does, what it should do ?
>
> int jffs2_do_fill_super(struct super_block *sb, void *data, int silent)
> {
> SNIP
> 	c->flash_size = c->mtd->size;
> 	/*
> 	 * Check, if we have to concatenate physical blocks to larger virtual 
> blocks
> 	 * to reduce the memorysize for c->blocks. (kmalloc allows max. 128K
> allocation)
> 	 */
> 	blocks = c->flash_size / c->mtd->erasesize;
> 	while ((blocks * sizeof (struct jffs2_eraseblock)) > (128 * 1024))
> 		blocks >>= 1;
> 	
> 	c->sector_size = c->flash_size / blocks;
> 	if (c->sector_size != c->mtd->erasesize)
> 		printk(KERN_INFO "jffs2: Erase block size too small (%dKiB). Using 
> virtual
> blocks size (%dKiB) instead\n",
> 			c->mtd->erasesize / 1024, c->sector_size / 1024);
>
> This is processed before calling jffs2_do_mount_fs. There is 
> calculated:
>
> 	c->nr_blocks = c->flash_size / c->sector_size;
> 	c->blocks = kmalloc(sizeof(struct jffs2_eraseblock) * c->nr_blocks,
> GFP_KERNEL);
> 	if (!c->blocks)
> 		return -ENOMEM;
>
> So it should rely on the previous adjusted sectorsize.

Ok, I switched back to the latest CVS and tried to mount the partition. 
  No luck, even with a 32MB partition.  I get:

mount -t jffs2 /dev/mtdblock1 /mnt/jffs
mount: /dev/mtdblock1 is not a valid block device

I have tried the latest CVS with both the "vmalloc c->blocks" change 
and without.  In both cases mount fails the same way.  I turned up 
debugging all the way for jffs2 and mtd but no messages were printed to 
/var/log/messages.  Guess I need to scour the jffs2 code and add some 
more printks...

So... I don't know yet if the above code is working or not.  I need to 
find out why mount doesn't like /dev/mtdblock1 with the latest CVS code 
(but DOES like it for the 20020819 code).

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
