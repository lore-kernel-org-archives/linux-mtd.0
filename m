Received: from idiom.com ([216.240.32.1] ident=espin)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MXNi-0003ef-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 Jan 2002 16:39:46 +0000
Received: (from espin@localhost)
	by idiom.com (8.9.3/8.9.3) id IAA67544
	for linux-mtd@lists.infradead.org; Fri, 4 Jan 2002 08:50:40 -0800 (PST)
Date: Fri, 4 Jan 2002 08:50:40 -0800
From: Geoffrey Espin <espin@idiom.com>
To: linux-mtd@lists.infradead.org
Subject: Re: linux-mtd digest, Vol 1 #323 - 3 msgs
Message-ID: <20020104085040.A48397@idiom.com>
References: <E16MWkI-0003Z1-00@pentafluge.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E16MWkI-0003Z1-00@pentafluge.infradead.org>; from linux-mtd-request@lists.infradead.org on Fri, Jan 04, 2002 at 03:59:02PM +0000
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

> From: "Sanjay Kumar" <sankumar96@lycos.com>
> Subject: Problem in changing  the starting location of JFFS2 for AMD flash
> I am using AMD flash of 4M size and keeping starting 1/2 MB for RAW data. Then for the remaining I want to use JFFS2. That is JFF2 will start from 0.5 MB to 4MB. For that I am making changes in super.c of JFFS2 for function jffs2_read_super. The changes are -    
> c->free_size = c->mtd->size - jffs2_start_addr;
> c->flash_size = c->mtd->size - jffs2_start_addr;
> c->nr_blocks = c->flash_size / c->sector_size;
> c->blocks[i].offset = i * c->sector_size + jffs2_start_addr;
> where am keeping jffs2_start_addr = 0x80000.
> I am using linux 2.4.2.
> Now I am able to mount the jffs2 file system and able to create a empty file.
> But when I go for writing into the created empty file, it is crashing.

As someone already has replied, don't mess with sources like super.c.

In linux/.config, have these options on:

    CONFIG_MTD=y
    CONFIG_MTD_PARTITIONS=y
    CONFIG_MTD_CHAR=y
    CONFIG_MTD_BLOCK=y
    CONFIG_MTD_<myboard>=y

Under linux/drivers/mtd/maps/ you must create your myboard-flash.c
(and add to Makefile), which has the partition table in it, e.g.:

    #define WINDOW_ADDR 0xbfc00000  /* default 4M part */
    #define WINDOW_SIZE 0x00400000
    ...
    static struct mtd_partition myboard_partitions[] = {
	    {
		    name: "bootstrap and kernel",
		    size: WINDOW_SIZE / 4,  /* 0.5M */
		    offset: 0,
	    },{
		    name: "filesystem",
		    size: MTDPART_SIZ_FULL, /* 2M */
		    offset: MTDPART_OFS_APPEND,
	    }
    };

Then from shell you can:

    # mtd_debug erase /dev/mtd/0 ${OFFSET} ${SIZE}   # 0 is entire device
    # cp empty.jffs2 /dev/mtd/2                      # 2 is second partition
    # mount -t jffs2 /dev/mtdblock/2 /mnt

Where 'empty.jffs2' is a stub file created by mkfs.jffs2,
and OFFSET & SIZE are whatever boundaries you've setup.

You might need to drop in later mtd files into 2.4.2.

Geoff
-- 
Geoffrey Espin
espin@idiom.com
