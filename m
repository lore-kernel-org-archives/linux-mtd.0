Received: from moutng.kundenserver.de ([212.227.17.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuMju-0006iX-PF
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 13:04:56 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v4 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
Date: Wed, 3 Jul 2013 15:03:49 +0200
References: <1372764757-29511-1-git-send-email-pekon@ti.com>
In-Reply-To: <1372764757-29511-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201307031503.50033.arnd@arndb.de>
Cc: sfr@canb.auug.org.au, jp.francois@cynove.com, tony@atomide.com,
 artem.bityutskiy@linux.intel.com, devicetree-discuss@lists.ozlabs.org,
 avinashphilipk@gmail.com, balbi@ti.com, linux-mtd@lists.infradead.org,
 olof@lixom.net, benoit.cousson@linaro.org, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 02 July 2013, Pekon Gupta wrote:
> (+ CC: devicetree-discuss@lists.ozlabs.org)
> 
> Changes v3 -> v4
> - [Patch 1/3] removed MTD_NAND_OMAP_BCH8 & MTD_NAND_OMAP_BCH4 from nand/Kconfig
> 	ECC scheme selectable via nand DT (nand-ecc-opt).
> - [*] rebased for l2-mtd.git

Do you also fix these build error?

/git/arm-soc/drivers/mtd/nand/omap2.c: In function 'omap_nand_probe':
/git/arm-soc/drivers/mtd/nand/omap2.c:1964:7: error: 'OMAP_ECC_BCH8_CODE_HW_DETECTION_SW' undeclared (first use in this function)
  case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
       ^
/git/arm-soc/drivers/mtd/nand/omap2.c:1964:7: note: each undeclared identifier is reported only once for each function it appears in
/git/arm-soc/drivers/mtd/nand/omap2.c:1991:7: error: 'OMAP_ECC_BCH4_CODE_HW_DETECTION_SW' undeclared (first use in this function)
  case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
       ^


	Arnd
