Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VaTEZ-0001ry-Jp
 for linux-mtd@lists.infradead.org; Sun, 27 Oct 2013 16:30:35 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/5] mtd: m25p80: fix allocation size
Date: Sun, 27 Oct 2013 17:30:11 +0100
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310271730.12065.marex@denx.de>
Cc: sourav.poddar@ti.com, linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

[...]

> @@ -1137,14 +1135,10 @@ static int m25p_probe(struct spi_device *spi)
>  static int m25p_remove(struct spi_device *spi)
>  {
>  	struct m25p	*flash = spi_get_drvdata(spi);
> -	int		status;
> 
>  	/* Clean up MTD stuff. */
> -	status = mtd_device_unregister(&flash->mtd);
> -	if (status == 0) {
> -		kfree(flash->command);
> -		kfree(flash);
> -	}
> +	mtd_device_unregister(&flash->mtd);
> +
>  	return 0;
>  }

I wonder if we shouldn't return "status" in here in case mtd_device_unregister() 
failed.

Best regards,
Marek Vasut
