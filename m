Message-ID: <4FEEF1D0.5060404@antcom.de>
Date: Sat, 30 Jun 2012 14:32:16 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v10] MTD: LPC32xx MLC NAND driver
References: <1340834129-15545-1-git-send-email-stigge@antcom.de>
 <1340973434.3070.168.camel@sauron.fi.intel.com>
In-Reply-To: <1340973434.3070.168.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux@arm.linux.org.uk,
 Alexandre Pereira da Silva <aletes.xgr@gmail.com>, linux-doc@vger.kernel.org,
 leiwen@marvell.com, devicetree-discuss@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem!

Thanks for the notes!

On 29/06/12 14:37, Artem Bityutskiy wrote:
> Successfully built configuration
> "arm-lpc32xx_defconfig,arm,arm-unknown-linux-gnueabi-", results:
> 
> --- before_patching.log +++ after_patching.log @@ @@ 
> +drivers/mtd/nand/lpc32xx_mlc.c: In function 'lpc32xx_nand_probe': 
> +drivers/mtd/nand/lpc32xx_mlc.c:679:10: warning: variable 'sr' set
> but not used [-Wunused-but-set-variable] 
> +drivers/mtd/nand/lpc32xx_mlc.c:561:24: error: bad constant
> expression [sparse]

This is because sparse doesn't understand this local variable:

uint8_t buf[mtd->writesize];

(but gcc does).

Are you sure we need to support sparse?

The above construction is quite convenient for this case and I'd
prefer this to allocating another buffer dynamically.

Thanks in advance,

Roland
