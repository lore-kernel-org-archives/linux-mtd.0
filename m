Date: Sun, 30 Nov 2014 09:55:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: nand: gpmi: add gpmi_move_bits function
Message-ID: <20141130095500.16f75e05@bbrezillon>
In-Reply-To: <20141130081110.GC3608@norris-Latitude-E6410>
References: <1417020793-3354-1-git-send-email-boris.brezillon@free-electrons.com>
 <1417020793-3354-2-git-send-email-boris.brezillon@free-electrons.com>
 <20141126175708.1acb90ac@bbrezillon>
 <20141130081110.GC3608@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Roy Lee <roylee@paypal.com>,
 Mike Voytovich <mvoytovich@paypal.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Sun, 30 Nov 2014 00:11:10 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Wed, Nov 26, 2014 at 05:57:08PM +0100, Boris Brezillon wrote:
> > On Wed, 26 Nov 2014 17:53:11 +0100 Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> > > +/**
> > > + * gpmi_move_bits - move bits from one memory region to another
> > > + * @dst: destination buffer
> > > + * @dst_bit_off: bit offset we're starting to write at
> > > + * @src: source buffer
> > > + * @src_bit_off: bit offset we're starting to read from
> > > + * @nbits: number of bits to copy
> > > + *
> > > + * This functions copies bits from one memory region to another, and is used by
> > > + * the GPMI driver to copy ECC sections which are not guaranteed to be byte
> > > + * aligned.
> > 
> > I forgot to add that src and dst should not overlap, otherwise it won't
> > work...
> 
> Hmm, normally that's implied for copy-like operations. But since you
> named this function "move" (rather than "copy" or "cpy"), that's a
> little less clear.

Indeed, that's a good point.

> 
> Did you have a good reason for the "move" name? If not, maybe it's worth
> changing.

No, I don't, and I'd prefer changing the name than implementing a non
destructive move function.

I'll send a new version with this change.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
