Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpygB-0002YI-Vx
 for linux-mtd@lists.infradead.org; Fri, 30 Sep 2016 14:20:50 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: linshunquan 00354166 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH 2/2] mtd: spi nor: gets resource from HiSilicon Flash
 Memory Controller driver
Date: Fri, 30 Sep 2016 16:19:21 +0200
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org,
 dwmw2@infradead.org, computersforpeace@gmail.com, robh@kernel.org,
 xuejiancheng@hisilicon.com, cyrille.pitchen@atmel.com,
 ezequiel@vanguardiasur.com.ar, jteki@openedev.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, howell.yang@hisilicon.com,
 jalen.hsu@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com,
 kevin.lixu@hisilicon.com, lvkuanliang@hisilicon.com
References: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
 <1475225971-30152-3-git-send-email-linshunquan1@hisilicon.com>
In-Reply-To: <1475225971-30152-3-git-send-email-linshunquan1@hisilicon.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201609301619.21674.arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 30 September 2016, linshunquan 00354166 wrote:
> 
> From: Shunquan Lin <linshunquan1@hisilicon.com>
> 
> As the HiSilicon Flash Memory Controller(FMC) driver is a Multi-
> function device drivers(MFD) that not only support spi-nor flash
> controller, but spi-nand and nand, so moves the register map of
> HiSilicon spi-nor flash controller driver to
> include/linux/mfd/hisi_fmc.h
> 
> Signed-off-by: Shunquan Lin <linshunquan1@hisilicon.com>
> ---
>  drivers/mtd/spi-nor/hisi-sfc.c | 86 +++---------------------------------------
>  1 file changed, 6 insertions(+), 80 deletions(-)

The patch seems incomplete, maybe forgot "git add" after a rebase?

	Arnd
