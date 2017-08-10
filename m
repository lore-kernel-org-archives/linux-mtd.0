Received: from mail-yw0-f196.google.com ([209.85.161.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dfu41-0000WM-D4
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 20:28:18 +0000
Received: by mail-yw0-f196.google.com with SMTP id l82so1125510ywc.2
 for <linux-mtd@lists.infradead.org>; Thu, 10 Aug 2017 13:27:57 -0700 (PDT)
Date: Thu, 10 Aug 2017 15:27:54 -0500
From: Rob Herring <robh@kernel.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 mark.rutland@arm.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v3 17/20] dt-bindings: qcom_nandc: IPQ4019 QPIC NAND
 documentation
Message-ID: <20170810202754.jufcee4si6ujmqia@rob-hp-laptop>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
 <1501949998-29859-18-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501949998-29859-18-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 05, 2017 at 09:49:55PM +0530, Abhishek Sahu wrote:
> 1. Qualcom IPQ4019 SoC uses QPIC NAND controller version 1.4.0
>    which uses BAM DMA Engine while IPQ806x uses EBI2 NAND
>    which uses ADM DMA Engine.
> 2. QPIC NAND will 3 BAM channels: command, data tx and data rx
>    while EBI2 NAND uses only single ADM channel.
> 3. CRCI is only required for ADM DMA and its not required for
>    BAM DMA.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  .../devicetree/bindings/mtd/qcom_nandc.txt         | 55 +++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
