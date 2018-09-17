Date: Mon, 17 Sep 2018 13:37:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Cc: linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org, computersforpeace@gmail.com,
 frieder.schrempf@exceet.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] spi: spi-mem: Add driver for NXP FlexSPI controller
Message-ID: <20180917133751.453ea6ed@bbrezillon>
In-Reply-To: <1537177710-9379-2-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1537177710-9379-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1537177710-9379-2-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yogesh,

On Mon, 17 Sep 2018 15:18:26 +0530
Yogesh Gaur <yogeshnarayan.gaur@nxp.com> wrote:

> +
> +	/*
> +	 * R/W functions for big- or little-endian registers:
> +	 * The FSPI controller's endianness is independent of
> +	 * the CPU core's endianness. So far, although the CPU
> +	 * core is little-endian the FSPI controller can use
> +	 * big-endian or little-endian.
> +	 */
> +	if (of_property_read_bool(np, "big-endian")) {
> +		f->write = fspi_writel_be;
> +		f->read = fspi_readl_be;
> +	} else {
> +		f->write = fspi_writel;
> +		f->read = fspi_readl;
> +	}

Hm, isn't it something you can extract from the compatible string? I'd
rather not allow users to set that in their DT if it's not something
you can change.

Regards,

Boris
