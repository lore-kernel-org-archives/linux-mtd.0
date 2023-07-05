Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CB2EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fw0F2WHFQ0+6ZlA+O6zu1GqQYLPGxXiosxnv0Ni+3gE=; b=h9JMQrtHuD2I//
	+mDahvbiywuBBfXWVaJ3rlmyFMU5RLS8K40CN5dDU766xF2Gkfj9n9afd66Fu/HStFXa8PYby0YSW
	PTQj/F7qx5KKP/vEynejbR9BKB0rzy9j1RXLslyHSyfOeI3AIMa0O+0tOseKnkF4gcuLnQ+Juq3jk
	fu08zZbc7lupXsz1rlLayQbljlC6btt3QxpWEX5+UBWo9/QXRbjX/a3CxuY1M0Fmorx8ACG4XNITt
	S9LpqKSZnTOiO6yG1F/+ZRaKlV9jQG0iPJn6huHfortvfT7jqI0RnTUzi6Um9kr1Md4y20Fy6UPvn
	e3FqvivQ9sTBidW8Y/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzdd-00FVCv-2R;
	Wed, 05 Jul 2023 10:21:33 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzdb-00FV9l-0m;
	Wed, 05 Jul 2023 10:21:32 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58F0C1F6E6;
	Wed,  5 Jul 2023 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688552489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qqER76PXnxWxMVZH46uY+IP0A7ISNxa4dFOpqm8Npig=;
	b=rK+eFTza2+XXgbRvOv5tQtV93F/4zZpu7norREAepZy5yow7baD/dvvqWhpeeItBt0IPcu
	Y5rwLWutv/on4mwv5EJraqTeqhb05mRkTW0yYXikGz/UA9AQcATVDIgxrBuvXRHMAszN6R
	RSIAN/j2D8s9RJrt3/Umhb+lT3pvazU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688552489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qqER76PXnxWxMVZH46uY+IP0A7ISNxa4dFOpqm8Npig=;
	b=0Ik5A3faiNr6MKUo0ZlFf0SVDy0zGGeX4x6PTOEnPlUJVjHk96v3tsbq/TGqKcufwhGJGx
	3sf2EXg0rHzUTICQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44C0D13460;
	Wed,  5 Jul 2023 10:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Xem5EClEpWRSCwAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 05 Jul 2023 10:21:29 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id C5467A0707; Wed,  5 Jul 2023 12:21:28 +0200 (CEST)
Date: Wed, 5 Jul 2023 12:21:28 +0200
From: Jan Kara <jack@suse.cz>
To: Keith Busch <kbusch@kernel.org>
Cc: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Message-ID: <20230705102128.vquve4qencbbn2br@quack3>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <ZKRItBRhm8f5Vba/@kbusch-mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZKRItBRhm8f5Vba/@kbusch-mbp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_032131_434823_DE11E651 
X-CRM114-Status: GOOD (  16.56  )
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

On Tue 04-07-23 10:28:36, Keith Busch wrote:
> On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:
> > +struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
> > +		void *holder, const struct blk_holder_ops *hops)
> > +{
> > +	struct bdev_handle *handle = kmalloc(sizeof(struct bdev_handle),
> > +					     GFP_KERNEL);
> 
> I believe 'sizeof(*handle)' is the preferred style.

OK.

> > +	struct block_device *bdev;
> > +
> > +	if (!handle)
> > +		return ERR_PTR(-ENOMEM);
> > +	bdev = blkdev_get_by_dev(dev, mode, holder, hops);
> > +	if (IS_ERR(bdev))
> > +		return ERR_CAST(bdev);
> 
> Need a 'kfree(handle)' before the error return. Or would it be simpler
> to get the bdev first so you can check the mode settings against a
> read-only bdev prior to the kmalloc?

Yeah. Good point with kfree(). I'm not sure calling blkdev_get_by_dev()
first will be "simpler" - then we need blkdev_put() in case of kmalloc()
failure. Thanks for review!
 
								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
