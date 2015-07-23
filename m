Received: from webbox1416.server-home.net ([77.236.96.61])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIIdH-0002y5-Sx
 for linux-mtd@lists.infradead.org; Thu, 23 Jul 2015 15:42:05 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Cory Tusar <cory.tusar@pid1solutions.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Han Xu <han.xu@freescale.com>
Subject: Re: [PATCH 1/1] mtd: fsl-quadspi: Add mutex for accessing different
 SPI-NOR devices
Date: Thu, 23 Jul 2015 17:41:34 +0200
Message-ID: <2755588.WRnIZEyBVY@ws-stein>
In-Reply-To: <CA+EcR22gNx4J_tiZ8kfO2uybKn=jWByhZW7mz=vATQjV2pVypg@mail.gmail.com>
References: <1437056014-16928-1-git-send-email-alexander.stein@systec-electronic.com>
 <22821071.S74fF7YYzh@ws-stein>
 <CA+EcR22gNx4J_tiZ8kfO2uybKn=jWByhZW7mz=vATQjV2pVypg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Han,

On Thursday 23 July 2015 10:31:05, Han Xu wrote:
> I think it is the same patch
> 
>  http://patchwork.ozlabs.org/patch/429631/

Yep. They are more or less the same. I didn't know about this.
I lack the include though, which seems the right thing to do.

But I see a problem in your case:
> @@ -751,6 +753,8 @@ static int fsl_qspi_prep(struct spi_nor *nor, enum 
spi_nor_ops ops)
>  	struct fsl_qspi *q = nor->priv;
>  	int ret;
>  
> +	mutex_lock(&q->lock);
> +
>  	ret = clk_enable(q->clk_en);
>  	if (ret)
>  		return ret;

I see a problem here. If one of those clk_enable fails, you return with the 
mutex still being locked. That's why I lock/unlock the mutex the last/first in 
prepare/unprepare.

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010
