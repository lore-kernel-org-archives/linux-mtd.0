Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197ZiY-0001f3-SV
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 12:44:14 +0100
Date: Mon, 21 Apr 2003 13:44:14 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
Message-ID: <20030421114414.GA9550@wohnheim.fh-wedel.de>
References: <1050513945.1172.265.camel@tubarao>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1050513945.1172.265.camel@tubarao>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: device info in /proc/mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 April 2003 11:25:45 -0600, Thayne Harbaugh wrote:
> 
> It's nice that loading the amd76xrom module outputs probe information
> about a device manufacturer and chip:
> 
> [root@172 2466]# modprobe amd76xrom
> Found: PMC Pm49FL004
> number of JEDEC chips: 1
> amd76xrom chip at offset: 480000
> 
> I hoped this same information would be in /proc/mtd - it's not.
> 
> [root@172 2466]# cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00080000 00001000 "AMD76X rom"
> 
> Is there someplace where the manufacturer and chip are available other
> than in the printk() messages?  It would be nice to be able to query
> this information at any time - a specific model of motherboard might
> socket a different chip depending on cost/availability and I'd like to
> be able to track which BIOS flash chip is being used.
> 
> Something like this in /proc/mtd might be nice:
> 
> dev:    size   erasesize  name       manufacturer chip chip_name
> mtd0: 00080000 00001000 "AMD76X rom" 009d         006e "PMC Pm49FL004"
> 
> Am I crazey?  Is this plain wrong?  Does anyone have objections if I
> submit a patch?

You are not crazy, but I consider this to be the wrong spot for the
information. /proc/mtd should hold those informations that mtd core
code knows about. Device specifics should go somewhere else.

Or could you find a nice common interface for mtdblock (which hard
drive?), mtdram (physical ram addresses), mtdram2 (dynamic allocation,
print the whole list?), NAND (no idea), NOR (manufacturer, chip),
really odd stuff like NOR with hardware ECC and all the nice goodies
that are yet to appear?

Put it into /proc/<find a nice name>, make it as general as possible,
but not more.

Jörn

-- 
Eighty percent of success is showing up.
-- Woody Allen
