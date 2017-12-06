Date: Wed, 6 Dec 2017 16:28:04 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 02/10] mtd: nand: gpmi: Utilize hardware to detect
 bitflips in erased blocks
Message-ID: <20171206152804.u62dopc6mwwdz457@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
 <20171206091925.5810-3-s.hauer@pengutronix.de>
 <20171206102713.47d2fdbe@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171206102713.47d2fdbe@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 06, 2017 at 10:27:13AM +0100, Boris Brezillon wrote:
> Hi Sascha,
> 
> On Wed,  6 Dec 2017 10:19:17 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > The GPMI nand has a hardware feature to ignore bitflips in erased pages.
> > Use this feature rather than the longish code we have now.
> > Unfortunately the bitflips in erased pages are not corrected, so we have
> > to memset the read data before passing it to the upper layers.
> 
> There's a good reason we didn't use the HW bitflip detection in the
> first place: we currently have no way to report the number of corrected
> bitflips in an erased page, and that's a big problem, because then UBI
> does not know when it should re-erase the block.

Ah, ok.

> 
> Maybe we missed something when the initial proposal was done and
> there's actually a way to retrieve this information, but if that's not
> the case, I'd prefer to keep the existing implementation even if it's
> slower and more verbose.

I'm not so much concerned about the verbosity of the code but rather
about the magic it has inside. I have stared at this code for some time
now and still only vaguely know what it does.

We could do a bit better: We can still detect the number of bitflips
using nand_check_erased_ecc_chunk() without reading the oob data.
That would not be 100% accurate since we do not take the oob data into
account which might have bitflips aswell, but still should be good
enough, no?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
