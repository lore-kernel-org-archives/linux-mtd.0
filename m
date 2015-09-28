Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgMax-00058l-KI
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 00:47:08 +0000
Received: by pacex6 with SMTP id ex6so157245518pac.0
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2015 17:46:46 -0700 (PDT)
Date: Sun, 27 Sep 2015 17:46:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jagan Teki <jteki@openedev.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 03/10] mtd: spi-nor: add SPI NOR manufacturer IDs
Message-ID: <20150928004644.GD34421@google.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
 <1441137435-52862-4-git-send-email-computersforpeace@gmail.com>
 <CAD6G_RTpucYCnbNxnTs1xionz4pYukAmvys6x45EjYc=n7PNFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD6G_RTpucYCnbNxnTs1xionz4pYukAmvys6x45EjYc=n7PNFw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 25, 2015 at 01:47:18AM +0530, Jagan Teki wrote:
> On 2 September 2015 at 01:27, Brian Norris <computersforpeace@gmail.com> wrote:
> > These are often similar for CFI (parallel NOR) and for SPI NOR, but they
> > aren't always the same, for various reasons (different namespaces,
> > company acquisitions and renames, etc.). And some don't have CFI_MFR_*
> > entries at all.
> >
> > So let's make a proper place to list the SPI NOR IDs, with all the SPI
> > NOR specific assumptions and comments.
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  include/linux/mtd/spi-nor.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> > index 321a055bc266..8558793cc0f7 100644
> > --- a/include/linux/mtd/spi-nor.h
> > +++ b/include/linux/mtd/spi-nor.h
> > @@ -11,6 +11,21 @@
> >  #define __LINUX_MTD_SPI_NOR_H
> >
> >  #include <linux/bitops.h>
> > +#include <linux/mtd/cfi.h>
> > +
> > +/*
> > + * Manufacturer IDs
> > + *
> > + * The first byte returned from the flash after sending opcode SPINOR_OP_RDID.
> > + * Sometimes these are the same as CFI IDs, but sometimes they aren't.
> > + */
> > +#define SNOR_MFR_ATMEL         CFI_MFR_ATMEL
> > +#define SNOR_MFR_INTEL         CFI_MFR_INTEL
> > +#define SNOR_MFR_MICRON                CFI_MFR_ST /* ST Micro <--> Micron */
> > +#define SNOR_MFR_MACRONIX      CFI_MFR_MACRONIX
> > +#define SNOR_MFR_SPANSION      CFI_MFR_AMD
> > +#define SNOR_MFR_SST           CFI_MFR_SST
> > +#define SNOR_MFR_WINBOND       0xef
> 
> Ideally company names same but looks like winbond is the only diff as
> of now, why can't we define WIN and re-use the same from CFI?

I'm not quite sure what you're suggesting. Are you suggesting we make up
a new Winbond CFI ID? There already is one, and it doesn't match their
SPI NOR, so we can't use it:

#define CFI_MFR_WINBOND         0x00DA

The whole point of this patch is that some mfrs use different IDs for
different classes of flash, so we shouldn't force our programming
patterns into looking like CFI (i.e., parallel NOR [1]) when we're
talking about serial NOR.

If you'd rather, I can just copy the values into this header (e.g.,
0x01, 0x89, etc.) and completely remove all references to CFI.

Brian

[1] Actually, I've seen some serial flash which have CFI parameter
tables. But that's a different subject.
