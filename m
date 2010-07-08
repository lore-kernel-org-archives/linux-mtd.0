Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWkBA-0003Ou-F3
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 06:01:49 +0000
Subject: Re: [PATCH 1/2] mtd: m25p80: Fix false-positive probing
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anton Vorontsov <avorontsov@mvista.com>
In-Reply-To: <20100622165734.GA20699@oksana.dev.rtsoft.ru>
References: <20100622165545.GA10255@oksana.dev.rtsoft.ru>
	<20100622165734.GA20699@oksana.dev.rtsoft.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jul 2010 08:57:24 +0300
Message-ID: <1278568644.12733.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <dbrownell@users.sourceforge.net>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	uclinux-dist-devel@blackfin.uclinux.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-22 at 20:57 +0400, Anton Vorontsov wrote:
> Since commit 18c6182bae0acca220ed6611f741034d563cd19f ("Rework
> probing/JEDEC code"), m25p80 driver successfully registers chips
> even if JEDEC probing fails.
> 
> This was needed to support non-JEDEC flashes. Though, it appears
> that some platforms (e.g. blackfin bf533 stamp[1]) used the old
> behavior to detect if there's any flash connected, so the driver
> have to fail on JEDEC probing errors.
> 
> This patch restores the old behavior for JEDEC flashes, and adds
> "-nonjedec" SPI device IDs for M25Pxx flashes, so that the kernel
> still supports non-JEDEC flashes.
> 
> [1] http://blackfin.uclinux.org/gf/project/uclinux-dist/tracker/?action=TrackerItemEdit&tracker_item_id=5975
> 
> Reported-by: Mingquan Pan
> Reported-by: Barry Song <21cnbao@gmail.com>
> Signed-off-by: Anton Vorontsov <avorontsov@mvista.com>
> ---

Pushed both patches to my l2-mtd-2.6.git / dunno, added Mike's ack.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
