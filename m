Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bykI5-0001DH-Q4
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 18:48:11 +0000
Received: by mail-qt0-x242.google.com with SMTP id s49so60460qta.1
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 11:47:49 -0700 (PDT)
Date: Mon, 24 Oct 2016 16:47:38 -0200
From: Sergio Prado <sergio.prado@e-labworks.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com,
 linux@armlinux.org.uk, linux@simtec.co.uk, richard@nod.at,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: s3c2410: parse the device configuration from
 OF node
Message-ID: <20161024184738.GA26671@sprado-desktop>
References: <1476999766-32526-1-git-send-email-sergio.prado@e-labworks.com>
 <1476999766-32526-4-git-send-email-sergio.prado@e-labworks.com>
 <20161024150201.01952f67@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161024150201.01952f67@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 24, 2016 at 03:02:01PM +0200, Boris Brezillon wrote:
> > +static int s3c2410_nand_setup_data_interface(struct mtd_info *mtd,
> > +					     const struct nand_data_interface *conf,
> > +					     bool check_only)
> > +{
> > +	struct s3c2410_nand_info *info = s3c2410_nand_mtd_toinfo(mtd);
> > +	struct s3c2410_platform_nand *pdata = info->platform;
> > +	const struct nand_sdr_timings *timings;
> > +	int tacls;
> > +
> > +	timings = nand_get_sdr_timings(conf);
> > +	if (IS_ERR(timings))
> > +		return -ENOTSUPP;
> > +
> > +	tacls = timings->tCLS_min - timings->tWP_min;
> > +	if (tacls < 0)
> > +		tacls = 0;
> > +
> > +	pdata->tacls  = DIV_ROUND_UP(tacls, 1000);
> > +	pdata->twrph0 = DIV_ROUND_UP(timings->tWP_min, 1000);
> > +	pdata->twrph1 = DIV_ROUND_UP(timings->tCLH_min, 1000);
> 
> You seem to only apply the timings in s3c2410_nand_setrate(), which is
> only called at probe time or on a cpufreq even, but the core can change
> timings at runtime (this is what happens each time you reset the chip).
> 
> To support that you have 2 options:
>  - apply the timings in ->select_chip()
>  - apply the timings here

Right. As far as I understood, ->setup_data_interface() will be called
when MTD core change timings at runtime, so it is enough to apply the
timings in the end of ->setup_data_interface()?

Thanks,

Sergio Prado
