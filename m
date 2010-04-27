Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6fbX-0008Fj-Ra
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 07:53:17 +0000
Date: Tue, 27 Apr 2010 09:53:10 +0200
From: Robert Schwebel <r.schwebel@pengutronix.de>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: mxc-nand duplicate case value in -next
Message-ID: <20100427075310.GM18567@pengutronix.de>
References: <20100423073625.GY7882@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20100423073625.GY7882@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
	Ivo Clarysse <ivo.clarysse@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Apr 23, 2010 at 09:36:25AM +0200, Sascha Hauer wrote:
> Currently we have a duplicate case value in the mxc-nand driver in
> -next. This is because of to different patches adding reset command
> support to the driver, one from Eric (coming via the mtd master tree)
> and one from Ivo (coming from the mxc master tree). As I see it we
> should take Ivos patch as it adds i.MX21 support along the way, so
> David, can you please drop Erics patch?

linux-next does still crash with

drivers/mtd/nand/mxc_nand.c: In function 'mxc_nand_command':
drivers/mtd/nand/mxc_nand.c:689: error: duplicate case value
drivers/mtd/nand/mxc_nand.c:606: error: previously used here
drivers/mtd/nand/mxc_nand.c: In function 'mxcnd_resume':
drivers/mtd/nand/mxc_nand.c:921: warning: unused variable 'host'
make[3]: *** [drivers/mtd/nand/mxc_nand.o] Error 1

David, would dropping Eric's patch (like suggested by Sascha) be an
acceptable solution?

Thanks,
rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
