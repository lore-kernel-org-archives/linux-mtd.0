Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tj9sj-00022d-8U
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2012 14:35:26 +0000
Date: Thu, 13 Dec 2012 15:35:20 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: jean-philippe francois <jp.francois@cynove.com>
Subject: Re: U-boot bch4_sw vs omap bch4_hw
Message-ID: <20121213143520.GA25416@parrot.com>
References: <CAGGh5h23djGTUynnoVUaGAQCuWVCDAW=PLQsvnyBVKGDfwERAQ@mail.gmail.com>
 <20121208082935.GA17392@parrot.com>
 <CAGGh5h2CoQTbOL32+f3jhtvUwCbFp7EPhL7g61PFkVGtXwAd-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGGh5h2CoQTbOL32+f3jhtvUwCbFp7EPhL7g61PFkVGtXwAd-w@mail.gmail.com>
Cc: andreas.devel@gmail.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 10, 2012 at 09:41:10AM +0000, jean-philippe francois wrote:
> 2012/12/8 Ivan Djelic <ivan.djelic@parrot.com>:
> > On Fri, Dec 07, 2012 at 03:26:06PM +0000, jean-philippe francois wrote:
> >> Hi Ivan,
> >>
> >> I have applied your patches for hardware bch ecc support on
> >> OMAP. On the linux side, everything is fine. However I have some trouble
> >> when it comes to u-boot and kernel interoperability.
> >>
> >> A nand page written with bch4_sw ecc by U-boot fails the ecc step when
> >> read by the kernel. Looking at a nanddump, OOB placement and size of
> >> the ecc data are the same.
> >>
> >> Do you know of any patch for u-boot that would make the  bch4_sw ecc
> >> identical to the kernel one ?
> >
> > Hi Jean-Philippe,
> >
> > If you point me to a git repo with the exact u-boot version you are using,
> > I can probably provide a patch (or at least understand the problem).
> > BR,
> > --
> > Ivan
> I am using an u-boot from the arago project :
> http://arago-project.org/git/projects/?p=u-boot-omap3.git;a=tags
> 
> So it is quite old.
> I will probably have to modify x-loader, too.
> Both implementation use very similar file for hardware assisted
> bch decoding.
> 
> If this code is too old for you to look at, could you help me find an omap
> project that "new ecc" all the way up from x-loader to u-boot + kernel ?
> 
> If I understands things correctly, I have two options if I want to use
> Nand that needs
> 4-bit ecc :
> - Stick with the old ecc scheme in x-loader and u-boot, and use
> software 4-bit bch in the kernel.
>   Is this compatible with using ubifs ?
> - Implement new ecc scheme in x-loader and u-boot, and use hardware
> assisted bch-4 in the kernel.
> Is this correct ?
> 

Hi Jean-Philippe,

I had a look at your u-boot version. It uses a BCH ECC layout from a TI
patch, which is indeed different from the current OMAP3 kernel version:

1. BCH4 ecc sequence is made of 13 nibbles stored into 7 bytes (14 nibbles) such
that there is a (zero) padding nibble. This padding nibble is stored:
 - at the end of the sequence in the kernel
 - at the beginning of the sequence in arago u-boot

2. ECC is computed on different input data sets:
 - kernel always computes an ecc vector on 512 bytes
 - arago u-boot computes an ecc vector on 512+6.5 bytes (data + ecc), which
   results in a zero ecc vector if no error was detected (and makes reading and
   writing asymmetric)

3. Kernel codes adds a constant polynomial to enable erased page reading.

Point 2 and 3 would be very easily fixed if ecc alignment were the same in
both cases; but it is not (point 1), so the fix is a little trickier and is
the resulting code is basically identical to the patch referenced by
Andreas Bießmann.

HTH,
--
Ivan
