Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zeofg-0001S1-Mp
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2015 18:21:37 +0000
Received: by vkgd64 with SMTP id d64so33272291vkg.0
 for <linux-mtd@lists.infradead.org>; Wed, 23 Sep 2015 11:21:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55FC8712.5040905@nod.at>
References: <loom.20150918T183854-37@post.gmane.org>
 <CAFLxGvwJjy=6GLXJm=2frruO9vKqqPG_6yYxSH7HLLr47x9apg@mail.gmail.com>
 <CA+-FG628WkbiqnzT9tp4Li=SP2qHPM+Nn+KLHjQWqHN-f==+vg@mail.gmail.com>
 <55FC6BCB.1030901@nod.at>
 <CA+-FG62MN2FBLKecGJJ6YHqPDyrgrx8BkCAZGezoKbADOCm_0g@mail.gmail.com>
 <55FC6F56.4050107@nod.at>
 <CA+-FG62nCCaK_GEGSqBJ4ROvqgVPZdsh7pyEsnq2C0AXZrnkjw@mail.gmail.com>
 <55FC8712.5040905@nod.at>
Date: Wed, 23 Sep 2015 13:21:15 -0500
Message-ID: <CA+EcR23BLTvQgD36bAAiT3yULYSpE0zMiXpRm0kDGQeLOTho8w@mail.gmail.com>
Subject: Re: UBIFS corruptions on NOR-Flash
From: Han Xu <xhnjupt@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Roshni Shah <roshni.shah@timesys.com>,
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

Have you enabled the CONFIG_CMA in kernel setting?

On Fri, Sep 18, 2015 at 4:50 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 18.09.2015 um 23:36 schrieb Roshni Shah:
>> Thanks. I tried 4.1 Kernel ran UBI tests and mounting the UBIFS on
>> Vybrid TWR. I see a different error, however corruptions & UBI test
>> failures still persist.
>>
>> Flash chip: s25fl128s (same as above).
>>
>> # uname -r
>> 4.1.5
>>
>> Following are the results:
>
> [...]
>
>> ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0x8f7714b9, must
>> be 0x31a3fc87
>> ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted
>> ubi0 warning: ubi_eba_read_leb: CRC error: calculated 0xd1882123, must
>
> So, reading data using UBI does not work as expected.
> One thing MTD drivers sometimes get wrong is that UBI is using vmalloc'ed buffers
> and drivers cannot deal with that.
>
> Adding Han Xu, maybe he has an idea.
>
> Thanks,
> //richard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
