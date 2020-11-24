Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9D9C64E75
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:33:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF59C20857
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R1lZWKig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF59C20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HtgxTtqRJ5Wls5JrXOge966bl5XNrCP2do4MzwI3U7A=; b=R1lZWKig/AWPOdIGzKEi343Vj
	ReINIbZnfwTp4cVRJ+5tVNkLf+IJvWUSgvZkpRldBCcX4T7d45Xmd7p2Li1DBin/vrD5S9c6tv351
	lscHVHu2PA/KAKmfysIFJzSSBB/q3etzRrb8iHfLmABmbFyMNWWxROBoHum7I/TIAJxuOTipzygDh
	yy+F00s0ow/EuYMQqypVi1Sp5PGT+DaI1aDrUXrXyHxemY7x9GYv03NkCWc3HYc5OAAbgykXO99tD
	1dD4SYd5fJKyhwWWGCGj7Wk2p9YJ5qSpOuiiRhfP+DHtaXyFTC+4Oi5sUmicvmG7k9q8Y5dQJeR+o
	zEFZbyWHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khPz1-0006mm-91; Tue, 24 Nov 2020 04:31:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khPyy-0006mJ-Ms
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 04:31:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 0F22D1F44A84
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v4 2/3] fscrypt: Have filesystems handle their d_ops
Organization: Collabora
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <87y2iuj8y2.fsf@collabora.com> <X7w4C8GAy+P9KNU6@sol.localdomain>
Date: Mon, 23 Nov 2020 23:31:05 -0500
In-Reply-To: <X7w4C8GAy+P9KNU6@sol.localdomain> (Eric Biggers's message of
 "Mon, 23 Nov 2020 14:30:35 -0800")
Message-ID: <87blfnpe9i.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_233112_879608_5CC25C10 
X-CRM114-Status: GOOD (  23.63  )
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
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Eric Biggers <ebiggers@kernel.org> writes:

> On Sat, Nov 21, 2020 at 11:45:41PM -0500, Gabriel Krisman Bertazi wrote:
>> > diff --git a/fs/ext4/super.c b/fs/ext4/super.c
>> > index 6633b20224d5..0288bedf46e1 100644
>> > --- a/fs/ext4/super.c
>> > +++ b/fs/ext4/super.c
>> > @@ -4968,11 +4968,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>> >  		goto failed_mount4;
>> >  	}
>> >  
>> > -#ifdef CONFIG_UNICODE
>> > -	if (sb->s_encoding)
>> > -		sb->s_d_op = &ext4_dentry_ops;
>> > -#endif
>> 
>> This change has the side-effect of removing the capability of the root
>> directory from being case-insensitive.  It is not a backward
>> incompatible change because there is no way to make the root directory
>> CI at the moment (it is never empty). But this restriction seems
>> artificial. Is there a real reason to prevent the root inode from being
>> case-insensitive?
>> 
>
> The problem is that the "lost+found" directory is special in that e2fsck needs
> to be able to find it.
>
> That's the reason why ext4 doesn't allow the root directory to be encrypted.
> (And encrypting the root directory isn't really useful anyway, since if the goal
> is to encrypt a whole filesystem with one key, dm-crypt is a better solution.)
>
> Casefolding is a bit less problematic than encryption.  But it still doesn't
> entirely work, as e.g. if you name the directory "LOST+FOUND" instead (the
> directory is casefolded after all...), then e2fsck can't find it.
>
> Unless there's a real use case for the root directory being casefolded and
> people are willing to fix e2fsck, I think we should just make ext4 return an
> error when setting the casefold flag on the root directory, like it does when
> trying to enable encryption on the root directory.

I don't have a use case where I need a root directory to be CI.  In
fact, when I first implemented CI, I did want to block the root directory
from being made CI, just to prevent people from doing "chattr +F /" and
complaining afterwards when /usr/lib breaks.

My concern with the curent patch was whether this side-effect was
considered, but I'm happy with either semantics.

-- 
Gabriel Krisman Bertazi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
