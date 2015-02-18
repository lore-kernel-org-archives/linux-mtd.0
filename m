Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YNxkB-0001K4-3s
 for linux-mtd@lists.infradead.org; Wed, 18 Feb 2015 06:04:20 +0000
Message-ID: <54E42B47.1020807@codeaurora.org>
Date: Wed, 18 Feb 2015 11:33:51 +0530
From: Archit Taneja <architt@codeaurora.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/5] mtd: Qualcomm NAND controller driver
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
In-Reply-To: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: galak@codeaurora.org, linux-kernel@vger.kernel.org, agross@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 01/16/2015 08:18 PM, Archit Taneja wrote:
> Add support for the NAND controller driver for SoC's that contain EBI2. For now,
> the only SoC upstream that has EBI2 is IPQ806x.
>
> The patchset requires the ADM dmaengine patches posted by Andy:
>
> http://thread.gmane.org/gmane.linux.ports.arm.msm/11136

I'd really appreciate if I could get some reviews on this driver from 
the mtd community.

Please let me know if I need to do anything to make it easier to review.

Thanks,
Archit

>
> Archit Taneja (5):
>    clk: qcom: Add EBI2 clocks for IPQ806x
>    mtd: nand: Add qcom nand controller driver
>    Documentaion: dt: add DT bindings for Qualcomm NAND controller
>    arm: qcom: dts: Add NAND controller node for ipq806x
>    arm: qcom: dts: Enale NAND node on IPQ8064 AP148 pplatform
>
>   .../devicetree/bindings/mtd/qcom_nandc.txt         |   48 +
>   arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |   32 +
>   arch/arm/boot/dts/qcom-ipq8064.dtsi                |   19 +-
>   drivers/clk/qcom/gcc-ipq806x.c                     |   34 +
>   drivers/mtd/nand/Kconfig                           |    7 +
>   drivers/mtd/nand/Makefile                          |    1 +
>   drivers/mtd/nand/qcom_nandc.c                      | 1995 ++++++++++++++++++++
>   include/dt-bindings/clock/qcom,gcc-ipq806x.h       |    1 +
>   8 files changed, 2136 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>   create mode 100644 drivers/mtd/nand/qcom_nandc.c
>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
