Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmIHm-0007jx-FU
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 11:00:41 +0000
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
 [209.85.161.182]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v2AB04le009153
 for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2017 20:00:05 +0900
Received: by mail-yw0-f182.google.com with SMTP id v76so21492736ywg.0
 for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2017 03:00:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161130091722.2e35f32a@bbrezillon>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <20161127160459.5894be93@bbrezillon>
 <CAK7LNAQPm7w0_iSDLJihFaxSdMp5UMnpDZH5nBTyVnoLL9KYjg@mail.gmail.com>
 <20161130091722.2e35f32a@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 Mar 2017 20:00:03 +0900
Message-ID: <CAK7LNAQxTSJT3szu46pQfBXGmenAexMWo8GyjmHsnXVmht4mOA@mail.gmail.com>
Subject: Re: [PATCH 00/39] mtd: nand: denali: 2nd round of Denali NAND IP
 patch bomb
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

I am almost getting v2 done,
and now I am testing it.

I am having one problem.  Please teach me.


2016-11-30 17:17 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> [2]
>> Remove driver-internal bounce buffer.
>> The current Denali driver allocate DMA_BIDIRECTIONAL buffer
>> to use it as a driver-internal bounce buffer.
>>
>> The hardware transfer page data into the bounce buffer,
>> then CPU copies from the bounce buffer to a given buf (and oob_poi).
>> This is not efficient.
>>
>> So, I want to set NAND_USE_BOUNCE_BUFFER flag
>> and do dma_map_single directly for a given buffer.
>
> Sounds good. Be careful though, when you use the generic bounce buffer
> interface you might have to clear the page cache info (->pagebuf = -1).


Instead of memcpy() of the whole page,
I am trying to use dma_map_single()  in ecc->read_page() / ecc->write_page().
This will allow direct transfer between the buffer and the device by DMA.

But, this does not work for Denali if use_bufpoi is set in nand_do_read_ops().


In the following code in nand_scan_tail(),

        if (!(chip->options & NAND_OWN_BUFFERS)) {
                nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
                                + mtd->oobsize * 3, GFP_KERNEL);
                if (!nbuf)
                        return -ENOMEM;
                nbuf->ecccalc = (uint8_t *)(nbuf + 1);
                nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
                nbuf->databuf = nbuf->ecccode + mtd->oobsize;

                chip->buffers = nbuf;


chip->buffers->databuf has no guarantee for DMA'able alignment.
(actually it has unwanted offset 0xc because sizeof(*nbuf) == 0xc on
32bit systems)

If we could change the code as follows,

                nbuf->ecccalc = kmalloc(mtd->oobsize, GFP_KERNEL);
                nbuf->ecccode = kmalloc(mtd->oobsize, GFP_KERNEL);
                nbuf->databuf = kmalloc(mtd->writesize + mtd->oobsize,
GFP_KERNEL);

chip->buffers->databuf would have DMA'able alignment in most cases
without NAND_OWN_BUFFERS.  (but, I am not sure if this is a good idea)


So, the idea of NAND_OWN_BUFFERS is that
drivers should allocate own buffers if they need to perform DMA-mapping
in read_page(), write_page(), right?


However, "git grep NAND_OWN_BUFFERS" shows
cafe_nand.c is the only driver that does so.

On the other hand, "git grep dma_map_single" has more hits,
i.e. some drivers perform dma_map_single() for read/write without
NAND_OWN_BUFFERS.

I have no idea how they are working.



-- 
Best Regards
Masahiro Yamada
