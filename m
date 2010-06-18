MIME-Version: 1.0
In-Reply-To: <AANLkTilnlE7hl4FKo5qRJ4PeTCuxA3Mfm13eedGPehrk@mail.gmail.com>
References: <AANLkTimbCSM3Kk-Mq3MhRDyhHAaERR-dXhtuplauB3ki@mail.gmail.com>
	<AANLkTilnlE7hl4FKo5qRJ4PeTCuxA3Mfm13eedGPehrk@mail.gmail.com>
Date: Fri, 18 Jun 2010 16:16:26 +0800
Message-ID: <AANLkTikT1hzTe4nEKj5n0cay0Q_277GlygXftYOlHI0q@mail.gmail.com>
Subject: Re: [PATCH 03/25] pxa3xx_nand: remove the flash info in driver
	structure
From: Lei Wen <adrian.wenl@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 18, 2010 at 2:40 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
> On Fri, Jun 18, 2010 at 1:33 PM, Haojian Zhuang
> <haojian.zhuang@gmail.com> wrote:
>> From 643765e6ae0f37902321f31e14b565896217dd3a Mon Sep 17 00:00:00 2001
>> From: Lei Wen <leiwen@marvell.com>
>> Date: Wed, 2 Jun 2010 21:54:33 +0800
>> Subject: [PATCH 03/25] pxa3xx_nand: remove the flash info in driver structure
>>
>> After probe, all info already transfer to driver structure.
>> There is no need to keep the original flash info.
>> So that we could safely free the flash info in memory, which may grows
>> larger when more flash is suported.
>>
>
> Some of the changes should be separated from my POV? Like the
> change to oob_size, and pxa3xx_nand_resume?
>

This patch is only servered as the prepraration of latter patch
seris... So hard to seperate them...
