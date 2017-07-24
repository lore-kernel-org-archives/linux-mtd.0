Received: from mail-pf0-f193.google.com ([209.85.192.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dZioh-0004QD-Sb
 for linux-mtd@lists.infradead.org; Mon, 24 Jul 2017 19:14:57 +0000
Received: by mail-pf0-f193.google.com with SMTP id y25so3802855pfk.4
 for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2017 12:14:35 -0700 (PDT)
Date: Mon, 24 Jul 2017 14:14:33 -0500
From: Rob Herring <robh@kernel.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2 06/25] dt-bindings: qcom_nandc: remove chip select
 compatible string
Message-ID: <20170724191433.k5en7k37isnygkf2@rob-hp-laptop>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-7-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1500464893-11352-7-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 19, 2017 at 05:17:54PM +0530, Abhishek Sahu wrote:
> Currently the compatible “qcom,nandcs” is being used for each
> connected NAND device to support for multiple NAND devices in the
> same bus. The same thing can be achieved by looking reg property
> for each sub nodes which contains the chip select number so this
> patch removes the use of “qcom,nandcs” for specifying NAND device
> sub nodes.
> 
> Since there is no user for this driver currently in so
> changing compatible string is safe.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
