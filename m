Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zpfco-0005Li-Qy
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2015 16:55:33 +0000
Received: by pacfv9 with SMTP id fv9so128566248pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 23 Oct 2015 09:55:10 -0700 (PDT)
Date: Fri, 23 Oct 2015 09:55:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Han Xu <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: fsl-quadspi: Never build on SPARC
Message-ID: <20151023165507.GJ13239@google.com>
References: <1445437906-23633-1-git-send-email-linux@roeck-us.net>
 <20151023010757.GI13239@google.com> <5629899C.5040404@roeck-us.net>
 <CA+EcR214vdP=W2Sg0zGHUxywxWcjs6e=+ffW41j7eVvQXb42og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EcR214vdP=W2Sg0zGHUxywxWcjs6e=+ffW41j7eVvQXb42og@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 23, 2015 at 11:31:47AM -0500, Han Xu wrote:
> On Thu, Oct 22, 2015 at 8:13 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> > On 10/22/2015 06:07 PM, Brian Norris wrote:
> >>
> >> + Han
> >>
> >> On Wed, Oct 21, 2015 at 07:31:46AM -0700, Guenter Roeck wrote:
> >>>
> >>> Attempts to build fsl-quadspi on SPARC fail with
> >>>
> >>> drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_init_lut':
> >>> drivers/mtd/spi-nor/fsl-quadspi.c:369:1: error:
> >>>         'LUT_0' undeclared (first use in this function)
> >>> drivers/mtd/spi-nor/fsl-quadspi.c:418:1: error:
> >>>         pasting "LUT_" and "(" does not give a valid preprocessing token
> >>> drivers/mtd/spi-nor/fsl-quadspi.c:418:2: error:
> >>>         implicit declaration of function 'LUT_'
> >>
> >>
> >> I don't think this is only a SPARC problem. The macro concatenation is
> >> generally suspect.
> >>
> >> I see that READ and WRITE are problems at least. If something like
> >> <linux/fs.h> gets included somehow, then these tokens resolve to
> >> integers or expressions before they fall through to literal
> >> concatentation, so we get 'LUT_0' or 'LUT_(1ULL << __REQ_WRITE)' instead
> >> of 'LUT_READ' and 'LUT_WRITE'.
> Hi Brian
> We have two options, either undef READ and WRITE before these macros
> or change the LUT_READ to LUT_FSLREAD and same as WRITE. So what's
> your opinion? Thanks.

I'd rule out #undef'ing other macros. That just looks like a hack.

There's at least one other option: de-obfuscate your code by directly
using macros instead of concatenating LUT_ to save a few characters. So:

#define LUT0(ins, pad, opr)                                             \
                (((opr) << OPRND0_SHIFT) | ((pad) << PAD0_SHIFT) | \
                ((ins) << INSTR0_SHIFT))

and for example:

	writel(LUT0(LUT_WRITE, LUT_PAD1, 0), base + QUADSPI_LUT(lut_base + 1));

I'd take either that option, or renaming your LUT_READ and LUT_WRITE to
LUT_FSL_READ and LUT_FSL_WRITE (not LUT_FSLREAD and LUT_FSLWRITE).

Brian
