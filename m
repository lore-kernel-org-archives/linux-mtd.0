Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RMN6B-0005Xo-JC
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2011 16:58:36 +0000
Date: Fri, 4 Nov 2011 17:58:24 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v2] mtd: nand: Add driver for M-sys / Sandisk diskonchip G4
Message-ID: <20111104165824.GA18759@parrot.com>
References: <1320274859-3270-1-git-send-email-mikedunn@newsguy.com>
	<20111103085824.GA28465@parrot.com> <4EB25B62.4070502@parrot.com>
	<4EB3F4AA.8090703@newsguy.com> <20111104152352.GA17776@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111104152352.GA17776@parrot.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu Castet <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 04, 2011 at 04:23:52PM +0100, Ivan Djelic wrote:
> On Fri, Nov 04, 2011 at 02:20:26PM +0000, Mike Dunn wrote:
> > On 11/03/2011 02:14 AM, Matthieu CASTET wrote:
> > > Hi,
> > >
> > > Ivan Djelic a écrit :
> > >>
> > >> 1. When you program a page, before writing hwecc to oob, adjust it like this:
> > >>
> > >>    hwecc[i] ^= blank_read_hwecc[i]^0xff;
> > >>
> > >> The effect of this is that you now get 0xffs as ecc for blank pages, and bitflip
> > >> correction on erased pages for free. This is transparent to your controller,
> > >> because this "adjustment" cancels itself upon reading when calc_ecc^recv_ecc is
> > >> computed.
> > 
> > 
> > Not entirely transparent.  I didn't think this through.  Modifying the
> > hw-generated ecc bytes causes the hw to think that there were error(s) on every
> > page.  True, the driver will know better, but it will slow things down because
> > ordinarily the ecc unit only has to be read when the hardware reports errors. 
> > With this scheme, an error is reported and the ecc bytes read and processed on
> > every page.
> 

Oops, forget what I said in my previous post; I should have said the opposite:
that is, my XOR masking idea only works if the controller does not compute
recv_ecc^calc_ecc itself. So indeed you're right, it's not useful in your case.

BR,
--
Ivan
