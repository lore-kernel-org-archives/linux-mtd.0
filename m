Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7Mcl-0005mp-Cv
 for linux-mtd@lists.infradead.org; Sun, 07 May 2017 13:53:25 +0000
Received: by mail-oi0-x235.google.com with SMTP id h4so27154715oib.3
 for <linux-mtd@lists.infradead.org>; Sun, 07 May 2017 06:53:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170505151425.4350ea69@jawa>
References: <20170505151425.4350ea69@jawa>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 7 May 2017 15:53:01 +0200
Message-ID: <CAFLxGvzQ-OMhskGZ8V3EbG4GTR-6bLboZmNifoQ_3=VBstpM9g@mail.gmail.com>
Subject: Re: SW ECC - double bit flip detection on old NAND devices
To: Lukasz Majewski <lukma@denx.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lukasz,

On Fri, May 5, 2017 at 3:14 PM, Lukasz Majewski <lukma@denx.de> wrote:
> Dear All,
>
> I've a problem with pretty old Flash NAND memory (Samsung 128Mx8) [1]
>
> It doesn't support On-Chip ECC - one needs to calculate ECC manually.
>
> The Yaffs2 FS (for this version) uses "1bit correction
> ECC" (yaffs_ecc.c). It calculates ECC for 256 bytes -> we have got 22
> bits for ECC (rounded up to 3 bytes).
>
> For 2048 bytes page we do have 8 such ECC blocks -> 24 ECC bytes in
> total in OOB.
>
> This code (as noted in yaffs_ecc.* header) is able to correct one
> single bit flip.
>
> I've also looked into Linux kernel code for SW ECC calculation:
>
> http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/nand_ecc.c#L523

This is for ecc->algo == NAND_ECC_HAMMING.

> And here it is also explicitly said that we can correct one bit in such
> chunk.
>
> Please correct me if I'm wrong but when we have two bit-flips in such
> 256 bytes chunk, the ECC will be still correct and such obviously
> broken page will not be "retired".
>
> What one can do to prevent such situation?
>
> My idea, if the above holds, would be to implement better ECC scheme as
> proposed in "Error Correction Code (ECC) in Micron" doc [2].
>
> Maybe somebody knows better/simpler solution?

I'd suggest to use BCH instead of Hamming.
Please see NAND_ECC_BCH.

-- 
Thanks,
//richard
