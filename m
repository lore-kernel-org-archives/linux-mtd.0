Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2Auv-0000Lj-Fe
 for linux-mtd@lists.infradead.org; Tue, 18 Sep 2018 07:59:30 +0000
Subject: Re: [PATCH v2] mtd: devices: m25p80: Make sure the buffer passed in
 op is DMA-able
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20180917143130.23007-1-boris.brezillon@bootlin.com>
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <8e5e8113-b091-6d3e-50d4-3e70e9372016@linux.intel.com>
Date: Tue, 18 Sep 2018 10:59:17 +0300
MIME-Version: 1.0
In-Reply-To: <20180917143130.23007-1-boris.brezillon@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 09/17/2018 05:31 PM, Boris Brezillon wrote:
> As documented in spi-mem.h, spi_mem_op->data.buf.{in,out} must be
> DMA-able, and commit 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx()
> API") failed to follow this rule as buffers passed to
> ->{read,write}_reg() are usually placed on the stack.
> 
> Fix that by allocating a scratch buffer and copying the data around.
> 
> Fixes: 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx() API")
> Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Note that the ->{read,write}() path is still buggy since nothing
> guarantees that buffers passed by the MTD layer to the SPI NOR layer
> are DMA-able, but this is a long-standing issue which we'll have to
> address at the spi-nor level (this layer can choose the bounce buffer
> size based on nor->page_size).
> 
> Changes in v2:
> - Copy the data from scratchbuf in the ->read_reg() path
> ---
>   drivers/mtd/devices/m25p80.c | 26 +++++++++++++++++++++++---
>   1 file changed, 23 insertions(+), 3 deletions(-)
> 
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
