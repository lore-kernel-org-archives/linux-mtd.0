Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am1cT-0006IZ-12
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 16:08:23 +0000
Received: by mail-pa0-x230.google.com with SMTP id tt10so94265874pab.3
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 09:08:00 -0700 (PDT)
Date: Fri, 1 Apr 2016 09:07:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: brcmnand: fix check for Hamming algorithm
Message-ID: <20160401160756.GD117117@google.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-3-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1455300685-27009-3-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 12, 2016 at 07:11:25PM +0100, Rafał Miłecki wrote:
> So far we were treating ECC strength 1 as Hamming algorithm. It didn't
> supporting some less common devices with BCH-1 (e.g. D-Link DIR-885L).
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 844fc07..b8055da 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1842,7 +1842,7 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>  
>  	switch (chip->ecc.size) {
>  	case 512:
> -		if (chip->ecc.strength == 1) /* Hamming */
> +		if (chip->ecc.algo == NAND_ECC_HAMMING)

It's probably best we do a little more than this. Right now, this allows
someone to specify:

	nand-ecc-strength = <20>;
	nand-ecc-stepsize = <512>;
	nand-ecc-algo = "hamming";
	nand-ecc-mode = "hw";

And they'll end up with 1-bit hamming ECC, except nand_base will still
think we have 20-bit correction. I think we need to add a check in this
driver to be sure we haven't selected >1-bit correction with hamming
ECC.

Brian

>  			cfg->ecc_level = 15;
>  		else
>  			cfg->ecc_level = chip->ecc.strength;
> -- 
> 1.8.4.5
> 
