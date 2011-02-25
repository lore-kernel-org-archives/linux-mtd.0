Received: from mga11.intel.com ([192.55.52.93])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvCt-0002qZ-Sv
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 10:47:32 +0000
Date: Fri, 25 Feb 2011 11:47:27 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 09/29] t7166xb: mfd_cell is now implicitly available to
	drivers
Message-ID: <20110225104726.GB2693@sortiz-mobl>
References: <1297998456-7615-1-git-send-email-dilinger@queued.net>
	<1297998456-7615-10-git-send-email-dilinger@queued.net>
	<1298624712.2798.21.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1298624712.2798.21.camel@localhost>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andres Salomon <dilinger@queued.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, Feb 25, 2011 at 11:05:12AM +0200, Artem Bityutskiy wrote:
> On Thu, 2011-02-17 at 19:07 -0800, Andres Salomon wrote:
> > No need to explicitly set the cell's platform_data/data_size.
> > 
> > Modify clients to use mfd_get_cell helper function instead of
> > accessing platform_data directly.
> > 
> > Signed-off-by: Andres Salomon <dilinger@queued.net>
> 
> Just to re-confirm, I suggest to merge these MTD changes via Samuel's
> tree, thanks.
Thanks, I'll take them.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
