Received: from exsmtp03.microchip.com ([198.175.253.49]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTR46-0006PZ-Jq
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 10:32:41 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: add dt support for Everspin MRAMs
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>, Jagan Teki
 <jagan@openedev.com>, Marek Vasut <marex@denx.de>
References: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
 <20170116210039.25267-1-u.kleine-koenig@pengutronix.de>
 <aa0fc197-c320-6d1c-a892-6e272e16366a@atmel.com>
CC: <linux-mtd@lists.infradead.org>, <kernel@pengutronix.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
Date: Tue, 17 Jan 2017 11:32:11 +0100
MIME-Version: 1.0
In-Reply-To: <aa0fc197-c320-6d1c-a892-6e272e16366a@atmel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 17/01/2017 à 10:48, Cyrille Pitchen a écrit :
> Hi,
> 
> Le 16/01/2017 à 22:00, Uwe Kleine-König a écrit :
>> The MR25 family doesn't support JEDEC, so they need explicit mentioning
>> in the list of supported spi IDs. This makes it possible to add these
>> using for example:
>>
>> 	compatible = "everspin,mr25h40";
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>> Changes since (implicit) v1:
>>  - use Kib instead of kib
>>
>>  drivers/mtd/devices/m25p80.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 9cf7fcd28034..aa50bd96de3a 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -305,6 +305,11 @@ static const struct spi_device_id m25p_ids[] = {
>>  	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
>>  	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
>>  
>> +	/* Everspin MRAMs */
>> +	{ "mr25h256" }, /* 256 Kib, 40 MHz */
> 
> There is already a "mr25h256" entry in the m25p_ids[] array.
> It's a good idea to regroup everspin memories but it might be better to
> reuse the existing entry.
> 
> The previous entry is between "at25df321a", ... and "mx25l4005a" so it
> doesn't appear in your patch.
> 
>> +	{ "mr25h10" },  /*   1 Mib, 40 MHz */
>> +	{ "mr25h40" },  /*   4 Mib, 40 MHz */
>> +

Also if you add new entries, I think you should update the "Supported chip
names" section in Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt:

"mr25h256" is already there.

Best regards,

Cyrille


>>  	{ },
>>  };
>>  MODULE_DEVICE_TABLE(spi, m25p_ids);
>>
> 
