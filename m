Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Neot7-0008DA-KD
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 12:08:22 +0000
Subject: Re: [PATCH] JFFS2: Erase max 3 EB's in jffs2_write_super()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF04B03B42.0D1C9BA8-ONC12576BE.00355ACE-C12576BE.00357DE9@transmode.se>
References: <1265103600-32522-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<OF04B03B42.0D1C9BA8-ONC12576BE.00355ACE-C12576BE.00357DE9@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2010 14:07:21 +0200
Message-ID: <1265717241.2006.144.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-02-02 at 10:44 +0100, Joakim Tjernlund wrote:
> Joakim Tjernlund <Joakim.Tjernlund@transmode.se> wrote on 2010/02/02 10:40:00:
> >
> > Deleting big files in a JFFS2 root FS and the rebooting makes
> > the system hang until all freed EB's has been erased which
> > can take several minutes.
> > Fix the hanging by making jffs2_write_super() erase max 3 EB's
> > at a time. If there are more EB's to erase afterwards, reset the
> > s_dirty flag.
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
> >
> >  I hope the list_empty calls doesn't need locking. If
> >  so, it can easily be added.
> >
> >  fs/jffs2/super.c |    5 ++++-
> >  1 files changed, 4 insertions(+), 1 deletions(-)
> >
> > diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> > index 9a80e8e..10393e0 100644
> > --- a/fs/jffs2/super.c
> > +++ b/fs/jffs2/super.c
> > @@ -64,7 +64,10 @@ static void jffs2_write_super(struct super_block *sb)
> >     if (!(sb->s_flags & MS_RDONLY)) {
> 
> I wonder if not MS_ACTIVE should be included in the above test too?

If this function is called with MS_ACTIVE flag, I'd say this is a bug.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
