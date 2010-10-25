Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAI39-0004e4-0q
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 08:04:59 +0000
Received: by bwz5 with SMTP id 5so2760295bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 01:04:57 -0700 (PDT)
Subject: Re: [PATCH] jffs2: Do not assume erase will fail
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1287965485.5674.25.camel@macbook.infradead.org>
References: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1287965485.5674.25.camel@macbook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 11:01:49 +0300
Message-ID: <1287993709.2224.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-25 at 01:11 +0100, David Woodhouse wrote:
> On Thu, 2010-10-07 at 18:29 +0200, Joakim Tjernlund wrote:
> > 
> > Test if it did and then abort.
> > 
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
> >  fs/jffs2/nodemgmt.c |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
> > index 694aa5b..49ee5de 100644
> > --- a/fs/jffs2/nodemgmt.c
> > +++ b/fs/jffs2/nodemgmt.c
> > @@ -260,9 +260,9 @@ static int jffs2_find_nextblock(struct jffs2_sb_info *c)
> >                 spin_lock(&c->erase_completion_lock);
> >  
> >                 /* An erase may have failed, decreasing the
> > -                  amount of free space available. So we must
> > -                  restart from the beginning */
> > -               return -EAGAIN;
> > +                  amount of free space available. */
> > +               if (list_empty(&c->free_list))
> > +                       return -EAGAIN; /* restart from the beginning */ 
> 
> Hm, but there could have been more than one erase pending (or in
> progress). And if one fails and another succeeds then you could have a
> non-empty free_list but you could *also* now have run short of
> free/freeable space so that a userspace write should now receive
> -ENOSPC.
> 
> Is this really a performance issue? It should just come straight back if
> the conditions are still met, surely?
> 
> And if we're hitting this code path that often, we should look at
> erasing more aggressively so that we *don't* have to erase stuff on
> demand.

David,

there are 2 patches which you seem to miss. I've re-based my l2 tree
against your today's mtd tree, and applied them on top. I've also
preserved this patch. Please, look at those.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
