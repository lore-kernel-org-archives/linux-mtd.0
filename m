Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cm6M6-0003hm-3V
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 22:16:21 +0000
Received: by mail-ot0-x229.google.com with SMTP id o24so65719820otb.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Mar 2017 14:15:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8f214368-48d1-ae21-b303-b36431abbeb9@aimvalley.nl>
References: <8f214368-48d1-ae21-b303-b36431abbeb9@aimvalley.nl>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 9 Mar 2017 23:15:56 +0100
Message-ID: <CAFLxGvxrcUDEBcUsnQibYbX=-8BRSuP7ir3vzpFD-GL+Ofk7wg@mail.gmail.com>
Subject: Re: One bit flip in erased page causes uncorrectable error using
 (LS1020A) HW ECC
To: Kees Trommel <ctrommel@aimvalley.nl>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
 Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kees,

On Tue, Mar 7, 2017 at 10:15 AM, Kees Trommel <ctrommel@aimvalley.nl> wrote:
> Hello,
>
> I am doing development on a custom board with a NXP LS1020A of which the
> NAND controller supports HW ECC. Unfortunately the implementation of the HW
> ECC does not do the final XOR with the ECC of an empty page (like the Linux
> SW implementation does). This causes that a read of an empty page (both data
> and OOB) causes the HW to report an uncorrectable error. The Linux driver of
> this NAND controller (drivers/mtd/nand/fsl_ifc_nand.c) tries to workaround
> this by checking whether a page with an uncorrectable error is erased and if
> so the uncorrectable error is suppressed. However this work around does not
> work when a bit flips in an erased page because the page is no longer
> regarded as empty:(
>
> I observed a few times that UBI reports uncorrectable errors for the above
> reason and I am wondering whether this can cause a corruption of the
> UBI/UBIFS on top of the NAND mtd?

What exactly does UBI report?

> Until now I did not observe an UBI/UBIFS corruption but I am not sure
> whether I am just lucky or whether UBI/UBIFS can deal with uncorrectable
> errors in erased pages. I am  hoping that someone with a more in depth
> knowledge of UBI/UBIFS can answer this.

UBIFS assumes that empty space is really empty and assumes that the layers below
deals with bit flips in empty pages.
So, I fear your driver needs a better way to work around these bit flips.

-- 
Thanks,
//richard
