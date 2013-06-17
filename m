Received: from softlayer.compulab.co.il ([50.23.254.55] helo=compulab.co.il)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UoSO0-0005M1-RQ
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2013 05:53:53 +0000
Message-ID: <51BEA455.2020605@compulab.co.il>
Date: Mon, 17 Jun 2013 08:53:25 +0300
From: Igor Grinberg <grinberg@compulab.co.il>
MIME-Version: 1.0
To: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: [PATCH 0/5] mtd: nand: Fixes and improvements on pxa3xx
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Lei Wen <leiwen@marvell.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Maen Suleiman <maen@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Neil Zhang <zhangwm@marvell.com>, Chao Xie <cxie4@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On 05/14/13 14:15, Ezequiel Garcia wrote:
> The Armada 370 and Armada XP SoC include a NAND controller (NFCv2) that
> is similar to the one in PXA SoC. Therefore, it should be possible to support
> Armada NAND using pxa3xx-nand driver.
> 
> While this effort is not ready yet, here is a set of patches that are needed
> for such work.
> 
> A small summary of the patches:
> 
>   * 1/5 is a fix for a 2-year regression that removed DMA support.
> 
>   * 2/5 and 3/5 are needed to build the driver on platforms other PXA.
> 
>   * 4/5 and 5/5 add ONFI-compliant device detection and are needed
>     to successfully probe newer flash devices.
> 
> Applies cleanly on top of l2-mtd.git.
> 
> Thanks!
> 
> Ezequiel Garcia (5):
>   mtd: nand: pxa3xx: Set info->use_dma properly
>   mtd: nand: pxa3xx: Use of_machine_is_compatible()
>   mtd: nand: pxa3xx: Fix MODULE_DEVICE_TABLE declaration
>   mtd: nand: pxa3xx: Add address support for READID command
>   mtd: nand: pxa3xx: Add support for Read parameter page command

tested on cm-x300, upstream 3.10-rc5 and no regressions seen.

Tested-by: Nikita Kiryanov <nikita@compulab.co.il>
Acked-by: Igor Grinberg <grinberg@compulab.co.il>

> 
>  drivers/mtd/nand/pxa3xx_nand.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 

-- 
Regards,
Igor.
