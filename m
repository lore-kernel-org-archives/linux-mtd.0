Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b89jU-0007HF-KB
 for linux-mtd@lists.infradead.org; Wed, 01 Jun 2016 17:15:05 +0000
Received: by mail-pf0-x243.google.com with SMTP id f144so4633759pfa.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jun 2016 10:14:43 -0700 (PDT)
Date: Wed, 1 Jun 2016 10:14:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH 1/2] mtd: brcmnand: Add check for erased page bitflips
Message-ID: <20160601171440.GA30704@google.com>
References: <1461961285-24159-1-git-send-email-kdasu.kdev@gmail.com>
 <20160530104213.79ff4a28@bbrezillon>
 <CAKekbesoPajRAE1d=df1bWM=YF2MmMnC8-UHEmEkYuV1y+PFhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKekbesoPajRAE1d=df1bWM=YF2MmMnC8-UHEmEkYuV1y+PFhg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 01, 2016 at 12:46:18PM -0400, Kamal Dasu wrote:
> On Mon, May 30, 2016 at 4:42 AM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Fri, 29 Apr 2016 16:21:24 -0400
> > Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> >> +     if (ret)
> >> +             return ret;
> >> +
> >> +     for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
> >> +             unsigned int bitflips = 0;
> >> +
> >> +             bitflips += oob_nbits - bitmap_weight(oob, oob_nbits);
> >> +             bitflips += data_nbits - bitmap_weight(buf, data_nbits);
> >> +
> >> +             buf += chip->ecc.size;
> >> +             addr += chip->ecc.size;
> >
> > You seem to duplicate nand_check_erased_ecc_chunk() here. Do you have a
> > good reason for doing that?
> >
> 
> Hmmm I see what you are saying. Let me try setting the
> NAND_ECC_GENERIC_ERASED_CHECK option and see if we can get away
> without having to read raw.  I will have to test and make sure on
> uncorrectable error the hw leaves the return page data buffers and oob
> buffers in raw state.

I'm quite sure you can't make use of NAND_ECC_GENERIC_ERASED_CHECK
unless you do a substantial rewrite; brcmnand doesn't use any of the
nand_base ecc.read_{page,subpage} callbacks.

> If that works as expected I will get rid of this duplication and send
> a revised change which shall make use of the
> NAND_ECC_GENERIC_ERASED_CHECK option.

I suspect he was just suggesting calling the
nand_check_erased_ecc_chunk() helper instead of doing your own
bitmap_weight() calls.

Brian
