Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L16pH-0000Sw-QZ
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 22:07:40 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1541068wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Nov 2008 14:07:38 -0800 (PST)
Message-ID: <8bd0f97a0811141407nde33c5tb90536c4983b53b4@mail.gmail.com>
Date: Fri, 14 Nov 2008 17:07:38 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH] mtd/physmap: use parse_mtd()
In-Reply-To: <20081114134116.972fce2f.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
	<1226533189-8492-1-git-send-email-vapier@gentoo.org>
	<20081114134116.972fce2f.akpm@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier@gentoo.org>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 14, 2008 at 16:41, Andrew Morton wrote:
> On Wed, 12 Nov 2008 18:39:48 -0500
> Mike Frysinger <vapier@gentoo.org> wrote:
>> Call parse_mtd() to handle partition/device registration rather than doing
>> it all ourself.
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>>  drivers/mtd/maps/physmap.c |   21 +--------------------
>>  1 files changed, 1 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
>> index 42d844f..9b87fd8 100644
>> --- a/drivers/mtd/maps/physmap.c
>> +++ b/drivers/mtd/maps/physmap.c
>> @@ -84,9 +84,6 @@ static int physmap_flash_remove(struct platform_device *dev)
>>  }
>>
>>  static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", NULL };
>> -#ifdef CONFIG_MTD_PARTITIONS
>> -static const char *part_probe_types[] = { "cmdlinepart", "RedBoot", NULL };
>> -#endif
>>
>>  static int physmap_flash_probe(struct platform_device *dev)
>>  {
>> @@ -170,23 +167,7 @@ static int physmap_flash_probe(struct platform_device *dev)
>>       if (err)
>>               goto err_out;
>>
>> -#ifdef CONFIG_MTD_PARTITIONS
>> -     err = parse_mtd_partitions(info->cmtd, part_probe_types, &info->parts, 0);
>> -     if (err > 0) {
>> -             add_mtd_partitions(info->cmtd, info->parts, err);
>> -             return 0;
>> -     }
>> -
>> -     if (physmap_data->nr_parts) {
>> -             printk(KERN_NOTICE "Using physmap partition information\n");
>> -             add_mtd_partitions(info->cmtd, physmap_data->parts,
>> -                                physmap_data->nr_parts);
>> -             return 0;
>> -     }
>> -#endif
>> -
>> -     add_mtd_device(info->cmtd);
>> -     return 0;
>> +     return parse_mtd(info->cmtd, NULL, physmap_data->parts, physmap_data->nr_parts);
>>
>>  err_out:
>>       physmap_flash_remove(dev);
>
> This didn't apply due to
> physmap-fix-leak-of-memory-returned-by-parse_mtd_partitions.patch.  I
> just smashed it in anyway.  Should I drop
> physmap-fix-leak-of-memory-returned-by-parse_mtd_partitions.patch
> instead?  Your changelog mentioned nothing about leak-fixing?

i'd like feedback from the main mtd guy(s) first, but if you're going
to queue things, it should be with v2 that i posted rather than this
set.

while mine doesnt explicitly mention leak fixing, it does fix it in
the process of moving code about.  so if you do add v2, you can safely
drop the leak fix.
-mike
