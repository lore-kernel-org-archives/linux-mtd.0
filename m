Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxTpc-0007FK-8v
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 07:33:49 +0000
Received: by mail-lf0-x243.google.com with SMTP id i3so4004506lfh.2
 for <linux-mtd@lists.infradead.org>; Mon, 10 Apr 2017 00:33:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2d6881a1-4ebf-da11-238d-969518c9c39a@gmail.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <2d6881a1-4ebf-da11-238d-969518c9c39a@gmail.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Mon, 10 Apr 2017 15:33:24 +0800
Message-ID: <CAAyFORK0HDB_14_K+V0VHeXhMyX1Ae-LYN=M3CKais1FWHKo_Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Introduction to SPI NAND framework
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
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

H Arnaud,

On Thu, Mar 30, 2017 at 8:17 PM, Arnaud Mouiche
<arnaud.mouiche@gmail.com> wrote:
> Hi all.
>
> On 23/03/2017 10:43, Peter Pan wrote:
>>
>> v4 also changes a lot than v3, thanks for Boris's and Arnaud's
>> valuable comments! The biggest change is "add spinand_alloc(),
>> spinand_free(), spinand_register(), spinand_unregister() interfaces
>> and make old interface - spinand_detect(), spinand_init() static".
>> While this is just a beginning. more effort is needed to make clear
>> layer. I really hope for comments on this part.
>>
>> This series introductes a SPI NAND framework.
>> SPI NAND is a new NAND family device with SPI protocol as
>> its interface. And its command set is totally different
>> with parallel NAND.
>
> [...]
>
> Get a chance to test this serie today on MT29F1G01AAADD (not receiving the
> MT29F2G01ABAGD yet).
>
> Except one bug I found that I will detail directly in the patch series:
> - detection is working
> - mtd operation with nanddump / nandwrite / flash_erase are ok
> - mounting ubifs partition + basic write/read are ok.
>
> Arnaud

This is really a big help for me. Really thank you.

Peter Pan
