From: Marek Vasut <marex@denx.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH linux-next v5 3/5] mtd: spi-nor: allow to tune the number
 of dummy cycles
Date: Wed, 26 Aug 2015 16:39:02 +0200
Cc: nicolas.ferre@atmel.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 beanhuo@micron.com, juhosg@openwrt.org, shijie.huang@intel.com,
 ben@decadent.org.uk, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux-mtd@lists.infradead.org
References: <cover.1440580764.git.cyrille.pitchen@atmel.com>
 <4324f398c0e69e3057e7da6a1a3e0328b44f224f.1440580764.git.cyrille.pitchen@atmel.com>
In-Reply-To: <4324f398c0e69e3057e7da6a1a3e0328b44f224f.1440580764.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508261639.02377.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, August 26, 2015 at 02:30:25 PM, Cyrille Pitchen wrote:
> The number of dummy cycles used during Fast Read commands can be reduced
> to improve transfer performances. Each manufacturer has a dedicated set of
> registers to provide the memory with the exact number of dummy cycles it
> should expect. Both the memory and the (Q)SPI controller must agree on
> this number of dummy cycles.
> 
> The number of dummy cycles can be found into the memory datasheet and
> mostly depends on the SPI clock frequency, the Fast Read op code and the
> Single/Dual Data Rate mode.
> 
> Probing JEDEC Serial Flash Discoverable Parameters (SFDP) tables would
> only provide the driver with a high enough number of dummy cycles for each
> Fast Read command to be used for all clock frequencies: this solution
> would not be optimized.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
