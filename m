Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB44C83F14
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DThzMKIfuaCkXPbLMpeqMi0v9gf3449ouLrBM8/HK5k=; b=uSP3tR27JXynZw
	eafZXlzhvy/BwD5pg4PAivPTN54UIpkBoHvyJJS7DlAcQho9LpT2dVjv+FjsvfLm34T9X9Xubgex1
	aVPyfZi1GqZat23Dq0HY5Y1iMALui5r38hASluNgaRV3MbUZfa/MXfvYtX2fOj7Rb5WQppJ6u3tQ1
	usD6fyJ7pZuuoBm2ic1XS8LSLatb2hmaHVTqKXgwjp/n1GeFNsRY7fBiG6+O8WixF2O2pPk5xi1LL
	EK04FfdrRB484WRAzQXHzJ5ERdj0HuhMVCjItwqxpXCbPROkvSN0uCaNa58Q3ylFaz1GcSCBPE1ZW
	SV/HMKEwnvP5rbFHav9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHju-00DAGL-0B;
	Wed, 30 Aug 2023 09:43:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbHjr-00DAFQ-26
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 09:43:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 20EF062A13;
	Wed, 30 Aug 2023 09:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014C0C433C7;
	Wed, 30 Aug 2023 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693388630;
	bh=kew2MtvrUU8NG0tP8101UzbqZvNxXYuYbe17Ogh0Ctg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IuW5S+lhs/yHaMfXnMDcEEBLo66W7JSf0MyvLIdO4sXB4Kr2tdkGYqqLlASVw9iQq
	 OQjSpihLE31q5PYyPQNW1SNr5UnLn6Y0gduI4KR+eE/naB+hv7vg0bp53BWnlby76H
	 Qnsz3NX1u1cj7n1NOj2XZMBrtiBxCm7ZYqeA8KteKoSjSiTZYI5Qj1ayU+AoSIqIj0
	 QFWwz+1S+MxVLgNlhlGGG5xHqH46xgG+hsCV1+Cnru2IihZ+Y1T/BVr95uw39pmkoc
	 eMa7LHUkZQue7c976MSaTMPP0aRpfcNHyoYY43lRbJv/OQxKQ5yhGHC/Yi5/q2Erto
	 cOW80mtUOTnxA==
Date: Wed, 30 Aug 2023 11:43:46 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: Christoph Hellwig <hch@lst.de>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/2] fs: export sget_dev()
Message-ID: <20230830-ohnedies-umland-fb2b1a45db10@brauner>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
 <20230829-vfs-super-mtd-v1-1-fecb572e5df3@kernel.org>
 <20230830061409.GB17785@lst.de>
 <20230830-befanden-geahndet-2f084125d861@brauner>
 <20230830093851.uwdgpt645niysuji@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230830093851.uwdgpt645niysuji@quack3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_024351_731761_42D3E5F8 
X-CRM114-Status: GOOD (  20.11  )
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

On Wed, Aug 30, 2023 at 11:38:51AM +0200, Jan Kara wrote:
> On Wed 30-08-23 10:05:57, Christian Brauner wrote:
> > On Wed, Aug 30, 2023 at 08:14:09AM +0200, Christoph Hellwig wrote:
> > > > +struct super_block *sget_dev(struct fs_context *fc, dev_t dev)
> > > 
> > > A kerneldoc comment would probably be useful here.
> > 
> > Added the following in-treep:
> > 
> > diff --git a/fs/super.c b/fs/super.c
> > index 158e093f23c9..19fa906b118a 100644
> > --- a/fs/super.c
> > +++ b/fs/super.c
> > @@ -1388,6 +1388,26 @@ static int super_s_dev_test(struct super_block *s, struct fs_context *fc)
> >                 s->s_dev == *(dev_t *)fc->sget_key;
> >  }
> > 
> > +/**
> > + * sget_dev - Find or create a superblock by device number
> > + * @fc:        Filesystem context.
> > + * @dev: device number
>       ^^^^^^ inconsistent indenting.

Fixed, thanks!

> 
> > + *
> > + * Find or create a superblock using the provided device number that
> > + * will be stored in fc->sget_key.
> > + *
> > + * If an extant superblock is matched, then that will be returned with
> > + * an elevated reference count that the caller must transfer or discard.
> > + *
> > + * If no match is made, a new superblock will be allocated and basic
> > + * initialisation will be performed (s_type, s_fs_info and s_id will be
> > + * set and the set() callback will be invoked), the superblock will be
>       ^^ I guess no point in talking about set() callback when sget_dev()
> has no callback specified. Rather you could mention s_dev as one of
> initialized fields.

Yeah, good point. Done.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
