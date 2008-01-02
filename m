Received: from smtp5.pp.htv.fi ([213.243.153.39])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J9rc3-0005bI-NA
	for linux-mtd@lists.infradead.org; Wed, 02 Jan 2008 00:37:46 +0000
Date: Wed, 2 Jan 2008 02:37:24 +0200
From: Adrian Bunk <bunk@kernel.org>
To: Wolfgang Denk <wd@denx.de>
Subject: Re: [2.6 patch] remove broken MTD drivers
Message-ID: <20080102003724.GL27566@does.not.exist>
References: <20080101231140.GF27566@does.not.exist>
	<20080102002826.574C324889@gemini.denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080102002826.574C324889@gemini.denx.de>
Cc: linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 02, 2008 at 01:28:26AM +0100, Wolfgang Denk wrote:
> In message <20080101231140.GF27566@does.not.exist> you wrote:
> >
> > The header of ppchameleonevb.c claims it comes from info@wawnet.biz 
> 
> Argh. That's indeed ancient code.
> 
> So what should I do to fix this? Wait for Thomas' response, or port
> patches here?

I'd say post patches, and I'd expect David to actually be the one who
reviews and incorporates them.

> Best regards,
> 
> Wolfgang Denk

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
