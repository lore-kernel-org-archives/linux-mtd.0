Received: from mail-yw0-x233.google.com ([2607:f8b0:4002:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfO7U-0005ot-LG
 for linux-mtd@lists.infradead.org; Sun, 19 Feb 2017 09:49:32 +0000
Received: by mail-yw0-x233.google.com with SMTP id v200so39269972ywc.3
 for <linux-mtd@lists.infradead.org>; Sun, 19 Feb 2017 01:49:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e5fb0bdf-0956-e364-14fb-c255471f371d@denx.de>
References: <1487086368-4118-1-git-send-email-kdasu.kdev@gmail.com>
 <1487086368-4118-3-git-send-email-kdasu.kdev@gmail.com>
 <e5fb0bdf-0956-e364-14fb-c255471f371d@denx.de>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Sun, 19 Feb 2017 04:48:26 -0500
Message-ID: <CAKekbesoBnEs0evM8OjhTEk+s2wREd6BgStkvTYdX68y_yQULA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: m25p80: Added pm ops support
To: Marek Vasut <marex@denx.de>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-spi@vger.kernel.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 18, 2017 at 5:31 PM, Marek Vasut <marex@denx.de> wrote:
> On 02/14/2017 04:32 PM, Kamal Dasu wrote:
>> Added power management ops for resume to be able to resan spi-nor
>
> rescan ... but you're not really rescanning it, are you ? You're just
> reconfiguring the pre-suspend parameters .
>
>> device and set it to right transfer modes in its probed state after
>> poweron. Some SoC implementations might  power down the spi-nor flash
>> and loose its initial settings on suspend. A resume should retore the
>
> restore ...
>
>> part to its probed state.
>>

Will fix typos.

>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>>  drivers/mtd/devices/m25p80.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index c4df3b1..3ab30b2 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -324,10 +324,21 @@ static int m25p_remove(struct spi_device *spi)
>>  };
>>  MODULE_DEVICE_TABLE(of, m25p_of_table);
>>
>> +#ifdef CONFIG_PM_SLEEP
>> +static int m25p_resume(struct device *dev)
>> +{
>> +     struct m25p *flash = dev_get_drvdata(dev);
>> +
>> +     return spi_nor_init(&flash->spi_nor);
>> +}
>> +#endif
>> +static SIMPLE_DEV_PM_OPS(m25p_pm_ops, NULL, m25p_resume);
>> +
>>  static struct spi_driver m25p80_driver = {
>>       .driver = {
>>               .name   = "m25p80",
>>               .of_match_table = m25p_of_table,
>> +             .pm     = &m25p_pm_ops,
>>       },
>>       .id_table       = m25p_ids,
>>       .probe  = m25p_probe,
>>
>
>
> --
> Best regards,
> Marek Vasut

Thanks
Kamal
