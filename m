Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D68C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 16:35:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063B0214E0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 16:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="akAq36J4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063B0214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZNUx3TkOLNgWwg6x2vHPS8s5NbE3O7VoFKWQ1CIpPI=; b=akAq36J4KMFbyq
	I7Z/UVAtbQL+M6XoN1sNxbXUMHZbhWlnSB+jsQF5X6qjIrMZCemEvnv36veU24MXlllkTp992jm0x
	Bx/qT76TO9k2guK/H+j/A5N5ERZYh9wPMf0j7DVUJ0qqGAdlv6tcmVKYTIT4l5s/eqNbv34yQ8nl3
	04Ay5QdJWKs4dftmI3vF5h/BvbyspPzGRuCCDJ+51z8H1FebEKAedHxw/eJ3qtR2TawQFqs5uh9CU
	eKUmfWIIgijwIuZspfKD50/yElH8eRfrwnu3nGEZqRkld4NzCg9Q0gEdB0Mzio514OACRxk8d415o
	b8P4MszIsSmt76dLoxYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUCeT-0004Lq-CP; Mon, 11 Nov 2019 16:34:53 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUCeQ-0004LE-DA
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 16:34:51 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42899B157;
 Mon, 11 Nov 2019 16:34:48 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AF7D21E47E5; Mon, 11 Nov 2019 17:34:46 +0100 (CET)
Date: Mon, 11 Nov 2019 17:34:46 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 7/7] ubifs: Add quota support
Message-ID: <20191111163446.GF13307@quack2.suse.cz>
References: <20191106091537.32480-1-s.hauer@pengutronix.de>
 <20191106091537.32480-8-s.hauer@pengutronix.de>
 <20191106101428.GD16085@quack2.suse.cz>
 <20191111085745.t6qbckcxt6byaoxq@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111085745.t6qbckcxt6byaoxq@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_083450_592438_84C8BB15 
X-CRM114-Status: GOOD (  17.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Jan Kara <jack@suse.cz>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sascha!

On Mon 11-11-19 09:57:45, Sascha Hauer wrote:
> On Wed, Nov 06, 2019 at 11:14:28AM +0100, Jan Kara wrote:
> > > +/**
> > > + * ubifs_dqblk_find_next - find the next qid
> > > + * @c: UBIFS file-system description object
> > > + * @qid: The qid to look for
> > > + *
> > > + * Find the next dqblk entry with a qid that is bigger or equally big than the
> > > + * given qid. Returns the next dqblk entry if found or NULL if no dqblk exists
> > > + * with a qid that is at least equally big.
> > > + */
> > > +static struct ubifs_dqblk *ubifs_dqblk_find_next(struct ubifs_info *c,
> > > +						 struct kqid qid)
> > > +{
> > > +	struct rb_node *node = c->dqblk_tree[qid.type].rb_node;
> > > +	struct ubifs_dqblk *next = NULL;
> > > +
> > > +	while (node) {
> > > +		struct ubifs_dqblk *ud = rb_entry(node, struct ubifs_dqblk, rb);
> > > +
> > > +		if (qid_eq(qid, ud->kqid))
> > > +			return ud;
> > > +
> > > +		if (qid_lt(qid, ud->kqid)) {
> > > +			if (!next || qid_lt(ud->kqid, next->kqid))
			^^^
This condition looks superfluous as it should be always true. The last node
where you went left should be the least greater node if you didn't find the
exact match...

> > > +				next = ud;
> > > +
> > > +			node = node->rb_left;
> > > +		} else {
> > > +			node = node->rb_right;
> > > +		}
> > > +	}
> > > +
> > > +	return next;
> > > +}
> > 
> > Why not use rb_next() here? It should do what you need, shouldn't it?
> 
> I could use rb_next(), but it defeats the purpose of a tree to iterate
> over the whole tree to find an entry. If I wanted that I would have used
> a list.

I wasn't quite clear in my suggestion and now that I look at it it was
actually misleading. I'm sorry for that. So a second try :):

You have ubifs_dqblk_find() and ubifs_dqblk_find_next() doing very similar
rbtree traversal. I think you could remove that duplication by using
ubifs_dqblk_find_next() from ubifs_dqblk_find()?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
