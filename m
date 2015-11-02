From: Marek Vasut <marex@denx.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH linux-next 0/4] mtd: spi-nor: fix Quad SPI memory support
Date: Mon, 2 Nov 2015 02:07:56 +0100
Cc: nicolas.ferre@atmel.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 beanhuo@micron.com, juhosg@openwrt.org, ben@decadent.org.uk,
 jogo@openwrt.org, jteki@openedev.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux-mtd@lists.infradead.org
References: <cover.1442590224.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1442590224.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201511020207.57031.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, September 18, 2015 at 05:49:24 PM, Cyrille Pitchen wrote:
> Hi all,

Hi!

> this series of patches fixes the QSPI support mostly for Micron and
> Macronix memories. There are also some updates for Spansion memories.
> There are also many comments to explain the implementation choices based
> on the datasheets from memory manufacturers.
> 
> The series was backported to a at91-4.1 kernel then tested on a sama5d2
> xplained board, which embeds a at25df321a memory on a SPI controller and
> a Micron n25q128a13 QSPI memory on the new Atmel QSPI controller.
> 
> The at25 memory was used to check non regression on the m25p80 driver
> whereas the Micron memory was used to test the fixes of the spi-nor
> framework. The driver for the Atmel QSPI controller will be sent in a
> dedicated series.

Are there any news on this patch series? I'd like to use that for my own
QSPI driver (the Cadence one), so I'd like to check on the status. Are you
still working on this please ?

Thanks!

Best regards,
Marek Vasut
