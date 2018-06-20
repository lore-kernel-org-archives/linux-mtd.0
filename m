Received: from mail-yb0-f194.google.com ([209.85.213.194])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVfYN-0007QK-49
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 16:01:52 +0000
Received: by mail-yb0-f194.google.com with SMTP id q62-v6so28864ybg.5
 for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2018 09:01:38 -0700 (PDT)
Date: Wed, 20 Jun 2018 10:01:30 -0600
From: Rob Herring <robh@kernel.org>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andy Gross <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 03/15] dt-bindings: qcom_nandc: update for ECC
 strength and step size
Message-ID: <20180620160130.GA21296@rob-hp-laptop>
References: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
 <1529479662-4026-4-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529479662-4026-4-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 20, 2018 at 12:57:30PM +0530, Abhishek Sahu wrote:
> 1. If nand-ecc-strength specified in DT, then controller will use
>    this ECC strength otherwise ECC strength will be calculated
>    according to chip requirement and available OOB size.
> 
> 2. QCOM NAND controller supports only one step size (512 bytes) but
>    nand-ecc-step-size is required property in DT. This DT property
>    can be removed and ecc step size can be assigned in driver with
>    512 bytes value.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> 
> * Changes from v3:
> 
> 1. Clubbed following 2 patches into one
>    https://patchwork.ozlabs.org/patch/920465/
>    https://patchwork.ozlabs.org/patch/920467/
> 
> * Changes from v2:
>   NONE
> 
> * Changes from v1:
>   NEW PATCH
> 
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
