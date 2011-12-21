Subject: Re: [PATCH v2 5/7] MTD: NAND: ams-delta: use GPIO instead of custom
 I/O
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
Date: Wed, 21 Dec 2011 22:56:50 +0200
In-Reply-To: <ebab42f6ddd313afb38b71880ac7865e4e0ceab4.1324331816.git.jkrzyszt@tis.icnet.pl>
References: <1323634328-856-1-git-send-email-jkrzyszt@tis.icnet.pl>
 <ebab42f6ddd313afb38b71880ac7865e4e0ceab4.1324331816.git.jkrzyszt@tis.icnet.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1324501012.2110.2.camel@koala>
Mime-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-12-20 at 00:08 +0100, Janusz Krzysztofik wrote:
> Don't use Amstrad Delta custom I/O functions for controlling the device,
> use GPIO API instead.
> 
> While being at it, add missing gpio_free(AMS_DELTA_GPIO_PIN_NAND_RB).
> 
> Depends on patch 2/7 "ARM: OMAP1: ams-delta: convert latches to
> basic_mmio_gpio"
> 
> Signed-off-by: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Tony Lindgren <tony@atomide.com>

Looks good, thanks!

Reviewed-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
