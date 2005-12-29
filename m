Received: from rwcrmhc11.comcast.net ([204.127.198.35])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Es75Y-0002nx-3h
	for linux-mtd@lists.infradead.org; Thu, 29 Dec 2005 18:21:43 -0500
Date: Thu, 29 Dec 2005 15:21:38 -0800
From: Deepak Saxena <dsaxena@plexity.net>
To: linux-mtd@lists.infradead.org
Message-ID: <20051229232138.GA32463@plexity.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [RFC] Make physmap into a platform device driver...
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm working on a system where I want to use the physmap driver
but the size or buswidth of the flash device might change depending
on the specific board layout. I want to be able to build a single kernel
that boots on all boards using this NPU (IXP2350) and with the hardcoded
approach to buswidth and such, it makes it rather impossible. On ARM
platforms, we've been using the following data structure to pass
board-specific flash information to the SOC-specific drivers and I 
am wondering if it makes sense to move it out of ARM into the generic
MTD layer and have the physmap driver use it. The physmap driver
could register itself as a platform driver for "phys-mtd" devices
and boards would just fill in platform_device structure with the
appropriate resource window and the needed fields below as the
platform_data. We may want to trim down the structure to remove 
ARM-specific fields and let ARM have it's own structure that contains
the generic structure as a member. Thoughts?

~Deepak

/*
 * map_name:	the map probe function name
 * name:	flash device name (eg, as used with mtdparts=)
 * width:	width of mapped device
 * init:	method called at driver/device initialisation
 * exit:	method called at driver/device removal
 * set_vpp:	method called to enable or disable VPP
 * mmcontrol:	method called to enable or disable Sync. Burst Read in OneNAND
 * parts:	optional array of mtd_partitions for static partitioning
 * nr_parts:	number of mtd_partitions for static partitoning
 */
struct flash_platform_data {
	const char	*map_name;
	const char	*name;
	unsigned int	width;
	int		(*init)(void);
	void		(*exit)(void);
	void		(*set_vpp)(int on);
	void		(*mmcontrol)(struct mtd_info *mtd, int sync_read);
	struct mtd_partition *parts;
	unsigned int	nr_parts;
};


-- 
Deepak Saxena - dsaxena@plexity.net - http://www.plexity.net

A starving child in Africa or you in front of your TV?
Where's the real tragedy?
