Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8sin-0006HM-7r
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 18:21:55 +0000
Received: by mail-pf0-x244.google.com with SMTP id w69so4123843pfk.1
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 11:21:31 -0700 (PDT)
Date: Thu, 11 May 2017 11:21:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V4 1/2] mtd: add support for partition parsers
Message-ID: <20170511182126.GG70297@google.com>
References: <20170227130633.4020-1-zajec5@gmail.com>
 <20170330123527.30181-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170330123527.30181-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Mar 30, 2017 at 02:35:26PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Some devices have partitions that are kind of containers with extra
> subpartitions / volumes instead of e.g. simple filesystem data. To
> support such cases we need to first create normal flash partitions and
> then take care of these special ones.
> 
> It's very common case for home routers. Depending on the vendor there
> are formats like TRX, Seama, TP-Link, WRGG & more. All of them are used
> to embed few partitions into a single one / single firmware file.
> 
> Ideally all vendors would use some well documented / standardized format
> like UBI (and some probably start doing so), but there are still
> countless devices on the market using these poor vendor specific
> formats.
> 
> This patch extends MTD subsystem by allowing to specify partition format
> and trying to use a proper parser when needed. Supporting such poor
> formats is highly unlikely to be the top priority so these changes try
> to minimize maintenance cost to the minimum. It reuses existing code for
> these new parsers and just adds a one property and one new function.
> 
> This implementation requires setting partition format in a flash parser.
> A proper change of bcm47xxpart will follow and in the future we will
> hopefully also find a solution for doing it with ofpart
> ("fixed-partitions").
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Marek Vasut <marek.vasut@gmail.com>
> ---
> V2: A totally rebased & refreshed version.
> V3: Don't mention uImage in commit message, it was a mistake.
> V4: Document mtd_parse_part parameters
> ---
>  drivers/mtd/mtdpart.c          | 41 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/partitions.h |  7 +++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index ea5e5307f667..81e0b80237df 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -363,6 +363,45 @@ static inline void free_partition(struct mtd_part *p)
>  	kfree(p);
>  }
>  
> +/**
> + * mtd_parse_part - parse MTD partition with a matching parser

The naming is a bit confusing to me. We already have partition parsers,
but those are typically expected to apply to the whole device. Is this
infrastructure the same thing? Or different?

(To answer myself) this is nearly the same infrastructure, but it's just
for adding *sub*partitions, not top-level partitions. Maybe it would be
slightly less confusing if this was called mtd_parse_subpartitions() or
mtd_parse_subparts()?

> + *
> + * @slave: part to be parsed for subpartitions
> + * @format: partition format used to call a proper parser
> + *
> + * Some partitions use a specific format to describe contained subpartitions
> + * (volumes). This function tries to use a proper parser for a given format and
> + * registers found (sub)partitions.
> + */
> +static int mtd_parse_part(struct mtd_part *slave, const char *format)
> +{
> +	struct mtd_partitions parsed;
> +	const char *probes[2];
> +	int i;
> +	int err;
> +
> +	probes[0] = format; /* Use parser with name matching the format */
> +	probes[1] = NULL; /* End of parsers */
> +	err = parse_mtd_partitions(&slave->mtd, probes, &parsed, NULL);
> +	if (err)
> +		return err;
> +	else if (!parsed.nr_parts)
> +		return -ENOENT;
> +
> +	for (i = 0; i < parsed.nr_parts; i++) {
> +		struct mtd_partition *part;
> +
> +		part = (struct mtd_partition *)&parsed.parts[i];

I'm not super-happy with the de-constification cast here. What if the
partition array was somehow shared? (I don't expect that, but you're
still potentially violating a caller's assumptions when you modify their
'const' data.)

> +		part->offset += slave->offset;
> +	}
> +
> +	err = add_mtd_partitions(slave->master, parsed.parts, parsed.nr_parts);

Maybe a better way to handle that offset modification is to either pass
in the offset to add_mtd_partitions() (e.g., as a simple parameter), or
else adapt add_mtd_partitions() to handle receiving a non-master as the
first parameter. (Then you just pass "slave", and add_mtd_partitions()
handle it with something like "if (mtd_is_partition(...))".)

Then I wonder how we want the parenting structure to work; should the
sub-partition have the "master" as its parent, or the original
partition? I thought Richard had mentioned some problems with the
existing parenting structure (with CONFIG_MTD_PARTITIONED_MASTER)
already, but I don't remember what those were.

Also, if you're "parsing" the slave, but "adding" to the master, then
the bounds-checking logic in add_mtd_partitions() won't properly apply,
and you'll be able to create sub-partitions that extend beyond the
slave, right? If so, then I think (after auditing add_mtd_partitions() a
little closer, and possibly adjusting some of its comments) you might
really just want to pass 'slave', not 'slave->master'.

> +
> +	mtd_part_parser_cleanup(&parsed);
> +
> +	return err;
> +}
> +
>  /*
>   * This function unregisters and destroy all slave MTD objects which are
>   * attached to the given master MTD object.
> @@ -724,6 +763,8 @@ int add_mtd_partitions(struct mtd_info *master,
>  
>  		add_mtd_device(&slave->mtd);
>  		mtd_add_partition_attrs(slave);
> +		if (parts[i].format)
> +			mtd_parse_part(slave, parts[i].format);
>  
>  		cur_offset = slave->offset + slave->mtd.size;
>  	}
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
> index 06df1e06b6e0..2787e76c030f 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -20,6 +20,12 @@
>   *
>   * For each partition, these fields are available:
>   * name: string that will be used to label the partition's MTD device.
> + * format: some partitions can be containers using specific format to describe
> + *	embedded subpartitions / volumes. E.g. many home routers use "firmware"
> + *	partition that contains at least kernel and rootfs. In such case an
> + *	extra parser is needed that will detect these dynamic partitions and
> + *	report them to the MTD subsystem. This property describes partition
> + *	format and allows MTD core to call a proper parser.
>   * size: the partition size; if defined as MTDPART_SIZ_FULL, the partition
>   * 	will extend to the end of the master MTD device.
>   * offset: absolute starting position within the master MTD device; if
> @@ -38,6 +44,7 @@
>  
>  struct mtd_partition {
>  	const char *name;		/* identifier string */
> +	const char *format;		/* partition format */

Why only a single format? Can't this use the same definition as what's
used already in, e.g., parse_mtd_partitions() and mtd_device_register()?
i.e., a NULL-terminated string array? Not that the definition ("const
char *const *types") is perfect (perhaps it could use a struct for
encapsulation), but it would be trivially easy to expand this to support
detecting more than one sub-partition type, no?

But then I see that your TRX parser doesn't actually do any validation;
it assumes that if it's called, it must match. I dunno if that can be
fixed...

Or maybe I'm missing the direction you're wanting to go with this. If
so, please correct me. Do you expect that you're only going to call a
sub-parser when you know *exactly* which one to use? If we were to do as
you suggest in the commit message and extend to "fixed-partitions", then
it seems more likely you'll want to support a list of potential
sub-parsers, and you'll want to validate them (i.e., check for headers
and abort and/or try the next one if they don't match).

>  	uint64_t size;			/* partition size */
>  	uint64_t offset;		/* offset within the master MTD space */
>  	uint32_t mask_flags;		/* master MTD flags to mask out for this partition */

Brian
