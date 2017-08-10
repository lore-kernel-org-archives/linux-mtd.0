Received: from mail-yw0-f194.google.com ([209.85.161.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfu2X-0000Af-SX
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 20:26:47 +0000
Received: by mail-yw0-f194.google.com with SMTP id n83so1125691ywn.3
 for <linux-mtd@lists.infradead.org>; Thu, 10 Aug 2017 13:26:25 -0700 (PDT)
Date: Thu, 10 Aug 2017 15:26:23 -0500
From: Rob Herring <robh@kernel.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 mark.rutland@arm.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v3 16/20] dt-bindings: qcom_nandc: fix the ipq806x device
 tree example
Message-ID: <20170810202623.oksod6fo5upzpvfe@rob-hp-laptop>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
 <1501949998-29859-17-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501949998-29859-17-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 05, 2017 at 09:49:54PM +0530, Abhishek Sahu wrote:
> 1. Correct the compatible string for IPQ806x
> 2. Change the NAND controller and NAND chip nodes name
>    for more clarity.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
