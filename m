Received: from lelnx194.ext.ti.com ([198.47.27.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eD4Vt-0004Ip-Kd
 for linux-mtd@lists.infradead.org; Fri, 10 Nov 2017 08:18:11 +0000
Subject: Re: [PATCH v3 2/7] mtd: onenand: omap2: Remove regulator support
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091327.gwshtlsn534tgro4@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <b73dca35-9948-8f3f-7e6b-ed1b20f13ba7@ti.com>
Date: Fri, 10 Nov 2017 10:17:25 +0200
MIME-Version: 1.0
In-Reply-To: <20171109091327.gwshtlsn534tgro4@lenoch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 09/11/17 11:13, Ladislav Michl wrote:
> As no platform data user sets regulator_can_sleep, regulator code is
> no-op and can be deleted.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  Changes:
>  -v2: new patch
>  -v3: none
> 
>  drivers/mtd/onenand/omap2.c | 42 +-----------------------------------------
>  1 file changed, 1 insertion(+), 41 deletions(-)

How about getting rid of regulator_can_sleep from
include/linux/platform_data/mtd-onenand-omap2.h?


> 
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c

<snip>

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
