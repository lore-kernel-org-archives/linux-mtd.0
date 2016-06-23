Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFzP4-0008Pk-38
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 07:50:22 +0000
Date: Thu, 23 Jun 2016 09:49:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Sylvain Etienne <seti@dadboo.eu>, linux-mtd@lists.infradead.org, Artem
 Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: switch_gc_head: remove redondant sync of wbuf
Message-ID: <20160623094959.59c8d17b@bbrezillon>
In-Reply-To: <576B9403.7040100@nod.at>
References: <20160623055344.GA5896@dadboo.eu>
	<576B9403.7040100@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 23 Jun 2016 09:47:15 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 23.06.2016 um 07:53 schrieb Sylvain Etienne:
> > The wbuf is already sync-ed before ubifs_leb_unmap()
> > 
> > Signed-off-by: Sylvain Etienne <seti@dadboo.eu>
> > ---
> > 
> > Notes:
> >     This is my first patch on this mailing list. Please let me know if I missed
> >     something.
> > 
> >  fs/ubifs/gc.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> > index 9718da8..821b348 100644
> > --- a/fs/ubifs/gc.c
> > +++ b/fs/ubifs/gc.c
> > @@ -100,10 +100,6 @@ static int switch_gc_head(struct ubifs_info *c)
> >  	if (err)
> >  		return err;
> >  
> > -	err = ubifs_wbuf_sync_nolock(wbuf);
> > -	if (err)
> > -		return err;
> > -
> >  	err = ubifs_add_bud_to_log(c, GCHD, gc_lnum, 0);
> >  	if (err)
> >  		return err;  
> 
> This call was introduced by:
> commit cb14a18465686ea6add51b1008865b8174c28bd7
> Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date:   Sun May 15 14:51:54 2011 +0300
> 
>     UBIFS: synchronize write-buffer before switching to the next bud
> 
> 
> Which basically syncs the wbuf before each ubifs_add_bud_to_log().
> In switch_gc_head() we synced already before ubifs_leb_unmap().
> So either the said commit oversaw that sync call or I miss something.
> 
> But AFACT your change is correct. Artem, can you please confirm?
> Boris, didn't discuss that redundancy while inspecting UBIFS wrt. MLC
> support?

Yes, I remember proposing the same patch (though I never posted it on
the ML). It seems to be useless, but let's wait for Artem's
confirmation.
