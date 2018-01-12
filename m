Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZzpp-0003CO-EO
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 13:57:31 +0000
Subject: Re: [PATCH v6 12/14] mtd: onenand: omap2: Decouple DMA enabling from
 INT pin availability
From: Roger Quadros <rogerq@ti.com>
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Peter Ujfalusi
 <peter.ujfalusi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>
References: <20180112131105.GA13810@lenoch> <20180112131657.GM13810@lenoch>
 <7d2a452b-3f0e-0ffb-5636-a26d1a903e88@ti.com>
Message-ID: <bed28644-2df3-26e4-2261-6aa96b7f2aa3@ti.com>
Date: Fri, 12 Jan 2018 15:56:55 +0200
MIME-Version: 1.0
In-Reply-To: <7d2a452b-3f0e-0ffb-5636-a26d1a903e88@ti.com>
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



On 12/01/18 15:46, Roger Quadros wrote:
> On 12/01/18 15:16, Ladislav Michl wrote:
>> INT pin (gpio_irq) is not really needed for DMA but only for notification
>> when a command that needs wait has completed. DMA memcpy can be still used
>> even without gpio_irq available, so enable it unconditionally.
>>
>> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
>> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>> Tested-by: Tony Lindgren <tony@atomide.com>
>> Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
> 

oops. sorry.

Acked-by: Roger Quadros <rogerq@ti.com>


-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
