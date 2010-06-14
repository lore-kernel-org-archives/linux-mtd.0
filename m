Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OO5Gr-0002C0-N2
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 08:43:54 +0000
Date: Mon, 14 Jun 2010 10:43:51 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [PATCH] mxc_nand: fix PM
Message-ID: <20100614084351.GC12159@pengutronix.de>
References: <1274942000-3580-2-git-send-email-eric@eukrea.com>
	<1274982919-13251-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1274982919-13251-1-git-send-email-eric@eukrea.com>
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Eric,

On Thu, May 27, 2010 at 07:55:19PM +0200, Eric Bénard wrote:
> * when resuming, we get the following log :
> nand_resume called for a chip which is not in suspended state
> * this happens because mtd->suspend and mtd->resume are already
> called from the mtd layer, thus they were called a second time
> in mxc_nand so mtd complains when trying to resume for the
> second time
> * the fix is to remove these call and thus remove the supend and
> resume functions of mxc_nand
the commit log looks IMHO ugly.  Better make it (including Subject):

mtd/mxc_nand: don't call mtd->{suspend,resume} explicitly

The mtd layer is responsible to call mtd->{suspend,resume}.  Doing it
again in the driver is wrong and results in a warning:

	nand_resume called for a chip which is not in suspended state

at resume time.  Removing the calls from the resume and suspend
functions makes them empty allowing them to be deleted completely.

Signed-off-by: Eric Bénard <eric@eukrea.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mtd@lists.infradead.org

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
