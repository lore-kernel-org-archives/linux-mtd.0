Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPawH-0001YW-B9
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 19:44:21 +0000
Received: by mail-pa0-x244.google.com with SMTP id cf3so1833525pad.2
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 12:44:01 -0700 (PDT)
Date: Tue, 19 Jul 2016 12:43:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: nand: Get rid of needless 'goto'
Message-ID: <20160719194358.GB143334@google.com>
References: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
 <1468942904-26464-2-git-send-email-andrew.smirnov@gmail.com>
 <20160719183047.GC85399@google.com>
 <CAHQ1cqHJK-EYB_P4Vzeze8x7hHGfb6mzHrBWqSu1HOhj0KmBvQ@mail.gmail.com>
 <20160719205521.3a816b19@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160719205521.3a816b19@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jul 19, 2016 at 08:55:21PM +0200, Boris Brezillon wrote:
> On Tue, 19 Jul 2016 11:48:04 -0700
> Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> 
> > On Tue, Jul 19, 2016 at 11:30 AM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> > > On Tue, Jul 19, 2016 at 08:41:44AM -0700, Andrey Smirnov wrote:  
> > >> Using "goto" in that "switch" statement only makes it harder to follow
> > >> control flow and doesn't bring any advantages. Rewrite the code to avoid
> > >> using "goto".
> > >>
> > >> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > >> ---
> > >>  drivers/mtd/nand/nand_base.c | 13 +++++--------
> > >>  1 file changed, 5 insertions(+), 8 deletions(-)
> > >>
> > >> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > >> index 57043a6..8fa5536 100644
> > >> --- a/drivers/mtd/nand/nand_base.c
> > >> +++ b/drivers/mtd/nand/nand_base.c
> > >> @@ -2139,18 +2139,15 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
> > >>       case MTD_OPS_PLACE_OOB:
> > >>       case MTD_OPS_AUTO_OOB:
> > >>       case MTD_OPS_RAW:
> > >> +             if (!ops->datbuf)
> > >> +                     ret = nand_do_read_oob(mtd, from, ops);
> > >> +             else
> > >> +                     ret = nand_do_read_ops(mtd, from, ops);
> > >>               break;
> > >> -
> > >>       default:
> > >> -             goto out;
> > >> +             break;
> > >>       }
> > >>
> > >> -     if (!ops->datbuf)
> > >> -             ret = nand_do_read_oob(mtd, from, ops);
> > >> -     else
> > >> -             ret = nand_do_read_ops(mtd, from, ops);
> > >> -
> > >> -out:
> > >>       nand_release_device(mtd);
> > >>       return ret;
> > >>  }  
> > >
> > > The default case is really just a catch-all error case. We don't
> > > actually even need the nand_get_device() call for that... can we just
> > > do this instead?  
> > 
> > Sure, although, if you don't mind, I'd rather you used:
> > 
> > if (ops->mode != MTD_OPS_PLACE_OOB &&
> >     ops->mode != MTD_OPS_AUTO_OOB &&
> >     ops->mode != MTD_OPS_RAW)
> >        return -ENOTSUPP;
> 
> Or just
> 
> 	if (ops->mode < MTD_OPS_PLACE_OOB || ops->mode > MTD_OPS_RAW)

ops->mode is unsigned. And this seems a little more fragile, assuming
the enum layout.

> 		return -ENOTSUPP;
> 
> Anyway, I'm fine with all different versions as long as you don't take
> the nand lock if the mode is incorrect, so I'll let Brian decide.

Whatever Andrey prefers is his choice to send, and I don't have much
more preference than the above comment. I'd take either mine or Andrey's
second solution above.

Brian

> > 
> > instead of the switch statement, IMHO, this way it is more obvious
> > that this codepath is just arguments correctness checking.
> > 
> > Andrey
> 
