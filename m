Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VDGJr-0001se-Fy
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2013 16:04:08 +0000
Received: by mail-pd0-f173.google.com with SMTP id p10so1829256pdj.32
 for <linux-mtd@lists.infradead.org>; Sat, 24 Aug 2013 09:03:44 -0700 (PDT)
Date: Sun, 25 Aug 2013 00:00:54 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 7/9] jffs2: init the ret with -EINVAL
Message-ID: <20130825040052.GB9911@gmail.com>
References: <1376879478-22128-1-git-send-email-b32955@freescale.com>
 <1376879478-22128-8-git-send-email-b32955@freescale.com>
 <20130824063739.GD32074@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130824063739.GD32074@brian-ubuntu>
Cc: dedekind1@gmail.com, akinobu.mita@gmail.com, matthieu.castet@parrot.com,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 23, 2013 at 11:37:39PM -0700, Brian Norris wrote:
> On Mon, Aug 19, 2013 at 10:31:16AM +0800, Huang Shijie wrote:
> > If the media is not SLC nand, dataflash, Sibley flash or a
> > ubi volume, we should return -EINVAL to the caller.
> > The caller should exit in this case.
> > 
> > Current code returns 0 in this case which is not proper.
> > 
> > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > ---
> >  fs/jffs2/fs.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> > index fe3c052..0452445 100644
> > --- a/fs/jffs2/fs.c
> > +++ b/fs/jffs2/fs.c
> > @@ -702,7 +702,7 @@ void jffs2_gc_release_page(struct jffs2_sb_info *c,
> >  }
> >  
> >  static int jffs2_flash_setup(struct jffs2_sb_info *c) {
> > -	int ret = 0;
> > +	int ret = -EINVAL;
> 
> This doesn't look correct to me. This function isn't meant to screen out
> unsupported flash; it's only for doing special things for certain flash.
> In fact, I think this will break many NOR flash which currently pass
> through this function without doing anything.

thanks for pointing this.
This patch was created when i was not familiar with the NOR.


> 
> If you really want to make MLC NAND fail, you should do it with an
> explicit check for MLC, and you probably don't want it in this function.
> Maybe in jffs2_do_fill_super(), near the other 'if (c->mtd->type == ...)'
> checks (but outside of the #ifndef, of course).

I will create a new patch to fix the MLC issue for the jffs2.

Huang Shijie
