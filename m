Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VnqP-0002JU-4H
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jun 2003 08:40:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Vikram Mehta <vm6580@hotmail.com>
In-Reply-To: <Law14-OE42JsaJbqJGN00053f83@hotmail.com>
References: <Law14-OE42JsaJbqJGN00053f83@hotmail.com>
Message-Id: <1056699649.28202.30.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 27 Jun 2003 08:40:49 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 Mount problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-26 at 03:53, Vikram Mehta wrote:
> Hi folks,
> I have built a kernel in RAM and Put in Jffs2 Support with two partitions.
> 
> On Booting However I get these messages for a huge number of times
> ..........
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e20c8:
> 0x0007 id
> ...........
> JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased

Either you didn't erase the flash before trying to mount it, or you're
mounting the wrong partition.

> when running the command
>  mount -t jffs2 /dev/mtdblock1 /mnt
> 
> I get
> 
> arena opened of 1 failed
> mount: Mounting /dev/mtdblock1 on /mnt failed: No such device

Does the device node /dev/mtdblock1 exist? Do you have the mtdblock
driver enabled? Check that CONFIG_MTD_BLOCK is set. What does 'cat
/proc/mtd' output?

-- 
dwmw2
