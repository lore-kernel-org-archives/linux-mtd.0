Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OinnW-0002HS-0B
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 12:19:14 +0000
Date: Tue, 10 Aug 2010 14:19:12 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Subject: Re: [PATCH 1/3] mxc_nand: set spare size and pages per block
Message-ID: <20100810121912.GG27749@pengutronix.de>
References: <80r5i63dn4.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80r5i63dn4.fsf@merkur.tec.linutronix.de>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Ivo Clarysse <ivo.clarysse@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi John,

Sorry, last time I sent only up to 09/12, so the patches I explicitely
mentioned to solve the things from your previous series were missing.
I just sent them. My versions of the patches differ slightly. For this
patch I decided to initialize every bit in NFC_V1_V2_CONFIG1 from
scratch so that we do not depend on any reset or bootloader values.
I think this is cleaner so I propose that we use my version of the
patch.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
