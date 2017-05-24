Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDSiX-0001ji-Iq
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 09:36:35 +0000
Received: by mail-lf0-x242.google.com with SMTP id 99so10381891lfu.2
 for <linux-mtd@lists.infradead.org>; Wed, 24 May 2017 02:36:12 -0700 (PDT)
Subject: Re: [PATCH V4 2/2] mtd: extract TRX parser out of bcm47xxpart into a
 separated module
To: Brian Norris <computersforpeace@gmail.com>
References: <20170227130633.4020-1-zajec5@gmail.com>
 <20170330123527.30181-1-zajec5@gmail.com>
 <20170330123527.30181-2-zajec5@gmail.com> <20170511183142.GH70297@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <a014b2a3-d116-0ac3-9984-ff38a3986c0f@gmail.com>
Date: Wed, 24 May 2017 11:36:08 +0200
MIME-Version: 1.0
In-Reply-To: <20170511183142.GH70297@google.com>
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

On 05/11/2017 08:31 PM, Brian Norris wrote:
> On Thu, Mar 30, 2017 at 02:35:27PM +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This makes TRX parsing code reusable with other platforms and parsers.
>>
>> Please note this patch doesn't really change anything in the existing
>> code, just moves it. There is still some place for improvement (e.g.
>> working on non-hacky method of checking rootfs format) but it's not
>> really a subject of this change.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> V2: A totally rebased & refreshed version.
>> ---
>>  drivers/mtd/Kconfig              |   4 ++
>>  drivers/mtd/Makefile             |   1 +
>>  drivers/mtd/bcm47xxpart.c        |  97 +------------------------------
>>  drivers/mtd/parsers/Kconfig      |   8 +++
>>  drivers/mtd/parsers/Makefile     |   1 +
>>  drivers/mtd/parsers/parser_trx.c | 119 +++++++++++++++++++++++++++++++++++++++
>>  6 files changed, 136 insertions(+), 94 deletions(-)
>>  create mode 100644 drivers/mtd/parsers/Kconfig
>>  create mode 100644 drivers/mtd/parsers/Makefile
>>  create mode 100644 drivers/mtd/parsers/parser_trx.c
>>
>> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
>> index e83a279f1217..5a2d71729b9a 100644
>> --- a/drivers/mtd/Kconfig
>> +++ b/drivers/mtd/Kconfig
>> @@ -155,6 +155,10 @@ config MTD_BCM47XX_PARTS
>>  	  This provides partitions parser for devices based on BCM47xx
>>  	  boards.
>>
>> +menu "Partition parsers"
>> +source "drivers/mtd/parsers/Kconfig"
>> +endmenu
>
> Is "parsers" a better name than "partitions"? I proposed moving
> everything to "partitions" previously.

I didn't see that or forgot about that, sorry. Since this module contains a
parser, I think "parsers" subdirectory may be a good choice.

Did you plan to put anything else than parsers in the "partitions" subdir?


>> +static const char *parser_trx_data_part_name(struct mtd_info *master,
>> +					     size_t offset)
>> +{
>> +	uint32_t buf;
>> +	size_t bytes_read;
>> +	int err;
>> +
>> +	err  = mtd_read(master, offset, sizeof(buf), &bytes_read,
>> +			(uint8_t *)&buf);
>> +	if (err && !mtd_is_bitflip(err)) {
>> +		pr_err("mtd_read error while parsing (offset: 0x%X): %d\n",
>> +			offset, err);
>> +		goto out_default;
>> +	}
>> +
>> +	if (buf == UBI_EC_MAGIC)
>> +		return "ubi";
>> +
>> +out_default:
>> +	return "rootfs";
>> +}
>> +
>> +static int parser_trx_parse(struct mtd_info *mtd,
>> +			    const struct mtd_partition **pparts,
>> +			    struct mtd_part_parser_data *data)
>
> So, this function doesn't do any validation that this is *actually* a
> TRX partition? I think it needs to do *some* level of validation if it's
> going to be an independent parser driver like this. See my comments on
> your other patch.
>
> (I also can't say that I understand the parent bcm47xxpart format/parser
> very well; it really looks like a collection of hacks, so maybe
> validation is impossible...)

It is possible, I'll add it!


>> +{
>> +	struct mtd_partition *parts;
>> +	struct mtd_partition *part;
>> +	struct trx_header trx;
>> +	size_t bytes_read;
>> +	uint8_t curr_part = 0, i = 0;
>> +	int err;
>> +
>> +	parts = kzalloc(sizeof(struct mtd_partition) * TRX_PARSER_MAX_PARTS,
>> +			GFP_KERNEL);
>> +	if (!parts)
>> +		return -ENOMEM;
>> +
>> +	err = mtd_read(mtd, 0, sizeof(trx), &bytes_read, (uint8_t *)&trx);
>> +	if (err) {
>> +		pr_err("MTD reading error: %d\n", err);
>> +		return err;
>
> You're leaking 'parts' here. (smatch noticed this.)

Right, thanks.


>> +	}
>> +
>> +	/* We have LZMA loader if offset[2] points to sth */
>
> Not that this is new, but I have no idea what "sth" is.

I'll improve this comment.
