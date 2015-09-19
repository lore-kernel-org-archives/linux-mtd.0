From: Marek Vasut <marex@denx.de>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH linux-next 1/4] mtd: spi-nor: remove unused
 read_xfer/write_xfer hooks
Date: Sat, 19 Sep 2015 05:08:55 +0200
Cc: nicolas.ferre@atmel.com, broonie@kernel.org, linux-spi@vger.kernel.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, zajec5@gmail.com,
 beanhuo@micron.com, juhosg@openwrt.org, ben@decadent.org.uk,
 jogo@openwrt.org, jteki@openedev.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux-mtd@lists.infradead.org
References: <cover.1442590224.git.cyrille.pitchen@atmel.com>
 <719ad7cc8bf6df151dd799cd4f13292fd9471079.1442590224.git.cyrille.pitchen@atmel.com>
In-Reply-To: <719ad7cc8bf6df151dd799cd4f13292fd9471079.1442590224.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201509190508.55496.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, September 18, 2015 at 05:49:25 PM, Cyrille Pitchen wrote:
> struct spi_nor_xfer_cfg and read_xfer/write_xfer hooks were never used by
> any driver. Do some cleanup by removing them.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>

Right, if this will ever be needed, it can be re-added.

Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
