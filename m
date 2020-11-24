Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFF3C6379F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:39:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAF920857
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VpqfyjTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAF920857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uq0zRkV4MRlacjDIW19XZSF2UK67qQNZq1dS4JxJqsg=; b=VpqfyjTLwQBR1E6vJXwT7Zg9q
	QlTm0XxfJzlvNJEDfGHy70WJAwbZccf+v+OK29QM+KPG/+o2aG+obWrXoWtkyYJ9hW/K6QUwNYOVp
	XWjU661MVR7gcxWCKTwdeXqHKsnvm4ztB8uDjHfW41SOT5onKdKmb5FWIfhDhT63k5UEETcFNfpv0
	TPOa44+X+VSJTRq4i6J5CHahWPMR7mi17JFSdihXtzDgxWYzus6NphexyssDb3L2Ibd+wH/9dNWsS
	lujZB7IHN6syA2gx68DnjA6t2rvN9M/7PfM3cZO+RtBk7bC9WZtesoq0DgOgimuyVX1ndguoBqC6n
	agIYp4F8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khQ5W-0007Xs-Pd; Tue, 24 Nov 2020 04:37:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khQ5O-0007UJ-8z
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 04:37:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id D57A11F4481C
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v4 2/3] fscrypt: Have filesystems handle their d_ops
Organization: Collabora
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <20201122051218.GA2717478@xiangao.remote.csb>
 <X7w9AO0x8vG85JQU@sol.localdomain>
Date: Mon, 23 Nov 2020 23:37:45 -0500
In-Reply-To: <X7w9AO0x8vG85JQU@sol.localdomain> (Eric Biggers's message of
 "Mon, 23 Nov 2020 14:51:44 -0800")
Message-ID: <877dqbpdye.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_233750_475491_BC61DEF9 
X-CRM114-Status: GOOD (  29.24  )
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Gao Xiang <hsiangkao@redhat.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Eric Biggers <ebiggers@kernel.org> writes:

> On Sun, Nov 22, 2020 at 01:12:18PM +0800, Gao Xiang wrote:
>> Hi all,
>> 
>> On Thu, Nov 19, 2020 at 06:09:03AM +0000, Daniel Rosenberg wrote:
>> > This shifts the responsibility of setting up dentry operations from
>> > fscrypt to the individual filesystems, allowing them to have their own
>> > operations while still setting fscrypt's d_revalidate as appropriate.
>> > 
>> > Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
>> > they have their own specific dentry operations as well. That operation
>> > will set the minimal d_ops required under the circumstances.
>> > 
>> > Since the fscrypt d_ops are set later on, we must set all d_ops there,
>> > since we cannot adjust those later on. This should not result in any
>> > change in behavior.
>> > 
>> > Signed-off-by: Daniel Rosenberg <drosen@google.com>
>> > Acked-by: Eric Biggers <ebiggers@google.com>
>> > ---
>> 
>> ...
>> 
>> >  extern const struct file_operations ext4_dir_operations;
>> >  
>> > -#ifdef CONFIG_UNICODE
>> > -extern const struct dentry_operations ext4_dentry_ops;
>> > -#endif
>> > -
>> >  /* file.c */
>> >  extern const struct inode_operations ext4_file_inode_operations;
>> >  extern const struct file_operations ext4_file_operations;
>> > diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
>> > index 33509266f5a0..12a417ff5648 100644
>> > --- a/fs/ext4/namei.c
>> > +++ b/fs/ext4/namei.c
>> > @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
>> >  	struct buffer_head *bh;
>> >  
>> >  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
>> > +	generic_set_encrypted_ci_d_ops(dentry);
>> 
>> One thing might be worth noticing is that currently overlayfs might
>> not work properly when dentry->d_sb->s_encoding is set even only some
>> subdirs are CI-enabled but the others not, see generic_set_encrypted_ci_d_ops(),
>> ovl_mount_dir_noesc => ovl_dentry_weird()
>> 
>> For more details, see:
>> https://android-review.googlesource.com/c/device/linaro/hikey/+/1483316/2#message-2e1f6ab0010a3e35e7d8effea73f60341f84ee4d
>> 
>> Just found it by chance (and not sure if it's vital for now), and
>> a kind reminder about this.
>> 
>
> Yes, overlayfs doesn't work on ext4 or f2fs filesystems that have the casefold
> feature enabled, regardless of which directories are actually using casefolding.
> This is an existing limitation which was previously discussed, e.g. at
> https://lkml.kernel.org/linux-ext4/CAOQ4uxgPXBazE-g2v=T_vOvnr_f0ZHyKYZ4wvn7A3ePatZrhnQ@mail.gmail.com/T/#u
> and
> https://lkml.kernel.org/linux-ext4/20191203051049.44573-1-drosen@google.com/T/#u.
>
> Gabriel and Daniel, is one of you still looking into fixing this?

Eric,

overlayfs+CI has been on my todo list for over a year now, as I have a
customer who wants to mix them, but I haven't been able to get to it.
I'm sure I won't be able to get to it until mid next year, so if anyone
wants to tackle it, feel free to do it.


> IIUC, the current thinking is that when the casefolding flag is set on
> a directory, it's too late to assign dentry_operations at that point.

yes

> But what if all child dentries (which must be negative) are
> invalidated first,

I recall I tried this approach when I quickly looked over this last
year, but my limited vfs knowledge prevented me from getting something
working.  But it makes sense.

> and also the filesystem forbids setting the casefold flag on encrypted
> directories that are accessed via a no-key name (so that
> fscrypt_d_revalidate isn't needed -- i.e. the directory would only go
> from "no d_ops" to "generic_ci_dentry_ops", not from
> "generic_encrypted_dentry_ops" to "generic_encrypted_ci_dentry_ops")?




-- 
Gabriel Krisman Bertazi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
