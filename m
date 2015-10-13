Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zm3Zj-0004TG-BP
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2015 17:41:24 +0000
Received: by wijq8 with SMTP id q8so42915445wij.0
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 10:41:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20151013173354.GW107187@google.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
 <1433968754-10651-6-git-send-email-fransklaver@gmail.com>
 <20151013173354.GW107187@google.com>
Date: Tue, 13 Oct 2015 19:41:00 +0200
Message-ID: <CAH6sp9MqyUaPUNLJd+tEHzFH9mic71HxLNfnuYswuf=KdnZr7Q@mail.gmail.com>
Subject: Re: [PATCH v2 05/60] mtd: devices: m25p80: show parent device in sysfs
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 13, 2015 at 7:37 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jun 10, 2015 at 10:38:19PM +0200, Frans Klaver wrote:
>> Fix a bug where mtd parent device symlinks aren't shown in sysfs.
>>
>> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
>
> This is one of the patches that didn't apply...
>
>> ---
>>  drivers/mtd/devices/m25p80.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 3af137f..dfa6ee0 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -206,6 +206,7 @@ static int m25p_probe(struct spi_device *spi)
>>
>>       spi_set_drvdata(spi, flash);
>>       flash->mtd.priv = nor;
>> +     flash->mtd.dev.parent = &spi->dev;
>
> ...but I don't think this patch is actually necessary. See
> spi_nor_scan(), which assigns mtd->dev.parent for us. So as long as the
> driver assigns the spi_nor::dev field, the spi-nor framework handles
> this for us.
>
> Same comment applies to fsl-quadspi.c (patch 59), which also didn't
> apply cleanly. So I don't think we need either of these patches.

Sure. Feel free to drop them. The main reason these patches exist is
based on the fact that these files didn't contain the "dev.parent ="
pattern. I tried to only add those necessary based on code inspection,
so it is very well possible that we don't need them. If someone runs
into it on these drivers, that's the time to fix it I guess.

Thanks,
Frans
