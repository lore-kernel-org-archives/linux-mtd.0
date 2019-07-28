Return-Path: <SRS0=FYfc=VZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB482C433FF
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 19:30:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805E12075B
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 19:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tFDyrpEs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805E12075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJ/tT4/0lqQBNk+gN9nU6quxI96YiTqEh0Gz8AsSBgw=; b=tFDyrpEs0eoSjb
	vWnMtPiAb3z5WksSx1yUHuTR93JFkYpAr6CKXAMARgG1axzlx/OyLyNDu5cCp5VCwla+4LbHEx5Mt
	scXfZDnX21L0qshKcCO6vMFit3fxUeOVHrf0n1OgS/dDr51InlsCkHzFYbz7wix5Rf7jLlFkz/RQV
	Ure7p64MJCXfS1CA3o5H2aTtOZEnrUdOkKV7uamTyLFDjRY/ob8oLRHbOHVFNGBJs9O6n3G69nsLr
	L2A64GzoeeFYQLm0kzIIWAMEbs/6JjMkUgtRhHLuer54F1c+VfMQ4tBENgqampNrG6NMvFCayqzTD
	2jb/FSoUaaZjJGx82v7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrosD-0003Ou-8a; Sun, 28 Jul 2019 19:30:25 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hros9-0003Oa-CK
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2019 19:30:23 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SJUDhE009303
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 15:30:14 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 7DDB54202F5; Sun, 28 Jul 2019 15:30:12 -0400 (EDT)
Date: Sun, 28 Jul 2019 15:30:12 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v7 08/16] fscrypt: add FS_IOC_GET_ENCRYPTION_KEY_STATUS
 ioctl
Message-ID: <20190728193012.GH6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-9-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-9-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_123022_532019_A890A92C 
X-CRM114-Status: GOOD (  13.90  )
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
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 26, 2019 at 03:41:33PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a new fscrypt ioctl, FS_IOC_GET_ENCRYPTION_KEY_STATUS.  Given a key
> specified by 'struct fscrypt_key_specifier' (the same way a key is
> specified for the other fscrypt key management ioctls), it returns
> status information in a 'struct fscrypt_get_key_status_arg'.
> 
> The main motivation for this is that applications need to be able to
> check whether an encrypted directory is "unlocked" or not, so that they
> can add the key if it is not, and avoid adding the key (which may
> involve prompting the user for a passphrase) if it already is.
> 
> It's possible to use some workarounds such as checking whether opening a
> regular file fails with ENOKEY, or checking whether the filenames "look
> like gibberish" or not.  However, no workaround is usable in all cases.
> 
> Like the other key management ioctls, the keyrings syscalls may seem at
> first to be a good fit for this.  Unfortunately, they are not.  Even if
> we exposed the keyring ID of the ->s_master_keys keyring and gave
> everyone Search permission on it (note: currently the keyrings
> permission system would also allow everyone to "invalidate" the keyring
> too), the fscrypt keys have an additional state that doesn't map cleanly
> to the keyrings API: the secret can be removed, but we can be still
> tracking the files that were using the key, and the removal can be
> re-attempted or the secret added again.
> 
> After later patches, some applications will also need a way to determine
> whether a key was added by the current user vs. by some other user.
> Reserved fields are included in fscrypt_get_key_status_arg for this and
> other future extensions.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
