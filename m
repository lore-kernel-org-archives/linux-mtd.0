Received: from 0122700014.0.fullrate.dk ([95.166.99.235] helo=kernel.dk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6j2Z-0007mv-Vk
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 11:33:25 +0000
Date: Tue, 27 Apr 2010 13:33:19 +0200
From: Jens Axboe <jens.axboe@oracle.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH 2/2] [MTD] Call bdi_init() and bdi_register()
Message-ID: <20100427113319.GJ27497@kernel.dk>
References: <20100426094810.GE27497@kernel.dk>
	<20100426143253.GB4364@logfs.org>
	<20100426143803.GM27497@kernel.dk>
	<20100426144532.GN27497@kernel.dk>
	<20100426163050.GC4364@logfs.org> <20100426163126.GD4364@logfs.org>
	<20100426170247.GP27497@kernel.dk>
	<20100426171236.GG4364@logfs.org>
	<20100427075229.GB27497@kernel.dk>
	<20100427112924.GB13859@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100427112924.GB13859@logfs.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	Paolo Minazzi <paolo.minazzi@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 27 2010, Jörn Engel wrote:
> On Tue, 27 April 2010 09:52:29 +0200, Jens Axboe wrote:
> > 
> > I cooked up that patch myself, here:
> > 
> > http://git.kernel.dk/?p=linux-2.6-block.git;a=commit;h=0661b1ac5d48eb47c8a5948c0554fea25e0895ab
> > 
> > Care to give it a quick spin?
> 
> Works for me.

Goodness, thanks for testing. Now we are pretty close to have something
we can send out.

-- 
Jens Axboe
