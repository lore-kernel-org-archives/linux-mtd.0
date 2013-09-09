Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VIyA0-0000ou-GI
 for linux-mtd@lists.infradead.org; Mon, 09 Sep 2013 09:53:33 +0000
Date: Mon, 9 Sep 2013 06:53:27 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [RFC/PATCH] mtd: nand: pxa3xx: Remove redundant device probing
Message-ID: <20130909095327.GA2396@localhost>
References: <1378478428-25280-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1378478428-25280-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <522D8C2F.6040501@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <522D8C2F.6040501@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 haojian.zhuang@gmail.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 09, 2013 at 10:51:59AM +0200, Daniel Mack wrote:
> Hi Ezequiel,
> 
> On 06.09.2013 16:40, Ezequiel Garcia wrote:
> > There's no need to go through this internal probe/auto-detect
> > procedure, since the nand core code will take care of that.
> > This commit removes the configuration and detection functions,
> > together with the built-in flash device table.
> > 
> > Besides being unneeded, it's also wrong to take care of such details
> > wich rightfully belong to the NAND base code. Removing this wrong
> > code, prevents the proliferation of the same mistake in future drivers.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > ---
> > This patch doesn't build, because it needs some other patches to be
> > applied first. It's not meant for inclusion, but to discuss about
> > the possibility of engaging such agressive cleanup on this driver.
> 
> Which patch is needed to make this one apply?
> 

Actually, after reviewing this change is not depending on any other
patch. It just needs this patch to be rebased properly, so it can be applied now.

Let me send another one.

> > @@ -1064,69 +989,18 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
> >  {
> >  	struct pxa3xx_nand_host *host = mtd->priv;
> >  	struct pxa3xx_nand_info *info = host->info_data;
> > -	struct platform_device *pdev = info->pdev;
> > -	struct pxa3xx_nand_platform_data *pdata = dev_get_platdata(&pdev->dev);
> > -	struct nand_flash_dev pxa3xx_flash_ids[2], *def = NULL;
> > -	const struct pxa3xx_nand_flash *f = NULL;
> >  	struct nand_chip *chip = mtd->priv;
> > -	uint32_t id = -1;
> > -	uint64_t chipsize;
> > -	int i, ret, num;
> > +	int ret;
> >  
> > -	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
> > -		goto KEEP_CONFIG;
> 
> The keep_config pdata setting was necessary in the past in order to
> purely rely on the nand controller timing settings as configured by the
> bootloader.
> 

The patch removes the keep_config checl since now it depends solely in
bootloader's settings. A future patch should add proper timing settings
either through detected ONFI stuff (is this possible?) or through DT
bindings; and re-introduce the check for keep_config.

> I'd like to have another look and test your patch, if you tell me its
> dependecy chain.
> 

Ok, great. I'll re-send something applicable.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
