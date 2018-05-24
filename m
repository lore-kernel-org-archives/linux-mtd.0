Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLjAK-0002aq-AV
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 05:51:57 +0000
Received: by mail-wr0-x243.google.com with SMTP id a15-v6so726231wrm.0
 for <linux-mtd@lists.infradead.org>; Wed, 23 May 2018 22:51:45 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: partitions: use DT info for parsing partitions
 with specified type
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Jonas Gorski <jonas.gorski@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20180523171448.26234-1-zajec5@gmail.com>
 <20180523171448.26234-2-zajec5@gmail.com>
 <20180523202408.632edefa@bbrezillon>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <0204012f-71b6-70ef-860d-fcce3abdd302@gmail.com>
Date: Thu, 24 May 2018 07:50:10 +0200
MIME-Version: 1.0
In-Reply-To: <20180523202408.632edefa@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23.05.2018 20:24, Boris Brezillon wrote:
> On Wed, 23 May 2018 19:14:48 +0200
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This supports nested partitions in a DT. If selected partition has a
>> "compatible" property specified it will be parsed looking for
>> subpartitions.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   drivers/mtd/mtdpart.c | 33 +++++++++++++--------------------
>>   1 file changed, 13 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
>> index f8d3a015cdad..52e2cb35fc79 100644
>> --- a/drivers/mtd/mtdpart.c
>> +++ b/drivers/mtd/mtdpart.c
>> @@ -322,22 +322,6 @@ static inline void free_partition(struct mtd_part *p)
>>   	kfree(p);
>>   }
>>   
>> -/**
>> - * mtd_parse_part - parse MTD partition looking for subpartitions
>> - *
>> - * @slave: part that is supposed to be a container and should be parsed
>> - * @types: NULL-terminated array with names of partition parsers to try
>> - *
>> - * Some partitions are kind of containers with extra subpartitions (volumes).
>> - * There can be various formats of such containers. This function tries to use
>> - * specified parsers to analyze given partition and registers found
>> - * subpartitions on success.
>> - */
>> -static int mtd_parse_part(struct mtd_part *slave, const char *const *types)
>> -{
>> -	return parse_mtd_partitions(&slave->mtd, types, NULL);
>> -}
>> -
>>   static struct mtd_part *allocate_partition(struct mtd_info *parent,
>>   			const struct mtd_partition *part, int partno,
>>   			uint64_t cur_offset)
>> @@ -735,8 +719,8 @@ int add_mtd_partitions(struct mtd_info *master,
>>   
>>   		add_mtd_device(&slave->mtd);
>>   		mtd_add_partition_attrs(slave);
>> -		if (parts[i].types)
>> -			mtd_parse_part(slave, parts[i].types);
>> +		/* Look for subpartitions */
>> +		parse_mtd_partitions(&slave->mtd, parts[i].types, NULL);
>>   
>>   		cur_offset = slave->offset + slave->mtd.size;
>>   	}
>> @@ -812,6 +796,12 @@ static const char * const default_mtd_part_types[] = {
>>   	NULL
>>   };
>>   
>> +/* Check DT only when looking for subpartitions. */
>> +static const char * const default_subpartition_types[] = {
>> +	"ofpart",
>> +	NULL
>> +};
>> +
>>   static int mtd_part_do_parse(struct mtd_part_parser *parser,
>>   			     struct mtd_info *master,
>>   			     struct mtd_partitions *pparts,
>> @@ -882,7 +872,9 @@ static int mtd_part_of_parse(struct mtd_info *master,
>>   	const char *fixed = "fixed-partitions";
>>   	int ret, err = 0;
>>   
>> -	np = of_get_child_by_name(mtd_get_of_node(master), "partitions");
>> +	np = mtd_get_of_node(master);
>> +	if (!mtd_is_partition(master))
>> +		np = of_get_child_by_name(np, "partitions");
>>   	of_property_for_each_string(np, "compatible", prop, compat) {
>>   		parser = mtd_part_get_compatible_parser(compat);
>>   		if (!parser)
>> @@ -945,7 +937,8 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
>>   	int ret, err = 0;
>>   
>>   	if (!types)
>> -		types = default_mtd_part_types;
>> +		types = mtd_is_partition(master) ? default_subpartition_types :
>> +			default_mtd_part_types;
> 
> Hm, that means the subparts inherit the parser types from their parent
> if types != NULL? Is that really what we want? And if that's what we
> want, why don't we do the same for types == NULL?

No, unless I'm missing something. In add_mtd_partitions() there is now
a following call:
parse_mtd_partitions(&slave->mtd, parts[i].types, NULL);

In most cases parts[i].types is NULL, unless you're using some
exceptional driver (like bcm47xxpart) which sets "types".

So for each partition parse_mtd_partitions() will be called with "types"
argument almost always set to NULL (no inheriting). That will result in
picking default_subpartition_types.
