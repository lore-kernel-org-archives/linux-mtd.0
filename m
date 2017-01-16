Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTBez-00014C-Bw
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 18:05:42 +0000
Received: by mail-lf0-x243.google.com with SMTP id h65so13579302lfi.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 10:05:18 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: add dt support for Everspin MRAMs
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20170116133503.13887-1-u.kleine-koenig@pengutronix.de>
 <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Jagan Teki <jagan@openedev.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <261f6372-ef71-8e6c-9b13-13e73140bb87@gmail.com>
Date: Mon, 16 Jan 2017 17:08:02 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6ryLDwr0S=e-uUt+ZGcY8mNDnUtBPg_RmqtSVBziJkZd5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/16/2017 02:55 PM, Rafał Miłecki wrote:
> On 16 January 2017 at 14:35, Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>> The MR25 family doesn't support JEDEC, so they need explicit mentioning
>> in the list of supported spi IDs. This makes it possible to add these
>> using for example:
>>
>>         compatible = "everspin,mr25h40";
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>> Hello,
>>
>> independent of the decision if -nonjedec is ok for m25p, this is needed
>> to make Everspin's MRAMs work.
>>
>> Best regards
>> Uwe
>>
>>  drivers/mtd/devices/m25p80.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -305,6 +305,11 @@ static const struct spi_device_id m25p_ids[] = {
>>         {"m25p40-nonjedec"},    {"m25p80-nonjedec"},    {"m25p16-nonjedec"},
>>         {"m25p32-nonjedec"},    {"m25p64-nonjedec"},    {"m25p128-nonjedec"},
>>
>> +       /* Everspin MRAMs without JEDEC support */
>> +       { "mr25h256" }, /* 256 kib, 40 MHz */
> 
> A trivial thing: I think it should be Kib
> https://en.wikipedia.org/wiki/Binary_prefix
> 
Except for that, it looks good IMO.

-- 
Best regards,
Marek Vasut
