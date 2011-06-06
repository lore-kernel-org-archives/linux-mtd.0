Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTZl9-0004jt-KI
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 13:22:24 +0000
Received: by wyb28 with SMTP id 28so3871073wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 06:22:20 -0700 (PDT)
Date: Mon, 6 Jun 2011 14:22:16 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCHv2 1/6] nand/denali: convert to dev_() printk helpers
Message-ID: <20110606132216.GJ11191@pulham.picochip.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
	<1307097169-11744-2-git-send-email-jamie@jamieiles.com>
	<1307365915.3112.68.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1307365915.3112.68.camel@localhost>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
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

OK, fair point (and the rest of your comments).  I'll respin this and 
try to rationalise the messages at the same time.

Jamie
