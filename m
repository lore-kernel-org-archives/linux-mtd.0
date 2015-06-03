Date: Wed, 3 Jun 2015 10:10:59 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 1/6] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Message-ID: <20150603081059.GA6944@breakpoint.cc>
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
…
> +static void vf610_nfc_addr_cycle(struct vf610_nfc *nfc, int column, int page)
> +{
> +	if (column != -1) {
> +		if (nfc->chip.options | NAND_BUSWIDTH_16)
> +			column = column/2;
> +		vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
> +				    COL_ADDR_SHIFT, column);
> +	}
> +	if (page != -1)
> +		vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
> +				    ROW_ADDR_SHIFT, page);
> +}

Do you have here also a different NAND layout on your boot-page vs
remaining pages? The mpc5125 has this different layout.

Sebastian
