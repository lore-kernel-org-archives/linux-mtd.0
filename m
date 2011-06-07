Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTxM6-0004VM-OT
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 14:34:07 +0000
Received: by wwb39 with SMTP id 39so3902409wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 07:34:05 -0700 (PDT)
Message-ID: <4DEE36D6.2070009@gmail.com>
Date: Tue, 07 Jun 2011 18:33:58 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
MIME-Version: 1.0
To: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH 01/44] mtd: add new API for handling MTD registration
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-2-git-send-email-dbaryshkov@gmail.com>
	<20110607134429.GE21174@pulham.picochip.com>
In-Reply-To: <20110607134429.GE21174@pulham.picochip.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07.06.2011 17:44, Jamie Iles wrote:
> Hi Dmitry,
>
> This sounds like a good idea.  Nitpick inline.
>
> Jamie
>
> On Tue, Jun 07, 2011 at 05:36:00PM +0400, Dmitry Eremin-Solenikov wrote:
>> Lots (nearly all) mtd drivers contain nearly the similar code that
>> calls parse_mtd_partitions, provides some platform-default values, if
>> parsing fails, and registers  mtd device.
>>
>> This is an aim to provide single implementation of this scenario:
>> mtd_device_parse_register() which will handle all this parsing and
>> defaults.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov<dbaryshkov@gmail.com>
>> ---
>>   drivers/mtd/mtdcore.c   |   30 ++++++++++++++++++++++++++++++
>>   include/linux/mtd/mtd.h |    5 +++++
>>   2 files changed, 35 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index c510aff..ac871ad 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -451,6 +451,36 @@ int mtd_device_register(struct mtd_info *master,
>>   }
>>   EXPORT_SYMBOL_GPL(mtd_device_register);
>>
>> +int mtd_device_parse_register(struct mtd_info *mtd,
>> +			      const char **part_probe_types,
>> +			      unsigned long origin,
>> +			      const struct mtd_partition *defparts,
>> +			      int defnr_parts)
>> +{
>> +	int err;
>> +	struct mtd_partition *parts;
>> +
>> +	err = parse_mtd_partitions(mtd, part_probe_types,&parts, origin);
>> +	if (err<= 0&&  defnr_parts) {
>> +		unsigned long size = sizeof(*parts) * defnr_parts;
>> +		err = defnr_parts;
>> +		parts = kzalloc(size, GFP_KERNEL);
>> +		memcpy(parts, defparts, size);
>
> Shouldn't this check the return of kzalloc()?  How about using kmemdup()
> instead of kzalloc() + memcpy()?

Good catch! Thank you.

>  Also some kernel-doc to describe the search order would be nice.

Search order is mainly detailed either by defaults specified in 
mtdpart.c or by probe types which user specifies.

-- 
With best wishes
Dmitry
