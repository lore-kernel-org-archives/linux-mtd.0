Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VPbo-0006ET-Cj
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 06:47:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Yy Yy <yy_hust@yahoo.com.cn>
In-Reply-To: <20030626023855.50873.qmail@web15306.mail.bjs.yahoo.com>
References: <20030626023855.50873.qmail@web15306.mail.bjs.yahoo.com>
Message-Id: <1056606486.26118.2.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 26 Jun 2003 06:48:06 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: nico@cam.org
cc: linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: Ask a question about mtdblock.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-06-26 at 03:38, Yy Yy wrote:
> I want to implement mass storage protocol.
> I write a kernel thread to handle the requests from
> mass storage protocol.
> I don't know how to read/write data from flash memory
> by mtdblock in my kernel thread.

Assuming you're talking about implementing USB mass storage
'personality' for the USB slave code, surely you shouldn't be making it
at all specific to the mtdblock device? You should make it work on _any_
block device.

> Should I call sys_open/sys_read/sys_write to mtdblock
> device file (/dev/mtdblock0) to get the data.
> Or should I call do_cache_write or do_cache_read to
> get the data directly.

No. You should do neither of those. And if you want any reasonable
chance of data integrity you shouldn't be using the mtdblock device for
writing at all. You should send read and write requests via the block
device queues -- see blkmtd.c for inspiration.

-- 
dwmw2
