Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXxur-0004hI-CB
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 17:35:22 +0000
Date: Mon, 12 Nov 2012 18:35:15 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: state of support for "external ECC hardware"
Message-ID: <20121112173515.GA3041@parrot.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>
 <509BDE9B.3080909@keymile.com>
 <alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com>
 <50A12FBD.8020801@keymile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50A12FBD.8020801@keymile.com>
Cc: "Bigler, Stefan" <Stefan.Bigler@keymile.com>,
 Christopher Harvey <charvey@matrox.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 12, 2012 at 05:19:57PM +0000, Gerlando Falauto wrote:
(...)
> > At any rate, the ECC algorithm itself should be able to take care of bit
> > flips in the ECC codes. For the 1-bit algorithm in nand_ecc.c it does this
> > by comparing the computed ECC with the actual ECC; if there's a difference
> > of exactly one bit (rather than a more complex diff which after
> > calculations points out the flipped bit in the main area), it is assumed
> > that the bitflip is in the ECC area rather than the data. I don't know how
> > BCH does this though.
> 
> Ivan, I came to understand (but I am not sure), that the implementation 
> you provided (and currently mainlined) *DOES* handle this correctly. It 
> was instead an old one which did not handle this properly. Is my 
> understanding correct?

Yes you are correct. In BCH ECC, there is no difference between data and ecc bytes, they are
all part of larger codeword on which error correction is performed.
An old patch introducing BCH support in nand/omap2.c had a bug which was triggered when a bitflip
was detected in ecc bytes; but this has nothing to do with the way BCH algorithms work.
BR,
--
Ivan
