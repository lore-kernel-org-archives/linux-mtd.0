Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0599AC4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 18:36:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8E1F20882
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 18:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YgDDsMOq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8E1F20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92FKLy3voIJyHuB4FgTBVKbbnpcHbQzuUdzWNmFVMCs=; b=YgDDsMOqqqgIu5
	kBlgzXAcE/MlbK2koX9V6/FRQ65WXTw64onJsyJDauZgTucp2gsHbcde95z81oXh44vPufVZuRMT4
	uXiWNYGaM4JNN8745LVxQiU9g/+SSXIyT6T26PDJBQivPPDwTelRnb9A8xZ3sU++jfZGyM+PBFcVy
	XU6M2GQxHXfnlbxtVdAA1j2IFgnxxNFUKJ12RaUeCcxqXXBuYYYnY6Eu5y+FoI26AP45zKHK29Whg
	8bUfnStIyg5jafQ8NssFKwIsUcGkE471xXEPFuBCI0z7+KDptzho5rNKfZZI4TR2343AFeVYJJ0ga
	vu0paywzkoBDUoZDPByw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBkkI-00011z-95; Wed, 03 Apr 2019 18:36:22 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBkkE-0008Bw-VQ
 for linux-mtd@lists.infradead.org; Wed, 03 Apr 2019 18:36:20 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hBkiC-0005rO-7L; Wed, 03 Apr 2019 18:34:12 +0000
Date: Wed, 3 Apr 2019 19:34:12 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v4 07/17] fs/dcache.c: add shrink_dcache_inode()
Message-ID: <20190403183411.GV2217@ZenIV.linux.org.uk>
References: <20190402154600.32432-1-ebiggers@kernel.org>
 <20190402154600.32432-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190402154600.32432-8-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_113619_008703_091117F9 
X-CRM114-Status: GOOD (  13.73  )
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

On Tue, Apr 02, 2019 at 08:45:50AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When a filesystem encryption key is removed, we need all files which had
> been "unlocked" (had ->i_crypt_info set up) with it to appear "locked"
> again.  This is most easily done by evicting the inodes.  This can
> currently be done using 'echo 2 > /proc/sys/vm/drop_caches'; however,
> that is overkill and not usable by non-root users.
> 
> To evict just the needed inodes we also need the ability to evict those
> inodes' dentries, since an inode is pinned by its dentries.  Therefore,
> add a function shrink_dcache_inode() which iterates through an inode's
> dentries and evicts any unused ones as well as any unused descendants
> (since there may be negative dentries pinning the inode's dentries).

Huh?

> + * Evict all unused aliases of the specified inode from the dcache.  This is
> + * intended to be used when trying to evict a specific inode, since inodes are
> + * pinned by their dentries.  We also have to descend to ->d_subdirs for each
> + * alias, since aliases may be pinned by negative child dentries.
> + */
> +void shrink_dcache_inode(struct inode *inode)
> +{
> +	for (;;) {
> +		struct select_data data;
> +		struct dentry *dentry;
> +
> +		INIT_LIST_HEAD(&data.dispose);
> +		data.start = NULL;
> +		data.found = 0;
> +
> +		spin_lock(&inode->i_lock);
> +		hlist_for_each_entry(dentry, &inode->i_dentry, d_u.d_alias)
> +			d_walk(dentry, &data, select_collect);
> +		spin_unlock(&inode->i_lock);
> +
> +		if (!data.found)
> +			break;
> +
> +		shrink_dentry_list(&data.dispose);
> +		cond_resched();

This is... odd.  What's wrong with
	if (S_ISDIR(inode->i_mode)) {
		dentry = d_find_any_alias(inode);
		if (dentry) {
			shrink_dcache_parent(dentry);
			dput(dentry);
		}
	}
	d_prune_aliases(inode);
instead of that thing?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
