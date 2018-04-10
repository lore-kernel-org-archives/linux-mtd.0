Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: Add DMA support for direct
 mode reads
To: Vignesh R <vigneshr@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20180410081910.858-1-vigneshr@ti.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <70777773-8ade-bd42-e75a-6d5d9c3e50a2@gmail.com>
Date: Tue, 10 Apr 2018 11:21:03 +0200
MIME-Version: 1.0
In-Reply-To: <20180410081910.858-1-vigneshr@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/10/2018 10:19 AM, Vignesh R wrote:
> Add support to use DMA over memory mapped reads in direct mode. This
> helps in reducing CPU usage from ~100% to ~10% when reading data from
> flash. For non-DMA'able/vmalloc'd buffers, driver just falls back to CPU
> based memcpy.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
