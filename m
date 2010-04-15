Received: from isilmar.linta.de ([213.133.102.198] helo=linta.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O2TLN-0004dM-Mi
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 17:59:14 +0000
Date: Thu, 15 Apr 2010 19:59:04 +0200
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Alexander Kurz <linux@blala.de>, David Woodhouse <dwmw2@infradead.org>,
	Magnus Damm <damm@opensource.se>, Karsten Keil <keil@b1-systems.de>,
	linux-pcmcia@lists.infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] drivers/mtd/maps/pcmciamtd.c: coding style cleanups
Message-ID: <20100415175904.GC31336@comet.dominikbrodowski.net>
References: <alpine.DEB.1.10.1004121949570.7438@blala.de>
	<20100415172750.GB27756@comet.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100415172750.GB27756@comet.dominikbrodowski.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 15, 2010 at 07:27:50PM +0200, Dominik Brodowski wrote:
> On Mon, Apr 12, 2010 at 07:51:12PM +0400, Alexander Kurz wrote:
> > @@ -691,7 +701,8 @@ static void pcmciamtd_detach(struct pcmcia_device *link)
> >  	if(dev->mtd_info) {
> >  		del_mtd_device(dev->mtd_info);
> >  		map_destroy(dev->mtd_info);
> > -		info("mtd%d: Removed", dev->mtd_info->index);
> > +		dev_info(&dev->p_dev->dev, "mtd%d: Removed\n",
> > +			 dev->mtd_info->index);
> >  	}
> 
> Could you switch the ordering between map_destroy() and dev_info(), please,
> to avoid an use-after-free? See the attached message by Julia Lawall, who
> noted this issue first.

Actually, to avoid any of the patches getting lost, I created a branch
"pcmciamtd" at:

http://git.kernel.org/?p=linux/kernel/git/brodo/pcmcia-2.6.git;a=shortlog;h=refs/heads/pcmciamtd
