Received: from lunge.mit.edu ([18.54.1.69] helo=lunge.queued.net)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PovEb-00083D-Pe
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 10:00:46 +0000
Date: Mon, 14 Feb 2011 02:00:28 -0800
From: Andres Salomon <dilinger@queued.net>
To: dedekind1@gmail.com
Subject: Re: [PATCH 09/17] t7166xb: mfd_cell is now implicitly available to
	drivers
Message-ID: <20110214020028.2449dbe4@debxo>
In-Reply-To: <1297675064.2854.12.camel@localhost>
References: <20110211181101.3a4325e4@queued.net>
	<1297675064.2854.12.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 Feb 2011 11:17:44 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2011-02-11 at 18:11 -0800, Andres Salomon wrote:
> > No need to explicitly set the cell's platform_data/data_size.
> > 
> > Modify clients to use mfd_get_cell helper function instead of
> > accessing platform_data directly.
> 
> Wold it be possible to separate out MTD-related changes?
> 

It's possible, sure.  Patch 09 is the only one that touches
drivers/mtd.  It would introduce build and/or runtime problems if mtd
and mfd trees get out of synch, however.

I was hoping to get subsystem maintainer ACKs and run everything
through the mfd tree, if possible (though I haven't heard any feedback
from Samuel about any of this yet).
