Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUhXf-0004JM-Eb
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 18:34:29 +0000
Date: Fri, 11 Oct 2013 11:33:45 -0700
From: Tony Lindgren <tony@atomide.com>
To: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v8 1/6] mtd: nand: omap: combine different flavours of
 1-bit hamming ecc schemes
Message-ID: <20131011183344.GY29913@atomide.com>
References: <1381498603-15715-1-git-send-email-pekon@ti.com>
 <1381498603-15715-2-git-send-email-pekon@ti.com>
 <20131011155535.GQ25706@radagast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131011155535.GQ25706@radagast>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, arnd@arndb.de, Pawel.Moll@arm.com,
 dedekind1@gmail.com, ijc+devicetree@hellion.org.uk, avinashphilipk@gmail.com,
 robherring2@gmail.com, Pekon Gupta <pekon@ti.com>, bcousson@baylibre.com,
 swarren@wwwdotorg.org, olof@lixom.net, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Felipe Balbi <balbi@ti.com> [131011 09:04]:
> On Fri, Oct 11, 2013 at 07:06:38PM +0530, Pekon Gupta wrote:
> > OMAP NAND driver currently supports multiple flavours of 1-bit Hamming
> > ecc-scheme, like:
> > - OMAP_ECC_HAMMING_CODE_DEFAULT
> > 	1-bit hamming ecc code using software library
> > - OMAP_ECC_HAMMING_CODE_HW
> > 	1-bit hamming ecc-code using GPMC h/w engine
> > - OMAP_ECC_HAMMING_CODE_HW_ROMCODE
> > 	1-bit hamming ecc-code using GPMC h/w engin with ecc-layout compatible
> > 	to ROM code.
> > 
> > This patch combines above multiple ecc-schemes into single implementation:
> > - OMAP_ECC_HAM1_CODE_HW
> > 	1-bit hamming ecc-code using GPMC h/w engine with ROM-code compatible
> > 	ecc-layout.
> > 
> > Signed-off-by: Pekon Gupta <pekon@ti.com>
> 
> Reviewed-by: Felipe Balbi <balbi@ti.com>

This one looks safe to queue via the MTD tree for the arch/arm/*omap* parts:

Acked-by: Tony Lindgren <tony@atomide.com>
