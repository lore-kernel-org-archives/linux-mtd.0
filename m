Received: from vps0.lunn.ch ([178.209.37.122])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeDwe-0006Cu-Sq
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 03:08:41 +0000
Date: Tue, 22 Sep 2015 05:00:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Luis de Bethencourt <luis@debethencourt.com>
Cc: linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Jingoo Han <jg1.han@samsung.com>, Wolfram Sang <wsa@the-dreams.de>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 5/5] mtd: orion_nand: Fix module autoload for OF platform
 driver
Message-ID: <20150922030006.GG20288@lunn.ch>
References: <20150917221402.GA9312@goodgumbo.baconseed.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150917221402.GA9312@goodgumbo.baconseed.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 12:14:02AM +0200, Luis de Bethencourt wrote:
> This platform driver has a OF device ID table but the OF module
> alias information is not created so module autoloading won't work.
> 
> Signed-off-by: Luis de Bethencourt <luisbg@osg.samsung.com>

Acked-by: Andrew Lunn <andrew@lunn.ch>

Thanks
	Andrew

> ---
>  drivers/mtd/nand/orion_nand.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
> index c3c6d30..64785f4 100644
> --- a/drivers/mtd/nand/orion_nand.c
> +++ b/drivers/mtd/nand/orion_nand.c
> @@ -201,6 +201,7 @@ static const struct of_device_id orion_nand_of_match_table[] = {
>  	{ .compatible = "marvell,orion-nand", },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, orion_nand_of_match_table);
>  #endif
>  
>  static struct platform_driver orion_nand_driver = {
> -- 
> 2.4.6
> 
