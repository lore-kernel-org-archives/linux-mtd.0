Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 198FFx-0002XW-GW
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 09:05:29 +0100
Date: Wed, 23 Apr 2003 10:05:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Wuertele <dave-gnus@bfnet.com>
Message-ID: <20030423080535.GB12378@wohnheim.fh-wedel.de>
References: <m365p6b0q0.fsf@bfnet.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m365p6b0q0.fsf@bfnet.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd and devfs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 April 2003 15:56:23 -0700, David Wuertele wrote:
> 
> Is there any reason why mtd wouldn't work under devfs?

It does here, with 2.4.18 plus some other patches.

> I'm running 2.4.18 plus some vendor patches.  I've got a nand flash
> that is recognized on boot:
> 
>   STWX225 NAND Flash initializing...
>   PFLASH_CNTL before MOD: 80after MOD: 80
>   NAND device: Manufacture ID: 0xec, Chip ID: 0x73 (Samsung KM29U128T) Chip size: 2000000
>   Creating 5 MTD partitions on "Samsung KM29U128T":
>   0x00000000-0x00200000 : "MTD partition 0"
>   mtd: Giving out device 0 to MTD partition 0
>   0x00200000-0x00400000 : "MTD partition 1"
>   mtd: Giving out device 1 to MTD partition 1
>   0x00400000-0x00c00000 : "MTD partition 2 - root FS"
>   mtd: Giving out device 2 to MTD partition 2 - root FS
>   0x01f00000-0x01ffc000 : "MTD partition 3"
>   mtd: Giving out device 3 to MTD partition 3
>   0x01ffc000-0x02000000 : "MTD partition 4"
>   mtd: Giving out device 4 to MTD partition 4
>   STW4X225 NAND Flash initialized.
> 
> This results in devices under devfs:
> 
>   # ls -R /dev/mtd
> 
>   /dev/mtd:
>   0
>   0ro
>   1
>   1ro
>   2
>   2ro
>   3
>   3ro
>   4
>   4ro
> 
> But when I try to read from these, my system hangs before it ever gets
> to the nand_read() function:
> 
>   # head /dev/mtd/0 > fred
> 
> Whether I try to read or write to the /dev/mtd/0 device, the system
> hangs hard.  The nand_read() function has a printk as its first
> statement, but the console never prints this, so I think there is
> something wrong with the read dispatch.  Could there be issues with my
> use of devfs?

Does the system work when you create the nodes by hand without devfs?
Likely not.
Does it work if you use the block devices instead?
Likely not.

If both fail enable CONFIG_MTD_DEBUG and increase
CONFIG_MTD_DEBUG_VERBOSE until you can tell, where the read hangs.
Write may be a bad test, depending on your setup, as printk doesn't
always reach you after a system hang.

Results without vendor patches are preferred. :)

Jörn

-- 
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown
