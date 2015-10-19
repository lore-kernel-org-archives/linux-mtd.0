Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zo4ZA-00018L-GL
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2015 07:09:09 +0000
Subject: Re: [PATCH v3 00/27] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
To: Tony Lindgren <tony@atomide.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
 <560BC0DB.5020205@ti.com> <20151006083346.GL23801@atomide.com>
 <56139A72.6040600@ti.com> <20151006100000.GN23801@atomide.com>
 <56139CE9.8020002@ti.com> <5613A256.8000105@ti.com>
 <20151006110134.GO23801@atomide.com> <5613ABEF.9000904@ti.com>
 <20151016212510.GF24370@atomide.com>
CC: <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <nsekhar@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <fcooper@ti.com>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <562496DB.4050803@ti.com>
Date: Mon, 19 Oct 2015 10:08:11 +0300
MIME-Version: 1.0
In-Reply-To: <20151016212510.GF24370@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17/10/15 00:25, Tony Lindgren wrote:
> * Roger Quadros <rogerq@ti.com> [151006 04:13]:
>>
>> Fine. The updated series is now at
>>
>> git@github.com:rogerq/linux.git
>>  * [new branch]      for-v4.4/gpmc-v4
> 
> Looks like it produces some build errors, this with RMKs 3430 and 4430
> only .configs:
> 
> drivers/memory/omap-gpmc.c:2035:43: error: ‘struct gpio_chip’ has no
> member named ‘irqdomain’
> drivers/memory/omap-gpmc.c:2116:8: error: implicit declaration of
> function ‘gpiochip_irqchip_add’ [-Werror=implicit-function-declaration]
> 

Good catch. We'll have to select GPIOLIB_IRQCHIP for this driver.

> Maybe run randconfig builds on it for overnight?

OK. I'll do that.

> 
> Other than that your series seems to behave for me now, so feel
> free to add:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>

Thanks for the tests :)

cheers,
-roger
