Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNtf0-0005Vy-F7
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 02:47:14 +0000
Date: Mon, 25 Jan 2016 20:46:48 -0600
From: Rob Herring <robh@kernel.org>
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
 galak@codeaurora.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, shijie.huang@intel.com,
 pengbinquan@huawei.com, han.xu@freescale.com,
 ezequiel@vanguardiasur.com.ar, fabio.estevam@freescale.com,
 manabian@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com,
 suwenping@hisilicon.com, raojun@hisilicon.com,
 ml.yang@hisilicon.com, gaofei@hisilicon.com,
 zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com
Subject: Re: [PATCH v4] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Message-ID: <20160126024648.GA26779@rob-hp-laptop>
References: <1453704460-8956-1-git-send-email-xuejiancheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453704460-8956-1-git-send-email-xuejiancheng@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 25, 2016 at 02:47:40PM +0800, Jiancheng Xue wrote:
> add hisilicon spi-nor flash controller driver
> 
> Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
> ---
> change log
> v4:
> Rebased to v4.5-rc1
> v3:
> Added a compatible string "hisilicon,hi3519-sfc".
> v2:
> Fixed some compiling warings.
>  .../devicetree/bindings/spi/spi-hisi-sfc.txt       |  25 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/spi-nor/Kconfig                        |   6 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/hisi-sfc.c                     | 499 +++++++++++++++++++++
>  4 files changed, 531 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-hisi-sfc.txt
>  create mode 100644 drivers/mtd/spi-nor/hisi-sfc.c
