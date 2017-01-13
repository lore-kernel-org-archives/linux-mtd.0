Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRyhX-0004sz-IT
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2017 10:03:18 +0000
Date: Fri, 13 Jan 2017 11:02:44 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] mtd: spi-nor: don't claim mr25h40 to be JEDEC compatible
Message-ID: <20170113100244.zgg6g4yuhngpumf4@pengutronix.de>
References: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170113093509.25737-1-u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 13, 2017 at 10:35:09AM +0100, Uwe Kleine-König wrote:
> Commit edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40") made it
> possible to use a mr25h40 by writing
> 
> 	compatible = "mr25h40", "jedec,spi-nor";
> 
> in a device tree. This chip however isn't JEDEC compatible however, so
> change the chip string and add a compatible entry to bless
> 
> 	compatible = "mr25h40-nonjedec";
> 
> as the right way.
> 
> Fixes: edd0c8f4932d ("mtd: spi-nor: Add support for mr25h40")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

I intended to write a note here, but sent out the mail before :w :-|

I wrote:

I wonder a bit about the "-nonjedec" suffix and only added it for
consistency. AFAICT all mr25h40 don't support JEDEC, so "-nonjedec"
doesn't really qualify as hardware description. Thoughts?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
