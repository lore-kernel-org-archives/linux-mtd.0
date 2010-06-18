MIME-Version: 1.0
In-Reply-To: <AANLkTimbCSM3Kk-Mq3MhRDyhHAaERR-dXhtuplauB3ki@mail.gmail.com>
References: <AANLkTimbCSM3Kk-Mq3MhRDyhHAaERR-dXhtuplauB3ki@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Fri, 18 Jun 2010 14:40:17 +0800
Message-ID: <AANLkTilnlE7hl4FKo5qRJ4PeTCuxA3Mfm13eedGPehrk@mail.gmail.com>
Subject: Re: [PATCH 03/25] pxa3xx_nand: remove the flash info in driver
	structure
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <david.woodhouse@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 18, 2010 at 1:33 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> From 643765e6ae0f37902321f31e14b565896217dd3a Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Wed, 2 Jun 2010 21:54:33 +0800
> Subject: [PATCH 03/25] pxa3xx_nand: remove the flash info in driver structure
>
> After probe, all info already transfer to driver structure.
> There is no need to keep the original flash info.
> So that we could safely free the flash info in memory, which may grows
> larger when more flash is suported.
>

Some of the changes should be separated from my POV? Like the
change to oob_size, and pxa3xx_nand_resume?
