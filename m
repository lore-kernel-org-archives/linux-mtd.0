Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad26W-0002oe-Hr
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 20:50:13 +0000
Received: by mail-pf0-x243.google.com with SMTP id q129so8680971pfb.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 12:49:52 -0800 (PST)
Date: Mon, 7 Mar 2016 12:49:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v2] mtd: nand: pxa3xx_nand: kill unused field 'drcmr_cmd'
Message-ID: <20160307204949.GY55664@google.com>
References: <1457147553-71596-1-git-send-email-computersforpeace@gmail.com>
 <877fhhwcft.fsf@belgarion.home> <20160307183730.GU55664@google.com>
 <87pov6ulmh.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pov6ulmh.fsf@belgarion.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 07, 2016 at 08:35:34PM +0100, Robert Jarzmik wrote:
> Brian Norris <computersforpeace@gmail.com> writes:
> 
> > With this removal, we don't need to 'get' the second DMA resource
> > either, as it's also unused.
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > On Sat, Mar 05, 2016 at 09:34:14AM +0100, Robert Jarzmik wrote:
> >> Brian Norris <computersforpeace@gmail.com> writes:
> >> > @@ -1812,7 +1811,6 @@ static int alloc_nand_resource(struct platform_device *pdev)
> >> >  			ret = -ENXIO;
> >> >  			goto fail_disable_clk;
> >> >  		}
> >> > -		info->drcmr_cmd = r->start;
> >> >  	}
> >> If you kill this field, why not kill also this block just above ?
> >> 		r = platform_get_resource(pdev, IORESOURCE_DMA, 1);
> >> 		if (r == NULL) {
> >> 			dev_err(&pdev->dev,
> >> 				"no resource defined for cmd DMA\n");
> >> 			ret = -ENXIO;
> >> 			goto fail_disable_clk;
> >> 		}
> >
> > Indeed, why not.
> >
> >  drivers/mtd/nand/pxa3xx_nand.c | 10 ----------
> >  1 file changed, 10 deletions(-)
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Applied to l2-mtd.git
