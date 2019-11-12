Return-Path: <SRS0=8T9L=ZE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64974C17441
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2019 09:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AF7120650
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2019 09:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lVAtHgq/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AF7120650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3ceWiQfRRo+V3IfOANVOuu/Aiay57W1NE9tU/gmzFM=; b=lVAtHgq/aMYmbk
	w4Hnxc8jyS56eoU42OIoMOed9zSDOauCX1vOh/nUxLIVP5jMZtFpFeIv7zYzatE+8E4eR4VYcTL6e
	SLn7LfZYxbXiO5NV8ZVHy54z9mJ5zMVl1Z2qesmPvAvVZsatJMa2rcZeEvZFxryNfIx3IWgAvufQ6
	yLMOnPX2oMQDUw+AcB/Z4j2+pE3crK4h2c+vnDg3mXOOwKks+ikqEwlD7Ds2PLT++CGGY8Y5vqb1Q
	nfyIH10ZtAnS4mGkXg06qr5godj1MH7e2UaylzGJET5YYdDver+3DicBIc4+kDuSFCAlAzSCBq4bJ
	oE8JVxC5TY9mWlMflHwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUSWa-0004Fv-U9; Tue, 12 Nov 2019 09:31:48 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUSWY-0004En-3N
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2019 09:31:47 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2110B3B7;
 Tue, 12 Nov 2019 09:31:44 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4DBBE1E47E5; Tue, 12 Nov 2019 10:31:44 +0100 (CET)
Date: Tue, 12 Nov 2019 10:31:44 +0100
From: Jan Kara <jack@suse.cz>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 7/7] ubifs: Add quota support
Message-ID: <20191112093144.GB1241@quack2.suse.cz>
References: <20191106091537.32480-1-s.hauer@pengutronix.de>
 <20191106091537.32480-8-s.hauer@pengutronix.de>
 <20191106101428.GD16085@quack2.suse.cz>
 <20191111085745.t6qbckcxt6byaoxq@pengutronix.de>
 <20191111163446.GF13307@quack2.suse.cz>
 <20191112085941.dg2wchto7iaczarr@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112085941.dg2wchto7iaczarr@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_013146_447464_668F5367 
X-CRM114-Status: GOOD (  23.84  )
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

On Tue 12-11-19 09:59:41, Sascha Hauer wrote:
> On Mon, Nov 11, 2019 at 05:34:46PM +0100, Jan Kara wrote:
> > Hi Sascha!
> > 
> > On Mon 11-11-19 09:57:45, Sascha Hauer wrote:
> > > On Wed, Nov 06, 2019 at 11:14:28AM +0100, Jan Kara wrote:
> > > > > +/**
> > > > > + * ubifs_dqblk_find_next - find the next qid
> > > > > + * @c: UBIFS file-system description object
> > > > > + * @qid: The qid to look for
> > > > > + *
> > > > > + * Find the next dqblk entry with a qid that is bigger or equally big than the
> > > > > + * given qid. Returns the next dqblk entry if found or NULL if no dqblk exists
> > > > > + * with a qid that is at least equally big.
> > > > > + */
> > > > > +static struct ubifs_dqblk *ubifs_dqblk_find_next(struct ubifs_info *c,
> > > > > +						 struct kqid qid)
> > > > > +{
> > > > > +	struct rb_node *node = c->dqblk_tree[qid.type].rb_node;
> > > > > +	struct ubifs_dqblk *next = NULL;
> > > > > +
> > > > > +	while (node) {
> > > > > +		struct ubifs_dqblk *ud = rb_entry(node, struct ubifs_dqblk, rb);
> > > > > +
> > > > > +		if (qid_eq(qid, ud->kqid))
> > > > > +			return ud;
> > > > > +
> > > > > +		if (qid_lt(qid, ud->kqid)) {
> > > > > +			if (!next || qid_lt(ud->kqid, next->kqid))
> > 			^^^
> > This condition looks superfluous as it should be always true. The last node
> > where you went left should be the least greater node if you didn't find the
> > exact match...
> 
> You are right. I can't say why I thought this is necessary when I wrote
> this.
> 
> > 
> > > > > +				next = ud;
> > > > > +
> > > > > +			node = node->rb_left;
> > > > > +		} else {
> > > > > +			node = node->rb_right;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	return next;
> > > > > +}
> > > > 
> > > > Why not use rb_next() here? It should do what you need, shouldn't it?
> > > 
> > > I could use rb_next(), but it defeats the purpose of a tree to iterate
> > > over the whole tree to find an entry. If I wanted that I would have used
> > > a list.
> > 
> > I wasn't quite clear in my suggestion and now that I look at it it was
> > actually misleading. I'm sorry for that. So a second try :):
> > 
> > You have ubifs_dqblk_find() and ubifs_dqblk_find_next() doing very similar
> > rbtree traversal. I think you could remove that duplication by using
> > ubifs_dqblk_find_next() from ubifs_dqblk_find()?
> 
> Ok, with this the two functions can be simplified to:
> 
> /**
>  * ubifs_dqblk_find_next - find the next qid
>  * @c: UBIFS file-system description object
>  * @qid: The qid to look for
>  *
>  * Find the next dqblk entry with a qid that is bigger or equally big than the
>  * given qid. Returns the next dqblk entry if found or NULL if no dqblk exists
>  * with a qid that is at least equally big.
>  */
> static struct ubifs_dqblk *ubifs_dqblk_find_next(struct ubifs_info *c,
> 						 struct kqid qid)
> {
> 	struct rb_node *node = c->dqblk_tree[qid.type].rb_node;
> 	struct ubifs_dqblk *next = NULL;
> 
> 	while (node) {
> 		struct ubifs_dqblk *ud = rb_entry(node, struct ubifs_dqblk, rb);
> 
> 		if (qid_eq(qid, ud->kqid))
> 			return ud;
> 
> 		if (qid_lt(qid, ud->kqid)) {
> 			next = ud;
> 			node = node->rb_left;
> 		} else {
> 			node = node->rb_right;
> 		}
> 	}
> 
> 	return next;
> }
> 
> /**
>  * ubifs_dqblk_find - find qid in tree
>  * @c: UBIFS file-system description object
>  * @qid: The qid to look for
>  *
>  * This walks the dqblk tree and searches a given qid. Returns the dqblk entry
>  * when found or NULL otherwise.
>  */
> static struct ubifs_dqblk *ubifs_dqblk_find(struct ubifs_info *c,
> 					    struct kqid qid)
> {
> 	struct ubifs_dqblk *next = NULL;
> 
> 	next = ubifs_dqblk_find_next(c, qid);
> 
> 	if (next && qid_eq(qid, next->kqid))
> 		return next;
> 
> 	return NULL;
> }

Yep, look good to me. Thanks!

> If this looks good now I'll integrate it for the next round. I'll delay
> sending a new version until Richard has had a look into this series.

Sure.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
