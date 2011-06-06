Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTbte-00087t-PT
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 15:39:19 +0000
Received: by bwz1 with SMTP id 1so4841553bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 08:39:16 -0700 (PDT)
Subject: Re: [PATCHv2 1/6] nand/denali: convert to dev_() printk helpers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <20110606135118.GK11191@pulham.picochip.com>
References: <1307097169-11744-1-git-send-email-jamie@jamieiles.com>
	<1307097169-11744-2-git-send-email-jamie@jamieiles.com>
	<1307365915.3112.68.camel@localhost>
	<20110606135118.GK11191@pulham.picochip.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 18:35:00 +0300
Message-ID: <1307374500.3112.82.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Chuanxiao Dong <chuanxiao.dong@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 14:51 +0100, Jamie Iles wrote:
> On Mon, Jun 06, 2011 at 04:11:55PM +0300, Artem Bityutskiy wrote:
> > On Fri, 2011-06-03 at 11:32 +0100, Jamie Iles wrote:
> > >  	if ((data_invalid - acc_clks * CLK_X) < 2)
> > > -		dev_warn(denali->dev, "%s, Line %d: Warning!\n",
> > > -			__FILE__, __LINE__);
> > > +		dev_warn(denali->dev, "%s, Line %d: Warning!\n", __FILE__,
> > > +			 __LINE__);
> > 
> > Do you really need __FILE__ and __LINE__ here? And may be you could also
> > change the warning message? Just printing "warning!" is a bit silly.
> 
> I'm afraid I can't work out from the Denali documentation that we have 
> what this is actually warning about.  Chuanxiao, is there a better error 
> message we can print here that can help users to debug it?  Is this just 
> an unsupported ONFI timing mode or something more sinister?

Well, we could kill it or change with "WARN_ON()" may be? Better to het
a comment from Chuanxiao of course ...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
