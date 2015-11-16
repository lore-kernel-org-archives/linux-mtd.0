Received: from mail-io0-x234.google.com ([2607:f8b0:4001:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyGqU-0000mp-6n
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 10:17:11 +0000
Received: by iouu10 with SMTP id u10so148456936iou.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 02:16:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvydxAF5hVqqEGhTec9=rpD5jga0VP8=DvDVDpBZJQ2zuw@mail.gmail.com>
References: <1447336537-3705-1-git-send-email-debrabander@gmail.com>
 <CAFLxGvydxAF5hVqqEGhTec9=rpD5jga0VP8=DvDVDpBZJQ2zuw@mail.gmail.com>
Date: Mon, 16 Nov 2015 11:16:49 +0100
Message-ID: <CAOBzU4NDDyZtDJ=LgXJ=VvYrnWi1qBFjeh8QMTeRueUbDtBYMg@mail.gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: support selecting ECC mode via the
 device tree
From: Frank de Brabander <debrabander@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2015-11-12 16:01 GMT+01:00 Richard Weinberger <richard.weinberger@gmail.com>:
>
> On Thu, Nov 12, 2015 at 2:55 PM, Frank de Brabander
> <debrabander@gmail.com> wrote:
> > Currently the Orion NAND ECC mode is hardcoded to NAND_ECC_SOFT, it does not
> > allow selecting any other ECC mode. This change makes it possible to use the
> > device tree to select other ECC modes. It still defaults to the original
> > mode NAND_ECC_SOFT.
> >
> > This makes the driver more in line with other mtd nand drivers, that already
> > support similar ways to select the ECC mode.
> >
> > Signed-off-by: Frank de Brabander <debrabander@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/mtd/orion-nand.txt | 4 ++++
> >  drivers/mtd/nand/orion_nand.c                        | 6 +++++-
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/orion-nand.txt b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> > index 2d6ab66..908c321 100644
> > --- a/Documentation/devicetree/bindings/mtd/orion-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> > @@ -11,6 +11,9 @@ Optional properties:
> >  - bank-width : Width in bytes of the device. Default is 1
> >  - chip-delay : Chip dependent delay for transferring data from array to read
> >                 registers in usecs
> > +- nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
> > +  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> > +  "soft_bch".
>
> Does the driver (and the NFC) really support all these modes?
>
> --
> Thanks,
> //richard

Good point, thanks. Only "none", "soft", and "soft_bch" are supported.
Will change the documentation and send the updated patch.

Frank
