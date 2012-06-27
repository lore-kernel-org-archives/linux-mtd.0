Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SjwPu-0001TT-0R
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 17:52:39 +0000
Date: Wed, 27 Jun 2012 19:52:34 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 1/2] mtd mxc_nand: use 32bit copy functions
Message-ID: <20120627175234.GF18096@pengutronix.de>
References: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1337955762-19157-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, May 25, 2012 at 04:22:41PM +0200, Sascha Hauer wrote:
> The following commit changes the function used to copy from/to
> the hardware buffer to memcpy_[from|to]io. This does not work
> since the hardware cannot handle the byte accesses used by these
> functions. Instead of reverting this patch introduce 32bit
> correspondents of these functions.
> 
> commit 5775ba36ea9c760c2d7e697dac04f2f7fc95aa62
> Author: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Date:   Tue Apr 24 10:05:22 2012 +0200
> 
>     mtd: mxc_nand: fix several sparse warnings about incorrect address space
> 
>     Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

I don't know about the sparse problems this introduces, but without this
patch the mxc-nand driver is broken, so it should really go in before
3.5.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
