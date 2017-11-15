Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEytU-0005a8-54
 for linux-mtd@lists.infradead.org; Wed, 15 Nov 2017 14:42:25 +0000
Subject: Re: [PATCH v4 14/16] mtd: onenand: omap2: Configure driver from DT
To: Ladislav Michl <ladis@linux-mips.org>
CC: <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>, Tony
 Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
 <20171111212742.m5t4rf5k47kikouu@lenoch>
 <27bb610f-b30a-cd4c-ccd5-06c0d9e205b7@ti.com>
 <20171115105357.3jkk5eyxst5limj3@lenoch>
 <d9b85025-4889-106e-e346-115e7d960705@ti.com>
 <20171115112028.b7sbjkmwnu2uzpey@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <d861ecb7-2212-4d8e-7d69-da4a8b9ed840@ti.com>
Date: Wed, 15 Nov 2017 16:41:39 +0200
MIME-Version: 1.0
In-Reply-To: <20171115112028.b7sbjkmwnu2uzpey@lenoch>
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

On 15/11/17 13:20, Ladislav Michl wrote:
> On Wed, Nov 15, 2017 at 01:04:22PM +0200, Roger Quadros wrote:
>> On 15/11/17 12:53, Ladislav Michl wrote:
> [snip]
>>> of_property_read_u32 will fail then, so I do not think it is worth adding
>>> explicit test for NULL here.
>>>
>>
>> But the error message would be wrong in that case.
>> I'm trying to tackle the case where driver was probed using legacy methods
>> where device tree/node isn't present.
> 
> But how could we ever get there in that case? platform_device_register is
> removed just one patch later.
> 
> Of course we should add:
> depends on (OF && GPIOLIB) || COMPILE_TEST
> to the Kconfig
> 

OK.

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
