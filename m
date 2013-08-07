Message-ID: <52026EE1.6000606@gmail.com>
Date: Wed, 07 Aug 2013 17:59:29 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 07/20] spi: spi-pxa2xx: remove legacy PXA DMA bits
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-8-git-send-email-zonque@gmail.com>
 <20130807155549.GE6427@sirena.org.uk>
In-Reply-To: <20130807155549.GE6427@sirena.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07.08.2013 17:55, Mark Brown wrote:
> On Wed, Aug 07, 2013 at 05:33:56PM +0200, Daniel Mack wrote:
>> Generic DMA support was already implemented by commit cd7bed00
>> ("spi/pxa2xx: break out the private DMA API usage into a separate
>> file") which moved all the legacy PXA DMA implementation code into
>> its own file.
> 
> Acked-by: Mark Brown <broonie@linaro.org>

Thanks.

> though this will have some trivial merge issues until the merge window
> they shouldn't be a problem.

Given the number of patches that need testing, I doubt this will hit the
3.12 window. But let's see :)


Daniel
