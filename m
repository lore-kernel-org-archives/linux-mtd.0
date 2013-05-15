Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcYYu-0004v9-Jd
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 10:03:57 +0000
Message-ID: <1368612357.15764.26.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v5 00/11] mtd: add datasheet's ECC information to
 nand_chip{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Date: Wed, 15 May 2013 13:05:57 +0300
In-Reply-To: <1368607232-2210-1-git-send-email-b32955@freescale.com>
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-15 at 16:40 +0800, Huang Shijie wrote:
> 1.) Why add the ECC information to the nand_chip{} ?
>    Each nand chip has its requirement for the ECC correctability, such as
>    "4bit ECC for each 512Byte" or "40bit ECC for each 1024Byte".
>    This ECC info is very important to the nand controller, such as gpmi.
> 
>    Take the Micron MT29F64G08CBABA for example, its geometry is
>    8k page size, 744 bytes oob size and it requires 40bit ECC per 1K bytes.
>    If we do not provide the ECC info to the gpmi nand driver, it has to
>    calculate the ECC correctability itself. The gpmi driver will gets the 56bit
>    ECC for per 1K bytes which is beyond its BCH's 40bit ecc capibility.
>    The gpmi will quits in this case. But in actually, the gpmi can supports
>    this nand chip if it can get the right ECC info.

Thanks. Brian has disappeared, may be busy, but I would still like to
wait for his response. At the very least, I would like to make sure he
does not object.

-- 
Best Regards,
Artem Bityutskiy
