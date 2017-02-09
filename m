Received: from 17.mo1.mail-out.ovh.net ([87.98.179.142])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbt6f-0007K5-43
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 18:06:11 +0000
Received: from player770.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id C100650BF8
 for <linux-mtd@lists.infradead.org>; Thu,  9 Feb 2017 19:05:39 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 09 Feb 2017 19:05:30 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH V2 1/2] mtd: bcm47xxpart: move TRX parsing code to
 separated function
In-Reply-To: <d42baa4c-1ab3-2a43-0adc-2ed10022d084@gmail.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
 <20170110221525.9216-1-zajec5@gmail.com>
 <d42baa4c-1ab3-2a43-0adc-2ed10022d084@gmail.com>
Message-ID: <cc2c7b030467be49a713574c4ac4422f@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2017-02-09 18:28, Marek Vasut wrote:
> On 01/10/2017 11:15 PM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>> 
>> This change simplifies main parsing loop logic a bit. In future it may
>> be useful for moving TRX support to separated module / parser (if we
>> implement support for them at some point).
>> Finally parsing TRX at the end puts us in a better position as we have
>> better flash layout knowledge. It may be useful e.g. if it appears 
>> there
>> is more than 1 TRX partition.
>> 
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> V2: Keep using bcm47xxpart_add_part in new parsing function
>> ---
>>  drivers/mtd/bcm47xxpart.c | 121 
>> ++++++++++++++++++++++++++++------------------
>>  1 file changed, 74 insertions(+), 47 deletions(-)
>> 
>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>> index 283ff7e..1093025 100644
>> --- a/drivers/mtd/bcm47xxpart.c
>> +++ b/drivers/mtd/bcm47xxpart.c
>> @@ -83,6 +83,67 @@ static const char 
>> *bcm47xxpart_trx_data_part_name(struct mtd_info *master,
>>  	return "rootfs";
>>  }
>> 
>> +static int bcm47xxpart_parse_trx(struct mtd_info *master,
>> +				 struct mtd_partition *trx,
>> +				 struct mtd_partition *parts,
>> +				 size_t parts_len)
>> +{
>> +	struct trx_header header;
>> +	size_t bytes_read;
>> +	int curr_part = 0;
>> +	int i, err;
>> +
>> +	if (parts_len < 3) {
>> +		pr_warn("No enough space to add TRX partitions!\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	err = mtd_read(master, trx->offset, sizeof(header), &bytes_read,
>> +		       (uint8_t *)&header);
>> +	if (err && !mtd_is_bitflip(err)) {
>> +		pr_err("mtd_read error while reading TRX header: %d\n", err);
> 
> Minor nit -- Can we make this dev_err() ?

The problem is parsers receive struct mtd_info (as an argument) with has 
empty
dev. I just tried
dev_info(&master->dev, "TEST TEST TEST :)\n");
and got this:
[    0.491576]  (null): TEST TEST TEST :)

I guess that's the reason why parse_mtd_partitions and 
mtd_device_parse_register
also use pr_* functions.

So this should be improved at mtd core subsystem first, then we can use 
it in
drivers as well.
