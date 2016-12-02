Received: from mail-wj0-x242.google.com ([2a00:1450:400c:c01::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cClSe-0002RN-DG
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 10:53:01 +0000
Received: by mail-wj0-x242.google.com with SMTP id he10so15496265wjc.2
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2016 02:52:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a83c7988-4418-5118-786f-91dcc981ce40@gmail.com>
References: <20161124165608.29816-1-ricardo.ribalda@gmail.com>
 <1e8b99b6-1110-70ae-e299-1c2c153a1908@gmail.com>
 <CAPybu_1r3Hpu9m4pn8yTG6Fi5hhbr_6wgJQt2yozL_+_+6HaHg@mail.gmail.com>
 <a83c7988-4418-5118-786f-91dcc981ce40@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 2 Dec 2016 11:52:17 +0100
Message-ID: <CAPybu_2FxzLzScqQ52PY5FOb=sFARtm7ZFJ11iGRWjErDVQ=MA@mail.gmail.com>
Subject: Re: [PATCH v8] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek

On Thu, Dec 1, 2016 at 7:11 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 12/01/2016 06:52 PM, Ricardo Ribalda Delgado wrote:
>> Hi Marek
>
> Hi,
>
>> Thanks for your review
>>
>> On Thu, Dec 1, 2016 at 5:05 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>
>>> On 11/24/2016 05:56 PM, Ricardo Ribalda Delgado wrote:
>>
>>>> +#define      SPI_S3AN                BIT(10) /*
>>>> +                                      * Xilinx Spartan 3AN In-System Flash
>>>> +                                      * (MFR cannot be used for probing
>>>> +                                      * because it has the same value as
>>>> +                                      * ATMEL flashes)
>>>> +                                      */
>>>
>>> I have possibly off-topic question. Altera has something very similar --
>>> EPCS/EPCQ flash which cannot be detected using standard READID .
>>> Would this patch help with supporting those degenerate flashes too?
>>>
>>>>  };
>>>>
>>
>> I dont know, but I love the term degenerated flash, please let me use it :)
>
> Hehe. It'd be great to know whether we don't have a possibility for a
> generic usecase here. Can you briefly check that ?

I have taken a brief look to
https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/cfg/cfg_cf52012.pdf

and they seem different enough to not reuse the flag :(.

>> I guess they are using some bits reserved to ECC for data and that way
>> you can squeeze some bits for user data.
>
> OK, comment could help clarify this, so please add one.

Will send a v9

Thanks!
