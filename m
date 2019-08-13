Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60771C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 00:14:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC0020665
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 00:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LUGJflTO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FC0020665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cb4R1KwIqUiXMwW49p1j0GXvCaYyyZQseNLvpazqda8=; b=LUGJflTOlBCsi5
	6GTVf5GK0fe1uHkSVCRuH22jsUNbkgMS8baa3m3bKdWoje1y6Qs8RVrys7bt7tiFiWe0yq8wx1dO+
	klDPwnVppqBVU1jzdv52+oW3zXxs2mBSSm4ZdfUVbaUwbPsV0oSVo0JALtfkxx/4m1aJKy3hrnkDA
	Z5MwA0wlv1UPMGKjNZkkY7kt5uDeQ7FCD+S/at9XjGx17zdpPJ15uJfNQET4Hj5HyTMW6QSSaDmWe
	xSW7F61FM+QCpUGL3BhMebF2bPY6XeL/BJQfPIb7dfTuNq+DcJx+BHLFuTu0gZID/7PNxFkZplOZ5
	Hy5BNrsTu+9v/yGAshMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxKS8-0002sF-Qv; Tue, 13 Aug 2019 00:14:16 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxKS5-0002rq-81
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 00:14:14 +0000
Received: from callcc.thunk.org (guestnat-104-133-9-109.corp.google.com
 [104.133.9.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x7D0E7I4017125
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 20:14:08 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 1BBDD4218EF; Mon, 12 Aug 2019 20:14:07 -0400 (EDT)
Date: Mon, 12 Aug 2019 20:14:07 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v8 14/20] fscrypt: allow unprivileged users to add/remove
 keys for v2 policies
Message-ID: <20190813001406.GI28705@mit.edu>
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-15-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805162521.90882-15-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_171413_456916_D3634C86 
X-CRM114-Status: GOOD (  19.28  )
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 05, 2019 at 09:25:15AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Allow the FS_IOC_ADD_ENCRYPTION_KEY and FS_IOC_REMOVE_ENCRYPTION_KEY
> ioctls to be used by non-root users to add and remove encryption keys
> from the filesystem-level crypto keyrings, subject to limitations.
> 
> Motivation: while privileged fscrypt key management is sufficient for
> some users (e.g. Android and Chromium OS, where a privileged process
> manages all keys), the old API by design also allows non-root users to
> set up and use encrypted directories, and we don't want to regress on
> that.  Especially, we don't want to force users to continue using the
> old API, running into the visibility mismatch between files and keyrings
> and being unable to "lock" encrypted directories.
> 
> Intuitively, the ioctls have to be privileged since they manipulate
> filesystem-level state.  However, it's actually safe to make them
> unprivileged if we very carefully enforce some specific limitations.
> 
> First, each key must be identified by a cryptographic hash so that a
> user can't add the wrong key for another user's files.  For v2
> encryption policies, we use the key_identifier for this.  v1 policies
> don't have this, so managing keys for them remains privileged.
> 
> Second, each key a user adds is charged to their quota for the keyrings
> service.  Thus, a user can't exhaust memory by adding a huge number of
> keys.  By default each non-root user is allowed up to 200 keys; this can
> be changed using the existing sysctl 'kernel.keys.maxkeys'.
> 
> Third, if multiple users add the same key, we keep track of those users
> of the key (of which there remains a single copy), and won't really
> remove the key, i.e. "lock" the encrypted files, until all those users
> have removed it.  This prevents denial of service attacks that would be
> possible under simpler schemes, such allowing the first user who added a
> key to remove it -- since that could be a malicious user who has
> compromised the key.  Of course, encryption keys should be kept secret,
> but the idea is that using encryption should never be *less* secure than
> not using encryption, even if your key was compromised.
> 
> We tolerate that a user will be unable to really remove a key, i.e.
> unable to "lock" their encrypted files, if another user has added the
> same key.  But in a sense, this is actually a good thing because it will
> avoid providing a false notion of security where a key appears to have
> been removed when actually it's still in memory, available to any
> attacker who compromises the operating system kernel.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good.  I'd probably would have used either "mk_secret_sem" or
"mk->mk_secret_sem" in the comments, instead of "->mk_securet_sem",
but that's just a personal style preference.  Since you consistently
used the latter, I assume that's a deliberate choice, which is fine.

Feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
