Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PowFn-00008N-GP
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2011 11:06:04 +0000
Received: by wwb17 with SMTP id 17so4795748wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Feb 2011 03:06:02 -0800 (PST)
Subject: Re: [PATCH 09/17] t7166xb: mfd_cell is now implicitly available to
	drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andres Salomon <dilinger@queued.net>
In-Reply-To: <20110214020028.2449dbe4@debxo>
References: <20110211181101.3a4325e4@queued.net>
	<1297675064.2854.12.camel@localhost>  <20110214020028.2449dbe4@debxo>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Feb 2011 13:04:51 +0200
Message-ID: <1297681491.2854.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-14 at 02:00 -0800, Andres Salomon wrote:
> On Mon, 14 Feb 2011 11:17:44 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Fri, 2011-02-11 at 18:11 -0800, Andres Salomon wrote:
> > > No need to explicitly set the cell's platform_data/data_size.
> > > 
> > > Modify clients to use mfd_get_cell helper function instead of
> > > accessing platform_data directly.
> > 
> > Wold it be possible to separate out MTD-related changes?
> > 
> 
> It's possible, sure.  Patch 09 is the only one that touches
> drivers/mtd.  It would introduce build and/or runtime problems if mtd
> and mfd trees get out of synch, however.
> 
> I was hoping to get subsystem maintainer ACKs and run everything
> through the mfd tree, if possible (though I haven't heard any feedback
> from Samuel about any of this yet).

OK, I'm not MTD maintainer, but I'd say that you can merge it via mfd
tree. I did no look at the whole set, but mtd changes look trivial and
there should not be issues with merging that via the mfd tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
