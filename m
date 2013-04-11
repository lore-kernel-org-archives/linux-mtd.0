Received: from mail-qa0-f42.google.com ([209.85.216.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQKS3-0006N8-Ra
 for linux-mtd@lists.infradead.org; Thu, 11 Apr 2013 16:34:21 +0000
Received: by mail-qa0-f42.google.com with SMTP id bv4so384712qab.8
 for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2013 09:34:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5166E4F8.5030107@ammonit.com>
References: <5166E4F8.5030107@ammonit.com>
Date: Thu, 11 Apr 2013 10:34:17 -0600
Message-ID: <CACwUX0PEfQfNa_Yg5JFEWFsFAC++Y1MgmPmckE5_2KZG8YuEOw@mail.gmail.com>
Subject: Re: Changing the ECC method for a running system (UBI seems to use
 OOB?)
From: David Mosberger-Tang <dmosberger@gmail.com>
To: =?ISO-8859-1?Q?Steffen_K=FChn?= <sk@ammonit.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steffen,

We had exactly the same issue with our embedded systems (I'm really mad at
Micron that they released the 4-bit ECC chips without as much as putting a
warning message in the Linux kernel, but that's a separate topic...).

Anyhow, we modified the AT91bootstrap loader to convert the entire NAND
from 1-bit sw-ecc to on-die 4-bit ECC.  I'd be happy to send a patch to
this mailing list if you think this would be useful.

UBI fortunately does not use OOB at all, so there should be no issue from
there.

The subpage size has to match though.  In our case, UBI was built for 512B
subpage, but when turning on the on-die ECC support, it'd by default only
support 2048B pages.  The patch I sent earlier to this mailing list enables
512B subpage writes with on-die ECC.

  --david

On Thu, Apr 11, 2013 at 10:29 AM, Steffen K=FChn <sk@ammonit.com> wrote:
> Hello everyone,
>
> the problem which I have to solve is to change the type of the used ECC
> procedure for a linux system with UBIFS >>after<< the installation. For
> this purpose I have modified the first-stage bootloader so, that it
> reads all blocks with the old ECC method (software ECC 1-bit) and
> re-writes these with the new one (on-die hardware ECC, Micron flash).
>
> The reason for that effort is, that the old method has to be proven as
> to bad (to much bit errors). Unfortunately it is not possible to install
> the system new with activated on-die ECC, because the hardware is
> scattered over the world.
>
> The update procedure works in principle fine, that means, it is possible
> to update the blocks for kernel, u-boot, first-stage bootloader and
> environment variables. But the rootfs makes problems. Can it be, that
> UBIFS uses some bytes of the OOB structures, perhaps indirect?
>
> Have someone any hints for me?
>
> Best regards,
> Steffen
>
>
>
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
