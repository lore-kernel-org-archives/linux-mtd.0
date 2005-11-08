Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZRCe-00008U-2C
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 05:59:51 -0500
Date: Tue, 8 Nov 2005 11:59:24 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20051108105923.GA31446@wohnheim.fh-wedel.de>
References: <20051105162650.620266000@b551138y.boeblingen.de.ibm.com>
	<20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/25] mtd: move ioctl32 code to mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 5 November 2005 17:26:56 +0100, Arnd Bergmann wrote:
> 
> The MTD ioctls are all specific to mtdchar.c, so the
> compat code for them should be there as well.
> 
> Also, some of the ioctl commands used in that driver
> were previously not marked as compatible.
> 
> The conversion handlers could be further simplified
> by not using compat_alloc_user_space any more.
> 
> CC: dwmw2@infradead.org
> CC: linux-mtd@lists.infradead.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Jörn Engel <joern@wh.fh-wedel.de>

Moving crap over to mtdchar.c is a good thing.  Complete removal of
mtdchar.c might be even better, but at least the crap is relatively
self-contained now.

Jörn

-- 
When in doubt, punt.  When somebody actually complains, go back and fix it...
The 90% solution is a good thing.
-- Rob Landley
