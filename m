Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adjC4-0004EX-DP
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 18:50:48 +0000
Received: by mail-pf0-x22e.google.com with SMTP id 129so47619308pfw.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 10:50:27 -0800 (PST)
Date: Wed, 9 Mar 2016 10:50:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jiancheng Xue <xuejiancheng@huawei.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 dwmw2@infradead.org, zajec5@gmail.com,
 boris.brezillon@free-electrons.com, jteki@openedev.com,
 ezequiel@vanguardiasur.com.ar, juhosg@openwrt.org,
 shijie.huang@intel.com, mika.westerberg@linux.intel.com,
 furquan@google.com, han.xu@freescale.com,
 fabio.estevam@freescale.com, manabian@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, yanhaifeng@hisilicon.com,
 yanghongwei@hisilicon.com, suwenping@hisilicon.com,
 raojun@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com,
 zhangzhenxing@hisilicon.com, xuejiancheng@hisilicon.com,
 Binquan Peng <pengbinquan@huawei.com>
Subject: Re: [RESEND PATCH v7] mtd: spi-nor: add hisilicon spi-nor flash
 controller driver
Message-ID: <20160309185024.GN55664@google.com>
References: <1456474316-24473-1-git-send-email-xuejiancheng@huawei.com>
 <20160307225229.GC55664@google.com> <56DE9A79.30704@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56DE9A79.30704@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 08, 2016 at 05:25:13PM +0800, Jiancheng Xue wrote:
> On 2016/3/8 6:52, Brian Norris wrote:
> [...]
> >> +static void hisi_spi_nor_dma_transfer(struct spi_nor *nor, u32 start_off,
> >> +		u32 dma_buf, u32 len, u8 op_type)
> > 
> > Does this controller support 64-bit addresses? What if you see LPAE, or
> > an ARM64 CPU? It'd be nice if you don't truncate potentially 64-bit
> > dma_buf down to u32.
> > 
> > Brian
> > 
> No, this controller just supports 32-bit addresses. So I think I have to truncate 64-bit dma_buf. :(

Then you should handle this proactively. Either some kind of WARN_ON and
error condition, or I think dma_set_mask_and_coherent(dev,
DMA_BIT_MASK(32)) should be able to ensure you get addresses in the
appropriate range?

Brian
