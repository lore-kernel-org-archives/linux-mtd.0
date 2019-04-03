Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6191C4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 20:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717CD2082C
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 20:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LxemkoRk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEgTqnOg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 717CD2082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rXeu7HtiXlrX31uRkrCaYq7FZ+GDHYcm4IKIjIojU0=; b=LxemkoRkn82JUc
	xpC3rbp25GsYb2PB7KzUayK4V6kFd54qu+V/u1ea497yKzuTx7m6Ama6pti2w4EwX+k/YUizybT6J
	TAtMPkbCllDAA0svU5tqmm1AEZgh/RJYaA5NCN1v21Vc0udHWfQimvucgXGsvXtQsakWYxhn24Pyv
	QNbziDaRmoDmOKRKGJkCn/8lw5CTzMqUgr7CNIHpG5eixTl6epsS81CeU5xAfr903rn5rmVvOFUj3
	s/XSfa3BllH6Gv2N8hCT6M0651rA3y0BkMUeWt8ammXJjZV8HqHOLvI2S2qXnlcU0dqyoyjFnU+zt
	iJL2n/2b/MMqDcRwUagQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBmd0-0004Nd-2G; Wed, 03 Apr 2019 20:36:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBmcw-0004Mn-Qs
 for linux-mtd@lists.infradead.org; Wed, 03 Apr 2019 20:36:56 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38C5F2082C;
 Wed,  3 Apr 2019 20:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554323813;
 bh=Iljr8qYLbE/Z4wI3N8qP1R/1VTfPA2d67crL/gJcouc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HEgTqnOgpxH+fIuff7IzRnDTwxrf4M1Pm8bDgCAgCPNM+qRy5MZyT+UD9ZpnLpU7X
 akevXAs6fD/uzgg6CFNIOOWAZMwtNegcllUWAgngFqKMTJkrGhaLZ++ldDrtAPE3bF
 I4uj+UwZi9tpQotr0vITgsJmcwbRcq4EBrFFDp9A=
Date: Wed, 3 Apr 2019 13:36:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v4 07/17] fs/dcache.c: add shrink_dcache_inode()
Message-ID: <20190403203650.GA216239@gmail.com>
References: <20190402154600.32432-1-ebiggers@kernel.org>
 <20190402154600.32432-8-ebiggers@kernel.org>
 <20190403183411.GV2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190403183411.GV2217@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_133654_893743_0E88E479 
X-CRM114-Status: GOOD (  18.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 03, 2019 at 07:34:12PM +0100, Al Viro wrote:
> On Tue, Apr 02, 2019 at 08:45:50AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > When a filesystem encryption key is removed, we need all files which had
> > been "unlocked" (had ->i_crypt_info set up) with it to appear "locked"
> > again.  This is most easily done by evicting the inodes.  This can
> > currently be done using 'echo 2 > /proc/sys/vm/drop_caches'; however,
> > that is overkill and not usable by non-root users.
> > 
> > To evict just the needed inodes we also need the ability to evict those
> > inodes' dentries, since an inode is pinned by its dentries.  Therefore,
> > add a function shrink_dcache_inode() which iterates through an inode's
> > dentries and evicts any unused ones as well as any unused descendants
> > (since there may be negative dentries pinning the inode's dentries).
> 
> Huh?
> 
> > + * Evict all unused aliases of the specified inode from the dcache.  This is
> > + * intended to be used when trying to evict a specific inode, since inodes are
> > + * pinned by their dentries.  We also have to descend to ->d_subdirs for each
> > + * alias, since aliases may be pinned by negative child dentries.
> > + */
> > +void shrink_dcache_inode(struct inode *inode)
> > +{
> > +	for (;;) {
> > +		struct select_data data;
> > +		struct dentry *dentry;
> > +
> > +		INIT_LIST_HEAD(&data.dispose);
> > +		data.start = NULL;
> > +		data.found = 0;
> > +
> > +		spin_lock(&inode->i_lock);
> > +		hlist_for_each_entry(dentry, &inode->i_dentry, d_u.d_alias)
> > +			d_walk(dentry, &data, select_collect);
> > +		spin_unlock(&inode->i_lock);
> > +
> > +		if (!data.found)
> > +			break;
> > +
> > +		shrink_dentry_list(&data.dispose);
> > +		cond_resched();
> 
> This is... odd.  What's wrong with
> 	if (S_ISDIR(inode->i_mode)) {
> 		dentry = d_find_any_alias(inode);
> 		if (dentry) {
> 			shrink_dcache_parent(dentry);
> 			dput(dentry);
> 		}
> 	}
> 	d_prune_aliases(inode);
> instead of that thing?

That works, as far as I can tell, so I'll do that instead.

I don't think I noticed that d_prune_aliases() existed when I wrote this.

Thanks for the suggestion!

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
