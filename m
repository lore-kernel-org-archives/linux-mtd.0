Date: Tue, 25 Aug 2015 13:34:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, sebastian@breakpoint.cc, robh+dt@kernel.org,
 pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 shawn.guo@linaro.org, kernel@pengutronix.de,
 boris.brezillon@free-electrons.com, marb@ixxat.de,
 aaron@tastycactus.com, bpringlemeir@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 albert.aribaud@3adev.fr, klimov.linux@gmail.com,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH v10 1/5] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Message-ID: <20150825203412.GM81844@google.com>
References: <1438594050-4595-1-git-send-email-stefan@agner.ch>
 <1438594050-4595-2-git-send-email-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438594050-4595-2-git-send-email-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One more thing...

On Mon, Aug 03, 2015 at 11:27:26AM +0200, Stefan Agner wrote:
> --- /dev/null
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -0,0 +1,645 @@
...
> +struct vf610_nfc {
> +	struct mtd_info mtd;
> +	struct nand_chip chip;
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct completion cmd_done;
> +	uint buf_offset;
> +	int page_sz;

AFAICT (even with the 2nd patch), you never really use this field. You
just set it/increment it, but don't use it for anything. Kill it?

> +	/* Status and ID are in alternate locations. */
> +	int alt_buf;
> +#define ALT_BUF_ID   1
> +#define ALT_BUF_STAT 2
> +#define ALT_BUF_ONFI 3
> +	struct clk *clk;
> +};

Brian
