Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DAv7E-0002sh-Gs
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 14:20:37 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j2EJKYi9027790
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 14:20:34 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j2EJKYdi096128
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 14:20:34 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j2EJKXCW018128
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 14:20:33 -0500
Received: from windu.rchland.ibm.com (windu.rchland.ibm.com [9.10.78.17])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j2EJKXsC018118
	for <linux-mtd@lists.infradead.org>; Mon, 14 Mar 2005 14:20:33 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1110827292.7642.26.camel@windu.rchland.ibm.com>
References: <1110827292.7642.26.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Mon, 14 Mar 2005 13:20:16 -0600
Message-Id: <1110828016.7642.29.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: lock bit and erase errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-03-14 at 13:08 -0600, Josh Boyer wrote:
> Caveat:  I am using some pretty old code in this case, but the current
> code is also questionable so bear with me.
> 
> I can't for the life of me figure out what the following code from
> do_erase_oneblock cfi_cmdset_0001.c is doing:
> 
> 	/* check for lock bit */
> 	if (status & CMD(0x3a)) {
> 		unsigned char chipstatus = status;
> 		if (status != CMD(status & 0xff)) {
> 			int i = cfi->interleave;
> 			for (i = 1; i<cfi->interleave; i++) {
> 				      chipstatus |= status >> (cfi->device_type * 8);
> 			}
> 			printk(KERN_WARNING "Status is not identical for all chips: 0x%x. Merging to give 0x%02x\n", status, chipstatus);
> 		}
> 
> 
> My device is a 16-bit device, the interleave is 1, and I have a few
> blocks with the lock bit on.  When I do a write to /dev/mtdblock/0/0, an
> erase is attempted.  When I run an older version of this code, I get:
> 
> "Status not identical for all chips: 0xa200.  Merging to give 0x00"
> 
> What I don't understand is how any of the above code is expected to
> work.  A 1 byte variable (chipstatus) is assigned a 4 byte value
> (status), which gets truncated.  Then status is shifted by 16 bits (in
> my case), which still means chipstatus is still 0.  When all is said and
> done, I get the merging printk but none of the checks below this code
> match.  That doesn't seem right...
> 
> I hacked the older code for my specific instance to do:
> 
> chipstatus = status >> 8;
> 
> and I get the proper return code for my situation (-EROFS).  I still
> don't get an error in the application writing to /dev/mtdblock/0/0, but
> at least the chip driver is actually returning an error.
> 
> Any ideas?
> 

Urm, I should also point out that I have intentionally locked the
eraseblocks on this device, so I _expect_ it to fail.  But the driver
didn't return a bad return code, which is what I'm confused about.

And I'm also confused as to why the app didn't get a bad return code
even when I "fixed" the driver to error out.  But one thing at a time.

josh
