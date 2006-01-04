Received: from mailout.stusta.mhn.de ([141.84.69.5])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Etx3Y-0005oc-Kf
	for linux-mtd@lists.infradead.org; Tue, 03 Jan 2006 20:03:18 -0500
Date: Wed, 4 Jan 2006 02:03:02 +0100
From: Adrian Bunk <bunk@stusta.de>
To: Andrew Morton <akpm@osdl.org>
Message-ID: <20060104010302.GL3831@stusta.de>
References: <20051216005505.GW23349@stusta.de>
	<0IRK00I50JP6FZ@mmp1.samsung.com>
	<20060103165437.2311cfc1.akpm@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060103165437.2311cfc1.akpm@osdl.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, torvalds@osdl.org,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/mtd/onenand/: unacceptable stack usage
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 03, 2006 at 04:54:37PM -0800, Andrew Morton wrote:
> Kyungmin Park <kyungmin.park@samsung.com> wrote:
> >
> >  OK. I change the source code. 
> >  It is working well on OMAP H4 with 2.6.15-rc4 kernel and LTP fs test is
> >  passed.
> > 
> >  And please apply the recent onenand patch
> > 
> >  	- check correct manufacturer 
> >  	- unlock problem in DDP (Double Density Package)
> >  	- add platform_device.h instead of device.h
> > 
> >  Thank you
> 
> These patches are wordwrapped and cannot be applied.
> 
> You've included three separate patches in the body of a single email. 
> Please don't do that.  One patch per email is preferred.
> 
> So please redo these patches against 2.6.15 and resend them, as per
> http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt, thanks.

???

The patches are already included in 2.6.15.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
