Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fNLSZ-0000lk-47
 for linux-mtd@lists.infradead.org; Mon, 28 May 2018 16:57:28 +0000
Date: Mon, 28 May 2018 18:57:14 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Benjamin Lindqvist <benjamin.lindqvist@endian.se>
Cc: Stefan Agner <stefan@agner.ch>, Dmitry Osipenko <digetx@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek =?UTF-8?B?VmHFoXV0?=
 <marek.vasut@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, Thierry
 Reding <thierry.reding@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, sboyd@kernel.org, Lucas Stach <dev@lynxeye.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at, Marcel Ziswiler
 <marcel@ziswiler.com>, krzk@kernel.org, jonathanh@nvidia.com,
 pdeschrijver@nvidia.com, Prashant Gaikwad <pgaikwad@nvidia.com>, Mirza Krak
 <mirza.krak@gmail.com>, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Message-ID: <20180528185714.0a33bdc7@bbrezillon>
In-Reply-To: <CAGefG56pyKd=rCjArVtvO1mnXzacrD+BW4_AkJSDRtw-2Gf3Nw@mail.gmail.com>
References: <20180527215442.14760-4-stefan@agner.ch>
 <b9cfc23e-2434-fd90-ae2d-e51f28b16038@gmail.com>
 <c4df253d318e7c268e8999d5f3bfcd0f@agner.ch>
 <CAGefG56pyKd=rCjArVtvO1mnXzacrD+BW4_AkJSDRtw-2Gf3Nw@mail.gmail.com>
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

On Mon, 28 May 2018 18:41:26 +0200
Benjamin Lindqvist <benjamin.lindqvist@endian.se> wrote:

> Note that it's certainly possible to encode U-Boot and kernel with
> RS[4] and still use RS[8] for the rootfs even if the boot rom doesn't
> support it.

Not if you want to read/write from/to the uboot partition from Linux.

Per-partition ECC setup is not supported, so the only solutions we have
right now are:
1/ use the same ECC config as the one use by the bootrom
2/ only access uboot partition in raw mode from Linux (that implies
   generating images containing the ECC bytes so that they can be
   flashed to the device in raw mode)
3/ never access uboot partitions from Linux (not sure we want that)

> This whole 'use-bootable-ecc-only' business seems a bit
> overengineered.
> 

Hm, I don't find it over-engineered.
