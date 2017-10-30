Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e99UH-0005Ha-Ff
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 12:48:19 +0000
Received: by mail-io0-x243.google.com with SMTP id j17so26810294iod.5
 for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2017 05:47:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171030093426.30827ef5@bbrezillon>
References: <20171028074351.13118-1-prasannatsmkumar@gmail.com>
 <20171030093426.30827ef5@bbrezillon>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Mon, 30 Oct 2017 18:17:50 +0530
Message-ID: <CANc+2y4U+BbOnWZzEZ4+2dNfJNEA0Was+ySuJRJwyakm-GxYiA@mail.gmail.com>
Subject: Re: [RFC] NAND: Optimize NAND_ECC_HW_OOB_FIRST read
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 30 October 2017 at 14:04, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi PrasannaKumar,
>
> On Sat, 28 Oct 2017 13:13:51 +0530
> PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com> wrote:
>
>> From: Lars-Peter Clausen <lars@metafoo.de>
>>
>> Avoid sending unnecessary READ commands to the chip.
>>
>> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
>> ---
>> This patch is taken from git://projects.qi-hardware.com/qi-kernel.git
>> branch jz-3.16. From [1] and [2] it can be seen that the patch author
>> thinks this can be sent upstream but it never happened so far. This
>> patch is used in OpenWRT as seen from [3].
>
> Sounds reasonable, but it's likely to conflict with something I'd like
> to queue for 4.16 [1]. I'll rebase this patch on nand/next once the
> ->exec_op() series is merged. Don't hesitate to ping me if I forget.
>
> Regards,
>
> Boris
>
> [1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=8923

Okay. I will remind you if required.

There is another patch used in OpenWRT at [1]. Do you mind to have a
look at it and take that if it is useful? I don't see a point in me
sending it as a RFC as I am not contributing anything to it other than
noticing its existence.

1. https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/xburst/patches-3.18/003-NAND-Add-support-for-subpage-reads-for-NAND_ECC_HW_O.patch;h=974eb7a5db9a09347fa6137461f030575f9a4328;hb=c03d4317a6bc891cb4a5e89cbdd77f37c23aff86

Thanks,
PrasannaKumar
