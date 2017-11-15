Received: from fllnx210.ext.ti.com ([198.47.19.17])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEvC5-0001T9-V3
 for linux-mtd@lists.infradead.org; Wed, 15 Nov 2017 10:45:23 +0000
Subject: Re: [PATCH v4 12/16] mtd: onenand: omap2: Enable DMA by default
To: Ladislav Michl <ladis@linux-mips.org>
CC: <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>, Tony
 Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
 <20171111212442.ucbatglvqeoiqb72@lenoch>
 <d2cd7de6-744c-6944-70d6-276a8530b6f5@ti.com>
 <20171115103209.b2wolfglkrwdjfku@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <dc310c57-d1fc-8f09-3fde-64a45ab8bd1c@ti.com>
Date: Wed, 15 Nov 2017 12:44:46 +0200
MIME-Version: 1.0
In-Reply-To: <20171115103209.b2wolfglkrwdjfku@lenoch>
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

On 15/11/17 12:32, Ladislav Michl wrote:
> On Wed, Nov 15, 2017 at 12:08:05PM +0200, Roger Quadros wrote:
>> Hi,
>>
>> On 11/11/17 23:24, Ladislav Michl wrote:
>>> DMA and R/B pin are independent on each other. Use DMA by default.
>>
>> Is there a R/B pin on Onenand? It looks more like it has a RDY pin and
>> an INT pin (which is used for command completion interrupt).
> 
> (See also my previous answer) Yes, there's RDY and INT pin. I tried to use
> the same scheme as NAND is using, but perhaps it doesn't fit too well here.
> Therefore I'm proposing to keep INT pin name and use int-gpios in DT
> bindings. Suggestions?

Yes, I think that is better too.

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
