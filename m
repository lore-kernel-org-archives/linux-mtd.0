Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAGip-0005YK-CN
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 09:53:32 +0000
Date: Fri, 16 Aug 2013 11:53:02 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH] m25p80 / fast read
Message-ID: <20130816095302.GA1380@pengutronix.de>
References: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

Any chance you take this for the next merge window?

Thanks
 Sascha

On Mon, Aug 12, 2013 at 12:22:22PM +0200, Sascha Hauer wrote:
> The following adds support for the mr25h10 chip to to the m25p80
> driver.
> 
> This driver currently has the problem that it unconditionally uses
> the fast_read command once it's enabled in Kconfig which of course
> leads to problems with multiboard kernels. This series adds a flag
> to the chip specific data to solve this. Also some unnecessary ifdefs
> are removed.
> 
> Sascha
> 
> ----------------------------------------------------------------
> Markus Niebel (1):
>       mtd: m25p80: add support for mr25h10
> 
> Sascha Hauer (3):
>       mtd: m25p80: Pass flags through CAT25_INFO macro
>       mtd: m25p80: make CONFIG_M25PXX_USE_FAST_READ safe to enable
>       mtd: m25p80: remove unnecessary ifdef
> 
>  drivers/mtd/devices/m25p80.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
