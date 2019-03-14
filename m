Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D5BC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 23:55:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73B75217F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 23:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NufdmecC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="kS52ctJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73B75217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtPzSNrZT4zOp3JRMiCjD9XWK/LKCxtAEPDWJaRcwtE=; b=NufdmecCuniVOY
	cNrGeuf64yPiZciUWey+zQ2cb3xYE3STLhpn6tjhSJjEjPiLZLAs+HkcxCYImy3OD82C8E38sgnB8
	JYJque9l6jGzNAxbyjmmFKnISXmAmymj7rqsm78lX4NEEQUAomIQ7eXB9NFTLoupvLWo5PvfHrhSW
	9KO1fYhfwUgrvVvxkF3mfaIeL41jCgE7BZzqDPYgswk75JcxGKpyjBKZtfD0pb/oLKLTe2mzgSj5U
	C4xOmx92sP7KBK+lyGPLBxwcuX1pdCliRc3kyGNfz7wwX1uEvLTdQjpFW1JgxORe56U5YVTX7IZ4y
	UP8gwEJPHlKYDg5iSZVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4aCQ-0008LA-O1; Thu, 14 Mar 2019 23:55:46 +0000
Received: from bedivere.hansenpartnership.com ([66.63.167.143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4aCN-0008Ko-9L
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 23:55:44 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id BE7C98EE1EC;
 Thu, 14 Mar 2019 16:55:42 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id W9yTdsDdr4ag; Thu, 14 Mar 2019 16:55:42 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id DB9BC8EE02B;
 Thu, 14 Mar 2019 16:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1552607742;
 bh=YNHkuTCKoNFfsmkVdp6HeMWsym6Cwxg03ePJT7rngkw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=kS52ctJhDNWE/z5kFcof6k0KtWcjMCrUxKji3MKqlmneYBk76ZttUW9tus49y06qh
 4x9bLGbzMtVRTVwPewHbzdPeergIv52TAwPNxyYqTe6jLV/T1XW8V1T913az7On3sz
 5xixkHjB3ow/1FQ6QHvnhZ/n3XAHib7SZHqJP1Sw=
Message-ID: <1552607740.2571.15.camel@HansenPartnership.com>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Theodore Ts'o <tytso@mit.edu>
Date: Thu, 14 Mar 2019 16:55:40 -0700
In-Reply-To: <20190314234230.GG6482@mit.edu>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-1-richard@nod.at>
 <20190314171559.27584-5-richard@nod.at>
 <1552605311.2571.6.camel@HansenPartnership.com>
 <20190314234230.GG6482@mit.edu>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_165543_348191_CF34F667 
X-CRM114-Status: GOOD (  20.28  )
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
Cc: miklos@szeredi.hu, Richard Weinberger <richard@nod.at>, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 paullawrence@google.com, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-03-14 at 19:42 -0400, Theodore Ts'o wrote:
> On Thu, Mar 14, 2019 at 04:15:11PM -0700, James Bottomley wrote:
> > On Thu, 2019-03-14 at 18:15 +0100, Richard Weinberger wrote:
> > > Usually fscrypt allows limited access to encrypted files even
> > > if no key is available.
> > > Encrypted filenames are shown and based on this names users
> > > can unlink and move files.
> > 
> > Shouldn't they be able to read/write and create as well (all with
> > the ciphertext name and contents, of course) ... otherwise how does
> > backup of encrypted files by admin without the key ever work?
> 
> That's not currently supported.  Michael Halcrow and I worked out
> some designs on how to do this, and I even had some prototype
> patches, but it's really, really, messy, and requires a lot of
> complex machinations in userspace on the save *and* restore, since
> there's a lot of crypto metadata that has to be saved, and you have
> to handle backing up the directory per-file keys, and restoring them
> when you recreate the directory on a restore, etc.
> 
> The simpler approach would have allowed backup of encrypted files
> without the key, but would require the user's key to do the restore,
> and if we ever actually tried to get this feature supported, that's
> the approach I'd suggest.

Well, as I said above encrypted file backup by an admin who doesn't
have the key was what I was thinking of.

> The fundamental reason why we never went did anything with this was
> that the original use case of fscrypt was for Chrome OS, where the
> original design premise was that you don't need to do backups, since
> everything is in the cloud.  A video from 2010:
> 
> 	https://www.youtube.com/watch?v=lm-Vnx58UYo
> 
> And with Android, backups happen automatically while you have the
> encryption key.

Heh, colour me paranoid, but if I backup my sensitive data to any
medium (including the cloud) I *want* the backup to be encrypted so
that if someone is careless with my backup data at least they don't get
the contents.

> There was talk about using fscrypt for Ubuntu desktops as an ecryptfs
> replacement, and in that case, we would have use case that would have
> required backups of a shared desktop where you don't have all of the
> encryption keys for all of the users.  Maybe someday as a Google
> Summer of Code project or maybe if some potential corporate user of
> fscrypt would be willing to fund the necessary engineering work?
> 
> But again, I'll repeat this because it's so important: In the vast
> majority of cases, including single-user laptops, desktops, etc., the
> real right answer is dm-crypt and *not* fscrypt.  Especially since
> time-sharing systems are *so* 1980's.  :-)
> 
> So I don't use fscrypt on my upstream development laptop (except for
> testing purposes) because it's simply not the right tool for the job.

I was thinking of the container use case again.  It's not really backup
per se but it is serialization: if you can't do a backup ... i.e. save
and restore an encrypted tar image, you can't use the filesystem for
container image protection.  But it also strikes me that inability to
do backup and restore without the key really restricts the use cases
for the entire filesystem.

James


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
