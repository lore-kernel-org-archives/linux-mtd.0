Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7176CC3DA63
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jTV/Kvm6baAjTNQ3lvvG9SiPiys8dWelsu2tgLPwYE=; b=lEkNkk2OTnDQ1K
	8aSzoHDMDWbMm51BsQwncj0qTEOJNGYzMF4A9vUa5D0LAQaG++41BXFgW5LhD/y8PpsG0BT3Nkfm9
	1Ohka51tkcTbZ9b8pCTtPyMKL9O7gQ/VmIUT5nWt/7oXvRu2DXa8lzO35rj/8PZ1l96CAbYnJT51D
	YscKt6FBXlaSLq57jUxUebOZlge54SOImx7YmzsFEM57tiots4O/5dcNL4dT3f+BZ/8g4e99fnmOR
	c7Ua0iaLxT2PHYZaf/2O2p9Zvoy1MlRBUYrFY+McigL9bvyfMbJBvEDqbYSuJMv+Zd1a9FJ13/Q63
	2PRCaIw2FwAJLNBlPPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sURNA-0000000HA4d-2yqx;
	Thu, 18 Jul 2024 13:40:40 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sURN5-0000000HA34-30r6
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 13:40:39 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D94721C26;
	Thu, 18 Jul 2024 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721310032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHr41Dfa8NxLB4Op/U4h+N3DTR4Jz1LVWa1aI9bFijA=;
	b=1wicsR8WcFWTA3Ee5gqqGVZoD0TgohY5g7Qi7DU0KiVnWOspCiYyBW6gmJDsTukGdkpBU+
	a8nAhtzSrfjaQ9KHjTfJ6zMYudpA50JjZkqSweqm3Onr6aZejAqtjDIVo0DworpI9axvbV
	qjtxJqawtYZD6v2m18kWhCdyqFLf21Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721310032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHr41Dfa8NxLB4Op/U4h+N3DTR4Jz1LVWa1aI9bFijA=;
	b=2RAWIehlIP1hHLb0vIUwRy8RcRGHKYWYZ8HgQxAKROQGQgJ6YqgUvckAJq8IwRi0hU3qBR
	mn0LjpdqXriZ9eAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=1wicsR8W;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2RAWIehl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721310032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHr41Dfa8NxLB4Op/U4h+N3DTR4Jz1LVWa1aI9bFijA=;
	b=1wicsR8WcFWTA3Ee5gqqGVZoD0TgohY5g7Qi7DU0KiVnWOspCiYyBW6gmJDsTukGdkpBU+
	a8nAhtzSrfjaQ9KHjTfJ6zMYudpA50JjZkqSweqm3Onr6aZejAqtjDIVo0DworpI9axvbV
	qjtxJqawtYZD6v2m18kWhCdyqFLf21Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721310032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHr41Dfa8NxLB4Op/U4h+N3DTR4Jz1LVWa1aI9bFijA=;
	b=2RAWIehlIP1hHLb0vIUwRy8RcRGHKYWYZ8HgQxAKROQGQgJ6YqgUvckAJq8IwRi0hU3qBR
	mn0LjpdqXriZ9eAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ACD41379D;
	Thu, 18 Jul 2024 13:40:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uGM+ElAbmWYECgAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 18 Jul 2024 13:40:32 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 025F7A0987; Thu, 18 Jul 2024 15:40:31 +0200 (CEST)
Date: Thu, 18 Jul 2024 15:40:31 +0200
From: Jan Kara <jack@suse.cz>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Zhihao Cheng <chengzhihao@huaweicloud.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Richard Weinberger <richard@nod.at>,
	"zhangyi (F)" <yi.zhang@huawei.com>,
	yangerkun <yangerkun@huawei.com>,
	"wangzhaolong (A)" <wangzhaolong1@huawei.com>
Subject: Re: [BUG REPORT] potential deadlock in inode evicting under the
 inode lru traversing context on ext4 and ubifs
Message-ID: <20240718134031.sxnwwzzj54jxl3e5@quack3>
References: <37c29c42-7685-d1f0-067d-63582ffac405@huaweicloud.com>
 <20240712143708.GA151742@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240712143708.GA151742@mit.edu>
X-Rspamd-Queue-Id: 5D94721C26
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.cz:dkim];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spamd-Bar: /
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_064035_937710_A198336D 
X-CRM114-Status: GOOD (  25.51  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri 12-07-24 10:37:08, Theodore Ts'o wrote:
> On Fri, Jul 12, 2024 at 02:27:20PM +0800, Zhihao Cheng wrote:
> > Problem description
> > ===================
> > 
> > The inode reclaiming process(See function prune_icache_sb) collects all
> > reclaimable inodes and mark them with I_FREEING flag at first, at that
> > time, other processes will be stuck if they try getting these inodes(See
> > function find_inode_fast), then the reclaiming process destroy the
> > inodes by function dispose_list().
> > Some filesystems(eg. ext4 with ea_inode feature, ubifs with xattr) may
> > do inode lookup in the inode evicting callback function, if the inode
> > lookup is operated under the inode lru traversing context, deadlock
> > problems may happen.
> > 
> > Case 1: In function ext4_evict_inode(), the ea inode lookup could happen
> > if ea_inode feature is enabled, the lookup process will be stuck under
> > the evicting context like this:
> > 
> >  1. File A has inode i_reg and an ea inode i_ea
> >  2. getfattr(A, xattr_buf) // i_ea is added into lru // lru->i_ea
> >  3. Then, following three processes running like this:
> > 
> >     PA                              PB
> >  echo 2 > /proc/sys/vm/drop_caches
> >   shrink_slab
> >    prune_dcache_sb
> >    // i_reg is added into lru, lru->i_ea->i_reg
> >    prune_icache_sb
> >     list_lru_walk_one
> >      inode_lru_isolate
> >       i_ea->i_state |= I_FREEING // set inode state
> >       i_ea->i_state |= I_FREEING // set inode state
> 
> Um, I don't see how this can happen.  If the ea_inode is in use,
> i_count will be greater than zero, and hence the inode will never be
> go down the rest of the path in inode_lru_inode():
> 
> 	if (atomic_read(&inode->i_count) ||
> 	    ...) {
> 		list_lru_isolate(lru, &inode->i_lru);
> 		spin_unlock(&inode->i_lock);
> 		this_cpu_dec(nr_unused);
> 		return LRU_REMOVED;
> 	}
> 
> Do you have an actual reproduer which triggers this?  Or would this
> happen be any chance something that was dreamed up with DEPT?

No, it looks like a real problem and I agree with the analysis. We don't
hold ea_inode reference (i.e., ea_inode->i_count) from a normal inode. The
normal inode just owns that that special on-disk xattr reference. Standard
inode references are acquired and dropped as needed.

And this is exactly the problem: ext4_xattr_inode_dec_ref_all() called from
evict() needs to lookup the ea_inode and iget() it. So if we are processing
a list of inodes to dispose, all inodes have I_FREEING bit already set and
if ea_inode and its parent normal inode are both in the list, then the
evict()->ext4_xattr_inode_dec_ref_all()->iget() will deadlock.

Normally we don't hit this path because LRU list walk is not handling
inodes with 0 link count. But a race with unlink can make that happen with
iput() from inode_lru_isolate().

I'm pondering about the best way to fix this. Maybe we could handle the
need for inode pinning in inode_lru_isolate() in a similar way as in
writeback code so that last iput() cannot happen from inode_lru_isolate().
In writeback we use I_SYNC flag to pin the inode and evict() waits for this
flag to clear. I'll probably sleep to it and if I won't find it too
disgusting to live tomorrow, I can code it.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
