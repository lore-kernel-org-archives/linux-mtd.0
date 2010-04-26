Received: from 0122700014.0.fullrate.dk ([95.166.99.235] helo=kernel.dk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6RgZ-0003sI-Ht
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2010 17:01:32 +0000
Date: Mon, 26 Apr 2010 19:01:28 +0200
From: Jens Axboe <jens.axboe@oracle.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH 1/2] [MTD] Move mtd_bdi_*mappable to mtdcore.c
Message-ID: <20100426170128.GO27497@kernel.dk>
References: <alpine.LFD.2.00.1004220730280.9086@i5.linux-foundation.org>
	<20100422162709.GJ27497@kernel.dk>
	<20100422203358.GB30749@logfs.org>
	<20100423100532.GN27497@kernel.dk>
	<20100423205518.GB7008@logfs.org>
	<20100426094810.GE27497@kernel.dk>
	<20100426143253.GB4364@logfs.org>
	<20100426143803.GM27497@kernel.dk>
	<20100426144532.GN27497@kernel.dk>
	<20100426163050.GC4364@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100426163050.GC4364@logfs.org>
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

On Mon, Apr 26 2010, Jörn Engel wrote:
> On Mon, 26 April 2010 16:45:32 +0200, Jens Axboe wrote:
> > 
> > Took a quick look, and you want bdi_setup_and_register() for the three
> > bdis listed in mtdbdi.c in mtdcore.c:init_mtd(). Or manual bdi_init()
> > and bdi_register(). I'll take a look post-dinner. Either is workable,
> > but since the flags are already setup, the latter may be cleaner.
> 
> Ok, here are two patches that appear to solve the problem for me.
> 
> diff --git a/drivers/mtd/devices/drais.c b/drivers/mtd/devices/drais.c
> index b93ff3f..6f81b28 100644
> --- a/drivers/mtd/devices/drais.c
> +++ b/drivers/mtd/devices/drais.c
> @@ -33,7 +33,7 @@
>  #include <linux/sched.h>
>  #include "drais.h"
>  
> -#undef DEBUG_ERASE
> +#define DEBUG_ERASE

Leftover debugging?

-- 
Jens Axboe
