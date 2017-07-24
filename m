Received: from mail-pf0-f196.google.com ([209.85.192.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dZinK-0003rA-Hh
 for linux-mtd@lists.infradead.org; Mon, 24 Jul 2017 19:13:31 +0000
Received: by mail-pf0-f196.google.com with SMTP id g69so2191220pfe.1
 for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2017 12:13:10 -0700 (PDT)
Date: Mon, 24 Jul 2017 14:13:07 -0500
From: Rob Herring <robh@kernel.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2 04/25] dt-bindings: qcom_nandc: change compatible
 string for EBI2 NANDC
Message-ID: <20170724191307.pbgfnye5gsc4yso2@rob-hp-laptop>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-5-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1500464893-11352-5-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 19, 2017 at 05:17:52PM +0530, Abhishek Sahu wrote:
> The current compatible string “qcom,ipq806x-nand" implies that
> the driver is specific to IPQ806x. This driver can be used by
> any chip which uses EBI2 NAND controller so changed the
> compatible string to “qcom,ebi2-nandc” to give it more generic
> name.
> 
> Since there is no user for this driver currently in so
> changing compatible string is safe.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> index 70dd511..4511918 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> @@ -1,7 +1,9 @@
>  * Qualcomm NAND controller
>  
>  Required properties:
> -- compatible:		should be "qcom,ipq806x-nand"
> +- compatible:		should be "qcom,ebi2-nandc" - EBI2 NAND which uses ADM
> +			DMA like IPQ8064.

Compatible strings are supposed to be specific to the SoC. The old one 
wasn't quite and the new one moves in the wrong direction.

Rob
