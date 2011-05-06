Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMKP-0000DB-LW
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 14:48:26 +0000
Received: by eyh6 with SMTP id 6so1118281eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 07:48:24 -0700 (PDT)
Subject: Re: [PATCH 2/3] ubifs: add ubifs_mount_fixup_lebs()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTi=12B0QO7L4A4B8K4=+6KYsc569HA@mail.gmail.com>
References: <BANLkTin-7YDkQ+k8bD1E2D8Qa-VsNyoK-Q@mail.gmail.com>
	<1304507625.7222.16.camel@localhost>
	<BANLkTimi=Xvvy98aj9u3Gaapzkb3hWSNgQ@mail.gmail.com>
	<1304596150.7222.51.camel@localhost>
	<BANLkTi=12B0QO7L4A4B8K4=+6KYsc569HA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 May 2011 17:44:51 +0300
Message-ID: <1304693091.7222.67.camel@localhost>
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

On Thu, 2011-05-05 at 16:36 -0400, Matthew L. Creech wrote:
> On Thu, May 5, 2011 at 7:49 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > The area which go _fefore_ the main are are special case.
> >
> > The lprops area are LEBs from number c->lpt_first to number c->lpt_last.
> > For those you need to look at the ltab:
> >
> > c->ltab[lnum - c->lpt_first].free is what you need, where lnum is the
> > LEB number you need the amount of free space for.
> >
> > For the orphans area [c->orph_first, c->orph_last] - you may to just
> > unmap them all, because when after mount this area does not contain any
> > useful data.
> >
> > Master area - LEBs UBIFS_MST_LNUM and UBIFS_MST_LNUM + 1 - you know the
> > free space start at c->mst_offs + c->mst_node_alsz. So the amount of
> > used space there is c->mst_offs + c->mst_node_alsz and free space is
> > c->leb_size - c->mst_offs - c->mst_node_alsz; And it is the same for
> > both master area LEBs.
> >
> > And finally the SB area (1 LEB) - you can skip this, but for
> > consistency, you can also fix it up. Amount of used space there is
> > always UBIFS_SB_NODE_SZ.
> >
> 
> OK, I've separated these out in the v3 patch.  I also ignored the log
> LEBs, since you didn't mention those, and I wasn't sure how to handle
> them - are they OK to leave alone?  Or could they cause similar
> problems if not cleaned up?

Actually the log LEBs shoule be processed as well. I think:

1. all LEBs which are _not_ between the log tail and head should be
unmapped.
2. log head should be fixed up.

I'll send some code to you soon.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
