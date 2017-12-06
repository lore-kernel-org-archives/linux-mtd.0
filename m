Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMbix-0004UH-Ch
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 15:35:13 +0000
Date: Wed, 6 Dec 2017 16:34:31 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 02/10] mtd: nand: gpmi: Utilize hardware to detect
 bitflips in erased blocks
Message-ID: <20171206163431.5fddd6c6@bbrezillon>
In-Reply-To: <20171206152804.u62dopc6mwwdz457@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
 <20171206091925.5810-3-s.hauer@pengutronix.de>
 <20171206102713.47d2fdbe@bbrezillon>
 <20171206152804.u62dopc6mwwdz457@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 6 Dec 2017 16:28:04 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> On Wed, Dec 06, 2017 at 10:27:13AM +0100, Boris Brezillon wrote:
> > Hi Sascha,
> > 
> > On Wed,  6 Dec 2017 10:19:17 +0100
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >   
> > > The GPMI nand has a hardware feature to ignore bitflips in erased pages.
> > > Use this feature rather than the longish code we have now.
> > > Unfortunately the bitflips in erased pages are not corrected, so we have
> > > to memset the read data before passing it to the upper layers.  
> > 
> > There's a good reason we didn't use the HW bitflip detection in the
> > first place: we currently have no way to report the number of corrected
> > bitflips in an erased page, and that's a big problem, because then UBI
> > does not know when it should re-erase the block.  
> 
> Ah, ok.
> 
> > 
> > Maybe we missed something when the initial proposal was done and
> > there's actually a way to retrieve this information, but if that's not
> > the case, I'd prefer to keep the existing implementation even if it's
> > slower and more verbose.  
> 
> I'm not so much concerned about the verbosity of the code but rather
> about the magic it has inside. I have stared at this code for some time
> now and still only vaguely know what it does.
> 
> We could do a bit better: We can still detect the number of bitflips
> using nand_check_erased_ecc_chunk() without reading the oob data.
> That would not be 100% accurate since we do not take the oob data into
> account which might have bitflips aswell, but still should be good
> enough, no?

Nope, we really have to take OOB bytes into account when counting
bitflips. Say that you have almost all in-band data set to 0xff, but
all OOB bytes reserved for ECC are set to 0 because someone decided to
write this portion of the page in raw mode. In this case we can't
consider the page as empty, otherwise we'll fail to correctly write ECC
bytes next time we program the page.

> 
> Sascha
> 
