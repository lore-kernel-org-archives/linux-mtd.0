Received: from mail-yw0-x229.google.com ([2607:f8b0:4002:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bunMK-0002LU-B2
 for linux-mtd@lists.infradead.org; Thu, 13 Oct 2016 21:16:13 +0000
Received: by mail-yw0-x229.google.com with SMTP id u124so63016366ywg.3
 for <linux-mtd@lists.infradead.org>; Thu, 13 Oct 2016 14:15:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8309370e-f99f-ed51-4789-c1d97d9d8191@atmel.com>
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
 <1472076269-4731-6-git-send-email-kdasu.kdev@gmail.com>
 <4b3b3d3e-b3f8-1d5b-65e3-0c37b6a29096@gmail.com>
 <8309370e-f99f-ed51-4789-c1d97d9d8191@atmel.com>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 13 Oct 2016 17:15:08 -0400
Message-ID: <CAKekbesq1deU_0TCV4STAi=o8jZwoc_u+9zkdZuEhmd+BGwU2A@mail.gmail.com>
Subject: Re: [PATCH v6,
 5/8] mtd: m25p80: Let m25p80_read() fallback to spi transfer
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Jon Mason <jon.mason@broadcom.com>
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

On Mon, Oct 10, 2016 at 4:29 AM, Cyrille Pitchen
<cyrille.pitchen@atmel.com> wrote:
> Hi all,
>
>
> Le 10/10/2016 =C3=A0 10:04, Florian Fainelli a =C3=A9crit :
>> On 08/24/2016 03:04 PM, Kamal Dasu wrote:
>>> In m25p80_read() even though spi_flash_read() is supported
>>> by some drivers, under certain circumstances like unaligned
>>> buffer, address or address range limitations on certain SoCs
>>> let it fallback to core spi reads. Such drivers are expected
>>> to return -EAGAIN so that the m25p80_read() uses standard
>>> spi transfer.
>>>
>>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
>>
>> MTD folks, any comments on this?
>>
>>> ---
>>>  drivers/mtd/devices/m25p80.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.=
c
>>> index 9cf7fcd..77c2d2c 100644
>>> --- a/drivers/mtd/devices/m25p80.c
>>> +++ b/drivers/mtd/devices/m25p80.c
>>> @@ -155,9 +155,16 @@ static ssize_t m25p80_read(struct spi_nor *nor, lo=
ff_t from, size_t len,
>>>              msg.data_nbits =3D m25p80_rx_nbits(nor);
>>>
>>>              ret =3D spi_flash_read(spi, &msg);
>>> -            if (ret < 0)
>>> +
>>> +            if (ret >=3D 0)
>>> +                    return msg.retlen;
>>> +
>>> +            /*
>>> +             * some spi master drivers might need to fallback to
>>> +             * normal spi transfer
>>> +             */
>>> +            if (ret !=3D -EAGAIN)
> I just wonder whether EINVAL would be a better choice.

 spi_flash_read calls the down stream controller driver with all
params addresses however  accelerated transfer is not possible by the
controller due to alignment issues, it needs to indicate to m25p call
to try the normal transfer, hence use of EAGAIN seemed appropriate.


>>>                      return ret;
>>> -            return msg.retlen;
>>>      }
>>>
>>>      spi_message_init(&m);
>>>
>>
>
> Best regards,
>
> Cyrille
