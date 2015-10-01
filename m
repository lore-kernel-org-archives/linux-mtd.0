Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhipT-0006Vc-Nk
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 18:43:44 +0000
Received: by pacex6 with SMTP id ex6so82191536pac.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2015 11:43:23 -0700 (PDT)
Date: Thu, 1 Oct 2015 11:43:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jagan Teki <jteki@openedev.com>
Cc: Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 03/10] mtd: spi-nor: add SPI NOR manufacturer IDs
Message-ID: <20151001184320.GB107187@google.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
 <1441137435-52862-4-git-send-email-computersforpeace@gmail.com>
 <CAD6G_RTpucYCnbNxnTs1xionz4pYukAmvys6x45EjYc=n7PNFw@mail.gmail.com>
 <20150928004644.GD34421@google.com>
 <CAD6G_RQazifzcjDhUk8dWQUDz4yzxmxb+86nrypYv-m8e2QiKg@mail.gmail.com>
 <20150928231346.GN31505@google.com>
 <CAD6G_RS=rDtar07bUYMejiKCy0WtTE6PDr=M-MBoJT2-Xg7BiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD6G_RS=rDtar07bUYMejiKCy0WtTE6PDr=M-MBoJT2-Xg7BiQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 01:42:05PM +0530, Jagan Teki wrote:
> On 29 September 2015 at 04:43, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Sep 28, 2015 at 02:42:24PM +0530, Jagan Teki wrote:
> >> On 28 September 2015 at 06:16, Brian Norris <computersforpeace@gmail.com> wrote:
> >> > The whole point of this patch is that some mfrs use different IDs for
> >> > different classes of flash, so we shouldn't force our programming
> >> > patterns into looking like CFI (i.e., parallel NOR [1]) when we're
> >> > talking about serial NOR.
> >> >
> >> > If you'd rather, I can just copy the values into this header (e.g.,
> >> > 0x01, 0x89, etc.) and completely remove all references to CFI.
> >>
> >> Understand your intention,
> >
> > Do you? It really doesn't seem like it.
> >
> >> but if what are the mfrs id's same then
> >> it's better to use already defined CFI notation because we may get
> >> into impression that the mfrs uses same id for CFI and SPINOR
> >
> > CFI is really unrelated, for the most part. Parallel and serial NOR
> > evolved quite differently. Why would we want that impression, again?
> >
> > Really, is it that hard to understand why we'd want two separate MFR ID
> > lists -- one for CFI and one for SPI NOR -- when it's quite clear that
> > those lists are NOT the same? Why should you needlessly ask programmers
> > to jump between using CFI_MFR_* and SNOR_MFR_* in the same framework?
> > What if someone starts trying to use CFI_MFR_WINBOND (which is NOT
> > correct for SPI NOR)? I'm trying *clarify* the ID namespace here, not
> > convolute it...
> 
> You're correct if the MFR ID's were different in CFI and SPI-NOR, i'm
> referring there are some mfr's have same id's for cfi and spi-nor like
> atmel, intel, micron, macronix, sst, spansion, is true right?
> 
> For these mfr's I'm suggesting we may reuse the CFI's as it is, do you
> see any concerns/issues for this?

Yes, I have concerns. I spelled out one in the quoted paragraph. I'll
try to spell it out clearer, but I'm beginning to lose sympathy here...

If there is code that *mostly* uses CFI_MFR_FOO and in only one place
uses SNOR_MFR_WINBOND, then it's very easy for a future programmer to
overlook the SNOR_MFR_WINBOND and start using CFI_MFR_WINBOND for future
code.

A variation of the above: this is a namespacing problem. You can't use
all the same IDs in both parallel and serial NOR contexts (even though
several of them are identical), so it's misleading to pretend that they
are in the same namespace. What's worse, C doesn't provide very strict
type guarantees here (everything's an int, even if we make enums), so
naming and obviousness are the best tools we have to ensure things are
used correctly. So I'm creating two separate namespaces to reflect the
fact at the beginning of this paragraph: that "you can't use all the
same IDs in both parallel and serial NOR contexts." With this patch, it
will be obvious if somebody is doing the wrong thing: we should not see
*any* use of CFI_MFR_ in spi-nor.c. At most, we should see definitions
in spi-nor.h that alias *specific* CFI IDs that are actually carried
over to SPI NOR.

Now, since you've repeatedly ignored (not refuted) my argument, I'll ask
you a question that you still haven't answered sufficiently: why
*shouldn't* we do as I suggest in my patch? I see your answer in two
parts:

  "it's better to use already defined CFI notation because we may get
  into impression that the mfrs uses same id for CFI and SPINOR"

I refuted the "because" part, and you're left only with the highly
subjective (and IMO wrong) statement that "it's better to use ..."

I'm tired of running around in circles on this simple concept. I'm about
ready to stop responding and ignore your thoughts on this matter, so
please take the time to really understand what I'm saying, if you care
to respond further.

Brian
