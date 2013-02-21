Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8ZYc-0001u0-CL
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 17:03:42 +0000
Date: Thu, 21 Feb 2013 18:03:32 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH RFC] mtd/nand: implement user otp for Micron chips
Message-ID: <20130221170332.GK32249@pengutronix.de>
References: <1361394332-19415-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <5125ED30.3020305@parrot.com>
 <20130221100728.GI32249@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130221100728.GI32249@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Thu, Feb 21, 2013 at 11:07:28AM +0100, Uwe Kleine-König wrote:
> > Shouldn't vendor specific code go in another file ?
> OK for me, I didn't notice any other vendor specific code and e.g. onfi
> stuff is in nand_base, too. (Maybe that is because it's not possible to
> see from the filenames under drivers/mtd/nand if that file defines a
> controller driver or some chip specific stuff.)
> 
> I will move it to a file nandchip-micron.c for the next submission. Does
> this look right?  I will wait for more feedback though.
I started to implement that now and one problem is that a few functions
(namely nand_get_device, nand_release_device and nand_onfi_set_features)
are statically defined in nand_base.c. The obvious options are:

 1) drop "static" from nand_get_device et al. and declare them in a
    header (say drivers/mtd/nand/nand.h);
 2) keep the implementation of the Micron stuff in nand_base.c; or
 3) put it into a nandchip-micron.c and #include that from nand_base.c

Did I miss something? David, Artem: Any thoughts/preferences?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
