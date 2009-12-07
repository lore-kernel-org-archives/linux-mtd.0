Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NHZjO-0005wT-Dw
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 09:18:11 +0000
Date: Mon, 7 Dec 2009 10:18:03 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: please drop or revert "mtd: move mxcnd_remove to .exit.text"
Message-ID: <20091207091803.GA13932@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	Robert Schwebel <r.schwebel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

you took two different fixes for the same problem from me.  Probably I
oversaw you took the first and resent a new version.

	82613b0 (mtd: move mxcnd_remove to .exit.text)
	daa0f15 (mtd: don't use __exit_p to wrap mxcnd_remove)

Can you please drop or revert 82613b0 as not having a remove callback
breaks rebinding because resources are not freed on remove.

Sorry for the inconvenience.

Best regards
Uwe




-- 
Pengutronix e.K.                              | Uwe Kleine-König            |
Industrial Linux Solutions                    | http://www.pengutronix.de/  |
