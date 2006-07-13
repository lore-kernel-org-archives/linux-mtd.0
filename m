Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G11Zk-0004lJ-Gw
	for linux-mtd@lists.infradead.org; Thu, 13 Jul 2006 09:50:10 -0400
Date: Thu, 13 Jul 2006 16:49:51 +0300
From: Ville Herva <vherva@vianova.fi>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work (try 3)
Message-ID: <20060713134951.GD15078@vianova.fi>
References: <20060707122221.GW6240@vianova.fi>
	<20060711062342.GY6240@vianova.fi>
	<20060712095048.GB14333@wohnheim.fh-wedel.de>
	<20060712172359.GZ15078@vianova.fi>
	<20060713133959.GA24056@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060713133959.GA24056@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 13, 2006 at 03:39:59PM +0200, you [Jörn Engel] wrote:
> > 
> > -	ret = block2mtd_setup2(block2mtd_paramline);
> > +	if (strlen(block2mtd_paramline)) 
> > +		ret = block2mtd_setup2(block2mtd_paramline);
> > 
> > might be sensible in block2mtd_init(). (I'm trusting that .initdata and
> > block2mtd_paramline are zero-initialized.)
> 
> Looks sane.  Can you send a proper patch for this?
> 
> Acked-by: Joern Engel <joern@wohnheim.fh-wedel.de>

Sure. Do you prefer an incremental or the whole patch re-done?



-- v -- 

v@iki.fi
