Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KNxGA-0006dI-Sh
	for linux-mtd@lists.infradead.org; Tue, 29 Jul 2008 22:01:35 +0000
Date: Tue, 29 Jul 2008 15:00:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [RESEND PATCH 2.6.26-git 1/2] MTD DataFlash: bugfix, binary
	page sizes now handled (v3)
Message-Id: <20080729150052.80e558db.akpm@linux-foundation.org>
In-Reply-To: <200807251549.12565.david-b@pacbell.net>
References: <1212467165-26379-1-git-send-email-cooloney@kernel.org>
	<200806282321.34275.david-b@pacbell.net>
	<200807251549.12565.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: cooloney@kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 25 Jul 2008 15:49:12 -0700
David Brownell <david-b@pacbell.net> wrote:

> This fixes a bug in handling certain newer DataFlash chips (at45db321d
> and at45db642d have current Linux users) when they were configured to
> use binary page sizes (possibly at the factory).
> 
>  - Use JEDEC probing (borrowed from m25p80 driver) to tell if the chip
>    supports binary page sizes ... if so, then query the chip to tell
>    whether it's currently using them.
> 
>  - Print that pagesize during probe; erasesize is still listed in 
>    the /proc/mtd file, useful for making filesystems.
> 
> Also fix a pre-existing bug with 2 MBit parts using the wrong pagesize;
> these are a bit smaller than Linux would normally use (even shared with
> a small FPGA's configuration bitstream).

I'm not sure what kernel this is against, but it gets a reject storm
against 2.6.27-rc1.  As does [2/2].
