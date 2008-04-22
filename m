Subject: Re: [PATCH] [JFFS2] Fix free space leaking
From: David Woodhouse <dwmw2@infradead.org>
To: Martin Creutziger <martin.creutziger@barco.com>
In-Reply-To: <1207213384.6161.4.camel@KARCLT0275>
References: <20071113102323.GA5933@damir.rnd.local>
	<1202293219.25864.45.camel@gentoo-jocke.transmode.se>
	<20080221111148.GA10791@lazybastard.org>
	<1203593969.15409.45.camel@shinybook.infradead.org>
	<1207213384.6161.4.camel@KARCLT0275>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 00:16:50 +0100
Message-Id: <1208906210.9212.696.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Damir Shayhutdinov <lost404@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-04-03 at 11:03 +0200, Martin Creutziger wrote:
> On Thu, 2008-02-21 at 20:39 +0900, an unknown sender wrote:
> > On Thu, 2008-02-21 at 12:11 +0100, J?rn Engel wrote:
> > > No idea, but it might help to add dwmw2 to Cc:.
> > 
> > dwmw2 moderately confused by it. I don't see why it's correct to account
> > for the space as 'free' when it isn't really. If it's causing a
> > persistent leak, shouldn't we deal with that when the block is erased
> > instead?
> 
> Hi, 
> 
> I am currently testing the patch on 2.6.24.2 (as a result of
> http://lists.infradead.org/pipermail/linux-mtd/2008-March/021024.html),
> and so far it seems to at least cure the symptoms, as in: The partition
> does not "fill up" any more so far. 
> But: For later production use I would certainly prefer a patch that also
> dwmw2 agrees being a cure to the _cause_, not just the symptoms.
> Any suggestions?

I have reproduced this locally with some extra 'paranoia' debug checks,
and I understand it now. The original patch was doing fairly much the
right thing, but ideally would have looked more like this:

--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -459,8 +459,9 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c,
        down(&c->erase_free_sem);
        spin_lock(&c->erase_completion_lock);
        c->erasing_size -= c->sector_size;
-       c->free_size += jeb->free_size;
-       c->used_size += jeb->used_size;
+       /* We already accounted for the cleanmarker in c->{used,free}_size,
+          so just add the eraseblock size now. */
+       c->free_size += c->sector_size;
 
        jffs2_dbg_acct_sanity_check_nolock(c,jeb);
        jffs2_dbg_acct_paranoia_check_nolock(c, jeb);


In fact I've cleaned it up a little more to fix the fact that we were
calling jffs2_link_node_ref() without the required locking:
http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=014b164e1392a166fe96e003d2f0e7ad2e2a0bb7

Thanks for your patience, and for showing me exactly where to look.

-- 
dwmw2
