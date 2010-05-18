Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OERPT-0001yg-7A
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 18:20:55 +0000
In-Reply-To: <1274197587.6930.7407.camel@macbook.infradead.org>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>	
	<1273771018.12840.7077.camel@macbook.infradead.org>
	<OFA2F265F6.2B404027-ONC1257723.003646C0-C1257723.0037EF5F@transmode.se>
	<1273833304.9999.1994.camel@macbook.infradead.org>	
	<OF1C1D0F53.C35CA5E4-ONC1257723.003B9D61-C1257723.003D1321@transmode.se>
	<OF7E076EC4.DAE6F9AF-ONC1257723.0042AFF4-C1257723.00430591@transmode.se>
	<1274197587.6930.7407.camel@macbook.infradead.org>
Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OF3DC6DD0B.DB8A6260-ONC1257727.00645369-C1257727.0064A32D@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 18 May 2010 20:19:13 +0200
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

David Woodhouse <dwmw2@infradead.org> wrote on 2010/05/18 17:46:27:
>
> On Fri, 2010-05-14 at 14:12 +0200, Joakim Tjernlund wrote:
> > @@ -167,8 +170,6 @@ static void jffs2_erase_succeeded(struct jffs2_sb_info
> *c, struct jffs2_eraseblo
> >         list_move_tail(&jeb->list, &c->erase_complete_list);
> >         spin_unlock(&c->erase_completion_lock);
> >         mutex_unlock(&c->erase_free_sem);
> > -       /* Ensure that kupdated calls us again to mark them clean */
> > -       jffs2_erase_pending_trigger(c);
> >  }
> >
> >  static void jffs2_erase_failed(struct jffs2_sb_info *c, struct
> jffs2_eraseblock *jeb, uint32_t bad_offset)
>
> Why remove this? If you have asynchronous erases, with the erase
> callback (and hence this jffs2_erase_succeeded function) getting called
> asynchronously, then we _do_ want to trigger the GC thread to run, to
> that it can write the cleanmarker to the block and refile it on the
> empty_list.

hmm, I haven't given async erases much thought(is anyone using that?)
but yes it looks premature to remove this. Could you add that back or
do you want me to submit another patch?
