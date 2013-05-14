Received: from mail-pd0-f170.google.com ([209.85.192.170])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uc53d-0003Uv-EB
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 02:33:42 +0000
Received: by mail-pd0-f170.google.com with SMTP id 10so12348pdi.15
 for <linux-mtd@lists.infradead.org>; Mon, 13 May 2013 19:33:20 -0700 (PDT)
Message-ID: <5191A269.6040006@gmail.com>
Date: Tue, 14 May 2013 08:03:13 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
 <510CB507.4020105@gmail.com> <518A6228.6050608@denx.de>
 <518B96FC.6000806@gmail.com> <518C91AA.8040107@denx.de>
 <5190551A.5010400@freescale.com> <51909DF1.4060201@denx.de>
 <5190ABF0.10501@freescale.com> <51911A2E.1060903@gmail.com>
 <5191A037.6060002@freescale.com>
In-Reply-To: <5191A037.6060002@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/14/2013 7:53 AM, Huang Shijie wrote:
> 于 2013年05月14日 00:51, Vikram Narayanan 写道:
>> Hello Huang,
>>
>> On 5/13/2013 2:31 PM, Huang Shijie wrote:
>>>>
>>>> Huang, is this to be expected? How does this look on one of your
>>>> officially "supported" imx6 boards with NAND support?
>>>>
>>> I suggest you do not use the mtd_nandbiterrs.ko. It will call the
>>> mtd_write_oob() which will definitely lead to the
>>> -EBADMSG (-74) error.
>>>
>>> The mtd_write_oob() in mtd_nandbiterrs.ko writes a whole page without
>>> enabling the BCH to do the hardware ECC.
>>> But mtd_read() in mtd_nandbiterrs.ko DOES do the hardware ECC by the
>>> BCH.
>>> It's normal that you meet -74.
>>
>> I wonder if this has something to do with the fake
>> "struct nand_ecclayout" defined in
>> <drivers/mtd/nand/gpmi-nand/gpmi-nand.c>?
> it's not a fake structure, i think.
>
> We do use all the oob now.
>>
>> Could you please explain on what is the technical restriction for not
>> providing a _sane_ ecclayout structure, so that the mtd_tests run
>> happily?
>>
> could you please read the chapter about the BCH, especially the "Flash
> Page Layout".

Yup. Will do it.

>
> The reason why We use all the oob is that we can not get the correct ECC
> info from the nand, such as "4 bits for 512 byte".
> I have sent a patch set with whitch we can parse out some ECC info for
> ONFI nand and full-id nand.
>
> The gpmi-nand does not live for mtd_tests. If it can not pass some
> mtd_tests, it does not mean the gpmi has bugs.

Huang, What we are trying here is to get a stable working driver which 
can live upto the expectation of end users.

So, don't think that we are pointing that the GPMI-NAND driver is buggy. 
My only concern is _mtdtests_ are there to reveal problems (if any) in 
the NAND related code, be it a driver or the mtd layer. If one can make 
that run happily, it's easy to pin point the source of these errors. 
(-74, fixable bit-flip etc).

Hope this clarifies my point.

Regards,
Vikram
