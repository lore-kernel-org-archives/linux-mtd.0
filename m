Received: from mail-ye0-x22f.google.com ([2607:f8b0:4002:c04::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOuA2-0002tY-Lx
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 18:50:07 +0000
Received: by mail-ye0-f175.google.com with SMTP id q8so33802yen.20
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 11:49:42 -0700 (PDT)
Date: Wed, 25 Sep 2013 11:42:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 2/4] mtd:nand:omap2: clean-up BCHx_HW and BCHx_SW
 ECC configurations in device_probe
Message-ID: <20130925184221.GC23337@ld-irv-0074.broadcom.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-3-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378986619-26765-3-git-send-email-pekon@ti.com>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, dedekind1@gmail.com,
 tony@atomide.com, avinashphilipk@gmail.com, balbi@ti.com,
 linux-mtd@lists.infradead.org, olof@lixom.net, benoit.cousson@linaro.org,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Thu, Sep 12, 2013 at 05:20:17PM +0530, Pekon Gupta wrote:
> OMAP NAND driver support multiple ECC scheme, which can used in following
> different flavours, depending on in-build Hardware engines supported by SoC.
> 
> +---------------------------------------+---------------+---------------+
> | ECC scheme                            |ECC calculation|Error detection|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_HAMMING_CODE_HW               |H/W (GPMC)     |S/W            |
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_BCH8_CODE_HW_DETECTION_SW     |H/W (GPMC)     |S/W            |
> |(requires CONFIG_MTD_NAND_ECC_BCH)     |               |               |
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_BCH8_CODE_HW                  |H/W (GPMC)     |H/W (ELM)      |
> |(requires CONFIG_MTD_NAND_OMAP_BCH &&  |               |               |
> | ti,elm-id in DT)                      |               |               |
> +---------------------------------------+---------------+---------------+
> To optimize footprint of omap2-nand driver, selection of some ECC schemes
> also require enabling following Kconfigs, in addition to setting appropriate
> DT bindings
> - Kconfig:CONFIG_MTD_NAND_ECC_BCH        enables S/W based BCH ECC algorithm
> - Kconfig:CONFIG_MTD_NAND_OMAP_BCH       enables H/W based BCH ECC algorithm
> 
> This patch

... does too many unrelated things in a single patch. I am not
comfortable taking large amounts of refactoring mixed in with Kconfig
and #ifdef changes. Can you please separate the steps you list below
into multiple patches and describe each one? I think you are doing many
trivial things, but it's difficult to separate the noise out from the
substantial changes.

Or, you can wait even longer until I have more time to kill :)

> - removes OMAP_ECC_HAMMING_CODE_DEFAULT and OMAP_ECC_HAMMING_CODE_HW_ROMCODE
> - separates the configurations for other ECC schemes
> - fixes dependency issues based on Kconfig options
> - updates ELM device detection in is_elm_present()
> - cleans redundant code

Brian
