Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Amr2-0006QL-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2002 07:50:00 +0000
Date: Sun, 10 Nov 2002 09:20:17 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kevin Kaichuan He <hek_u5@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q on MTD support for NOR flash
Message-ID: <20021110082017.GC16704@wohnheim.fh-wedel.de>
References: <20021109205730.GB16704@wohnheim.fh-wedel.de> <20021110074920.4607.qmail@web14812.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021110074920.4607.qmail@web14812.mail.yahoo.com>
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

On Sat, 9 November 2002 23:49:20 -0800, Kevin Kaichuan He wrote:
> 
> One Further question is : how do I configure MTD driver to support
> my NOR flash ? For example, the AMD29LV800 flash has two width: 8bits
> or 16bits, how do I let the driver know which width of word I choose ?
> Or can the MTD magically figure out the configuration of my NOR 
> flash ?

You need something like this:
CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP...=...

Details might vary, have fun figuring those out. Buswidth must be set
for physmap.

Jörn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
