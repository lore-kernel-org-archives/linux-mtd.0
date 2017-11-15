Received: from lelnx193.ext.ti.com ([198.47.27.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEvDn-0003In-L6
 for linux-mtd@lists.infradead.org; Wed, 15 Nov 2017 10:47:10 +0000
Subject: Re: [PATCH v4 15/16] ARM: OMAP2+: Remove gpmc-onenand
To: Ladislav Michl <ladis@linux-mips.org>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171111211206.465pgorrjp3eyix6@lenoch>
 <20171111212904.2qti2txasbsmmjw7@lenoch>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <9bc361d9-d21a-3ffc-e6b7-0f254b54ed56@ti.com>
Date: Wed, 15 Nov 2017 12:46:31 +0200
MIME-Version: 1.0
In-Reply-To: <20171111212904.2qti2txasbsmmjw7@lenoch>
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

On 11/11/17 23:29, Ladislav Michl wrote:
> As OneNAND driver is now using devicetree gpmc-onenand and its
> platform data is unused and can be removed.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>

Acked-by: Roger Quadros <rogerq@ti.com>

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
