Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHx6v-0004WG-19
	for linux-mtd@lists.infradead.org; Thu, 05 May 2011 11:52:53 +0000
Received: by eyh6 with SMTP id 6so705070eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 May 2011 04:52:47 -0700 (PDT)
Subject: Re: [PATCH 2/3] ubifs: add ubifs_mount_fixup_lebs()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTimi=Xvvy98aj9u3Gaapzkb3hWSNgQ@mail.gmail.com>
References: <BANLkTin-7YDkQ+k8bD1E2D8Qa-VsNyoK-Q@mail.gmail.com>
	<1304507625.7222.16.camel@localhost>
	<BANLkTimi=Xvvy98aj9u3Gaapzkb3hWSNgQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 May 2011 14:49:10 +0300
Message-ID: <1304596150.7222.51.camel@localhost>
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

On Wed, 2011-05-04 at 18:02 -0400, Matthew L. Creech wrote:
> All makes sense Artem, thanks for the feedback.
> 
> On Wed, May 4, 2011 at 7:13 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2011-05-03 at 18:55 -0400, Matthew L. Creech wrote:
> >> +
> >> +             if (!(lprops->flags & LPROPS_EMPTY) &&
> >
> > I think this is not quite right, because empty taken LEBs will not be
> > fixed up. I think you should only look at free space and nothing else.
> >
> 
> OK, however I did find that I needed to check for (lprops->flags &
> LPROPS_TAKEN) in addition to (lprops->free == c->leb_size) before
> unmapping a LEB.  Failing to do so caused this:
> 
> UBIFS error (pid 1): check_lpt_type: invalid type (15) in LPT node type 1
> UBIFS error (pid 1): ubifs_read_nnode: error -22 reading nnode at 8:783
> 
> so apparently it was unmapping part of the LPT, I guess?

Oh, right, the LPT subsystem contains the information about LEBs in the
main area, i.e., from LEBs number c->main_first to LEB number c->leb_cnt
- 1

The area which go _fefore_ the main are are special case.

The lprops area are LEBs from number c->lpt_first to number c->lpt_last.
For those you need to look at the ltab: 

c->ltab[lnum - c->lpt_first].free is what you need, where lnum is the
LEB number you need the amount of free space for.

For the orphans area [c->orph_first, c->orph_last] - you may to just
unmap them all, because when after mount this area does not contain any
useful data.

Master area - LEBs UBIFS_MST_LNUM and UBIFS_MST_LNUM + 1 - you know the
free space start at c->mst_offs + c->mst_node_alsz. So the amount of
used space there is c->mst_offs + c->mst_node_alsz and free space is
c->leb_size - c->mst_offs - c->mst_node_alsz; And it is the same for
both master area LEBs.

And finally the SB area (1 LEB) - you can skip this, but for
consistency, you can also fix it up. Amount of used space there is
always UBIFS_SB_NODE_SZ.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
