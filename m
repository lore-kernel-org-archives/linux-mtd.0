Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJnk4-0001sJ-7Z
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 18:35:00 +0000
Message-ID: <54D508BA.7000606@free-electrons.com>
Date: Fri, 06 Feb 2015 15:32:26 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: fix build on ARM64
References: <1423004776-17825-1-git-send-email-robh@kernel.org>
In-Reply-To: <1423004776-17825-1-git-send-email-robh@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/03/2015 08:06 PM, Rob Herring wrote:
[..]
> @@ -1580,7 +1580,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
>  	info->pdev = pdev;
>  	info->variant = pxa3xx_nand_get_variant(pdev);
>  	for (cs = 0; cs < pdata->num_cs; cs++) {
> -		mtd = (struct mtd_info *)((unsigned int)&info[1] +
> +		mtd = (struct mtd_info *)((void *)&info[1] +
>  		      (sizeof(*mtd) + sizeof(*host)) * cs);
>  		chip = (struct nand_chip *)(&mtd[1]);
>  		host = (struct pxa3xx_nand_host *)chip;
> 

Those casts are an eyesore to me. Is this change related to the patch?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
