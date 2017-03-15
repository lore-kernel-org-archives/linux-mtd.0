Date: Wed, 15 Mar 2017 14:13:49 -0500
From: Rob Herring <robh@kernel.org>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, tony@atomide.com,
 Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 1/2] doc: dt: mtd: add w25q64 to list of supported SPI
 flashes
Message-ID: <20170315191349.mxh2ahnhn2uhyvm4@rob-hp-laptop>
References: <20170307215751.29266-1-fcooper@ti.com>
 <20170307215751.29266-2-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170307215751.29266-2-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 07, 2017 at 03:57:50PM -0600, Franklin S Cooper Jr wrote:
> From: Sekhar Nori <nsekhar@ti.com>
> 
> W25Q64 is found on TI's AM335x ICEv2 board. Add it to list
> for supported SPI flash devices. This flash can be identified
> using JEDEC READ ID opcode.
> 
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
