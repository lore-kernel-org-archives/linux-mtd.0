Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akS34-0005PG-D6
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2016 07:57:19 +0000
Received: by mail-lf0-x243.google.com with SMTP id i75so10379722lfb.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2016 00:56:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160325095015.341a11eb@bbrezillon>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
 <20160325095015.341a11eb@bbrezillon>
Date: Mon, 28 Mar 2016 15:56:56 +0800
Message-ID: <CAAyFORJE9ceR_Jv_+E4ujBdCH-ogbQe1B++FJVL8HMfD9TszYg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mtd: nand_bbt: introduce independent nand BBT
From: Peter Pan <peterpansjtu@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 25, 2016 at 4:50 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Mon, 14 Mar 2016 02:47:53 +0000
> Peter Pan <peterpansjtu@gmail.com> wrote:
>
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
>>       drivers/mtd/nand/<all-nand-core-code>
>>       drivers/mtd/nand/raw/<raw-nand-controller-drivers>
>>       drivers/mtd/nand/spi/<spi-nand-code>
>>       drivers/mtd/nand/onenand/<onenand-code>
>>       drivers/mtd/nand/chips/<manufacturer-spcific-code>
>
> Hm, we should have a chips directory under each interface type, because
> vendor specific handling is dependent on the NAND interface.
> Otherwise, yes, that's the idea.

Update this in v4

Thanks,
Peter Pan
