Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SZIqt-0006J5-Ol
 for linux-mtd@lists.infradead.org; Tue, 29 May 2012 09:36:33 +0000
Date: Tue, 29 May 2012 11:36:29 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] mtd mxc_nand: use 32bit copy functions
Message-ID: <20120529093629.GQ30400@pengutronix.de>
References: <1338279369-25915-1-git-send-email-s.hauer@pengutronix.de>
 <20120529091254.GY3710@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120529091254.GY3710@pengutronix.de>
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

On Tue, May 29, 2012 at 11:12:54AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, May 29, 2012 at 10:16:09AM +0200, Sascha Hauer wrote:
> > The following commit changes the function used to copy from/to
> > the hardware buffer to memcpy_[from|to]io. This does not work
> > since the hardware cannot handle the byte accesses used by these
> > functions. Instead of reverting this patch introduce 32bit
> > correspondents of these functions.
> Hmm, I didn't run an mtd test suite, but on mx27 it worked for me. IMHO
> it's surprising that memcpy used to work, but memcpy_fromio doesn't. I
> wouldn't expect a different semantic (apart from normal vs. __iomem
> memory). And I wonder what will break when ARM's memcpy_fromio et al.
> is optimized.

Have a look at the (ARM) implementation of memcpy_fromio:

void _memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
{
	unsigned char *t = to;
	while (count) {
		count--;
		*t = readb(from);
		t++;
		from++;
	}
}

Appearently this uses byte accesses which do not work on NFC SRAM,
whereas memcpy uses optimized (so 32bit whenever possible) accesses.
If someone would implement an optimized version of memcpy_fromio, it
would work for the NFC aswell.

btw on i.MX27 byte accesses also do not work on NFC SRAM, so I doubt
this worked for you.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
