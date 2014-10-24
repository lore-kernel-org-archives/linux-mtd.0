Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhdKG-0002Ri-T2
 for linux-mtd@lists.infradead.org; Fri, 24 Oct 2014 11:46:38 +0000
Received: by mail-wg0-f46.google.com with SMTP id l18so901592wgh.5
 for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2014 04:46:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1414073085-19296-2-git-send-email-wangzhou.bry@gmail.com>
References: <1414073085-19296-1-git-send-email-wangzhou.bry@gmail.com>
 <1414073085-19296-2-git-send-email-wangzhou.bry@gmail.com>
Date: Fri, 24 Oct 2014 19:46:11 +0800
Message-ID: <CAN1soZz8NYxppaY4cXadqynERZ=6ZRAynDtptGAps+yUJZ0Qsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: hisilicon: add a new NAND controller driver
 for hisilicon hip04 Soc
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Zhou Wang <wangzhou.bry@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xuwei \(O\)" <xuwei5@hisilicon.com>, wangzhou1@hisilicon.com,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 galak@codeaurora.org, caizhiyong@huawei.com,
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

On Thu, Oct 23, 2014 at 10:04 PM, Zhou Wang <wangzhou.bry@gmail.com> wrote:
> Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
> ---
>  drivers/mtd/nand/Kconfig        |    5 +
>  drivers/mtd/nand/Makefile       |    1 +
>  drivers/mtd/nand/hisi504_nand.c |  836 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 842 insertions(+)
>  create mode 100644 drivers/mtd/nand/hisi504_nand.c
>

I think that you need to run scripts/checkpatch.pl. There're some
warnings reported on this patch.

> +
> +       case NAND_CMD_SEQIN:
> +               host->offset = column;
> +

It's better not using waterfall style. Maybe you can write it clearly.
            case NAND_CMD_SEQIN:
                    host->offset = column;
                    set_addr(mtd, column, page_addr);
                    break;

> +       chip->ecc.mode = of_get_nand_ecc_mode(np);
> +       /* read ecc-bits from dts */
> +       of_property_read_u32(np, "hisi,nand-ecc-bits", &host->ecc_bits);

Do you need to check the ecc_bits at here? Maybe user inputed the
wrong ecc_bits in DTS.

Best Regards
Haojian
