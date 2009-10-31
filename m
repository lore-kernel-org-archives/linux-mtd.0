Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N4KJT-0006mZ-Fx
	for linux-mtd@lists.infradead.org; Sat, 31 Oct 2009 20:12:40 +0000
Date: Sat, 31 Oct 2009 21:11:54 +0100
From: Robert Schwebel <r.schwebel@pengutronix.de>
To: alfred steele <alfred.jaquez@gmail.com>
Subject: Re: [RFC] mxc nand controller updates
Message-ID: <20091031201154.GF22376@pengutronix.de>
References: <1256134406-25251-1-git-send-email-s.hauer@pengutronix.de>
	<528f13590910311138s7c3b1551odfd363846dca0efb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <528f13590910311138s7c3b1551odfd363846dca0efb@mail.gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Eric Benard <ebenard@eukrea.com>,
	Vladimir Barinov <vova.barinov@gmail.com>,
	mathieu.berland@eads.com, jbe@pengutronix.de,
	linux-mtd@lists.infradead.org, sha@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 31, 2009 at 01:38:39PM -0500, alfred steele wrote:
> Are these changes ported to u-boot yet.
> Would this be able to support 4k page size NAND flash. I took the
> latest snapshot from the U-boot GIT and trying to boot out of a 4K
> NAND on this but haven't been succesful as of now.
> I believe we used have a separate mxc_nand_load.S assembly code in
> earlier u-boot v2.0 which would load the first 4k from the NAND to the
> NFC SRAM and then the rest of the uboot is loaded after SDRAM /DDR is
> initialized. But with the lates code you have in uboot GIT, looks like
> all this is done in C after a minimal stack is setup.

Did you try the latest u-boot-v2 snapshots?

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
