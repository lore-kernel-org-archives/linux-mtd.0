Message-ID: <4FCF68DE.6000701@antcom.de>
Date: Wed, 06 Jun 2012 16:27:42 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v6] MTD: LPC32xx SLC NAND driver
References: <1338974414-5308-1-git-send-email-stigge@antcom.de>
 <1338989921.6875.50.camel@sauron.fi.intel.com>
In-Reply-To: <1338989921.6875.50.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux@arm.linux.org.uk,
 linux-doc@vger.kernel.org, leiwen@marvell.com,
 devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 06/06/2012 03:38 PM, Artem Bityutskiy wrote:
>> +#else +#define lpc32xx_nand_resume NULL +#define
>> lpc32xx_nand_suspend NULL +#endif
> 
> 0, not NULL.

Can you please point me to an explanation for this? NULL sounds
natural here, since it is used as a pointer, and other nand drivers
are already doing it via NULL:

bcm_umi_nand.c
bf5xx_nand.c
pxa3xx_nand.c
r852.c
s3c2410.c
tmio_nand.c
txx9ndfmc.c

... and none is #defining as 0.

Thanks in advance,

Roland
