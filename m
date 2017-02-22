Received: from mail-yw0-x22d.google.com ([2607:f8b0:4002:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgeRZ-00082P-06
 for linux-mtd@lists.infradead.org; Wed, 22 Feb 2017 21:27:27 +0000
Received: by mail-yw0-x22d.google.com with SMTP id l19so7982082ywc.2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Feb 2017 13:27:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a414f2cc-7e3d-f25d-cfc7-cab1d259a01e@wedev4u.fr>
References: <1487791173-22159-1-git-send-email-kdasu.kdev@gmail.com>
 <1487791173-22159-3-git-send-email-kdasu.kdev@gmail.com>
 <a414f2cc-7e3d-f25d-cfc7-cab1d259a01e@wedev4u.fr>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Wed, 22 Feb 2017 16:26:22 -0500
Message-ID: <CAKekbes3haHZ1BSwt9_-yxwp9igyxZhGUyaTcLg0_+td5e5K3Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mtd: m25p80: Added pm ops support
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, linux-spi@vger.kernel.org,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>,
 Mark Brown <broonie@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 22, 2017 at 3:38 PM, Cyrille Pitchen
<cyrille.pitchen@wedev4u.fr> wrote:
> Hi Kamal,
>
> Le 22/02/2017 =C3=A0 20:19, Kamal Dasu a =C3=A9crit :
>> Added power management ops for resume to be able to reinitialize
>> spi-nor device and set it to right transfer mode in its pre-suspend
>> state. Some SoC implementations might power down the spi-nor flash
>> and loose its initial settings on suspend. A resume should restore
>> part settings to its original pre-suspend state.
>>
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
>> +     struct m25p *flash =3D dev_get_drvdata(dev);
>> +
>> +     return spi_nor_init(&flash->spi_nor);
>> +}
>> +#endif
>> +static SIMPLE_DEV_PM_OPS(m25p_pm_ops, NULL, m25p_resume);
>> +
>>  static struct spi_driver m25p80_driver =3D {
>>       .driver =3D {
>>               .name   =3D "m25p80",
>>               .of_match_table =3D m25p_of_table,
>> +             .pm     =3D &m25p_pm_ops,
>>       },
>>       .id_table       =3D m25p_ids,
>>       .probe  =3D m25p_probe,
>>
>
> I'm still studying the runtime_pm documentation and source code to
> understand how the power management works in the Linux kernel.
> I didn't finish but for what I have understood until now, I think there
> is an issue.
>
> Here you add suspend/resume handlers on the SPI device. So the SPI
> sub-system is aware of the power state of the SPI flash memory, that
> fine. However what about the MTD sub-system? I don't see any
> synchronization between the SPI device and the MTD device. Hence I guess
> the MTD sub-system is not aware of the actual power state of the
> hardware memory. So I think that mtd->_read() or mtd->_write() handlers
> could be called from some mtd driver when the SPI device has already
> been suspended. For instance, let's image the root file-system is
> mounted from a ubifs stored a SPI NOR flash: what if the kernel tries to
> perform some file access when the SPI device has already been suspended?
>

However in the current stack based on spi master bus driver and m25p80
flash device the spi-bcm-qspi does call the spi_master_suspend(),
which stops the queue so there should not be any activity.

spi-nor may implement something on the lines of the nand_base where it
simply sets a state and locks the device in a certain state using
nand_get_device() call.  But does not actually do any thing with the
mtd structures as far as I can tell.

mtd->_suspend =3D spi_nor_suspend;
mtd->_resume =3D spi_nor_resume;
mtd->_reboot =3D spi_nor_shutdown;

I am not sure what spi_nor_suspend() or spi_nor_shutdown() will
actually do. As mtd layer is just an abstraction in memory and does
not change state. But spi-nor can be made aware of the states by
maintaining it in the nor structure. Both spi and m25p80 and the
controller driver are aware.

> The 'struct m25p' instance makes the link between the SPI device the the
> spi_nor->mtd device. Sync could be done using this object.
>
> That why I think this patch is currently incomplete as the
> synchronization of the power states of both the SPI and MTD devices is
> missing.
>
> I think the feature you're trying to implement is interesting but some
> rework seems to needed. I can't tell you more for now since, as I said,
> I'm still lacking strong knowledge about the runtime_pm framework.
>

Ideally spi-nor driver should handle the mtd ops I thought fro the framewor=
k.

> Best regards,
>
> Cyrille

Thanks
Kamal
