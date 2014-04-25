Received: from mail-by2lp0244.outbound.protection.outlook.com
 ([207.46.163.244] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdVWX-0008BX-26
 for linux-mtd@lists.infradead.org; Fri, 25 Apr 2014 02:05:58 +0000
Message-ID: <5359C361.9000302@freescale.com>
Date: Fri, 25 Apr 2014 10:07:29 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: Add support to use nand_base poi databuf
 as bounce buffer
References: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2014年04月25日 05:40, Kamal Dasu 写道:
> + * This option is defined to protect against kmapped buffers
> + * being passed from highmem when using DMA
the dma API can not support the highmem.

could you show us how do the driver use the highmem buffer?

In the gpmi driver, i do a memcpy for the highmem buffer passed from 
upper layer.

thanks
Huang Shijie
