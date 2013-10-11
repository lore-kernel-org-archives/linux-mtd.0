Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUhWJ-000364-Tz
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 18:33:04 +0000
Date: Fri, 11 Oct 2013 11:32:34 -0700
From: Tony Lindgren <tony@atomide.com>
To: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v8 2/6] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Message-ID: <20131011183234.GX29913@atomide.com>
References: <1381498603-15715-1-git-send-email-pekon@ti.com>
 <1381498603-15715-3-git-send-email-pekon@ti.com>
 <20131011155527.GP25706@radagast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131011155527.GP25706@radagast>
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

* Felipe Balbi <balbi@ti.com> [131011 09:03]:
> On Fri, Oct 11, 2013 at 07:06:39PM +0530, Pekon Gupta wrote:
> > OMAP NAND driver support multiple ECC scheme, which can used in following
> > different flavours, depending on in-build Hardware engines supported by SoC.
> > 
> > +---------------------------------------+---------------+---------------+
> > | ECC scheme                            |ECC calculation|Error detection|
> > +---------------------------------------+---------------+---------------+
> > |OMAP_ECC_HAM1_CODE_HW                  |H/W (GPMC)     |S/W            |
> > +---------------------------------------+---------------+---------------+
> > |OMAP_ECC_BCH8_CODE_HW_DETECTION_SW     |H/W (GPMC)     |S/W            |
> > |(requires CONFIG_MTD_NAND_ECC_BCH)     |               |               |
> > +---------------------------------------+---------------+---------------+
> > |OMAP_ECC_BCH8_CODE_HW                  |H/W (GPMC)     |H/W (ELM)      |
> > |(requires CONFIG_MTD_NAND_OMAP_BCH &&  |               |               |
> > | ti,elm-id in DT)                      |               |               |
> > +---------------------------------------+---------------+---------------+
> > To optimize footprint of omap2-nand driver, selection of some ECC schemes
> > also require enabling following Kconfigs, in addition to setting appropriate
> > DT bindings
> > - Kconfig:CONFIG_MTD_NAND_ECC_BCH        error detection done in software
> > - Kconfig:CONFIG_MTD_NAND_OMAP_BCH       error detection done by h/w engine
> > 
> > DT binding updates in this patch are:
> > - ti,elm-id: replaces elm_id
> > - ti,nand-ecc-opts: supported values ham1, bch4, and bch8
> > 	selection of h/w or s/w implementation depends on ti,elm-id
> > 
> > Signed-off-by: Pekon Gupta <pekon@ti.com>
> 
> since this maintains backwards compatibility, I think it should be
> alright to apply
> 
> Reviewed-by: Felipe Balbi <balbi@ti.com>

This patch looks safe to queue via the MTD tree for the arch/arm/*omap*
parts in this patch:

Acked-by: Tony Lindgren <tony@atomide.com>
