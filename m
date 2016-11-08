Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c43I7-00047T-7x
 for linux-mtd@lists.infradead.org; Tue, 08 Nov 2016 10:06:08 +0000
Received: by mail-it0-x241.google.com with SMTP id q124so15201641itd.1
 for <linux-mtd@lists.infradead.org>; Tue, 08 Nov 2016 02:05:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161108022330.GA119161@google.com>
References: <1471263690-32512-1-git-send-email-zajec5@gmail.com>
 <20161108022330.GA119161@google.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 8 Nov 2016 11:05:44 +0100
Message-ID: <CACna6rybjMoay7FBWK=N6xK8V4yjq7g0TN6TbFnthoEgS7hsLw@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use uncached MMIO access for BCM53573
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 David Woodhouse <dwmw2@infradead.org>, Frans Klaver <fransklaver@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

On 8 November 2016 at 03:23, Brian Norris <computersforpeace@gmail.com> wro=
te:
> On Mon, Aug 15, 2016 at 02:21:28PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> BCM53573 is a new series of Broadcom's SoCs. It's based on ARM and uses
>> this old ChipCommon-based flash access. Early tests resulted in flash
>> corruptions that were tracked down to using cached MMIO for flash read
>> access. Switch to ioremap_nocache conditionally to support BCM53573 and
>> don't break performance on old MIPS devices.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> ---
>>  drivers/mtd/devices/bcm47xxsflash.c | 24 +++++++++++++++++++-----
>>  1 file changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/b=
cm47xxsflash.c
>> index 1c65c15..514be04 100644
>> --- a/drivers/mtd/devices/bcm47xxsflash.c
>> +++ b/drivers/mtd/devices/bcm47xxsflash.c
>> @@ -296,16 +296,30 @@ static int bcm47xxsflash_bcma_probe(struct platfor=
m_device *pdev)
>>               dev_err(dev, "can't request region for resource %pR\n", re=
s);
>>               return -EBUSY;
>>       }
>> -     b47s->window =3D ioremap_cache(res->start, resource_size(res));
>> -     if (!b47s->window) {
>> -             dev_err(dev, "ioremap failed for resource %pR\n", res);
>> -             return -ENOMEM;
>> -     }
>>
>>       b47s->bcma_cc =3D container_of(sflash, struct bcma_drv_cc, sflash)=
;
>>       b47s->cc_read =3D bcm47xxsflash_bcma_cc_read;
>>       b47s->cc_write =3D bcm47xxsflash_bcma_cc_write;
>>
>> +     /*
>> +      * On old MIPS devices cache was magically invalidated when needed=
,
>> +      * allowing us to use cached access and gain some performance. Try=
ing
>> +      * the same on ARM based BCM53573 results in flash corruptions, we=
 need
>> +      * to use uncached access for it.
>
> Is the word "magically" really used in the Broadcom reference code? I
> wouldn't be too suprised actually :)
>
> I'd prefer getting a better explanation on this point, but without that,
> I think it's fair to leave the caching for the old (working) MIPS SoCs
> and avoid caching on the new ARM one.

I have to admit "magic" word was my choice ;) I guess Broadcom ppl
know more about this, but they didn't release any
datasheets/programming guide and they didn't document it well in the
code.

Reference code can be found in Broadcom's SDK in the ccsflash.c.

1) ccsflash_init does:
ccsflash.base =3D (uint32)REG_MAP(ccsflash.phybase, ccsflash.size);
(and REG_MAP is a macro for ioremap_nocache)

2) ccsflash_read does:
if (sih->ccrev =3D=3D 12) {
        from =3D (uint8 *)OSL_UNCACHED((void *)SI_FLASH2 + offset);
} else if (sih->ccrev =3D=3D 54) {
        from =3D (uint8 *)((void *)sfl->base + offset);
} else {
        from =3D (uint8 *)OSL_CACHED((void *)SI_FLASH2 + offset);
}

I'm not aware of any market-released device with ChipCommon rev 12, so
I check for rev 54 only.


>> +      * It may be arch specific, but right now there is only 1 ARM SoC =
using
>> +      * this driver, so let's follow Broadcom's reference code and chec=
k
>> +      * ChipCommon revision.
>
> Yeah, if we get any more ARM chips that behave similarly, I think we'll
> just want to do 'if !MIPS'.
>
> Applied to l2-mtd.git.

Thank you!
