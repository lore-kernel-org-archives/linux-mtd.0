Date: Mon, 19 Sep 2016 11:47:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: RogerCC Lin <rogercc.lin@mediatek.com>
Cc: <xiaolei.li@mediatek.com>, <steven.liu@mediatek.com>, <robh@kernel.org>,
 <computersforpeace@gmail.com>, <jorge.ramirez-ortiz@linaro.org>,
 <daniel.thompson@linaro.org>, <linux-mtd@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <dwmw2@infradead.org>,
 <blogic@openwrt.org>
Subject: Re: [PATCH v5 0/2] mtd: nand: fix writing incorrect ECC parity data
 in OOB region
Message-ID: <20160919114758.37ec6606@bbrezillon>
In-Reply-To: <1474253606-9965-1-git-send-email-rogercc.lin@mediatek.com>
References: <1474253606-9965-1-git-send-email-rogercc.lin@mediatek.com>
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

On Mon, 19 Sep 2016 10:53:24 +0800
RogerCC Lin <rogercc.lin@mediatek.com> wrote:

> From: RogerCC Lin <rogercc.lin@mediatek.com>
> 
> This series fix chances to write incorrect ECC data which may cause uncorrectable ECC error when reading.

Applied (I'll send a PR to Brian).

Thanks,

Boris

> 
> change since v4:
> - use (i / 4) instead of (i >> 2) to make code more clear.
> 
> changes since v3:
> - use macro for function arguments.
> 
> changes since v2:
> - use macro for shift operation.
> 
> changes since v1:
> - separate patches into 2.
> - use shift operator with byte access to avoid endianness conversion problems.
> - follow linux coding style.
> 
> The patch passed the test of UBIFS file-system read/write on Mediatek's RFB. The tested driver is checked-out from LEDE OpenWRT project's upstream driver, which is pretty much same as nand/next branch upstream driver(git clone https://git.lede-project.org/source.git).
> 
> 
> RogerCC Lin (2):
>   mtd: nand: fix generating over-boundary ECC data when writing
>   mtd: nand: fix chances to create incomplete ECC data when writing
> 
>  drivers/mtd/nand/mtk_ecc.c  |   12 ++++++++----
>  drivers/mtd/nand/mtk_nand.c |    7 +++++--
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
