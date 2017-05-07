Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7SjL-00033F-9B
 for linux-mtd@lists.infradead.org; Sun, 07 May 2017 20:24:37 +0000
Date: Sun, 7 May 2017 22:24:04 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: SW ECC - double bit flip detection on old NAND devices
Message-ID: <20170507222404.241e7281@jawa>
In-Reply-To: <CAFLxGvzQ-OMhskGZ8V3EbG4GTR-6bLboZmNifoQ_3=VBstpM9g@mail.gmail.com>
References: <20170505151425.4350ea69@jawa>
 <CAFLxGvzQ-OMhskGZ8V3EbG4GTR-6bLboZmNifoQ_3=VBstpM9g@mail.gmail.com>
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

Thanks for your support.

> Lukasz,
> 
> On Fri, May 5, 2017 at 3:14 PM, Lukasz Majewski <lukma@denx.de> wrote:
> > Dear All,
> >
> > I've a problem with pretty old Flash NAND memory (Samsung 128Mx8)
> > [1]
> >
> > It doesn't support On-Chip ECC - one needs to calculate ECC
> > manually.
> >
> > The Yaffs2 FS (for this version) uses "1bit correction
> > ECC" (yaffs_ecc.c). It calculates ECC for 256 bytes -> we have got
> > 22 bits for ECC (rounded up to 3 bytes).
> >
> > For 2048 bytes page we do have 8 such ECC blocks -> 24 ECC bytes in
> > total in OOB.
> >
> > This code (as noted in yaffs_ecc.* header) is able to correct one
> > single bit flip.
> >
> > I've also looked into Linux kernel code for SW ECC calculation:
> >
> > http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/nand_ecc.c#L523
> 
> This is for ecc->algo == NAND_ECC_HAMMING.

In my current 2.6.27 kernel it is called:

NAND_ECC_SOFT -> But this is the same.

the 

ecc.correct = nand_correct_data()

, which has following statement in the function description:

 *
 * Detect and correct a 1 bit error for 256 byte block
 */

So now it is clear that two+ bit flips happening in the 256 B chunk
cannot be detected.

> 
> > And here it is also explicitly said that we can correct one bit in
> > such chunk.
> >
> > Please correct me if I'm wrong but when we have two bit-flips in
> > such 256 bytes chunk, the ECC will be still correct and such
> > obviously broken page will not be "retired".
> >
> > What one can do to prevent such situation?
> >
> > My idea, if the above holds, would be to implement better ECC
> > scheme as proposed in "Error Correction Code (ECC) in Micron" doc
> > [2].
> >
> > Maybe somebody knows better/simpler solution?
> 
> I'd suggest to use BCH instead of Hamming.
> Please see NAND_ECC_BCH.

Thanks for your tip. I will try to backport this feature ...

> 


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
