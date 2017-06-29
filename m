Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQTW5-0001rS-1M
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 07:05:30 +0000
Received: by mail-wr0-x22e.google.com with SMTP id r103so184660328wrb.0
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 00:05:05 -0700 (PDT)
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
To: =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "richard@nod.at" <richard@nod.at>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>,
 "marex@denx.de" <marex@denx.de>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "peterpansjtu@gmail.com" <peterpansjtu@gmail.com>,
 "linshunquan1@hisilicon.com" <linshunquan1@hisilicon.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
 <20170530001152.1d8beb72@bbrezillon>
 <B7799737-B040-4824-BBAF-5A0510CD553C@micron.com>
 <20170627221552.6e4efff9@bbrezillon>
 <C3581AD4-9CFE-489B-91E7-B923217DDCBD@micron.com>
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <14f6f4f7-6a27-212b-4fb9-7a4303c1be34@gmail.com>
Date: Thu, 29 Jun 2017 09:05:02 +0200
MIME-Version: 1.0
In-Reply-To: <C3581AD4-9CFE-489B-91E7-B923217DDCBD@micron.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 29/06/2017 08:07, Peter Pan 潘栋 (peterpandong) wrote:
> Hi Boris,
>
>> 在 2017年6月28日，04:16，Boris Brezillon <boris.brezillon@free-electrons.com> 写道：
>>
>>
>>>>> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
>>>>> index dd9da71..04ad1dd 100644
>>>>> --- a/include/linux/mtd/spinand.h
>>>>> +++ b/include/linux/mtd/spinand.h
>>>>> @@ -103,11 +103,14 @@ struct spinand_controller_ops {
>>>>> *          return directly and let others to detect.
>>>>> * @init: initialize SPI NAND device.
>>>>> * @cleanup: clean SPI NAND device footprint.
>>>>> + * @prepare_op: prepara read/write operation.
>>>>           ^ prepare
>>>>
>>>>
>>>>
>>>>> */
>>>>> struct spinand_manufacturer_ops {
>>>>>    bool (*detect)(struct spinand_device *spinand);
>>>>>    int (*init)(struct spinand_device *spinand);
>>>>>    void (*cleanup)(struct spinand_device *spinand);
>>>>> +    void (*prepare_op)(struct spinand_device *spinand,
>>>>> +               struct spinand_op *op, u32 page, u32 column);
>>>> It seems to be here to prepare read/write page operations, so I'd like
>>>> to rename this method ->prepare_page_op() if you don't mind.
>>> I'm ok with the new name
>> Hm, actually I wonder if this ->prepare_op() method is really what we
>> want. It seems to be here to set the proper plane number and the
>> number of dummy bytes after the address cycles.
>> I'd say deducing the plane from the page is something standard. Whether
>> we need it or not depends on the information provide in the memorg
>> object (->nplanes).
> For Micron spi nand, it's true. But I don't know whether other vendors'
> spi nand need set plane number when the chip has more than one
> planes. The reason Micron spi nand need to set plane number is
> internal cache register is per plane.
>
> Arnaud,
> Do you have info about this?
I don't know the internals, only the user side.
Up to now, Micron is the only one requiring a "pane bit" in the offset 
address.
Arnaud
>
> Thanks
> Peter Pan
>
>> Regarding the dummy byte, do you have examples of SPI NANDs requiring
>> less or more dummy bytes in this read/write from/to cache use case?
>> If not, I'd prefer to keep it hardcoded in the core for know, and add
>> a hook when the need appears.
