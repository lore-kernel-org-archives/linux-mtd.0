Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4CDC83F14
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfXqqeIHOw9+oRYYVg+xJh4KqiCVNkpLm1htGwzpa4Q=; b=g0Rr4Rbycw9DQN
	AO4yMm65SEM+H6EbSS5LLx1m1DOoMgE1bpzdu4l6DOR7zyCZExzKVivJ9LDqw81mxpv/kxr3rZMUg
	5mJ4nZ8aQz0cR6iLNfmdctJk8F0FheShKubcYFUN3oEZNeg72R7Yx3P986qUiT+6b8T0fmC+JIXyF
	Tj/zs5eZBOTjHSClklWBuC8tPQpbbe+qg9a2YCXQHU1k3C/Zp9zVce23p9w93TKSDt12uyIxc5Eop
	8XsWf1rj6fDX8tHsZtXCe1PnhrVL2lfErBukFfYPcG0o9pe7bRhKTas7AsFnfBrIs1hXheSTojavO
	+GmTGhl+Sm1MnsFG+huQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHf9-00D9lL-10;
	Wed, 30 Aug 2023 09:38:59 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHf5-00D9kO-2l
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 09:38:57 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 715AD1F45F;
	Wed, 30 Aug 2023 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693388332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PIxQhlRFdNZswSMGee257L+GnW4woe/Nn9nub9+MKzw=;
	b=u3purBzD1lDBwNHBxD0L10YRsGqgTiDXKMf+uNIDtSbfzg2f1dExaGu0302JVjHEc6yn72
	gujaXasqwXCPLVMHXB6S9XbH8A6kHK6N+TEtJluiWcJqVQFdRNGhCGa99Px8/l4pE8i9+t
	lRtWvsBXvx4Kxa+rxjMkxVMbaBCfGAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693388332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PIxQhlRFdNZswSMGee257L+GnW4woe/Nn9nub9+MKzw=;
	b=YRZdTIazvSq/KWONWEgag0o18Mp7C9iPMcHhhBOBJSSd34qqxaRCaRje2aLGNBArcZ1Ifb
	LGpGuD/TRBxzCqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 606FB1353E;
	Wed, 30 Aug 2023 09:38:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +y+AFywO72QNJAAAMHmgww
	(envelope-from <jack@suse.cz>); Wed, 30 Aug 2023 09:38:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id E8292A0774; Wed, 30 Aug 2023 11:38:51 +0200 (CEST)
Date: Wed, 30 Aug 2023 11:38:51 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230830093851.uwdgpt645niysuji@quack3>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
 <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
 <20230830061409.GB17785@lst.de>
 <20230830-befanden-geahndet-2f084125d861@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830-befanden-geahndet-2f084125d861@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_023856_052526_B7A03B80 
X-CRM114-Status: GOOD (  19.99  )
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

On Wed 30-08-23 10:05:57, Christian Brauner wrote:
> On Wed, Aug 30, 2023 at 08:14:09AM +0200, Christoph Hellwig wrote:
> > > +struct super_block *sget_dev(struct fs_context *fc, dev_t dev)
> > 
> > A kerneldoc comment would probably be useful here.
> 
> Added the following in-treep:
> 
> diff --git a/fs/super.c b/fs/super.c
> index 158e093f23c9..19fa906b118a 100644
> --- a/fs/super.c
> +++ b/fs/super.c
> @@ -1388,6 +1388,26 @@ static int super_s_dev_test(struct super_block *s, struct fs_context *fc)
>                 s->s_dev == *(dev_t *)fc->sget_key;
>  }
> 
> +/**
> + * sget_dev - Find or create a superblock by device number
> + * @fc:        Filesystem context.
> + * @dev: device number
      ^^^^^^ inconsistent indenting.

> + *
> + * Find or create a superblock using the provided device number that
> + * will be stored in fc->sget_key.
> + *
> + * If an extant superblock is matched, then that will be returned with
> + * an elevated reference count that the caller must transfer or discard.
> + *
> + * If no match is made, a new superblock will be allocated and basic
> + * initialisation will be performed (s_type, s_fs_info and s_id will be
> + * set and the set() callback will be invoked), the superblock will be
      ^^ I guess no point in talking about set() callback when sget_dev()
has no callback specified. Rather you could mention s_dev as one of
initialized fields.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
