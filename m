Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C0FC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 17:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efXYYqSDJmJuWJJWguvDvzhpvsuKtu3VGPa3SUzfhYA=; b=N931ZXe6Uj7Meh
	vepFj/3gDkW88z4MClyIErMmwVF3X156IhJQ7LnMNlfgdJ1NPyHRR4Vown0+5vP6s5auC1BqFPKTW
	WuTSZoGuOAfXPoqElo3tzgu5mTtKihM5MLLRuGfvPIAMg1QocTKLAe2REQ5sqyWfbWmFXoPxAGzSb
	oAtb6Er/OJCF9tIcaPFjDbT+mTRWVSAKVwBYlF6KSAsnNRjK2LB4kDBE02P+RD/4EWn+qfaIE3ZMU
	TlDsoGikyU+mqvY9uRP/vXuif5dY46Nmpbl51s7OajhHsJmBA/fjjzez/4I1ava8SxRxdUBGPq+Ck
	MnlwXZgt/41iV5KE78cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCk3n-006JHU-1W;
	Mon, 11 Dec 2023 17:27:15 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCk3j-006JEg-2W
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 17:27:13 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B84E5223DB;
	Mon, 11 Dec 2023 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702315630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uuXeYcPGrieZET/Hl977sPLVwbUrIJA1zejD9mT3ogI=;
	b=KJ4efM9E+sa33aFAd8jwg5VXmnjMxleP6CmyD1Z0i97ow/IMJQBSqYXPh1ej+xavVwSRP4
	Yg1lz/fUikUZbf1u2+vXr2RJE2evTJgLdRHZp8PKCuknSrpV2KnjDsWgIdBkLdxCyxxQjh
	RNp4pJOJa1FNsc52gTMd8s7goQjnjEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702315630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uuXeYcPGrieZET/Hl977sPLVwbUrIJA1zejD9mT3ogI=;
	b=TO6pszgbMWjR3gBZnaW4MEVQ+gbRax/0poyUFFXjotFHInDoOr+qN7/2TD3A7ZbLly3/IT
	YRHLNJGFEpFf+TBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702315629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uuXeYcPGrieZET/Hl977sPLVwbUrIJA1zejD9mT3ogI=;
	b=wzXbksvRNiCb4BbXMMBxbEnY6iRN/20VAk4MCpHS3Rljj8T26a7bGIb5ufMVkyXIF6ZR91
	EvfGBjSwf9A5O7MLBegJl4BM0+huE5fNoBm4jZzLIFLmDT7FuH6vs9QkRAvxTJx13mPPRM
	NuBUsypYbVCpDejdowVksfEijuMTCJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702315629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uuXeYcPGrieZET/Hl977sPLVwbUrIJA1zejD9mT3ogI=;
	b=k3338zTO3EpETkE8li6Dp/0dY97GEZjygMS4ZhvDNl1b1VwUfwBL4jBi4Swo7FgrfAdnP+
	7OISWgzg4D5XlXAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A588134B0;
	Mon, 11 Dec 2023 17:27:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id DhppJW1Gd2WxHQAAn2gu4w
	(envelope-from <jack@suse.cz>); Mon, 11 Dec 2023 17:27:09 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 0511CA07E3; Mon, 11 Dec 2023 18:27:08 +0100 (CET)
Date: Mon, 11 Dec 2023 18:27:08 +0100
From: Jan Kara <jack@suse.cz>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, p.raghav@samsung.com, hare@suse.de,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v2 for-6.8/block 15/18] buffer: add a new helper to
 read sb block
Message-ID: <20231211172708.qpuk4rkwq4u2zbmj@quack3>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140753.975297-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211140753.975297-1-yukuai1@huaweicloud.com>
X-Spamd-Bar: +++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=wzXbksvR;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=k3338zTO;
	dmarc=none;
	spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither permitted nor denied by domain of jack@suse.cz) smtp.mailfrom=jack@suse.cz
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [9.46 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_SPF_SOFTFAIL(4.60)[~all];
	 R_RATELIMIT(0.00)[to_ip_from(RLa8hd5fybgmzcyr9mhbq8ey7y)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.cz:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_GT_50(0.00)[50];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(1.20)[suse.cz];
	 NEURAL_SPAM_SHORT(2.97)[0.991];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.com:email,huawei.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[kernel.dk,citrix.com,suse.de,gmail.com,lazybastard.org,bootlin.com,nod.at,ti.com,linux.ibm.com,oracle.com,fb.com,toxicpanda.com,suse.com,zeniv.linux.org.uk,kernel.org,fluxnic.net,mit.edu,dilger.ca,redhat.com,infradead.org,linux-foundation.org,samsung.com,vger.kernel.org,lists.xenproject.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev,huawei.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: B84E5223DB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_092711_991391_2070C131 
X-CRM114-Status: GOOD (  15.34  )
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

On Mon 11-12-23 22:07:53, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Unlike __bread_gfp(), ext4 has special handing while reading sb block:
> 
> 1) __GFP_NOFAIL is not set, and memory allocation can fail;
> 2) If buffer write failed before, set buffer uptodate and don't read
>    block from disk;
> 3) REQ_META is set for all IO, and REQ_PRIO is set for reading xattr;
> 4) If failed, return error ptr instead of NULL;
> 
> This patch add a new helper __bread_gfp2() that will match above 2 and 3(
> 1 will be used, and 4 will still be encapsulated by ext4), and prepare to
> prevent calling mapping_gfp_constraint() directly on bd_inode->i_mapping
> in ext4.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
...
> +/*
> + * This works like __bread_gfp() except:
> + * 1) If buffer write failed before, set buffer uptodate and don't read
> + * block from disk;
> + * 2) Caller can pass in additional op_flags like REQ_META;
> + */
> +struct buffer_head *
> +__bread_gfp2(struct block_device *bdev, sector_t block, unsigned int size,
> +	     blk_opf_t op_flags, gfp_t gfp)
> +{
> +	return bread_gfp(bdev, block, size, op_flags, gfp, true);
> +}
> +EXPORT_SYMBOL(__bread_gfp2);

__bread_gfp2() is not a great name, why not just using bread_gfp()
directly? I'm not a huge fan of boolean arguments but three different flags
arguments would be too much for my taste ;) so I guess I can live with
that.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
