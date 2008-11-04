Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KxOHn-0002Xc-U4
	for linux-mtd@lists.infradead.org; Tue, 04 Nov 2008 15:57:44 +0000
Subject: Re: [PATCH] jffs2: Fix race condition in jffs2_lzo_compress()
From: Richard Purdie <rpurdie@openedhand.com>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
In-Reply-To: <Pine.LNX.4.64.0811031714590.6298@vixen.sonytel.be>
References: <Pine.LNX.4.64.0811031714590.6298@vixen.sonytel.be>
Content-Type: text/plain
Date: Tue, 04 Nov 2008 15:57:40 +0000
Message-Id: <1225814260.5433.13.camel@dax.rpnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Linux Kernel Development <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2008-11-03 at 17:17 +0100, Geert Uytterhoeven wrote:
> deflate_mutex protects the globals lzo_mem and lzo_compress_buf. However,
> jffs2_lzo_compress() unlocks deflate_mutex _before_ it has copied out the
> compressed data from lzo_compress_buf. Correct this by moving the mutex unlock
> after the copy.
> In addition, document what deflate_mutex actually protects.
> 
> Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

Acked-by: Richard Purdie <rpurdie@linux.intel.com>

This should probably be queued as a bugfix for the current -rc series.

> ---
> Just noticed this when looking at the code.
> The patch is untested, except for a quick compile test.
> 
>  fs/jffs2/compr_lzo.c |   15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
