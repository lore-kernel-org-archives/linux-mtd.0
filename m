Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1djypW-0006n8-4i
 for linux-mtd@lists.infradead.org; Tue, 22 Aug 2017 02:22:14 +0000
Received: by mail-oi0-f65.google.com with SMTP id k77so3677173oib.4
 for <linux-mtd@lists.infradead.org>; Mon, 21 Aug 2017 19:21:50 -0700 (PDT)
Date: Mon, 21 Aug 2017 21:21:48 -0500
From: Rob Herring <robh@kernel.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Sricharan R <sricharan@codeaurora.org>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 14/16] dt-bindings: qcom_nandc: IPQ8074 QPIC NAND
 documentation
Message-ID: <20170822022148.dfckwlzcsamgjkvm@rob-hp-laptop>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
 <1502971674-13810-15-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1502971674-13810-15-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 17, 2017 at 05:37:52PM +0530, Abhishek Sahu wrote:
> Qualcom IPQ8074 SoC uses QPIC NAND controller version 1.5.0
> which uses BAM DMA Engine.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> 
> * Changes from v4: None
> 
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
