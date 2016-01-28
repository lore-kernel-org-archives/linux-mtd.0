Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOqqv-0000Iy-25
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 17:59:30 +0000
Received: by mail-pa0-x244.google.com with SMTP id yy13so2306472pab.1
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2016 09:59:08 -0800 (PST)
Date: Thu, 28 Jan 2016 09:59:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Marek Vasut <marex@denx.de>,
 Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH 4/8] mtd: spi-nor: disallow further writes to SR if WP#
 is low
Message-ID: <20160128175905.GA33340@google.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
 <1453960307-10181-5-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfC6HM6M0ZJuEqj-=QUUs9+kHJB0m5bt2t9a-VYuiMPx4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfC6HM6M0ZJuEqj-=QUUs9+kHJB0m5bt2t9a-VYuiMPx4Q@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

Thanks for the review.

On Thu, Jan 28, 2016 at 11:36:13AM -0300, Ezequiel Garcia wrote:
> On 28 January 2016 at 02:51, Brian Norris <computersforpeace@gmail.com> wrote:
> > Locking the flash is most useful if it provides real hardware security.
> > Otherwise, it's little more than a software permission bit.
> >
> > A reasonable use case that provides real HW security might be like
> > follows:
> >
> > (1) hardware WP# is deasserted
> > (2) program flash
> > (3) flash range is protected via status register
> > (4) hardware WP# is asserted
> > (5) flash protection range can no longer be changed, until WP# is
> >     deasserted
> >
> > In this way, flash protection is co-owned by hardware and software.
> >
> > Now, one would expect to be able to perform step (3) with
> > ioctl(MEMLOCK), except that the spi-nor driver does not set the Status
> > Register Protect bit (a.k.a. Status Register Write Disable (SRWD)), so
> > even though the range is now locked, it does not satisfy step (5) -- it
> > can still be changed by a call to ioctl(MEMUNLOCK).
> >
> > So, let's enable status register protection after the first lock
> > command.
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c |    3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 3a08aa53c171..46da6bb706fa 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -518,6 +518,9 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
> >
> >         status_new = (status_old & ~mask) | val;
> >
> > +       /* Disallow further writes if WP pin is asserted */
> > +       status_new |= SR_SRWD;
> > +
> 
> No need to clear SR_SRWD in stm_unlock?

Good point.

I actually had thought about that earlier, but I didn't come up with a
great plan, and then I forgot about it when I was preparing this RFC. I
don't think we want *all* "unlock" operations to unprotect the status
register. What if we had the whole flash locked, and we're just calling
unlock on the top half, with the intention of leaving the bottom half
protected still?

So, maybe we want to clear SR_SRWD only when we unlock the *entire*
flash? What do you think?

Brian
