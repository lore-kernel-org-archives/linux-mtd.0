Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUHlz-0002gM-Jh
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 12:22:12 +0000
Received: by vws8 with SMTP id 8so368266vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 05:22:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110608101909.GG21174@pulham.picochip.com>
References: <20110607134429.GE21174@pulham.picochip.com>
	<1307461738-16811-1-git-send-email-dbaryshkov@gmail.com>
	<20110608101909.GG21174@pulham.picochip.com>
Date: Wed, 8 Jun 2011 16:22:08 +0400
Message-ID: <BANLkTikhuyQ3JN9EHLvoCtej6bMYtCZm8A@mail.gmail.com>
Subject: Re: [PATCH 01/44] mtd: add new API for handling MTD registration
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On 6/8/11, Jamie Iles <jamie@jamieiles.com> wrote:
> On Tue, Jun 07, 2011 at 07:48:58PM +0400, Dmitry Eremin-Solenikov wrote:
>> Lots (nearly all) mtd drivers contain nearly the similar code that
>> calls parse_mtd_partitions, provides some platform-default values, if
>> parsing fails, and registers  mtd device.
>>
>> This is an aim to provide single implementation of this scenario:
>> mtd_device_parse_register() which will handle all this parsing and
>> defaults.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> ---
>>  drivers/mtd/mtdcore.c   |   47
>> +++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/mtd.h |    5 +++++
>>  2 files changed, 52 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index c510aff..d538e0a 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -452,6 +452,53 @@ int mtd_device_register(struct mtd_info *master,
>>  EXPORT_SYMBOL_GPL(mtd_device_register);
>>
>>  /**
>> + * mtd_device_parse_register - register an MTD device.
>> + *
>> + * @mtd: the MTD device to register
>> + * @part_probe_types: the list of MTD partition probes to try
>> + * @origin: start address of MTD device. =0 unless you are sure you need
>> this.
>> + * @defparts: default partition information to register. Only valid if
>> + *		defnr_parts > 0
>> + * @defnr_parts: the number of partitions in defparts.  If zero then the
>> full
>> + *		MTD device is registered if no partition info is found
>> + *
>> + * Extract partition info and register MTD device (partitions or a whole
>> device)
>> + * It calls parse_mtd_partitions(), checks the result. If there were no
>> + * partitions found, it uses default info specified (via
>> defparts/defnr_parts)
>> + * and then registers either partitions, or (if no partitions were
>> + * found/specified) the whow MTD.
>
> s/whow/whole ?

Yup.

>> + */
>> +int mtd_device_parse_register(struct mtd_info *mtd,
>> +			      const char **part_probe_types,
>> +			      unsigned long origin,
>> +			      const struct mtd_partition *defparts,
>> +			      int defnr_parts)
>> +{
>> +	int err;
>> +	struct mtd_partition *parts;
>> +
>> +	err = parse_mtd_partitions(mtd, part_probe_types, &parts, origin);
>> +	if (err <= 0 && defnr_parts) {
>> +		parts = kmemdup(defparts, sizeof(*parts) * defnr_parts,
>> +				GFP_KERNEL);
>> +		if (!parts)
>> +			err = -ENOMEM;
>> +	}
>
> I see that some of your patches for drivers (e.g. plat_nand) remove the
> kfree() of the partitions but this doesn't appear to be handled anywhere
> else afaict.  I don't think this can be done in mtd_device_unregister()
> as it doesn't have the mtd_partition array so probably needs to remain
> in the driver.

It's handled by kfree right aftert add_mtd_partitions. No mtd partitions
information is exported out of mtd_device_parse_register(). In fact I'll have
to check if I can remove all <mtd/partitions.h> includes from drivers.

Anyway I'll post a V2 later after fixing issues identified by you and Artem.

-- 
With best wishes
Dmitry
