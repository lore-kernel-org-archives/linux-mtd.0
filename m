Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QejF9-0006Tj-2l
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 07:43:28 +0000
Date: Thu, 7 Jul 2011 09:43:24 +0200
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBIFS: fix master node recovery
Message-ID: <20110707094324.24128229@wker>
In-Reply-To: <1310019990.3149.105.camel@sauron>
References: <1309944626-30195-1-git-send-email-agust@denx.de>
	<1310019990.3149.105.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 07 Jul 2011 09:26:26 +0300
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Wed, 2011-07-06 at 11:30 +0200, Anatolij Gustschin wrote:
> > When the 1st LEB was unmapped and written but 2nd LEB not,
> > the master node recovery doesn't succeed after power cut.
> > We see following error when mounting UBIFS partition on NOR
> > flash:
> > 
> > UBIFS error (pid 1137): ubifs_recover_master_node: failed to recover master node
> > 
> > Additional 2nd master node offset check is needed to fix the
> > problem. If the 2nd master node is at the end in the 2nd LEB,
> > first master node is used for recovery.
> > 
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > ---
> >  fs/ubifs/recovery.c |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
> > index 783d8e0..0e951f0 100644
> > --- a/fs/ubifs/recovery.c
> > +++ b/fs/ubifs/recovery.c
> > @@ -274,7 +274,9 @@ int ubifs_recover_master_node(struct ubifs_info *c)
> >  				if (cor1)
> >  					goto out_err;
> >  				mst = mst1;
> > -			} else if (offs1 == 0 && offs2 + sz >= c->leb_size) {
> > +			} else if (offs1 == 0 &&
> > +				   (offs2 + sz >= c->leb_size ||
> > +				    (c->leb_size - offs2 - sz) < sz)) {
> 
> Hmm, ok, so we have situation like this I guess:
> 
> First LEB:   |M_______|
> Second LEB:  |MMMMMMM_|
>               1234567      
> 
> Where M - valid master node, _ - just free space.
> 
> So offs1 is 0, and offs2 is the position where the 7th M _starts_.

Yes, in our case we have 511 valid master nodes + 384 bytes free
space in LEB 2 and one valid master node in LEB 1 + free space.

> What we want to check is that there is no room for another master node
> in the second LEB. We have to take offs2, add sz, and make sure that LEB
> size minus that is less than sz, i.e., exactly what you have done.
> 
> And  offs2 + sz >= c->leb_size seems to be completely incorrect and
> should be removed, AFAICS. Can you confirm that?

Yes, offs2 + sz >= c->leb_size check is not correct, I think.

Anatolij
