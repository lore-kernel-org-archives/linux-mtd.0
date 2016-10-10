Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btUlP-0005Pe-PO
 for linux-mtd@lists.infradead.org; Mon, 10 Oct 2016 07:12:45 +0000
Received: by mail-lf0-x233.google.com with SMTP id l131so110134029lfl.2
 for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2016 00:12:22 -0700 (PDT)
Date: Mon, 10 Oct 2016 08:14:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linshunquan 00354166 <linshunquan1@hisilicon.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, robh@kernel.org,
 xuejiancheng@hisilicon.com, cyrille.pitchen@atmel.com,
 ezequiel@vanguardiasur.com.ar, jteki@openedev.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, howell.yang@hisilicon.com,
 jalen.hsu@hisilicon.com, suwenping@hisilicon.com,
 raojun@hisilicon.com, kevin.lixu@hisilicon.com, lvkuanliang@hisilicon.com
Subject: Re: [PATCH 1/2] mfd: Add HiSilicon Flash Memory Controller(FMC) driver
Message-ID: <20161010071439.GC13133@dell>
References: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
 <1475225971-30152-2-git-send-email-linshunquan1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1475225971-30152-2-git-send-email-linshunquan1@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 Sep 2016, linshunquan 00354166 wrote:

> From: Shunquan Lin <linshunquan1@hisilicon.com>
> 
> This patch adds driver support for HiSilicon Flash Memory
> Controller(FMC). HiSilicon FMC is a multi-functions device which
> supports SPI Nor flash controller, SPI nand Flash controller and
> parallel nand flash controller.

This is not an MFD.  MFDs span multiple subsystems, where as these are
all Memory Technology Devices (MTDs).  Please find a way to support
this in the MTD subsystem.

> Signed-off-by: Shunquan Lin <linshunquan1@hisilicon.com>
> ---
>  .../devicetree/bindings/mfd/hisilicon,hisi-fmc.txt |  62 ++++++++++++
>  drivers/mfd/Kconfig                                |  10 ++
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/hisi_fmc.c                             | 109 +++++++++++++++++++++
>  include/linux/mfd/hisi_fmc.h                       |  92 +++++++++++++++++
>  5 files changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
>  create mode 100644 drivers/mfd/hisi_fmc.c
>  create mode 100644 include/linux/mfd/hisi_fmc.h

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
