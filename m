Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QI5Hz-0001PG-N7
	for linux-mtd@lists.infradead.org; Thu, 05 May 2011 20:36:48 +0000
Received: by qyk32 with SMTP id 32so4406334qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 May 2011 13:36:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1304596150.7222.51.camel@localhost>
References: <BANLkTin-7YDkQ+k8bD1E2D8Qa-VsNyoK-Q@mail.gmail.com>
	<1304507625.7222.16.camel@localhost>
	<BANLkTimi=Xvvy98aj9u3Gaapzkb3hWSNgQ@mail.gmail.com>
	<1304596150.7222.51.camel@localhost>
Date: Thu, 5 May 2011 16:36:46 -0400
Message-ID: <BANLkTi=12B0QO7L4A4B8K4=+6KYsc569HA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ubifs: add ubifs_mount_fixup_lebs()
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 5, 2011 at 7:49 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> The area which go _fefore_ the main are are special case.
>
> The lprops area are LEBs from number c->lpt_first to number c->lpt_last.
> For those you need to look at the ltab:
>
> c->ltab[lnum - c->lpt_first].free is what you need, where lnum is the
> LEB number you need the amount of free space for.
>
> For the orphans area [c->orph_first, c->orph_last] - you may to just
> unmap them all, because when after mount this area does not contain any
> useful data.
>
> Master area - LEBs UBIFS_MST_LNUM and UBIFS_MST_LNUM + 1 - you know the
> free space start at c->mst_offs + c->mst_node_alsz. So the amount of
> used space there is c->mst_offs + c->mst_node_alsz and free space is
> c->leb_size - c->mst_offs - c->mst_node_alsz; And it is the same for
> both master area LEBs.
>
> And finally the SB area (1 LEB) - you can skip this, but for
> consistency, you can also fix it up. Amount of used space there is
> always UBIFS_SB_NODE_SZ.
>

OK, I've separated these out in the v3 patch.  I also ignored the log
LEBs, since you didn't mention those, and I wasn't sure how to handle
them - are they OK to leave alone?  Or could they cause similar
problems if not cleaned up?

-- 
Matthew L. Creech
