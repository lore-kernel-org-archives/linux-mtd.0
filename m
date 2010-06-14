Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OO59E-00061t-Au
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 08:36:00 +0000
Date: Mon, 14 Jun 2010 10:35:57 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd/mxc_nand: remove unused variable
Message-ID: <20100614083557.GB12159@pengutronix.de>
References: <1276498911-28115-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1276498911-28115-1-git-send-email-u.kleine-koenig@pengutronix.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Ivo Clarysse <ivo.clarysse@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 14, 2010 at 09:01:51AM +0200, Uwe Kleine-König wrote:
> This fixes:
> 
> 	drivers/mtd/nand/mxc_nand.c: In function 'mxcnd_resume':
> 	drivers/mtd/nand/mxc_nand.c:901: warning: unused variable 'host'
> 
> Removing this variable was missed in 9c14b153e6af.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
This conflicts with Eric's "mxc_nand: fix PM" patch which also solves
this issue. 

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
