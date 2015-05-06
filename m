Received: from mout.kundenserver.de ([212.227.126.187])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yq4ph-0008Oe-Ml
 for linux-mtd@lists.infradead.org; Wed, 06 May 2015 19:18:14 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 03/10] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Date: Wed, 06 May 2015 21:17:36 +0200
Message-ID: <2114576.uWbXPVDdyI@wuerfel>
In-Reply-To: <1430935194-7579-4-git-send-email-computersforpeace@gmail.com>
References: <1430935194-7579-1-git-send-email-computersforpeace@gmail.com>
 <1430935194-7579-4-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Dan Ehrenberg <dehrenberg@chromium.org>,
 Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, Gregory Fong <gregory.0xf0@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 06 May 2015 10:59:47 Brian Norris wrote:
> +
> +static inline u32 nand_readreg(struct brcmnand_controller *ctrl, u32 offs)
> +{
> +       return __raw_readl(ctrl->nand_base + offs);
> +}
> +
> +static inline void nand_writereg(struct brcmnand_controller *ctrl, u32 offs,
> +                                u32 val)
> +{
> +       __raw_writel(val, ctrl->nand_base + offs);
> +}
> +
> 

You had mentioned previously that there might be an endianess issue in this
driver. I think this won't work on big-endian architectures other than MIPS,
so it would be good to either list in the DT the endianess of the device
and use appropriate accessors here, or hardcode it based on the architecture
(using ioread32_be in big-endian mips, but readl elsewhere).

Using __raw_writel has another problem regarding the DMA capability of this
driver, as it will not flush any write buffers or synchronize caches before
sending data off to the device, so you risk data corruption. Also, the
compiler can choose to split up the 32-bit word access into byte accesses,
which on most hardware does not do what you want.

	Arnd
