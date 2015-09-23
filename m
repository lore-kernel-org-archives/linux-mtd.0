Received: from mail-oi0-f41.google.com ([209.85.218.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zeomo-0004bR-M5
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 18:28:59 +0000
Received: by oiww128 with SMTP id w128so28858247oiw.2
 for <linux-mtd@lists.infradead.org>; Wed, 23 Sep 2015 11:28:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+EcR23BLTvQgD36bAAiT3yULYSpE0zMiXpRm0kDGQeLOTho8w@mail.gmail.com>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
 <55FC6F56.4050107@nod.at>
 <CA+-FG62nCCaK_GEGSqBJ4ROvqgVPZdsh7pyEsnq2C0AXZrnkjw@mail.gmail.com>
 <55FC8712.5040905@nod.at>
 <CA+EcR23BLTvQgD36bAAiT3yULYSpE0zMiXpRm0kDGQeLOTho8w@mail.gmail.com>
Date: Wed, 23 Sep 2015 14:28:37 -0400
Message-ID: <CA+-FG62qXfW8nLqPbYrRMHNZmCJqiy36a_waKzRV=5=cYb7yTQ@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Roshni Shah <roshni.shah@timesys.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "han.xu@freescale.com" <han.xu@freescale.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Han,

Thank you very much for looking into this.

I do not have CONFIG_CMA enabled. I did not know it was required. I
can try a test with that enabled.

I tried the older version of the fsl_quadspi driver yesterday and with
that, I was able to mount the UBIFS.

http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/mtd/spi-nor/fsl-quadspi.c?h=imx_3.14.28_1.0.0_ga&id=7a998cb82c4e6862eff95ff75d253717e8f5598d

Is the CONFIG_CMA requirement applicable to later versions of the driver?

Thanks,
Roshni

On Wed, Sep 23, 2015 at 2:21 PM, Han Xu <xhnjupt@gmail.com> wrote:
> Have you enabled the CONFIG_CMA in kernel setting?
>
> On Fri, Sep 18, 2015 at 4:50 PM, Richard Weinberger <richard@nod.at> wrote:
>> Am 18.09.2015 um 23:36 schrieb Roshni Shah:
>>> Thanks. I tried 4.1 Kernel ran UBI tests and mounting the UBIFS on
>>> Vybrid TWR. I see a different error, however corruptions & UBI test
>>> failures still persist.
>>>
>>> Flash chip: s25fl128s (same as above).
>>>
>>> # uname -r
>>> 4.1.5
>>>
>>> Following are the results:
>>
>> [...]
>>
>>> ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8f7714b9, must
>>> be 0x31a3fc87
>>> ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>>> ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xd1882123, must
>>
>> So, reading data using UBI does not work as expected.
>> One thing MTD drivers sometimes get wrong is that UBI is using vmalloc'ed buffers
>> and drivers cannot deal with that.
>>
>> Adding Han Xu, maybe he has an idea.
>>
>> Thanks,
>> //richard
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
