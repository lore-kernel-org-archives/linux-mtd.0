Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnNC-0006T8-KF
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:37:23 +0000
Message-ID: <1362472674.2943.27.camel@sauron>
Subject: Re: [PATCH 05/12] mtd: nand: remove AG-AND support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 05 Mar 2013 10:37:54 +0200
In-Reply-To: <CAN8TOE_unP1QVSTiOJdAf3LQ6zKYDLJ03ZRO7ZcDg0L72prnDw@mail.gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-6-git-send-email-dedekind1@gmail.com>
 <CAN8TOE_unP1QVSTiOJdAf3LQ6zKYDLJ03ZRO7ZcDg0L72prnDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 10:56 -0800, Brian Norris wrote:
> On Mon, Mar 4, 2013 at 8:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >
> > We have only one AG-AND driver and it was not touched since 2005. It looks
> > like AG-AND was not really make it to mass-production and can be considered
> > a dead technology.
> 
> You might want to include in your commit message that BBT_AUTO_REFRESH
> was only needed for AG-AND. You drop it here (which is perfectly
> reasonable) but it is technically provided as a generic feature which
> *could* be used outside of AG-AND.

OK, will do, thanks!

> > @@ -22,7 +21,6 @@
> >   *     Enable cached programming for 2k page size chips
> >   *     Check, if mtd->ecctype should be set to MTD_ECC_HW
> >   *     if we have HW ECC support.
> > - *     The AG-AND chips have nice features for speed improvement,
> >   *     which are not supported yet. Read / program 4 pages in one go.
> >   *     BBT table is not serialized, has to be fixed
> >   *
> 
> You cut this off mid-sentence. Did you mean to cut three lines here,
> instead of just one?

Oops.

> > -       if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
> > -               chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
> > -       else
> > +       if (state == FL_ERASING)
> >                 chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
> 
> This is not a precise refactor. All non-AND flash would previously
> have run the STATUS command, but now you make it only run when
> FL_ERASING. Shouldn't it just be an unconditional cmdfunc(STATUS)?
 
OOPS!

-- 
Best Regards,
Artem Bityutskiy
