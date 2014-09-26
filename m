Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXRAd-0003lJ-NR
 for linux-mtd@lists.infradead.org; Fri, 26 Sep 2014 08:46:32 +0000
From: Marek Vasut <marex@denx.de>
To: bpqw <bpqw@micron.com>
Subject: Re: [PATCH 1/1] driver:mtd:spi-nor: Add Micron quad I/O support
Date: Fri, 26 Sep 2014 10:46:07 +0200
References: <A765B125120D1346A63912DDE6D8B6315DCC46@NTXXIAMBX02.xacn.micron.com>
 <201409251211.57183.marex@denx.de>
 <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <A765B125120D1346A63912DDE6D8B6315DCDF1@NTXXIAMBX02.xacn.micron.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201409261046.07132.marex@denx.de>
Cc: "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "shijie8@gmail.com" <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, September 26, 2014 at 10:39:38 AM, bpqw wrote:
> >> +	/* set EVCR ,enable quad I/O */
> >> +	nor->cmd_buf[0] = val & ~EVCR_QUAD_EN_MICRON;
> >> +	ret = nor->write_reg(nor, SPINOR_OP_WD_EVCR, nor->cmd_buf, 1, 0);
> >> +	if (ret < 0) {
> >> +		dev_err(nor->dev,
> >> +			"error while writing EVCR register\n");
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	if (wait_till_ready(nor))
> >> +		return 1;
> >
> >Why does this not return proper error code or even better, return value
> >from wait_till_ready() ?
> >
> >Other than that, there's nothing wrong with the patch I think.
> 
> Hi,Marek
> Thanks for your review,you can find the same usage in the spi-nor.c.
> Below method is OK? Or you can give me some suggestion.
> 
> if (wait_till_ready(nor))
> 	return - EINVAL;

ret = wait_till_readynor()
if (ret)
 return ret;

But all right, this means the subsystem isn't perfect. Well, others, what do you 
think ?

Best regards,
Marek Vasut
