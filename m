Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8PKs-0004Ja-Lm
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2016 10:26:59 +0000
Date: Sun, 20 Nov 2016 11:26:36 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: [PATCH v2 00/46] Nandsim facelift (part I of II)
Message-ID: <20161120112636.257dd8c9@bbrezillon>
In-Reply-To: <CAFLxGvyDfJ9HRcMhOxYyjAZUgsQrKcYW5c8EjYUX9j+CDkQJ=A@mail.gmail.com>
References: <cover.1474450295.git.dwalter@sigma-star.at>
 <20161016182441.49adc653@bbrezillon>
 <CAFLxGvyDfJ9HRcMhOxYyjAZUgsQrKcYW5c8EjYUX9j+CDkQJ=A@mail.gmail.com>
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

Hi Richard,

On Mon, 14 Nov 2016 17:24:18 +0100
Richard Weinberger <richard.weinberger@gmail.com> wrote:

> Boris,
> 
> sorry for the late answer. I was not on CC, therefore this mail was
> unnoticed by me. :-(
> 
> On Sun, Oct 16, 2016 at 6:24 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > Daniel, Richard,
> >
> > On Wed, 21 Sep 2016 11:43:29 +0200
> > Daniel Walter <dwalter@sigma-star.at> wrote:
> >  
> >> Changes since V1:
> >>   Incooperate feedback for nand_cleanup()
> >>   Improve commit messages  
> 
> [..-]
> 
> > I really like the new approach for 2 reasons:
> > 1/ it allows creating several NAND devs, and you can do that after the
> >    module has been loaded.
> > 2/ it fixes the partial NAND detection support by allowing one to
> >    describe its NAND in term of page size, eraseblock size, oob
> >    size, ...
> >
> > But I'm wondering if we should not create a new driver instead of
> > trying to fix the old one (I must admit I haven't been through the 46
> > patches of this series, but last time we discussed it on IRC, Richard
> > said it actually was a complete rewrite of the nandsim driver).
> >
> > Moreover, if we specify the flash layout manually, maybe we could make
> > it an mtdsim driver instead of restricting the emulation to NAND
> > devices.
> >
> > What do you think?  
> 
> I think we don't need a completely new driver. This series just adds
> functionality to nandsim without much cost, in fact we reuse also some
> bits from nandsim.
> If we add a new nandsim alike driver we basically give up the current nandsim
> and it will die a painful death. This series tries to avoid that.

Well, the whole problem with the current nandsim driver is that it
tries to do too many things. It not only tries to emulate a NAND device,
with all its constraint (bitflips, and many more), but it also tries to
register as a NAND driver with the NAND dev detection flow, and all
the convoluted page read/write logic (with/without ECC, ...).

Life (and code) would be much easier if the emulation driver was just
trying to emulate a NAND device without registering to the NAND
framework. All you'd have to do is implement your own mtd_info hooks,
without this nandsim device state burden that is required for
->cmd_ctrl() to work properly.

Of course, adding a new driver means marking the old one as deprecated
and keeping it around for some time, but that's IMHO, cleaner than
keeping a lot of code for something that we do not want to maintain.
One example is the NAND ID detection: it is a real pain, and we have
no easy solution to support ONFI chips.
If we go for a solution where the user select all the NAND properties
manually, we get rid of this complex beast, while leaving more freedom
to test some corner cases (non-powerof2 number of blocks per die for
example).

> What we can do is splitting nandsim into three files (common, old and new).

Well, it's not really about creating new files, it's more about
maintaining things that IMO are not so useful...

Regards,

Boris
