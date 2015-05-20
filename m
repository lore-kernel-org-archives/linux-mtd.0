Date: Wed, 20 May 2015 11:41:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 0/5] ARM: shmobile: dts: Replace "nor-jedec" by
 "jedec,spi-nor"
Message-ID: <20150520184150.GG11598@ld-irv-0074>
References: <1432145814-12442-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432145814-12442-1-git-send-email-geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-sh@vger.kernel.org,
 Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms@verge.net.au>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd, FYI

On Wed, May 20, 2015 at 08:16:49PM +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series replaces the recently introduced "nor-jedec"
> compatible value by "jedec,spi-nor" in all shmobile dts files,
> cfr. commit 8947e396a8296c52 ('Documentation: dt: mtd: replace
> "nor-jedec" binding with "jedec,spi-nor"'), which was applied in
> v4.1-rc4.
> 
> As the "bad" compatible values are already in -next for v4.2, these
> updates should be applied and queued for v4.2, too.
> 
> Thanks for applying!

For the series:

Acked-by: Brian Norris <computersforpeace@gmail.com>

Thanks Geert!
