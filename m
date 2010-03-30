Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NwbC6-0005D9-C1
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 13:09:27 +0000
In-Reply-To: <1269953854.6648.4.camel@localhost>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1269953854.6648.4.camel@localhost>
Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
To: dedekind1@gmail.com
Message-ID: <OFFDC7AC85.1E17F5B4-ONC12576F6.0047CC15-C12576F6.0047D5D9@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 30 Mar 2010 15:04:38 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/03/30 14:57:34:
>
> On Sat, 2010-03-20 at 11:03 +0100, Joakim Tjernlund wrote:
> > Erasing blocks is a form of GC and therefore it should live in the
> > GC task. By moving it there two problems will be solved:
> > 1) unmounting will not hang until all pending blocks has
> >    been erased.
> > 2) Erasing can be paused by sending a SIGSTOP to the GC thread which
> >    allowes for time critical tasks to work in peace.
> >
> > Since erasing now is in the GC thread, erases should trigger
> > the GC task instead.
> > wbuf.c still wants to flush its buffer via write_super so
> > invent jffs2_dirty_trigger() and use that in wbuf.
> > Remove surplus call to jffs2_erase_pending_trigger() in erase.c
> > and remove jffs2_garbage_collect_trigger() from write_super as
> > of now write_super() should only commit dirty data to disk.
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
>
> Chatted with dwmw2, and he is fine with your patch, so I'll add it to my
> l2 tree, thanks.

Thanks.

   Jocke
