Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18AcCG-0003TV-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Nov 2002 20:27:12 +0000
Date: Sat, 9 Nov 2002 21:57:30 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kevin Kaichuan He <hek_u5@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q on MTD support for NOR flash
Message-ID: <20021109205730.GB16704@wohnheim.fh-wedel.de>
References: <20021109203650.72416.qmail@web14809.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021109203650.72416.qmail@web14809.mail.yahoo.com>
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

On Sat, 9 November 2002 12:36:50 -0800, Kevin Kaichuan He wrote:
> 
> We are considering to use NOR flash in a embedded linux
> system. But it seems that NAND flash support was mentioned
> a lot in MTD instead of NOR flash. I'm wondering if there
> is intensive NOR flash support in MTD, specifically if
> AMD's boot sector NOR flash
> (AM29LV800B,http://www.amd.com/us-en/FlashMemory/ProductInformation/0,,37_1447_1623_1468%5E1532,00.html)
> is supported.

Yupp.
Nand flash support is not too old and thus is getting a lot more
development now. Nor, in almost all cases, simply works.

> Also can we partition the AM29LV800B into multiple partitions and
> mount different filesystem on it (e.g. JFFS on RW partiton and Cramfs
> on RO partition) ?

Yupp.

> How about the boot sector of NOR flash, is it supported too ?

Kinda. If you have to access the small fragments seperately, you might
run into problems. But that is usually only done from a bootloader,
not from linux.
For all practical purposes, yupp.

Jörn

-- 
Fancy algorithms are slow when n is small, and n is usually small.
Fancy algorithms have big constants. Until you know that n is
frequently going to be big, don't get fancy.
-- Rob Pike
