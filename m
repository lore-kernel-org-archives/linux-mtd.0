Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXbAK-0007xl-Bf
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 19:59:08 +0000
Received: by pabyw6 with SMTP id yw6so74156075pab.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 12:58:47 -0700 (PDT)
Message-ID: <550735D1.7030308@gmail.com>
Date: Mon, 16 Mar 2015 12:58:09 -0700
From: Florian Fainelli <f.fainelli@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[snip]

> +static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
> +			      u32 len, u8 dma_cmd)
> +{
> +	struct brcmnand_controller *ctrl = host->ctrl;
> +	dma_addr_t buf_pa;
> +	int dir = dma_cmd == CMD_PAGE_READ ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +
> +	buf_pa = dma_map_single(ctrl->dev, buf, len, dir);

We are missing a dma_mapping_error() check here.
-- 
Florian
