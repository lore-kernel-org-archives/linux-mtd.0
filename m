Received: from mx.novero.com ([212.23.138.198])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNjtg-00061z-95
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 16:21:45 +0000
Received: from ablexc01.internal.novero.com ([10.121.42.121]:53357)
 by mx.novero.com with esmtps (TLSv1:DES-CBC3-SHA:168)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <Sven.Eisenberg@novero.com>)
 id 1aNjtG-0003c5-2w
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 17:21:18 +0100
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Sven Eisenberg <sven.eisenberg@novero.com>
Subject: Migrating to UBI Volumes, keeping some data
Message-ID: <56A64B94.7000808@novero.com>
Date: Mon, 25 Jan 2016 17:21:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all

I'm facing a common mistake with UBI, we have a system that has nand
partitioning on the MTD layer.

Partitions:
mtd1: root
mtd2: dynamic_data
mtd3: other_data
mtd4: static_data

We have learned the lesson with reduced wear leveling and degraded bad
block pools. Now i plan to migrate also systems in the field to a UBI
volume partitioning concept.

The challenge for me is the data migration of the "static_data"
partition, it is quite big and re-writing the data in the field is not
an option.
Erasing and re-writing the other partitions is not a problem in my
situation. We run the kernel from NOR and have initial data to start from.

After thinking about it i have the following theory of how a migration
could work and I'd like to ask if you also think this is a possible way
or if it is a stupid idea maybe:

Target: migrate, but keep the volume in mtd4.
The system is launched with the old mtd partitioning scheme, and does a
flash_eraseall on mtd1, mtd2, mtd3 but not on mtd4.
Then we reboot with only a single full size MTD configured in the kernel.
Will the kernel UBI scan code be able to merge the erased blocks and the
existing blocks from mtd4 into a consistent UBI device?
The erased blocks should be initialized with the UBI headers, so we can
define the remaining UBI volumes in the next step and initialize the
system with data.

I'm aware that by flash_eraseall the erase counters will be lost in mtd1-3.

The kernel level is ~3.10.y.

Thanks and regards,
Sven Eisenberg

-- 
Sven Eisenberg

Novero gmbh | Meesmannstr. 103 | 44807 Bochum  | Germany

Novero GmbH | Parsevalstr. 7a | 40468 Düsseldorf | Germany | Amtsgericht Düsseldorf | HRB 58283 | Umsatzsteueridentifikationsnummer: DE 814973142 | Geschäftsführer: Freddie Geier
