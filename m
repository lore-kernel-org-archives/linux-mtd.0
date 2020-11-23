Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4EEC388F9
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 22:31:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A733206D5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 22:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pf+I4PaI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNfDxTnu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A733206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ay92BXFt1p5r08fXyaA0cxdW1AT2etjQIfDX8pRB+aI=; b=Pf+I4PaIzhJwrpIroz2GYpYNR
	y3jaGhhlIr0y1ILMZauLkr2CnxYJIkNRGvpGWIgtOTCQ7P+eZNW3PfJ8unnTDFY8cuEb4ABT/G/lR
	nHnbEb4D8XL8EbmlJ7GFbr+zzvu4mtlyLvnQ+hhw+UXkv7zPXi+Zu/y8nNgZZU9uMT0m+PR8yXIeq
	SXMtGOpVAWP0Gh0BXmUiAQRWowVydLiteTpnXOaAnyoV4/dtd+YGyM/JnObpt7w+Qkt0o9qLGUllo
	2SORZZygn+tfjKt39iChBGP4Px1Du5JXQRkx3nStE7Uu80Df+pOSWthg9sLfxfTnvWZEz/Ua70Wxy
	PTCnaoohA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khKM6-00039h-MO; Mon, 23 Nov 2020 22:30:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khKM4-00038N-TR
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 22:30:41 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75A21206D5;
 Mon, 23 Nov 2020 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606170638;
 bh=qMsLhguUfZGHthn8o/bIe+LRx3PrKd4xYprbL94g5Es=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DNfDxTnuJc/9ZOQO+U1ViZqPntmi9u+PapFohdzgovjh/jy/Yy4xVB33Rww+qBRm7
 az2CJzZnLZkYf7iatMCzDNGSHVMHyPoXq/qiSNoa3lsby8//RGmrveXMtq3Cqen2Q2
 SidiEvRqa7Jbzx0Zmg8juZV1Q8JiUJnD9dIkecsc=
Date: Mon, 23 Nov 2020 14:30:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Subject: Re: [PATCH v4 2/3] fscrypt: Have filesystems handle their d_ops
Message-ID: <X7w4C8GAy+P9KNU6@sol.localdomain>
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <87y2iuj8y2.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2iuj8y2.fsf@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_173041_042621_C99E19DF 
X-CRM114-Status: GOOD (  20.60  )
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

On Sat, Nov 21, 2020 at 11:45:41PM -0500, Gabriel Krisman Bertazi wrote:
> > diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> > index 6633b20224d5..0288bedf46e1 100644
> > --- a/fs/ext4/super.c
> > +++ b/fs/ext4/super.c
> > @@ -4968,11 +4968,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
> >  		goto failed_mount4;
> >  	}
> >  
> > -#ifdef CONFIG_UNICODE
> > -	if (sb->s_encoding)
> > -		sb->s_d_op = &ext4_dentry_ops;
> > -#endif
> 
> This change has the side-effect of removing the capability of the root
> directory from being case-insensitive.  It is not a backward
> incompatible change because there is no way to make the root directory
> CI at the moment (it is never empty). But this restriction seems
> artificial. Is there a real reason to prevent the root inode from being
> case-insensitive?
> 

The problem is that the "lost+found" directory is special in that e2fsck needs
to be able to find it.

That's the reason why ext4 doesn't allow the root directory to be encrypted.
(And encrypting the root directory isn't really useful anyway, since if the goal
is to encrypt a whole filesystem with one key, dm-crypt is a better solution.)

Casefolding is a bit less problematic than encryption.  But it still doesn't
entirely work, as e.g. if you name the directory "LOST+FOUND" instead (the
directory is casefolded after all...), then e2fsck can't find it.

Unless there's a real use case for the root directory being casefolded and
people are willing to fix e2fsck, I think we should just make ext4 return an
error when setting the casefold flag on the root directory, like it does when
trying to enable encryption on the root directory.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
