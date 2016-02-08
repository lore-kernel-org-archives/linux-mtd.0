Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aSnjw-000054-4l
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2016 15:28:40 +0000
From: Marek Vasut <marex@denx.de>
To: Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
Date: Mon, 8 Feb 2016 16:27:57 +0100
Cc: Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602060842.38290.marex@denx.de> <56B879BD.2070608@ti.com>
In-Reply-To: <56B879BD.2070608@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201602081627.57666.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, February 08, 2016 at 12:19:25 PM, Vignesh R wrote:
> On 02/06/2016 01:12 PM, Marek Vasut wrote:
> > On Thursday, February 04, 2016 at 06:30:27 PM, R, Vignesh wrote:
> >> On 2/4/2016 4:55 PM, Marek Vasut wrote:
> [...]
> 
> >> Yeah, there is delay(of few ns) required between writing to
> >> INDIRECTWR_START bit and actually writing data to flash(i.e writesl()
> >> call). This is specific to TI K2G SoC and needs to be tied to the new
> >> binding.
> > 
> > Can't you somehow poll the hardware to check whether or not it's ready
> > instead of adding some random delay ?
> 
> There is no dedicated register to poll as such.
> 
> According to TRM:
> "Wait for couple of cycles of QSPI_REF_CLK(functional clock of QSPI
> @384MHz) until CQSPI_REG_INDIRECTWR[0] bit is internally synchronized by
> the QSPI module before writing to flash".
> 
> So, a few ns(~6ns @384MHz) delay is needed (or accessing a QSPI module
> register should be sufficient as it will take more than 2 clock cycles).
> I believe this delay is specific to TI K2G SoC and maybe needs to be
> tied to the binding.

OK, got it. Dinh/Graham, can you check if this might be needed on SoCFPGA too 
please?

Best regards,
Marek Vasut
