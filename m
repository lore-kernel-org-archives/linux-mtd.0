Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btOsq-00075y-Ks
 for linux-mtd@lists.infradead.org; Mon, 10 Oct 2016 00:56:01 +0000
Received: by mail-oi0-f67.google.com with SMTP id d132so7209773oib.2
 for <linux-mtd@lists.infradead.org>; Sun, 09 Oct 2016 17:55:40 -0700 (PDT)
Date: Sun, 9 Oct 2016 19:55:38 -0500
From: Rob Herring <robh@kernel.org>
To: linshunquan 00354166 <linshunquan1@hisilicon.com>
Cc: mark.rutland@arm.com, lee.jones@linaro.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, xuejiancheng@hisilicon.com,
 cyrille.pitchen@atmel.com, ezequiel@vanguardiasur.com.ar,
 jteki@openedev.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 howell.yang@hisilicon.com, jalen.hsu@hisilicon.com,
 suwenping@hisilicon.com, raojun@hisilicon.com,
 kevin.lixu@hisilicon.com, lvkuanliang@hisilicon.com
Subject: Re: [PATCH 1/2] mfd: Add HiSilicon Flash Memory Controller(FMC) driver
Message-ID: <20161010005538.GA32227@rob-hp-laptop>
References: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
 <1475225971-30152-2-git-send-email-linshunquan1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475225971-30152-2-git-send-email-linshunquan1@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 30, 2016 at 04:59:30PM +0800, linshunquan 00354166 wrote:
> From: Shunquan Lin <linshunquan1@hisilicon.com>
> 
> This patch adds driver support for HiSilicon Flash Memory
> Controller(FMC). HiSilicon FMC is a multi-functions device which
> supports SPI Nor flash controller, SPI nand Flash controller and
> parallel nand flash controller.

I still have unanswered questions from the last version.

> 
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
