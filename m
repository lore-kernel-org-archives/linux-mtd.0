Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctZ1b-0006iO-DX
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 12:18:01 +0000
Received: by mail-wr0-x244.google.com with SMTP id w43so11589969wrb.1
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 05:17:38 -0700 (PDT)
Subject: Re: [PATCH v4 0/9] Introduction to SPI NAND framework
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, marex@denx.de,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <2d6881a1-4ebf-da11-238d-969518c9c39a@gmail.com>
Date: Thu, 30 Mar 2017 14:17:34 +0200
MIME-Version: 1.0
In-Reply-To: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.

On 23/03/2017 10:43, Peter Pan wrote:
> v4 also changes a lot than v3, thanks for Boris's and Arnaud's
> valuable comments! The biggest change is "add spinand_alloc(),
> spinand_free(), spinand_register(), spinand_unregister() interfaces
> and make old interface - spinand_detect(), spinand_init() static".
> While this is just a beginning. more effort is needed to make clear
> layer. I really hope for comments on this part.
>
> This series introductes a SPI NAND framework.
> SPI NAND is a new NAND family device with SPI protocol as
> its interface. And its command set is totally different
> with parallel NAND.
[...]

Get a chance to test this serie today on MT29F1G01AAADD (not receiving 
the MT29F2G01ABAGD yet).

Except one bug I found that I will detail directly in the patch series:
- detection is working
- mtd operation with nanddump / nandwrite / flash_erase are ok
- mounting ubifs partition + basic write/read are ok.

Arnaud
