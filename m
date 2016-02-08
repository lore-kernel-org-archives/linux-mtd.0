Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aSjri-00014s-MP
 for linux-mtd@lists.infradead.org; Mon, 08 Feb 2016 11:20:25 +0000
Subject: Re: [PATCH V8 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
To: Marek Vasut <marex@denx.de>
References: <1452486886-8049-1-git-send-email-marex@denx.de>
 <201602041225.11679.marex@denx.de> <56B38AB3.3070801@ti.com>
 <201602060842.38290.marex@denx.de>
CC: Brian Norris <computersforpeace@gmail.com>, Rob Herring <robh@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Graham Moore <grmoore@opensource.altera.com>,
 Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <56B879BD.2070608@ti.com>
Date: Mon, 8 Feb 2016 16:49:25 +0530
MIME-Version: 1.0
In-Reply-To: <201602060842.38290.marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 02/06/2016 01:12 PM, Marek Vasut wrote:
> On Thursday, February 04, 2016 at 06:30:27 PM, R, Vignesh wrote:
>> On 2/4/2016 4:55 PM, Marek Vasut wrote:

[...]

>> Yeah, there is delay(of few ns) required between writing to
>> INDIRECTWR_START bit and actually writing data to flash(i.e writesl()
>> call). This is specific to TI K2G SoC and needs to be tied to the new
>> binding.
> 
> Can't you somehow poll the hardware to check whether or not it's ready instead
> of adding some random delay ?

There is no dedicated register to poll as such.

According to TRM:
"Wait for couple of cycles of QSPI_REF_CLK(functional clock of QSPI
@384MHz) until CQSPI_REG_INDIRECTWR[0] bit is internally synchronized by
the QSPI module before writing to flash".

So, a few ns(~6ns @384MHz) delay is needed (or accessing a QSPI module
register should be sufficient as it will take more than 2 clock cycles).
I believe this delay is specific to TI K2G SoC and maybe needs to be
tied to the binding.


-- 
Regards
Vignesh
