Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G04Hc-0001IC-QL
	for linux-mtd@lists.infradead.org; Mon, 10 Jul 2006 18:31:23 -0400
Date: Tue, 11 Jul 2006 01:31:07 +0300
From: Ville Herva <vherva@vianova.fi>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work (try 3)
Message-ID: <20060710223106.GX6240@vianova.fi>
References: <20060707122221.GW6240@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060707122221.GW6240@vianova.fi>
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 07, 2006 at 03:22:21PM +0300, you [Ville Herva] wrote:
> 
> --- linux-mtd-GIT/drivers/mtd/devices/block2mtd.c	2006-07-05 23:06:10.000000000 +0300
> +++ linux-2.6.17.3.NEW3/drivers/mtd/devices/block2mtd.c	2006-07-07 15:04:48.000000000 +0300

For the record: I tested this variant of the patch in the following ways: 
 - block2mtd compiled in statically, no block2mtd.block2mtd kernel parameter
 - block2mtd compiled in statically, block2mtd.block2mtd=/dev/hda2 kernel parameter
 - block2mtd compiled as a module, no block2mtd.block2mtd kernel parameter
   - insert block2mtd.ko with no arguments, later 
     echo /dev/hda2 > /sys/module/block2mtd/parameters/block2mtd
   - insert block2mtd.ko with block2mtd=/dev/hda2 argument
 - block2mtd compiled in statically, block2mtd.block2mtd=/dev/hda2 kernel parameter
