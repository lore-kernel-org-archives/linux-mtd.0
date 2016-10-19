Date: Tue, 18 Oct 2016 22:17:16 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mtd: nand: Add OX820 NAND Support
Message-ID: <20161018171149.vhlnuqnyn4axnk2p@rob-hp-laptop>
References: <20161018090927.1990-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161018090927.1990-1-narmstrong@baylibre.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 18, 2016 at 11:09:27AM +0200, Neil Armstrong wrote:
> Add NAND driver to support the Oxford Semiconductor OX820 NAND Controller.
> This is a simple memory mapped NAND controller with single chip select and
> software ECC.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/mtd/oxnas-nand.txt         |  24 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/Kconfig                           |   5 +
>  drivers/mtd/nand/Makefile                          |   1 +
>  drivers/mtd/nand/oxnas_nand.c                      | 144 +++++++++++++++++++++
>  4 files changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/oxnas-nand.txt
>  create mode 100644 drivers/mtd/nand/oxnas_nand.c
