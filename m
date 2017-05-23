Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD4yP-0007uc-Q3
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 08:15:24 +0000
Received: by mail-lf0-x242.google.com with SMTP id q24so7305415lfb.1
 for <linux-mtd@lists.infradead.org>; Tue, 23 May 2017 01:15:01 -0700 (PDT)
Subject: Re: [PATCH V4 1/2] mtd: add support for partition parsers
To: Brian Norris <computersforpeace@gmail.com>
References: <20170227130633.4020-1-zajec5@gmail.com>
 <20170330123527.30181-1-zajec5@gmail.com> <20170511182126.GG70297@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <d2eb6a73-38c7-498a-b32d-cd75b5ae1cf2@gmail.com>
Date: Tue, 23 May 2017 10:14:57 +0200
MIME-Version: 1.0
In-Reply-To: <20170511182126.GG70297@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/11/2017 08:21 PM, Brian Norris wrote:
> On Thu, Mar 30, 2017 at 02:35:26PM +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Some devices have partitions that are kind of containers with extra
>> subpartitions / volumes instead of e.g. simple filesystem data. To
>> support such cases we need to first create normal flash partitions and
>> then take care of these special ones.
>>
>> It's very common case for home routers. Depending on the vendor there
>> are formats like TRX, Seama, TP-Link, WRGG & more. All of them are used
>> to embed few partitions into a single one / single firmware file.
>>
>> Ideally all vendors would use some well documented / standardized format
>> like UBI (and some probably start doing so), but there are still
>> countless devices on the market using these poor vendor specific
>> formats.
>>
>> This patch extends MTD subsystem by allowing to specify partition format
>> and trying to use a proper parser when needed. Supporting such poor
>> formats is highly unlikely to be the top priority so these changes try
>> to minimize maintenance cost to the minimum. It reuses existing code for
>> these new parsers and just adds a one property and one new function.
>>
>> This implementation requires setting partition format in a flash parser.
>> A proper change of bcm47xxpart will follow and in the future we will
>> hopefully also find a solution for doing it with ofpart
>> ("fixed-partitions").
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> Acked-by: Marek Vasut <marek.vasut@gmail.com>
>> ---
>> V2: A totally rebased & refreshed version.
>> V3: Don't mention uImage in commit message, it was a mistake.
>> V4: Document mtd_parse_part parameters
>> ---
>>  drivers/mtd/mtdpart.c          | 41 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/partitions.h |  7 +++++++
>>  2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
>> index ea5e5307f667..81e0b80237df 100644
>> --- a/drivers/mtd/mtdpart.c
>> +++ b/drivers/mtd/mtdpart.c
>> @@ -363,6 +363,45 @@ static inline void free_partition(struct mtd_part *p)
>>  	kfree(p);
>>  }
>>
>> +/**
>> + * mtd_parse_part - parse MTD partition with a matching parser
>
> The naming is a bit confusing to me. We already have partition parsers,
> but those are typically expected to apply to the whole device. Is this
> infrastructure the same thing? Or different?
>
> (To answer myself) this is nearly the same infrastructure, but it's just
> for adding *sub*partitions, not top-level partitions. Maybe it would be
> slightly less confusing if this was called mtd_parse_subpartitions() or
> mtd_parse_subparts()?

I'm not native English, but I think the name is accurate.

You use spectrum analyzer to analyze the spectrum. You'd probably call it
foo_analyze_spectum.
Or you use signal analyzer to analyze the signal. You'd probably call it
foo_analyze_signal.

This "mtd_parse_part" function uses parser to parse the partition. What it
*looks for* are subpartitions. Maybe I could extend current "parse MTD
partition with a matching parser" function documentation to be more clear.

The name you posted ("mtd_parse_subparts") suggests this function is
parsing (analyzing) subpartitions looking for something inside them. It's
not exactly the case.


If you prefer to have "subpart" or "subpartitions" phase in the function
name then I suggest to use "mtd_parse_for_subparts".

Let me know what do you think.


>> + *
>> + * @slave: part to be parsed for subpartitions
>> + * @format: partition format used to call a proper parser
>> + *
>> + * Some partitions use a specific format to describe contained subpartitions
>> + * (volumes). This function tries to use a proper parser for a given format and
>> + * registers found (sub)partitions.
>> + */
>> +static int mtd_parse_part(struct mtd_part *slave, const char *format)
>> +{
>> +	struct mtd_partitions parsed;
>> +	const char *probes[2];
>> +	int i;
>> +	int err;
>> +
>> +	probes[0] = format; /* Use parser with name matching the format */
>> +	probes[1] = NULL; /* End of parsers */
>> +	err = parse_mtd_partitions(&slave->mtd, probes, &parsed, NULL);
>> +	if (err)
>> +		return err;
>> +	else if (!parsed.nr_parts)
>> +		return -ENOENT;
>> +
>> +	for (i = 0; i < parsed.nr_parts; i++) {
>> +		struct mtd_partition *part;
>> +
>> +		part = (struct mtd_partition *)&parsed.parts[i];
>
> I'm not super-happy with the de-constification cast here. What if the
> partition array was somehow shared? (I don't expect that, but you're
> still potentially violating a caller's assumptions when you modify their
> 'const' data.)
>
>> +		part->offset += slave->offset;
>> +	}
>> +
>> +	err = add_mtd_partitions(slave->master, parsed.parts, parsed.nr_parts);
>
> Maybe a better way to handle that offset modification is to either pass
> in the offset to add_mtd_partitions() (e.g., as a simple parameter), or
> else adapt add_mtd_partitions() to handle receiving a non-master as the
> first parameter. (Then you just pass "slave", and add_mtd_partitions()
> handle it with something like "if (mtd_is_partition(...))".)
>
> Then I wonder how we want the parenting structure to work; should the
> sub-partition have the "master" as its parent, or the original
> partition? I thought Richard had mentioned some problems with the
> existing parenting structure (with CONFIG_MTD_PARTITIONED_MASTER)
> already, but I don't remember what those were.
>
> Also, if you're "parsing" the slave, but "adding" to the master, then
> the bounds-checking logic in add_mtd_partitions() won't properly apply,
> and you'll be able to create sub-partitions that extend beyond the
> slave, right? If so, then I think (after auditing add_mtd_partitions() a
> little closer, and possibly adjusting some of its comments) you might
> really just want to pass 'slave', not 'slave->master'.

I like this idea!


>> +
>> +	mtd_part_parser_cleanup(&parsed);
>> +
>> +	return err;
>> +}
>> +
>>  /*
>>   * This function unregisters and destroy all slave MTD objects which are
>>   * attached to the given master MTD object.
>> @@ -724,6 +763,8 @@ int add_mtd_partitions(struct mtd_info *master,
>>
>>  		add_mtd_device(&slave->mtd);
>>  		mtd_add_partition_attrs(slave);
>> +		if (parts[i].format)
>> +			mtd_parse_part(slave, parts[i].format);
>>
>>  		cur_offset = slave->offset + slave->mtd.size;
>>  	}
>> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
>> index 06df1e06b6e0..2787e76c030f 100644
>> --- a/include/linux/mtd/partitions.h
>> +++ b/include/linux/mtd/partitions.h
>> @@ -20,6 +20,12 @@
>>   *
>>   * For each partition, these fields are available:
>>   * name: string that will be used to label the partition's MTD device.
>> + * format: some partitions can be containers using specific format to describe
>> + *	embedded subpartitions / volumes. E.g. many home routers use "firmware"
>> + *	partition that contains at least kernel and rootfs. In such case an
>> + *	extra parser is needed that will detect these dynamic partitions and
>> + *	report them to the MTD subsystem. This property describes partition
>> + *	format and allows MTD core to call a proper parser.
>>   * size: the partition size; if defined as MTDPART_SIZ_FULL, the partition
>>   * 	will extend to the end of the master MTD device.
>>   * offset: absolute starting position within the master MTD device; if
>> @@ -38,6 +44,7 @@
>>
>>  struct mtd_partition {
>>  	const char *name;		/* identifier string */
>> +	const char *format;		/* partition format */
>
> Why only a single format? Can't this use the same definition as what's
> used already in, e.g., parse_mtd_partitions() and mtd_device_register()?
> i.e., a NULL-terminated string array? Not that the definition ("const
> char *const *types") is perfect (perhaps it could use a struct for
> encapsulation), but it would be trivially easy to expand this to support
> detecting more than one sub-partition type, no?

I think this would actually simplify mtd_parse_part a bit, I like it!

Thanks for the review Brian!
