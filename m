Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akSPh-0007Aa-9T
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2016 08:20:42 +0000
Received: by mail-lf0-x241.google.com with SMTP id y184so3437583lfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2016 01:20:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAEAJfCtjSrSgqDFs_F67Kqm6=7TOZ-p3x1gYRL5_hRdTsDfZg@mail.gmail.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <CAAEAJfCtjSrSgqDFs_F67Kqm6=7TOZ-p3x1gYRL5_hRdTsDfZg@mail.gmail.com>
Date: Mon, 28 Mar 2016 16:20:19 +0800
Message-ID: <CAAyFORLNTtv=CdLBEE7y-4xhtAzSUO4XsYGeVgV7-nZiRQjb=w@mail.gmail.com>
Subject: Re: [PATCH 00/11] mtd: nand_bbt: introduce independent nand BBT
From: Peter Pan <peterpansjtu@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jiancheng Xue <xuejiancheng@huawei.com>,
 beanhuo@micron.com, karlzhang@micron.com, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

Sorry for reply your mail late. And thaks a lot for reviewing it.

On Thu, Mar 24, 2016 at 4:57 AM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> Hello,
>
> On 13 March 2016 at 23:47, Peter Pan <peterpansjtu@gmail.com> wrote:
>> Sorry for send the v3 out late. I went through a busy time in the past
>> two month.
>>
>> Currently nand_bbt.c is tied with struct nand_chip, and it makes other
>> NAND family chips hard to use nand_bbt.c. Maybe it's the reason why
>> onenand has own bbt(onenand_bbt.c).
>>
>> Separate struct nand_chip from BBT code can make current BBT shareable.
>> We create struct nand_bbt to take place of nand_chip in nand_bbt.c.
>> Struct nand_bbt contains all the information BBT needed from outside and
>> it should be embedded into NAND family chip struct (such as struct nand_chip).
>>
>> Below is mtd folder structure we want:
>>         drivers/mtd/nand/<all-nand-core-code>
>>         drivers/mtd/nand/raw/<raw-nand-controller-drivers>
>>         drivers/mtd/nand/spi/<spi-nand-code>
>>         drivers/mtd/nand/onenand/<onenand-code>
>>         drivers/mtd/nand/chips/<manufacturer-spcific-code>
>>
>
> You mention this structure, but nothing in the current patchset is actually
> enforcing it. This is more the future direction we are going.

Yes, this is what we want.
>
>> Most of the patch is borrowed from Brian Norris <computersforpeace@gmail.com>.
>> http://git.infradead.org/users/norris/linux-mtd.git/shortlog/refs/heads/nand-bbt
>> I decided the authorship of each patch by contribution. Please let me know if
>> there is something unproper.
>> Based on Brian's suggestion and Boris's comments, I make 11 independent
>> patches. Previous patch is http://patchwork.ozlabs.org/patch/492066/
>> After discussion with Boris and Ezequiel, I realized above structure is better,
>> so I drop the patch to move nand_bbt.c to mtd folder.
>>
>
> I have reviewed this patchset, and it looks mostly good to me. I can
> spot trivial style comments, or comments related to the commit logs, or the
> way commits are splitted.
>
> Boris will probably have more insightful comments to make.
>
> However, before starting my silly bikeshedding I'd like to know if we all
> agree with the patchset's overall scheme.
>
> It would be good to finally move forward with this, to take mt29f out
> of staging and also support other SPI NAND vendors.

Yes. We plan to move mt29f_spi_nand out from staging. But because mt29f_spi_nand
is under raw/parallel NAND framework, it mismatch the stucture we
want. Rewite it
under SPI NAND framework may be a better choice, right? Actually I'm
working on this
now.

Thanks,
Peter Pan
