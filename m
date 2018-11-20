Received: from 6.mo2.mail-out.ovh.net ([87.98.165.38])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP2Zm-0000GH-Pf
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:44:12 +0000
Received: from player755.ha.ovh.net (unknown [10.109.146.86])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id A07BA17451A
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2018 10:43:50 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 20 Nov 2018 10:43:38 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: keep original flags for every struct mtd_info
In-Reply-To: <20181120101303.762ab73e@bbrezillon>
References: <20181120085546.8336-1-zajec5@gmail.com>
 <20181120101303.762ab73e@bbrezillon>
Message-ID: <6ceccac8c2e82fe74fabbc33a3615e5d@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-11-20 10:13, Boris Brezillon wrote:
> On Tue, 20 Nov 2018 09:55:45 +0100
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> From: Rafał Miłecki <rafal@milecki.pl>
>> 
>> When allocating a new partition mtd subsystem runs internal tests in 
>> the
>> allocate_partition(). They may result in modifying specified flags 
>> (e.g.
>> dropping some /features/ like write access).
>> 
>> Those constraints don't have to be necessary true for subpartitions. 
>> It
>> may happen parent partition isn't block aligned (effectively disabling
>> write access) while subpartition may fit blocks nicely. In such case 
>> all
>> checks should be run again (starting with original flags value).
>> 
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>  drivers/mtd/mtdcore.c   | 2 ++
>>  drivers/mtd/mtdpart.c   | 3 ++-
>>  include/linux/mtd/mtd.h | 1 +
>>  3 files changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index 97ac219c082e..2d24701255e5 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -665,6 +665,8 @@ static void mtd_set_dev_defaults(struct mtd_info 
>> *mtd)
>>  	} else {
>>  		pr_debug("mtd device won't show a device symlink in sysfs\n");
>>  	}
>> +
>> +	mtd->orig_flags = mtd->flags;
>>  }
>> 
>>  /**
>> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
>> index 99c460facd5e..2b6e53af47da 100644
>> --- a/drivers/mtd/mtdpart.c
>> +++ b/drivers/mtd/mtdpart.c
>> @@ -346,7 +346,8 @@ static struct mtd_part *allocate_partition(struct 
>> mtd_info *parent,
>> 
>>  	/* set up the MTD object for this partition */
>>  	slave->mtd.type = parent->type;
>> -	slave->mtd.flags = parent->flags & ~part->mask_flags;
>> +	slave->mtd.flags = parent->orig_flags & ~part->mask_flags;
>> +	slave->mtd.orig_flags = slave->mtd.flags;
>>  	slave->mtd.size = part->size;
>>  	slave->mtd.writesize = parent->writesize;
>>  	slave->mtd.writebufsize = parent->writebufsize;
>> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
>> index cd0be91bdefa..b491a08e87e5 100644
>> --- a/include/linux/mtd/mtd.h
>> +++ b/include/linux/mtd/mtd.h
>> @@ -207,6 +207,7 @@ struct mtd_debug_info {
>>  struct mtd_info {
>>  	u_char type;
>>  	uint32_t flags;
>> +	uint32_t orig_flags; /* Flags as before running mtd checks */
> 
> Hm, I'm not a big fan of this orig_flags field. I'd prefer to have
> Miquel's patch series [1] ported to Linus, so that master can be
> retrieved with a simple loop:
> 
> struct mtd_info *mtd_get_master(struct mtd_info *mtd)
> {
> 	struct mtd_info *master = mtd;
> 
> 	while (master->parent)
> 		master = master->parent;
> }
> 
> [1]https://www.mail-archive.com/u-boot@lists.denx.de/msg297465.html

Retrieving master is not a big deal, but I don't think it's going to
help. Just because master is writeable doesn't mean every subpartition
should be.

Let me try to provide some example covering both cases.

. "spi0.0" orig_flags:MTD_WRITEABLE flags:MTD_WRITEABLE
├── "boot" orig_flags:0 flags:0
├── "firmware" orig_flags:MTD_WRITEABLE flags:0 (misaligned partition)
     ├── "header" flags: ? (misaligned partition)
     ├── "rootfs" flags: ? (aligned partition)
     └── "kernel" flags: ? (aligned partition)
└── "calibration" flags:0
     ├── "wifi0" flags: ?
     └── "wifi1" flags: ?

My patch is intended to fix "rootfs" and "kernel" not having
MTD_WRITEABLE flag. The reason for lacking flag is mtd subsystem
(correctly) dropping it in the allocate_partition() due to misalignment.

If we start checking flags of the master however that will result in
"wifi0" and "wifi1" receiving MTD_WRITEABLE. The intention of
"calibration"  was to make all calibration data (unit specific thing) RO
only.

I don't have any better idea than "orig_flags" that would help solving
this problem :(
