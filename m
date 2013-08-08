Message-ID: <52033DE1.5050700@gmail.com>
Date: Thu, 08 Aug 2013 08:42:41 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 01/20] mtd: pxa3xx-nand: replace pxa_request_dma with
 dmaengine
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-2-git-send-email-zonque@gmail.com>
 <20130807174612.GB18567@localhost>
In-Reply-To: <20130807174612.GB18567@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 broonie@kernel.org, Zhangfei Gao <zhangfei.gao@marvell.com>,
 mika.westerberg@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 gregkh@linuxfoundation.org, g.liakhovetski@gmx.de, sachin.kamat@linaro.org,
 kernel@pengutronix.de, djbw@fb.com, davem@davemloft.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07.08.2013 19:46, Ezequiel Garcia wrote:
> Hi Daniel,
> 
> On Wed, Aug 07, 2013 at 05:33:50PM +0200, Daniel Mack wrote:
>> From: Zhangfei Gao <zhangfei.gao@marvell.com>
>>
>> [zonque@gmail.com: rebased in top of l2-mtd.git. The newly introduced
>> ARCH_HAS_DMA hack was changed into a check for CONFIG_HAS_DMA]
>>
> 
> Are you sure you need to introduce the CONFIG_HAS_DMA ifdef?
> 
> The reason I introduced the ARCH_HAS_DMA macro was to avoid including
> the "mach/dma.h" header. Now that you've removed it, I don't think
> this driver can be used in any platform where CONFIG_HAS_DMA=n.

Well, yes it can, or at least you could decide to use it without DMA on
PXA/MMP. The idea of CONFIG_HAS_DMA is to save binary size.


Daniel
