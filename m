Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dS7K9-0006KZ-CR
 for linux-mtd@lists.infradead.org; Mon, 03 Jul 2017 19:47:59 +0000
Date: Mon, 3 Jul 2017 21:47:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org,
 computersforpeace@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH 03/14] qcom: mtd: nand: Fixed config error for BCH
Message-ID: <20170703214735.2acb70cc@bbrezillon>
In-Reply-To: <b385fe5e-42a4-9944-55db-5a99a69a5941@gmail.com>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-4-git-send-email-absahu@codeaurora.org>
 <b385fe5e-42a4-9944-55db-5a99a69a5941@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 Jun 2017 11:49:07 +0200
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 06/29/2017 09:15 AM, Abhishek Sahu wrote:
> > The configuration for BCH is not correct in the current
> > driver so this patch fixed the same.  
> 
> Fix the commit message, I have no idea what this patch does or fixes.

And please add a Fixes tag and Cc stable. 

> 
> > Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> > ---
> >  drivers/mtd/nand/qcom_nandc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> > index 520add9..410ee53 100644
> > --- a/drivers/mtd/nand/qcom_nandc.c
> > +++ b/drivers/mtd/nand/qcom_nandc.c
> > @@ -1919,7 +1919,7 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
> >  				| wide_bus << WIDE_FLASH
> >  				| 1 << DEV0_CFG1_ECC_DISABLE;
> >  
> > -	host->ecc_bch_cfg = host->bch_enabled << ECC_CFG_ECC_DISABLE
> > +	host->ecc_bch_cfg = !host->bch_enabled << ECC_CFG_ECC_DISABLE
> >  				| 0 << ECC_SW_RESET
> >  				| host->cw_data << ECC_NUM_DATA_BYTES
> >  				| 1 << ECC_FORCE_CLK_OPEN
> >   
> 
> 
