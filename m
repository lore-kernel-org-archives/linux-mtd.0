Received: from mail-qt0-f193.google.com ([209.85.216.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cap64-0007VE-B3
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2017 19:37:10 +0000
Received: by mail-qt0-f193.google.com with SMTP id n13so16322141qtc.0
 for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2017 11:36:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <9108d13d-0f06-172f-5e8d-91ff80fdd510@atmel.com>
References: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
 <1486164676-12912-5-git-send-email-kdasu.kdev@gmail.com>
 <9108d13d-0f06-172f-5e8d-91ff80fdd510@atmel.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 6 Feb 2017 14:35:46 -0500
Message-ID: <CAC=U0a3V9fPnee6yYPw6CarFiKnwFw1aA-tm=+K4RQSm_bgVSg@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] mtd: m25p80: Check if the spi flash device has pm
 support
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marex@denx.de>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <bcm-kernel-feedback-list@broadcom.com>
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

On Mon, Feb 6, 2017 at 6:01 AM, Cyrille Pitchen
<cyrille.pitchen@atmel.com> wrote:
> Hi Kamal,
>
> Le 04/02/2017 =C3=A0 00:31, Kamal Dasu a =C3=A9crit :
>> Call the spi_nor_rescan() only if the controller driver needs this
>> support. This way SoCs that need this feature can use it.
>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>> ---
>>  drivers/mtd/devices/m25p80.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 4528e33..ffdec60 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -328,8 +328,13 @@ static int m25p_suspend(struct device *dev)
>>  static int m25p_resume(struct device *dev)
>>  {
>>       struct m25p *flash =3D dev_get_drvdata(dev);
>> +     struct spi_device *spi =3D flash->spi;
>> +     int ret =3D 0;
>> +
>> +     if (spi_flash_pm_supported(spi))
>> +             ret =3D spi_nor_pm_rescan(&flash->spi_nor, NULL);
>>
>
> Why don't you squash patch 2 into this one? Patch 2 suggests that
> spi_nor_pm_rescan() could safely be called in any case but now this patch
> suggests that calling that function is not so safe.
>
> I see two cases:
>
> 1/ either calling spi_nor_pm_rescan() is safe in any case, then patches 3=
,
> 4 and 5 are needless.
>

I agree it should be safe to call resume after implementing your
suggestions for patch 1 itself.

> 2/ or calling spi_nor_pm_rescan() has unwanted side effects in some cases=
,
> then patch 2 should be squashed into this patch: patch 2 will never be
> taken alone in the spi-nor tree if it may introduce bugs or regressions.
>
> If something has to be done in the SPI sub-system, I guess it should be
> done first: for sure applying patches 3 and 5 would not create any issue.
> Then patches 2 and 4 squashed into a single patch may be safely applied a=
fter.
>
> However, patches 3 and 5 still need to be discussed first.
>

I agree that these are not needed.

> Best regards,
>
> Cyrille
>
>> -     return spi_nor_pm_rescan(&flash->spi-nor, NULL);
>> +     return ret;
>>  }
>>  #endif
>>  static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);
>>
>

Thanks
Kamal
