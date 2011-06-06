Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTaDF-0005bs-D3
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 13:51:25 +0000
Received: by wwb39 with SMTP id 39so2993406wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 06:51:23 -0700 (PDT)
Date: Mon, 6 Jun 2011 14:51:18 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
Subject: Re: [PATCHv2 1/6] nand/denali: convert to dev_() printk helpers
Message-ID: <20110606135118.GK11191@pulham.picochip.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
	<1307097169-11744-2-git-send-email-jamie@jamieiles.com>
	<1307365915.3112.68.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307365915.3112.68.camel@localhost>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 06, 2011 at 04:11:55PM +0300, Artem Bityutskiy wrote:
> On Fri, 2011-06-03 at 11:32 +0100, Jamie Iles wrote:
> >  	if ((data_invalid - acc_clks * CLK_X) < 2)
> > -		dev_warn(denali->dev, "%s, Line %d: Warning!\n",
> > -			__FILE__, __LINE__);
> > +		dev_warn(denali->dev, "%s, Line %d: Warning!\n", __FILE__,
> > +			 __LINE__);
> 
> Do you really need __FILE__ and __LINE__ here? And may be you could also
> change the warning message? Just printing "warning!" is a bit silly.

I'm afraid I can't work out from the Denali documentation that we have 
what this is actually warning about.  Chuanxiao, is there a better error 
message we can print here that can help users to debug it?  Is this just 
an unsupported ONFI timing mode or something more sinister?

Jamie
