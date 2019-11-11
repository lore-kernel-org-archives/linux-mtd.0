Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD82C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 08:58:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF0922084F
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 08:58:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQKHhsji"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF0922084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNaVaGf9P3VFWz/QUAyvvcu9MrejIWQFB1R7d3fUsqY=; b=CQKHhsji4/FZhH
	22e+NBBd2fKBSUrBZxjym0N2ZMA1FEM9NLOzJY14J1ZbmOQVFA+u6suF5ubbe1h3yvrEomGB85wte
	BXzMHr3vDzydQHt6KWpL0PEdLcMcV1Rlcdiy9Cm6ijCH6FC7cc/hZYcssXgNMMU6rl+IwMZqk23uv
	zY5nz8E0yw3dOnLtojtUOANg+aTzPp7nde+ji0mNl2ISEuIPfLbWufPWGmN+YX+koICsY/n+bRM9J
	No7cRMf+0fYyxyG8JW1XXUoKyWV/RG2WKoNV9I+//AcaOU8IN+LNzMn+MX4f94ggRlIqBujaK2Lj0
	4DUs//4szILjtat8T17Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU5WM-0006yd-Hy; Mon, 11 Nov 2019 08:58:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU5WJ-0006y4-5t
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 08:58:00 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iU5WB-0006td-AQ; Mon, 11 Nov 2019 09:57:51 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iU5W5-0003uA-PV; Mon, 11 Nov 2019 09:57:45 +0100
Date: Mon, 11 Nov 2019 09:57:45 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 7/7] ubifs: Add quota support
Message-ID: <20191111085745.t6qbckcxt6byaoxq@pengutronix.de>
References: <20191106091537.32480-1-s.hauer@pengutronix.de>
 <20191106091537.32480-8-s.hauer@pengutronix.de>
 <20191106101428.GD16085@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106101428.GD16085@quack2.suse.cz>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:49:34 up 126 days, 14:59, 123 users,  load average: 0.12, 0.11,
 0.12
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_005759_220118_6C8B59AC 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jan,

On Wed, Nov 06, 2019 at 11:14:28AM +0100, Jan Kara wrote:
> > +/**
> > + * ubifs_dqblk_find_next - find the next qid
> > + * @c: UBIFS file-system description object
> > + * @qid: The qid to look for
> > + *
> > + * Find the next dqblk entry with a qid that is bigger or equally big than the
> > + * given qid. Returns the next dqblk entry if found or NULL if no dqblk exists
> > + * with a qid that is at least equally big.
> > + */
> > +static struct ubifs_dqblk *ubifs_dqblk_find_next(struct ubifs_info *c,
> > +						 struct kqid qid)
> > +{
> > +	struct rb_node *node = c->dqblk_tree[qid.type].rb_node;
> > +	struct ubifs_dqblk *next = NULL;
> > +
> > +	while (node) {
> > +		struct ubifs_dqblk *ud = rb_entry(node, struct ubifs_dqblk, rb);
> > +
> > +		if (qid_eq(qid, ud->kqid))
> > +			return ud;
> > +
> > +		if (qid_lt(qid, ud->kqid)) {
> > +			if (!next || qid_lt(ud->kqid, next->kqid))
> > +				next = ud;
> > +
> > +			node = node->rb_left;
> > +		} else {
> > +			node = node->rb_right;
> > +		}
> > +	}
> > +
> > +	return next;
> > +}
> 
> Why not use rb_next() here? It should do what you need, shouldn't it?

I could use rb_next(), but it defeats the purpose of a tree to iterate
over the whole tree to find an entry. If I wanted that I would have used
a list.

> 
> 
> > @@ -435,6 +438,9 @@ static int ubifs_show_options(struct seq_file *s, struct dentry *root)
> >  	else if (c->mount_opts.chk_data_crc == 1)
> >  		seq_puts(s, ",no_chk_data_crc");
> >  
> > +	if (c->quota_enable)
> > +		seq_puts(s, ",quota");
> > +
> 
> I'd expect here to see 'usrquota', 'grpquota', 'prjquota' etc. to match
> mount options user has used.

Ok, will fix in the next round.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
