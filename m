Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD5mQ-0000WB-0C
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 09:07:04 +0000
Received: by mail-lf0-x244.google.com with SMTP id q24so7406913lfb.1
 for <linux-mtd@lists.infradead.org>; Tue, 23 May 2017 02:06:41 -0700 (PDT)
Subject: Re: [PATCH V4 1/2] mtd: add support for partition parsers
To: Brian Norris <computersforpeace@gmail.com>
References: <20170227130633.4020-1-zajec5@gmail.com>
 <20170330123527.30181-1-zajec5@gmail.com> <20170511182126.GG70297@google.com>
 <d2eb6a73-38c7-498a-b32d-cd75b5ae1cf2@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <12299bb6-a34d-5b84-616d-d1f4d067c8dd@gmail.com>
Date: Tue, 23 May 2017 11:06:37 +0200
MIME-Version: 1.0
In-Reply-To: <d2eb6a73-38c7-498a-b32d-cd75b5ae1cf2@gmail.com>
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

On 05/23/2017 10:14 AM, Rafał Miłecki wrote:
> On 05/11/2017 08:21 PM, Brian Norris wrote:
>> On Thu, Mar 30, 2017 at 02:35:26PM +0200, Rafał Miłecki wrote:
>>> + *
>>> + * @slave: part to be parsed for subpartitions
>>> + * @format: partition format used to call a proper parser
>>> + *
>>> + * Some partitions use a specific format to describe contained subpartitions
>>> + * (volumes). This function tries to use a proper parser for a given format and
>>> + * registers found (sub)partitions.
>>> + */
>>> +static int mtd_parse_part(struct mtd_part *slave, const char *format)
>>> +{
>>> +    struct mtd_partitions parsed;
>>> +    const char *probes[2];
>>> +    int i;
>>> +    int err;
>>> +
>>> +    probes[0] = format; /* Use parser with name matching the format */
>>> +    probes[1] = NULL; /* End of parsers */
>>> +    err = parse_mtd_partitions(&slave->mtd, probes, &parsed, NULL);
>>> +    if (err)
>>> +        return err;
>>> +    else if (!parsed.nr_parts)
>>> +        return -ENOENT;
>>> +
>>> +    for (i = 0; i < parsed.nr_parts; i++) {
>>> +        struct mtd_partition *part;
>>> +
>>> +        part = (struct mtd_partition *)&parsed.parts[i];
>>
>> I'm not super-happy with the de-constification cast here. What if the
>> partition array was somehow shared? (I don't expect that, but you're
>> still potentially violating a caller's assumptions when you modify their
>> 'const' data.)
>>
>>> +        part->offset += slave->offset;
>>> +    }
>>> +
>>> +    err = add_mtd_partitions(slave->master, parsed.parts, parsed.nr_parts);
>>
>> Maybe a better way to handle that offset modification is to either pass
>> in the offset to add_mtd_partitions() (e.g., as a simple parameter), or
>> else adapt add_mtd_partitions() to handle receiving a non-master as the
>> first parameter. (Then you just pass "slave", and add_mtd_partitions()
>> handle it with something like "if (mtd_is_partition(...))".)
>>
>> Then I wonder how we want the parenting structure to work; should the
>> sub-partition have the "master" as its parent, or the original
>> partition? I thought Richard had mentioned some problems with the
>> existing parenting structure (with CONFIG_MTD_PARTITIONED_MASTER)
>> already, but I don't remember what those were.
>>
>> Also, if you're "parsing" the slave, but "adding" to the master, then
>> the bounds-checking logic in add_mtd_partitions() won't properly apply,
>> and you'll be able to create sub-partitions that extend beyond the
>> slave, right? If so, then I think (after auditing add_mtd_partitions() a
>> little closer, and possibly adjusting some of its comments) you might
>> really just want to pass 'slave', not 'slave->master'.
>
> I like this idea!

Oh, it's not that simple. Passing struct mtd_part to the add_mtd_partitions
is simple, but it's getting complex afterwards.

1) We can't simply adjust offset in add_mtd_partitions as we are still
    dealing with const struct mtd_partition (note: const).
2) We can't adjust offset after calling allocate_partition as this would
    bypass some validation happening in the allocate_partition.
3) Passing an extra argume to the allocate_partition is a bad idea as it
    already receives uint64_t cur_offset - this would be confusing.
