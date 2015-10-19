Date: Mon, 19 Oct 2015 11:32:31 +0200
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, zmxu@marvell.com,
 jszhang@marvell.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] mtd: pxa3xx_nand: add helpers to setup the timings
Message-ID: <20151019093231.GA29389@kwain>
References: <1444893451-16610-1-git-send-email-antoine.tenart@free-electrons.com>
 <1444893451-16610-3-git-send-email-antoine.tenart@free-electrons.com>
 <20151017135726.GA1578@laptop.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20151017135726.GA1578@laptop.cereza>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel,

On Sat, Oct 17, 2015 at 10:57:26AM -0300, Ezequiel Garcia wrote:
> On 15 Oct 09:17 AM, Antoine Tenart wrote:
> >  /*
> >   * Set the data and OOB size, depending on the selected
> >   * spare and ECC configuration.
> > @@ -1538,6 +1660,19 @@ KEEP_CONFIG:
> >  	if (nand_scan_ident(mtd, 1, def))
> >  		return -ENODEV;
> >  
> > +	if (!pdata->keep_config) {
> > +		ret = pxa3xx_nand_init(host);
> > +		if (ret) {
> > +			dev_err(&info->pdev->dev, "Failed to init nand: %d\n",
> > +				ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	ret = pxa3xx_nand_config_flash(info);
> > +	if (ret)
> > +		return ret;
> > +
> 
> Does this chunk belong to this patch? It wasn't here in the v2, and I believe
> it's not correct as you end up messing with the NDCR setting even if keep_config
> was passed.

You're right, it should be in "[3/4] mtd: pxa3xx_nand: rework flash
detection and timing setup". I made a mistake reworking the series...

And yes, pxa3xx_nand_config_flash() should be called before
"KEEP_CONFIG:".

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
