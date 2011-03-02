Received: from mga09.intel.com ([134.134.136.24])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PujOZ-0002aX-90
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2011 10:35:04 +0000
Date: Wed, 2 Mar 2011 11:34:46 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH] tmio: silence warnings introduced by mfd changes
Message-ID: <20110302103446.GE16181@sortiz-mobl>
References: <20110301154230.df32be17.sfr@canb.auug.org.au>
	<20110301105322.48754094@debxo> <20110301123220.705d3368@debxo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110301123220.705d3368@debxo>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
	David Brownell <dbrownell@users.sourceforge.net>,
	linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ian Molton <ian@mnementh.co.uk>,
	linux-next@vger.kernel.org, linux-mtd@lists.infradead.org,
	Chris Ball <cjb@laptop.org>, David Woodhouse <dwmw2@infradead.org>,
	Greg Kroah-Hartman <gregkh@suse.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andres,

On Tue, Mar 01, 2011 at 12:32:20PM -0800, Andres Salomon wrote:
> On Tue, 1 Mar 2011 10:53:22 -0800
> Andres Salomon <dilinger@queued.net> wrote:
> 
> > On Tue, 1 Mar 2011 15:42:30 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Hi Samuel,
> > > 
> > > After merging the mfd tree, today's linux-next build (x86_64
> > > allmodconfig) produced these warnings:
> > > 
> > > drivers/video/tmiofb.c: In function 'tmiofb_hw_init':
> > > drivers/video/tmiofb.c:270: warning: initialization discards
> > > qualifiers from pointer target type drivers/video/tmiofb.c: In
> > > function 'tmiofb_hw_mode': drivers/video/tmiofb.c:314: warning:
> > > initialization discards qualifiers from pointer target type
> > > drivers/video/tmiofb.c:314: warning: unused variable 'cell'
> > > drivers/video/tmiofb.c: In function 'tmiofb_probe':
> > > drivers/video/tmiofb.c:683: warning: initialization discards
> > > qualifiers from pointer target type drivers/video/tmiofb.c: In
> > > function 'tmiofb_remove': drivers/video/tmiofb.c:811: warning:
> > > initialization discards qualifiers from pointer target type
> > > drivers/video/tmiofb.c: In function 'tmiofb_suspend':
> > > drivers/video/tmiofb.c:941: warning: initialization discards
> > > qualifiers from pointer target type drivers/video/tmiofb.c: In
> > > function 'tmiofb_resume': drivers/video/tmiofb.c:973: warning:
> > > initialization discards qualifiers from pointer target type
> > > 
> > > Introduced by commits 2a79bb1d72f5ac22dff96de340d90d512f852ecb
> > > ("mfd: mfd_cell is now implicitly available to tc6393xb drivers")
> > > and b6361637190e6cb7acb84509499942ada69e7136 ("fb: Use mfd_data
> > > instead of driver_data for tmio-fb").
> > > 
> > 
> > Oops, this should fix that.
> > 
> > 
> > 
> 
> 
> Actually, I noticed that I screwed this up for the other tmio drivers
> as well.  Here's a patch that addresses them all (you can
> ignore the previous patch).
Patch applied, thanks for fixing that.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
