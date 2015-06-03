Date: Wed, 3 Jun 2015 15:08:25 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 1/6] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Message-ID: <20150603130825.GA23991@breakpoint.cc>
References: <1427300909-20825-1-git-send-email-stefan@agner.ch>
 <1427300909-20825-2-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1427300909-20825-2-git-send-email-stefan@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, pawel.moll@arm.com, marb@ixxat.de,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 shawn.guo@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, bpringlemeir@nbsps.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-03-25 17:28:24 [+0100], Stefan Agner wrote:
> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
> new file mode 100644
> index 0000000..23c1510
> --- /dev/null
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -0,0 +1,686 @@
…
> +static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
> +{
> +	return readl(nfc->regs + reg);
> +}
> +
> +static inline void vf610_nfc_write(struct vf610_nfc *nfc, uint reg, u32 val)
> +{
> +	writel(val, nfc->regs + reg);
> +}
…

> +static void vf610_nfc_send_command(struct vf610_nfc *nfc, u32 cmd_byte1,
> +				   u32 cmd_code)
> +{
> +	void __iomem *reg = nfc->regs + NFC_FLASH_CMD2;
> +	u32 tmp;
> +
> +	vf610_nfc_clear_status(nfc);
> +
> +	tmp = __raw_readl(reg);
> +	tmp &= ~(CMD_BYTE1_MASK | CMD_CODE_MASK | BUFNO_MASK);
> +	tmp |= cmd_byte1 << CMD_BYTE1_SHIFT;
> +	tmp |= cmd_code << CMD_CODE_SHIFT;
> +	__raw_writel(tmp, reg);
> +}

Why readl() vs __raw_readl() dito for write?
vf610_nfc_{read|write} is good since for PPC we would need out_be32()
here instead.
It would be nice if you could abstract the __raw_ once as well. And I am
not sure if you need those at all since the former functions should work
here just fine.

Sebastian
