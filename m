Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJXof-0000nm-KL
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 05:20:35 +0000
Date: Fri, 18 May 2018 08:20:17 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Bin Meng <bmeng.cn@gmail.com>, Richard Weinberger <richard@nod.at>,
 Anthony Wong <anthony.wong@canonical.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 1/2] spi-nor: intel-spi: Fix atomic sequence handling
Message-ID: <20180518052017.GD15419@lahna.fi.intel.com>
References: <20180205113300.21270-1-mika.westerberg@linux.intel.com>
 <20180227165142.GL2424@lahna.fi.intel.com>
 <20180403134836.GD2173@lahna.fi.intel.com>
 <cf459344-c3aa-5bf7-c013-782a402d797c@gmail.com>
 <20180404212238.0dbeae6f@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180404212238.0dbeae6f@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 04, 2018 at 09:22:38PM +0200, Boris Brezillon wrote:
> On Wed, 4 Apr 2018 10:21:45 +0200
> Marek Vasut <marek.vasut@gmail.com> wrote:
> 
> > On 04/03/2018 03:48 PM, Mika Westerberg wrote:
> > > On Tue, Feb 27, 2018 at 06:51:42PM +0200, Mika Westerberg wrote:  
> > >> On Mon, Feb 05, 2018 at 02:32:59PM +0300, Mika Westerberg wrote:  
> > >>> Changes from v1:
> > >>>
> > >>>   - Added atomic_preopcode field and only when it is set, enable atomic
> > >>>     sequence.
> > >>>   - Return -EINVAL if the requested WREN operation cannot be found from
> > >>>     PREOP register instead of silently pretending it is supported.
> > >>>   - Updated patch subject to match more closely what is being fixed.  
> > >>
> > >> Any comments on these two? I did the changes Cyrille asked me to do.  
> > > 
> > > Ping. If no comments, could someone pick these up please.
> > >   
> > Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
> > 
> 
> Will queue this patches to mtd/fixes just after 4.17-rc1 is out. Sorry
> for the huge delay.

Hi,

Did these patches end up somewhere? I can't see them in current
v4.17-rc5.

Thanks!
