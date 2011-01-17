Received: from mail.bluewatersys.com ([202.124.120.130]
	helo=hayes.bluewaternz.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PewjH-0005hq-4z
	for linux-mtd@lists.infradead.org; Mon, 17 Jan 2011 21:35:12 +0000
Message-ID: <4D34B614.3000909@bluewatersys.com>
Date: Tue, 18 Jan 2011 10:35:16 +1300
From: Ryan Mallon <ryan@bluewatersys.com>
MIME-Version: 1.0
To: Hong Xu <hong.xu@atmel.com>
Subject: Re: [PATCH] MTD: atmel_nand: Add DMA support to access Nandflash
References: <hong.xu@atmel.com>
	<1295248809-30334-2-git-send-email-hong.xu@atmel.com>
In-Reply-To: <1295248809-30334-2-git-send-email-hong.xu@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: nicolas.ferre@atmel.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, jamie@jamieiles.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/17/2011 08:20 PM, Hong Xu wrote:
> Some SAM9 chips have the ability to perform DMA between CPU and SMC controller.
> This patch adds DMA support for SAM9RL, SAM9G45, SSAM9G46,AM9M10, SAM9M11.
> 
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> ---

One more comment:

> +	if (cpu_has_dma() && use_dma) {
> +		dma_cap_mask_t mask;
> +
> +		dma_cap_zero(mask);
> +		dma_cap_set(DMA_MEMCPY, mask);
> +		host->dma_chan = dma_request_channel(mask, 0, NULL);
> +
> +		if (!host->dma_chan) {
> +			dev_err(host->dev, "Failed to request DMA channel\n");
> +			host->dma_ready = 0;

Because host is kzalloc'ed above, you do not need to set host->dma_ready
to zero here.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

Ryan Mallon         		5 Amuri Park, 404 Barbadoes St
ryan@bluewatersys.com         	PO Box 13 889, Christchurch 8013
http://www.bluewatersys.com	New Zealand
Phone: +64 3 3779127		Freecall: Australia 1800 148 751
Fax:   +64 3 3779135			  USA 1800 261 2934
