Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtWD8-0004P7-AF
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 06:36:23 +0000
Received: by mail-wg0-f47.google.com with SMTP id n12so2797221wgh.34
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 22:35:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
Date: Wed, 26 Nov 2014 14:35:59 +0800
Message-ID: <CAN1soZzd3CGazsCnv9cwtW5Pb3h9JrkegAm=f34crVNckjXHkA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Zhou Wang <wangzhou.bry@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xuwei \(O\)" <xuwei5@hisilicon.com>, wangzhou1@hisilicon.com,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Kumar Gala <galak@codeaurora.org>, caizhiyong@huawei.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 4, 2014 at 8:46 PM, Zhou Wang <wangzhou.bry@gmail.com> wrote:
> This patchset adds the support for NAND controller of hisilicon hip04 Soc.
> The NAND controller IP was developed by hisilicon and needs a new driver to
> support it. This patchset is based on v3.18-rc1. I have tested that NAND flash
> controller works fine in Hip04 D01 board.
>
> Changes in v4:
> - add mtd->dev.parent = &pdev->dev, thanks Frans Klaver.
> Changes in v3:
> - Modify code to eliminate some code style warnings.
> - add ecc-bits input check.
> - avoid using waterfall style in hisi_nfc_cmdfunc().
> Changes in v2:
> - Remove the patch for device tree, now patchset only has the driver and its
>   device tree binding documentation.
> - Change the file name: hisi_nand.c to hisi504_nand.c.
> Changes in v1:
> - Remove callback functions out of struct hinfc_host, and call them directly
>   in relative functions.
> - Change hinfc_read and hinfc_write from macros to inline functions.
> - Instead of putting pointers, embed struct nand_chip and struct mtd_info in
>   struct hinfc_host directly.
> - rewrite some unclear lines in device tree binding document, correct some
>   code style error.
>
> Link on v3:
> - https://lkml.org/lkml/2014/10/28/386
> Link on v2:
> - https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg750071.html
> Link on v1:
> - https://lkml.org/lkml/2014/7/15/198
>
> Zhou Wang (2):
>   mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc
>   mtd: hisilicon: add device tree binding documentation
>
>  .../devicetree/bindings/mtd/hisi504-nand.txt       |   40 +
>  drivers/mtd/nand/Kconfig                           |    5 +
>  drivers/mtd/nand/Makefile                          |    1 +
>  drivers/mtd/nand/hisi504_nand.c                    |  846 ++++++++++++++++++++
>  4 files changed, 892 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt
>  create mode 100644 drivers/mtd/nand/hisi504_nand.c
>
> --
> 1.7.9.5
>

Hi David & Brian,

How do you think about this nand patch set? Could it be merged into v3.19?

Best Regards
Haojian
