Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac7fd-0007BD-Md
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 08:34:42 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: kill unused field 'drcmr_cmd'
References: <1457147553-71596-1-git-send-email-computersforpeace@gmail.com>
Date: Sat, 05 Mar 2016 09:34:14 +0100
In-Reply-To: <1457147553-71596-1-git-send-email-computersforpeace@gmail.com>
 (Brian Norris's message of "Fri, 4 Mar 2016 19:12:33 -0800")
Message-ID: <877fhhwcft.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Hi Brian,

> @@ -1812,7 +1811,6 @@ static int alloc_nand_resource(struct platform_device *pdev)
>  			ret = -ENXIO;
>  			goto fail_disable_clk;
>  		}
> -		info->drcmr_cmd = r->start;
>  	}
If you kill this field, why not kill also this block just above ?
		r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
		if (r == NULL) {
			dev_err(&pdev->dev,
				"no resource defined for cmd DMA\n");
			ret = -ENXIO;
			goto fail_disable_clk;
		}

Cheers.

-- 
Robert
