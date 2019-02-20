Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABDAC10F01
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 07:54:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C7802083B
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 07:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZTa6Fv9p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKU7DBXp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C7802083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwQpu0p2sA/IH+GRyyaORLUQnXdy1xVty8V1b1mouVY=; b=ZTa6Fv9pdP/Z7H
	m9QlRWnLKX6w9m2e+J4v0vD7iSPRIRH4AqTg8Fof0EDLYQ0dHNYnvtozsZtAT724JozhKG+bsu10U
	Ha+4zeo4wCTYcThKNpma0dqFxdyqh6peHQ8MgF+Ez9vmEMrbkHkBZn/SYfG3g0DQrb8PyJ+dTypta
	F6KJ7i0ifS4uVzFdCZ7uBAj055gSC/b2vg4e3IZyHV9f+RaT72U6X9iKr0F+Eh11CUWsLZfNwYfDM
	r/h1l8SUmmxR+4GdOg72OpvODBow9Nyu2QRdP3BQ/MugY2GRDEJODq3Nluax2uhNugB3PpkzBRO0a
	ZPwmhWCvpwe1LcycmJIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwMhl-0008Gq-Ug; Wed, 20 Feb 2019 07:54:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwMhj-0008GD-VG
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 07:54:09 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 440E12083B;
 Wed, 20 Feb 2019 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550649247;
 bh=tLOAeQqo8uWF4VkUGKhfz71PVfoAaoBcFMjA2Hj/aW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uKU7DBXp0Hq4FeA1WZfTzMFWadwa1LkoRF0dY1fWJnZzqaXsWKu0MxvnvLR4xhY/x
 N4GzMOv6bJBGyoKjWblU/NQBBWCJVWZ3EjomIutqG/+Cp/IswqT1iNP09jb+GiEy1z
 Px/6RiDKz01hM58Rv3p9YP2CEnzugDFeckUdhp8Q=
Date: Tue, 19 Feb 2019 23:54:05 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andreas Dilger <adilger@dilger.ca>
Subject: Re: [RFC PATCH v3 00/18] fscrypt: key management improvements
Message-ID: <20190220075404.GA974@sol.localdomain>
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <1660609D-3525-4485-9652-57976DB020F4@dilger.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1660609D-3525-4485-9652-57976DB020F4@dilger.ca>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_235408_020420_53C9B272 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 19, 2019 at 11:18:21PM -0800, Andreas Dilger wrote:
> On Feb 19, 2019, at 10:52 PM, Eric Biggers <ebiggers@kernel.org> wrote:
> > 
> > Hello,
> > 
> > This patchset makes major improvements to how keys are added, removed,
> > and derived in fscrypt, aka ext4/f2fs/ubifs encryption.  It does this by
> > adding new ioctls that add and remove encryption keys directly to/from
> > the filesystem, and by adding a new encryption policy version ("v2")
> > where the user-provided keys are only used as input to HKDF-SHA512 and
> > are identified by their cryptographic hash.
> 
> Just to confirm for the layman reader - the fact that the crypto keys
> are registered with the filesystem and not with the user process doesn't
> prevent user(s) from having different crypto keys for different subdirs
> in a single filesystem?

Correct, that hasn't changed.  Different directories can use different keys.

> 
> Secondly, does this progress fscrypt toward allowing multiple master keys
> to decrypt a single per-file key?
> 

It's not a goal of this patchset as no one has really been asking for it yet.
Per-file keys are still derived from the master key.

Note that it's already possible to wrap the master keys in userspace.  Thus you
can already have multiple passwords that unlock the same encrypted directory.
You just can't do this with *individual files*.  Maybe that's good enough.

However, this patchset does fix the denial of service vulnerabilities that
currently exist when users share an encrypted directory.  Also, since it adds a
real KDF, it makes it much easier to derive a wrapping key to wrap the per-file
keys if that were to become a requirement.  (The master key could be used as the
wrapping key directly, but that's inflexible and more error-prone.)

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
