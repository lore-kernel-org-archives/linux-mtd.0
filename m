Received: from m199-177.yeah.net ([123.58.177.199])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajHuP-0008Mq-4P
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 02:55:35 +0000
Subject: Re: [PATCH 0/5] drivers/mtd: make several functions return bool
To: Yaowei Bai <baiyaowei@cmss.chinamobile.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, richard@nod.at,
 boris.brezillon@free-electrons.com
References: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <56F4A87B.5090100@easystack.cn>
Date: Fri, 25 Mar 2016 10:54:51 +0800
MIME-Version: 1.0
In-Reply-To: <1458873715-3670-1-git-send-email-baiyaowei@cmss.chinamobile.com>
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

ccing: Brian and Richard

Hi Yao,
     Is that really necessary? I am not sure how much benefit we can 
achieve from this change.
Could you explain more?

Yang

On 03/25/2016 10:41 AM, Yaowei Bai wrote:
> This series only make several funcitons return bool to improve
> readability, no other funcitonal changes.
>
> Yaowei Bai (5):
>    drivers/mtd: mtd_is_partition can be boolean
>    drivers/mtd: cfi_interleave_supported can be boolean
>    drivers/mtd: map_bankwidth_supported can be boolean
>    drivers/mtd: mtd_nand_has_bch can be boolean
>    drivers/mtd/nand: nand_opcode_8bits can be boolean
>
>   drivers/mtd/mtdpart.c          | 6 +++---
>   include/linux/mtd/cfi.h        | 6 +++---
>   include/linux/mtd/map.h        | 6 +++---
>   include/linux/mtd/nand.h       | 6 +++---
>   include/linux/mtd/nand_bch.h   | 4 ++--
>   include/linux/mtd/partitions.h | 2 +-
>   6 files changed, 15 insertions(+), 15 deletions(-)
>
