Received: from amalthea.dnx.de ([193.108.181.146])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bh8qO-00056z-VT
	for linux-mtd@lists.infradead.org; Sun, 04 Jul 2004 11:23:53 -0400
Date: Sun, 4 Jul 2004 17:23:39 +0200
From: Robert Schwebel <r.schwebel@pengutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20040704152339.GB8673@pengutronix.de>
References: <20040703110325.GA26836@pengutronix.de>
	<200407031637.04488.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200407031637.04488.tglx@linutronix.de>
Sender: Robert Schwebel <rsc@pengutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] gen_probe forgets to clean chip_map
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 03, 2004 at 04:37:04PM +0200, Thomas Gleixner wrote:
> Thanks, fixed due to your previous suggestion since 06-24 in CVS

Ah, thx ;) It became difficult recently to follow CVS since it lives
behind that IPv6 gateway...

Robert 
-- 
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hornemannstraﬂe 12,  31137 Hildesheim, Germany
    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4
