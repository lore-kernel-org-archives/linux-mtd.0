Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2y7y-0000nd-Dm
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 09:50:55 +0000
Received: by mail-wm0-x243.google.com with SMTP id w143so11304439wmw.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2016 02:50:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <573C384F.8000209@ti.com>
References: <1459230377-26847-1-git-send-email-vigneshr@ti.com>
 <CAOMqctR75awkRbwzG4_U91wuZqdZJH9MGrcfCtQm7f6qP=ezUw@mail.gmail.com>
 <573C384F.8000209@ti.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 18 May 2016 11:49:53 +0200
Message-ID: <CAOMqctTOS5jT=OgicpQQakDvSwuJH-Q-1Dso5WAkyLLNyw7tDQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH] mtd: devices: m25p80: add support for mmap read
 request
To: Vignesh R <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 May 2016 at 11:39, Vignesh R <vigneshr@ti.com> wrote:
> Hi,
>
> On 05/18/2016 02:53 PM, Michal Suchanek wrote:
>> Hello,
> [...]
>>>
>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>>> index c9c3b7fa3051..7730e633d7d3 100644
>>> --- a/drivers/mtd/devices/m25p80.c
>>> +++ b/drivers/mtd/devices/m25p80.c
>>> @@ -131,6 +131,26 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
>>>         /* convert the dummy cycles to the number of bytes */
>>>         dummy /= 8;
>>>
>>> +       if (spi_flash_read_supported(spi)) {
>>> +               struct spi_flash_read_message msg;
>>> +               int ret;
>>> +
>>> +               msg.buf = buf;
>>> +               msg.from = from;
>>> +               msg.len = len;
>>> +               msg.read_opcode = nor->read_opcode;
>>> +               msg.addr_width = nor->addr_width;
>>> +               msg.dummy_bytes = dummy;
>>> +               /* TODO: Support other combinations */
>>> +               msg.opcode_nbits = SPI_NBITS_SINGLE;
>>> +               msg.addr_nbits = SPI_NBITS_SINGLE;
>>> +               msg.data_nbits = m25p80_rx_nbits(nor);
>>> +
>>> +               ret = spi_flash_read(spi, &msg);
>>> +               *retlen = msg.retlen;
>>
>> This is wrong. The previous retlen is never passed into msg so it must
>> be added and not assigned as is seen a few lines below:
>>
>>         ret = m.actual_length - m25p_cmdsz(nor) - dummy;
>>         if (ret < 0)
>>                 return -EIO;
>>         *retlen += ret;
>>
>> This interface with odd design and poor documentation will be
>> hopefully weeded out with
>> mtd: spi-nor: stop passing around retlen
>> so there is probably no need to patch this separately.
>>
>
> This patch was applied by Brian quite sometime back and the v7  of "mtd:
> spi-nor: stop passing around retlen" patch takes care of removing the
> offending code: https://lkml.org/lkml/2016/5/5/692
>

Yes, I am looking exactly at that patchset but don't see it applied
anywhere yet.

Thanks

Michal
