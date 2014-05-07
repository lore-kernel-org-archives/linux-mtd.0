Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi5Oo-0005hb-Ih
 for linux-mtd@lists.infradead.org; Wed, 07 May 2014 17:12:55 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb1so1452986pad.23
 for <linux-mtd@lists.infradead.org>; Wed, 07 May 2014 10:12:33 -0700 (PDT)
Date: Wed, 7 May 2014 10:12:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mtd: nand: refactor erase_cmd() to return chip status
Message-ID: <20140507171229.GD28907@ld-irv-0074>
References: <1399417870-14436-1-git-send-email-computersforpeace@gmail.com>
 <CAF2Aj3hB-6=yfCOhqXrWGcPey1DEGqkUfkEsRdrQbXz80s_sug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF2Aj3hB-6=yfCOhqXrWGcPey1DEGqkUfkEsRdrQbXz80s_sug@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Your reply was multipart HTML/Text, so the list probably bounced you)

On Wed, May 07, 2014 at 11:59:56AM +0100, Lee Jones wrote:
> On 7 May 2014 00:12, &quot;Brian Norris&quot; <computersforpeace@gmail.com>
> wrote:
> >
> > The nand_chip::erase_cmd callback previously served a dual purpose; for
> > one, it allowed a per-flash-chip override, so that AG-AND devices could
> > use a different erase command than other NAND. These AND devices were
> > dropped in commit xxxxx. On the other hand, some drivers (denali and
> I think you still need to fill this in.

Yes... I should re-read my commit messages before sending! This should
be:

commit 14c6578683367b1e7af0c3c09e872b45a45183a7
(mtd: nand: remove AG-AND support)

> > doc-g4) need to use this sort of callback to implement
> > controller-specific erase operations.
> >
> > To make the latter operation easier for some drivers (e.g., ST's new BCH
> > NAND driver), it helps if the command dispatch and wait functions can be
> > lumped together, rather than called separately.
> >
> > This patch does two things:
> >  1. Pull the call to chip->waitfunc() into chip->erase_cmd(), and return
> >     the status from this callback
> >  2. Rename erase_cmd() to just erase(), since this callback does a
> >     little more than just send a command
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Mike Dunn <mikedunn@newsguy.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/mtd/nand/denali.c    |  7 +++----
> >  drivers/mtd/nand/docg4.c     |  6 ++++--
> >  drivers/mtd/nand/nand_base.c | 14 +++++++-------
> >  include/linux/mtd/nand.h     |  5 ++---
> >  4 files changed, 16 insertions(+), 16 deletions(-)
> If the code hasn't changed since the pastebin:
> Tested-by: Lee Jones <lee.jones@linaro.org>

It is the same.

I've updated my commit message locally. I'll give this a few days, then
push the patch.

Thanks,
Brian
