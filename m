Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184IAr-0000I9-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 10:51:38 +0100
Received: from mail.fh-wedel.de ([195.37.86.23])
	by phoenix.infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 4.10)
	id 184ITz-0000P7-00
	for linux-mtd@lists.infradead.org; Wed, 23 Oct 2002 11:11:24 +0100
Date: Wed, 23 Oct 2002 12:06:19 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Frank Neuber <neuber@convergence.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021023100618.GB13926@wohnheim.fh-wedel.de>
References: <20021018104910.GA11807@jupiter> <26791.1034943288@passion.cambridge.redhat.com> <20021019164445.GA9364@wohnheim.fh-wedel.de> <20021022103936.GA24369@jupiter> <20021022170803.GA9161@wohnheim.fh-wedel.de> <20021023094928.GA27905@jupiter>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021023094928.GA27905@jupiter>
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

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, 23 October 2002 11:49:28 +0200, Frank Neuber wrote:
> > Ok, enough rambling. Try this patch:
> > http://wh.fh-wedel.de/~joern/software/kernel/mtd.patch.mphysmap.2.4.19-untested
> But this is not what I need :-(

Argl! Sorry, my bad. Try the attached file instead.

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra

--dDRMvlgZJXvWKvBx
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="mphysmap.c"

/*
 * $Id: mphysmap.c,v 1.8 2002/05/27 12:53:53 engeljoe Exp $
 *
 * Normal mappings of multiple chips in physical memory
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/config.h>
#ifdef CONFIG_PROC_FS
#include <linux/proc_fs.h>
#endif

#define error(fmt, args...) printk(KERN_NOTICE "mphysmap: " fmt "\n", ## args);

#define MPHYSMAP_DEVICES 8

#if MPHYSMAP_DEVICES < CONFIG_MTD_MPHYSMAP_AMOUNT
#  error Config.in defines more devices than mphysmap.c can hold
#endif

/*
 * map_priv_1 after ioremap: virtual address to device start
 *           before ioremap: partition parser, see mtd_mphysmap_setup
 * map_priv_2 holds physical address to device start
 */
struct map_info my_map[MPHYSMAP_DEVICES] = {
	{
		name:		CONFIG_MTD_MPHYSMAP1_NAME,
		map_priv_1:	1,
		map_priv_2:	CONFIG_MTD_MPHYSMAP1_START,
		size:		CONFIG_MTD_MPHYSMAP1_LEN,
		buswidth:	CONFIG_MTD_MPHYSMAP1_BUSWIDTH,
#if CONFIG_MTD_MPHYSMAP_AMOUNT > 1
	},{
		name:		CONFIG_MTD_MPHYSMAP2_NAME,
		map_priv_1:	1,
		map_priv_2:	CONFIG_MTD_MPHYSMAP2_START,
		size:		CONFIG_MTD_MPHYSMAP2_LEN,
		buswidth:	CONFIG_MTD_MPHYSMAP2_BUSWIDTH,
#endif
#if CONFIG_MTD_MPHYSMAP_AMOUNT > 2
	},{
		name:		CONFIG_MTD_MPHYSMAP3_NAME,
		map_priv_1:	1,
		map_priv_2:	CONFIG_MTD_MPHYSMAP3_START,
		size:		CONFIG_MTD_MPHYSMAP3_LEN,
		buswidth:	CONFIG_MTD_MPHYSMAP3_BUSWIDTH,
#endif
#if CONFIG_MTD_MPHYSMAP_AMOUNT > 3
	},{
		name:		CONFIG_MTD_MPHYSMAP4_NAME,
		map_priv_1:	1,
		map_priv_2:	CONFIG_MTD_MPHYSMAP4_START,
		size:		CONFIG_MTD_MPHYSMAP4_LEN,
		buswidth:	CONFIG_MTD_MPHYSMAP4_BUSWIDTH,
#endif
	},
};

static int last_device = CONFIG_MTD_MPHYSMAP_AMOUNT - 1;
static int __initdata cmdline_override = 0;

static struct mtd_info *mymtd[MPHYSMAP_DEVICES];

__u8 mphysmap_read8(struct map_info *map, unsigned long ofs)
{
	return __raw_readb(map->map_priv_1 + ofs);
}

__u16 mphysmap_read16(struct map_info *map, unsigned long ofs)
{
	return __raw_readw(map->map_priv_1 + ofs);
}

__u32 mphysmap_read32(struct map_info *map, unsigned long ofs)
{
	return __raw_readl(map->map_priv_1 + ofs);
}

void mphysmap_copy_from(struct map_info *map, void *to, unsigned long from,
		ssize_t len)
{
	memcpy_fromio(to, map->map_priv_1 + from, len);
}

void mphysmap_write8(struct map_info *map, __u8 d, unsigned long adr)
{
	__raw_writeb(d, map->map_priv_1 + adr);
	mb();
}

void mphysmap_write16(struct map_info *map, __u16 d, unsigned long adr)
{
	__raw_writew(d, map->map_priv_1 + adr);
	mb();
}

void mphysmap_write32(struct map_info *map, __u32 d, unsigned long adr)
{
	__raw_writel(d, map->map_priv_1 + adr);
	mb();
}

void mphysmap_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
{
	memcpy_toio(map->map_priv_1 + to, from, len);
}

/**
 *	tokens are uses as follows:
 *	token[0]: device name
 *	token[1]: start address
 *	token[2]: size
 *	token[3]: buswidth
 *	token[4]: partition parser (0=none, 1=default) (optional, defaults to 1)
 */
static int __init mtd_mphysmap_setup(char *str)
{
	char *token[5], *c;
	int i;

	for (i=0; i<5; i++)
		token[i] = strsep(&str, ",");

	if (str) {
		error("mphysmap: too many arguments passed - device ignored");
		return 1;
	}
	if (!token[3]) {
		error("mphysmap: not enough arguments - device ignored");
		return 1;
	}
	if (!cmdline_override) {
		last_device = -1;
		cmdline_override = 1;
	}

	last_device++;
	my_map[last_device].name = token[0];
	my_map[last_device].map_priv_2 = simple_strtoul(token[1], &c, 0);
	my_map[last_device].size = simple_strtoul(token[2], &c, 0);
	my_map[last_device].buswidth = simple_strtoul(token[3], &c, 0);
	if (token[4]) 
		my_map[last_device].map_priv_1 = simple_strtoul(token[4], &c,0);
	else
		my_map[last_device].map_priv_1 = 1;
	return 1;
}

__setup("mphysmap=", mtd_mphysmap_setup);

#ifdef CONFIG_PROC_FS 

static struct proc_dir_entry *proc_mphysmap;

static int
mphysmap_read_proc(char *page, char **start, off_t off, int count, int *eof,
		void *data_unused)
{
	int i, len;

	len = sprintf(page, "dev: start:     len:\n");
	for (i=0; i<=last_device; i++)
		len += sprintf(page+len, "%2d   0x%08lx 0x%08lx\n",
				MTD_DEVICE(mymtd[i]->minor),
				my_map[i].map_priv_2, my_map[i].size);
	*eof = 1;
	return len;
}

#endif /* CONFIG_PROC_FS */

int __init init_mphysmap(void)
{
	int i, ret = -ENXIO;
	partition_parser *part_pars;

#ifdef CONFIG_PROC_FS
	if ((proc_mphysmap = create_proc_entry("mphysmap", 0, NULL)))
		proc_mphysmap->read_proc = mphysmap_read_proc;
#endif
	for (i=0; i<=last_device; i++) { /*FIXME*/
		if (my_map[i].map_priv_1)
			part_pars = default_parser;
		else
			part_pars = parse_no_partitions;
		printk(KERN_NOTICE "physmap flash device \"%s\": 0x%08lx at "
				"0x%08lx\n", my_map[i].name, my_map[i].size,
				my_map[i].map_priv_2);
		my_map[i].map_priv_1 = (unsigned long)ioremap (
				my_map[i].map_priv_2, my_map[i].size);
		if (!my_map[i].map_priv_1) {
			printk ("Failed to ioremap\n");
			continue;
		}

		my_map[i].read8 = mphysmap_read8;
		my_map[i].read16 = mphysmap_read16;
		my_map[i].read32 = mphysmap_read32;
		my_map[i].copy_from = mphysmap_copy_from;
		my_map[i].write8 = mphysmap_write8;
		my_map[i].write16 = mphysmap_write16;
		my_map[i].write32 = mphysmap_write32;
		my_map[i].copy_to = mphysmap_copy_to;

		mymtd[i] = do_map_probe ("cfi_probe", &my_map[i]);
		if (!mymtd[i]) {
			iounmap ((void*)my_map[i].map_priv_1);
			continue;
		}
		mymtd[i]->module = THIS_MODULE;
		add_mtd_part_device (mymtd[i], part_pars);
		ret = 0; /* We found at least one device */
	}
	return ret;
}

static void __exit cleanup_mphysmap(void)
{
	int i;

#ifdef CONFIG_PROC_FS
	if (proc_mphysmap)
		remove_proc_entry("mphysmap", NULL);
#endif
	for (i=0; i<=last_device; i++) { /*FIXME*/
		if (mymtd[i]) {
			del_mtd_device (mymtd[i]);
			map_destroy (mymtd[i]);
		}
		if (my_map[i].map_priv_1) {
			iounmap ((void*)my_map[i].map_priv_1);
			my_map[i].map_priv_1 = 0;
		}
	}
}

module_init(init_mphysmap);
module_exit(cleanup_mphysmap);

--dDRMvlgZJXvWKvBx--
