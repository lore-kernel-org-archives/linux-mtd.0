Received: from kluster1.contactor.se ([91.191.140.11])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KggpL-0004lJ-HI
	for linux-mtd@lists.infradead.org; Fri, 19 Sep 2008 14:19:20 +0000
Received: from hemma.cagruppen.se (www-data@localhost [127.0.0.1])
	by kluster1.contactor.se (8.13.8/8.13.8/Debian-3) with ESMTP id
	m8JEJFjU031247
	for <linux-mtd@lists.infradead.org>; Fri, 19 Sep 2008 16:19:15 +0200
Message-ID: <65109.20.138.20.231.1221833955.squirrel@hemma.cagruppen.se>
Date: Fri, 19 Sep 2008 16:19:15 +0200 (CEST)
Subject: JFFS2 and small sized flash chips
From: "Olof Backing" <olof.backing@contactor.se>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Reply-To: olof.backing@contactor.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!
I found this code segement in fs.c for JFFS2:

if (c->flash_size < 5*c->sector_size) {
	printk(KERN_ERR "jffs2: Too few erase blocks (%d)\n", c->flash_size / c->sector_size);
	return -EINVAL;
}

This code states that it needs 5 erase blocks, right? Consider this table:

struct flash_info {
	char		*name;
	u8		id;
	u16		jedec_id;
	unsigned	sector_size;
	unsigned	n_sectors;
};

static struct flash_info __devinitdata m25p_data [] = {
	/* REVISIT: fill in JEDEC ids, for parts that have them */
	{ "m25p05", 0x05, 0x2010, 32 * 1024, 2 },
	{ "m25p10", 0x10, 0x2011, 32 * 1024, 4 },
	{ "m25p20", 0x11, 0x2012, 64 * 1024, 4 },
	{ "m25p40", 0x12, 0x2013, 64 * 1024, 8 },
	{ "m25p80", 0x13, 0x0000, 64 * 1024, 16 },
	{ "m25p16", 0x14, 0x2015, 64 * 1024, 32 },
	{ "m25p32", 0x15, 0x2016, 64 * 1024, 64 },
	{ "m25p64", 0x16, 0x2017, 64 * 1024, 128 },
};

Where I'm currently being offered an m25p10 for use. I have two simple qestions:

* Am I safe to use JFFS2 on that chip?
* Or is the m25p40 with 8 sectors the smallest chip leaving 8-5=3 sectors for
(payload) data?

Regards,
Olof
-- 
Olof Backing
CAG Contactor AB                              Office: +46 (0)8 752 81 00
Finlandsgatan 14                             Mobile: +46 (0)70 995 98 99
SE-164 74  KISTA                                 Fax: +46 (0)8 752 05 30
