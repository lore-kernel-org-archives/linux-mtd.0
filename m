Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4aSf-00064c-Rc
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 15:04:02 +0000
Date: Tue, 29 Mar 2011 17:03:13 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH/RFC v4 1/3] Shared BCH ECC library
Message-ID: <20110329150313.GA15405@parrot.com>
References: <1fb708d8d49cdd83e62424fb77912418f5c92d69.1299836869.git.ivan.djelic@parrot.com>
	<Pine.LNX.4.64.1103291534110.25520@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1103291534110.25520@lnxricardw.se.axis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 29, 2011 at 02:55:19PM +0100, Ricard Wanderlof wrote:
> However, if I introduce a single bit error in the page, bch_decode() fails 
> with -EBADMSG, and some further debugging reveals that 
> bch.c:compute_error_locator_polynomial() returns 4 in this particular 
> case, whereas bch.c:find_poly_roots() returns 0, the two don't match, and 
> the function exits with an error. I'm no wizard with the algorithms used 
> so i have no idea what is reasonable. I would assume both would return 1, 
> as there is one bit error that I've introduced.

Yes you are correct, the computed error locator polynomial seems wrong, it
should be of degree 1.

> I've dumped the read and calculated ECC and it looks like they are being 
> generated as expected; indeed, if there was a fault there reading ok pages 
> would also fail.
> 
> I'm a bit bewildered, as the algorithm appearently has been tested on a 
> Mips (albeit under QEMU). Of course it's very likely that I've made a 
> mistake somewhere, in that case it must be in the set-up, as the two files 
> which actually implement the algorithm are new and not patches to existing 
> files. I was thinking it was perhaps an endianess problem (our MIPS is 
> little-endian), but I see it's been tested on x86 too so it shouldn't be 
> that.
> 
> Any ideas?

I should be able to help if you provide me with the following information:

- your patch against 2.6.35
- on an erased page, could you please program just the first byte to 0x7f (in
raw mode, no ecc), then read the page back normally with ecc, and dump the
calculated ecc ?

If you wish I can also send you the userland test suite that I use for
validation.

Best Regards,

--
Ivan
