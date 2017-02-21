Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5eh-0007iz-Ps
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 08:18:45 +0000
Received: by mail-lf0-x22c.google.com with SMTP id g134so16952115lfe.1
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 00:18:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAAyFORKkCdw2WhOOZXV1U+LzvvUuniDCxoShwv9TEt5XZJRqxw@mail.gmail.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <8d67a301-cc8d-276a-12f5-4e5db24a8abc@nod.at>
 <CAAyFORKkCdw2WhOOZXV1U+LzvvUuniDCxoShwv9TEt5XZJRqxw@mail.gmail.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Tue, 21 Feb 2017 16:18:17 +0800
Message-ID: <CAAyFORJYVQmDja+MfsDbC-Uovh==SAePRWp=0WT0OV6Ungnq6w@mail.gmail.com>
Subject: Re: [PATCH 00/11] Introduction to SPI NAND framework
To: Richard Weinberger <richard@nod.at>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 21, 2017 at 4:11 PM, Peter Pan <peterpansjtu@gmail.com> wrote:
> Hi Richard,
>
>
> On Tue, Feb 21, 2017 at 4:05 PM, Richard Weinberger <richard@nod.at> wrote:
>> Peter,
>>
>> Am 21.02.2017 um 08:59 schrieb Peter Pan:
>>> This serie introductes a SPI NAND framework.
>>> SPI NAND is a new NAND family device with SPI protocol as
>>> its interface. And its command set is totally different
>>> with parallel NAND.
>>>
>>> Our first attempt was more than 2 years ago[1]. At that
>>> time, I didn't make BBT shareable and there were too many
>>> duplicate code with parallel NAND, so that serie stoped.
>>> But the discussion never stops. Now Boris has a plan to
>>> make a generic NAND framework which can be shared with
>>> both parallel and SPI NAND. Now the first step of the
>>> new generic NAND framework is finished. And it is waiting
>>> for a user. After discussion with Boris. We both think it's
>>> time to rebuild SPI NAND framework based on the new NAND
>>> framework and send out for reviewing.
>>>
>>> This serie is based on Boris's nand/generic branch[2], which
>>> is on 4.9-rc1. In this serie, BBT code is totally shared.
>>> Of course SPI NAND can share more code with parallel, this
>>> requires to put more in new NAND core (now only BBT included).
>>> I'd like to send this serie out first, then we can decide
>>> which part should be in new NAND core.
>>>
>>> This serie only supports basic SPI NAND features and uses
>>> generic spi controller for data transfer, on-die ECC for data
>>> correction. Support advanced features and specific SPI NAND
>>> controller with hardware ECC is the next step.
>>
>> Can you please share on which SPI NAND chips this got tested?
>
> Sorry for missing this part in cover letter... This series is tested on
> Xilinx Zedboard with Micron MT29F2G01AAAED SPI NAND chip.

Sorry for mistake, the chip should be MT29F2G01ABAGDSF

Thanks,
Peter Pan
