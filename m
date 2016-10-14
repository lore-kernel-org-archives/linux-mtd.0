Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bv2NE-00085T-QP
 for linux-mtd@lists.infradead.org; Fri, 14 Oct 2016 13:18:10 +0000
Subject: Re: [PATCH v6, 5/8] mtd: m25p80: Let m25p80_read() fallback to spi
 transfer
To: Kamal Dasu <kamal.dasu@broadcom.com>
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
 <1472076269-4731-6-git-send-email-kdasu.kdev@gmail.com>
 <4b3b3d3e-b3f8-1d5b-65e3-0c37b6a29096@gmail.com>
 <8309370e-f99f-ed51-4789-c1d97d9d8191@atmel.com>
 <CAKekbesq1deU_0TCV4STAi=o8jZwoc_u+9zkdZuEhmd+BGwU2A@mail.gmail.com>
CC: Florian Fainelli <f.fainelli@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <vigneshr@ti.com>, "Yendapally Reddy
 Dhananjaya Reddy" <yendapally.reddy@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, Jon Mason <jon.mason@broadcom.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <ae2c984e-2bcf-380e-a257-dbe786973af1@atmel.com>
Date: Fri, 14 Oct 2016 15:17:44 +0200
MIME-Version: 1.0
In-Reply-To: <CAKekbesq1deU_0TCV4STAi=o8jZwoc_u+9zkdZuEhmd+BGwU2A@mail.gmail.com>
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

Le 13/10/2016 à 23:15, Kamal Dasu a écrit :
> On Mon, Oct 10, 2016 at 4:29 AM, Cyrille Pitchen
> <cyrille.pitchen@atmel.com> wrote:
>> Hi all,
>>
>>
>> Le 10/10/2016 à 10:04, Florian Fainelli a écrit :
>>> On 08/24/2016 03:04 PM, Kamal Dasu wrote:
>>>> In m25p80_read() even though spi_flash_read() is supported
>>>> by some drivers, under certain circumstances like unaligned
>>>> buffer, address or address range limitations on certain SoCs
>>>> let it fallback to core spi reads. Such drivers are expected
>>>> to return -EAGAIN so that the m25p80_read() uses standard
>>>> spi transfer.
>>>>
>>>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>>>
>>> MTD folks, any comments on this?
>>>
>>>> ---
>>>>  drivers/mtd/devices/m25p80.c | 11 +++++++++--
>>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>>>> index 9cf7fcd..77c2d2c 100644
>>>> --- a/drivers/mtd/devices/m25p80.c
>>>> +++ b/drivers/mtd/devices/m25p80.c
>>>> @@ -155,9 +155,16 @@ static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>>>              msg.data_nbits = m25p80_rx_nbits(nor);
>>>>
>>>>              ret = spi_flash_read(spi, &msg);
>>>> -            if (ret < 0)
>>>> +
>>>> +            if (ret >= 0)
>>>> +                    return msg.retlen;
>>>> +
>>>> +            /*
>>>> +             * some spi master drivers might need to fallback to
>>>> +             * normal spi transfer
>>>> +             */
>>>> +            if (ret != -EAGAIN)
>> I just wonder whether EINVAL would be a better choice.
> 
>  spi_flash_read calls the down stream controller driver with all
> params addresses however  accelerated transfer is not possible by the
> controller due to alignment issues, it needs to indicate to m25p call
> to try the normal transfer, hence use of EAGAIN seemed appropriate.
> 
>

Yes, I think I've understood the purpose of this patch. In the example you
gave, the actual implementation of spi_flash_read() works fine with aligned
addresses but doesn't support unaligned addresses. Hence, such unaligned
addresses are invalid argument for spi_flash_read() and we should fall back
to the legacy implementation of m25p80_read().

My point is just that EINVAL clearly tells that the SPI controller driver
implementation of spi_flash_read() doesn't support the given input
parameters, here an unaligned address, whereas EAGAIN suggests that some
hardware resource is temporarily unavailable and we could call spi_flash_read()
again later. However, in this case, spi_flash_read() would still fail even if
called later.

That's why I've suggested EINVAL might have been a better choice than EAGAIN,
but honestly it's not a big deal, only a detail. So if most people prefer to
keep EAGAIN, I'm perfectly fine with it! :)

I don't want my comment to delay the integration of this patch.

>>>>                      return ret;
>>>> -            return msg.retlen;
>>>>      }
>>>>
>>>>      spi_message_init(&m);
>>>>
>>>
>>
>> Best regards,
>>
>> Cyrille
