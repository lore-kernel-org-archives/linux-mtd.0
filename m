Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCWB5-0007EU-40
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 18:33:52 +0000
Received: by mail-wm0-x244.google.com with SMTP id a20so35636848wme.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 10:33:29 -0800 (PST)
Subject: Re: [PATCH v8] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
References: <20161124165608.29816-1-ricardo.ribalda@gmail.com>
 <1e8b99b6-1110-70ae-e299-1c2c153a1908@gmail.com>
 <CAPybu_1r3Hpu9m4pn8yTG6Fi5hhbr_6wgJQt2yozL_+_+6HaHg@mail.gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a83c7988-4418-5118-786f-91dcc981ce40@gmail.com>
Date: Thu, 1 Dec 2016 19:11:24 +0100
MIME-Version: 1.0
In-Reply-To: <CAPybu_1r3Hpu9m4pn8yTG6Fi5hhbr_6wgJQt2yozL_+_+6HaHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/01/2016 06:52 PM, Ricardo Ribalda Delgado wrote:
> Hi Marek

Hi,

> Thanks for your review
> 
> On Thu, Dec 1, 2016 at 5:05 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>
>> On 11/24/2016 05:56 PM, Ricardo Ribalda Delgado wrote:
> 
>>> +#define      SPI_S3AN                BIT(10) /*
>>> +                                      * Xilinx Spartan 3AN In-System Flash
>>> +                                      * (MFR cannot be used for probing
>>> +                                      * because it has the same value as
>>> +                                      * ATMEL flashes)
>>> +                                      */
>>
>> I have possibly off-topic question. Altera has something very similar --
>> EPCS/EPCQ flash which cannot be detected using standard READID .
>> Would this patch help with supporting those degenerate flashes too?
>>
>>>  };
>>>
> 
> I dont know, but I love the term degenerated flash, please let me use it :)

Hehe. It'd be great to know whether we don't have a possibility for a
generic usecase here. Can you briefly check that ?

>>>       for (i = 0; i < len; ) {
>>>               ssize_t written;
>>> +             loff_t addr = to + i;
>>> +
>>> +             if (hweight32(nor->page_size) == 1) {
>>> +                     page_offset = addr & (nor->page_size - 1);
>>> +             } else {
>>> +                     uint64_t aux = addr;
>>>
>>> -             page_offset = (to + i) & (nor->page_size - 1);
>>> +                     page_offset = do_div(aux, nor->page_size);
>>> +             }
>>
>> Why is this part necessary ?
> 
> If page_size is not a power of 2 (264,528),  the & (size-1) operation
> for getting the offset  does not work, you need to do a real modulus.

Aaah, now it makes sense. Ew, but all right, thanks for clarifying.
This could use a comment, somewhere along these lines.

>>> +
>>> +     /* Flash in Power of 2 mode */
>>> +     if (val & XSR_PAGESIZE) {
>>> +             nor->page_size = (nor->page_size == 264) ? 256 : 512;
>>
>> 264 is due to some ECC ?
> 
> The flash can be in standard mode or in power of two mode. You need to
> check the status register to know if the chip is in one mode or the
> other.
> 
> The flash is in standard mode from factory, you can change the mode to
> power of two, but the data is corrupted and you cannot change  back to
> standard mode.
> 
> I guess they are using some bits reserved to ECC for data and that way
> you can squeeze some bits for user data.

OK, comment could help clarify this, so please add one.

>>> +             nor->mtd.writebufsize = nor->page_size;
>>> +             nor->mtd.size = 8 * nor->page_size * info->n_sectors;
>>> +             nor->mtd.erasesize = 8 * nor->page_size;
>>> +     } else {
>>> +             nor->flags |= SNOR_F_S3AN_ADDR_DEFAULT;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>
>> [...]
>>
>> --
>> Best regards,
>> Marek Vasut
> 
> Thanks Again
> 
> 
> 
> 


-- 
Best regards,
Marek Vasut
