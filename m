Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF595C433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 01:12:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1AB22067D
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 01:12:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mt/GAv/h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8Dwci5x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1AB22067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AeKdmY5mRx/Q6dVIO2d9dPTvmzh7kBAnUGM0CuZ7YL0=; b=mt/GAv/hMNbXsk
	aoByu1gBim6xgh54pUlQ/CA8gHpVpT2PO7bUgCDweVLXrCMhKDp+JZVpYW9NwUpxA4V6pIwJ5qeUw
	ilihVcwH4AE8N8dTC36VMqAM7tJpoW1c2eJCTU5chLx4Za9ZCzVAgJt45z3YHwOIEu/rEBFi4iUr3
	0tVrxh41kAWOdaojulh1yMNjBiorJagLAcaAkZsAeY2ccWii2PBlrVbFHnr+YG+TwvXhBdOmDWooT
	SyQtKjwPrebhlau56zFYTXL2hDwkdn9Fp2x6UQNWVPx+Ptx81McpnCV7qY+qnnx8VfVgkncfn6d/X
	dQWIVl1hsTOaOLm2Z42w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hszdD-0005QM-8A; Thu, 01 Aug 2019 01:11:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hszd9-0005Po-Ed
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 01:11:45 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D166420665;
 Thu,  1 Aug 2019 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564621902;
 bh=H1VGC39qmcqOsG5Rnv48x88mYEzA6Ram+Ziuu/hGRjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e8Dwci5xbYFe0C6i+Jry/mUax6YutZbfR3b/Gv6NL6rFOTDCCnd/C6LBkT2KI54v8
 CsswFjk1ORn0BeQh+I/EUKIkcKyQOl9CS/Sr8D605d28SIESBmwR0cw69VcDq8gpU3
 Qniz1oJ5alZPULLLVyiKg5WFquPGWnvOd3X3n8cE=
Date: Wed, 31 Jul 2019 18:11:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [f2fs-dev] [PATCH v7 07/16] fscrypt: add
 FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
Message-ID: <20190801011140.GB687@sol.localdomain>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-8-ebiggers@kernel.org>
 <20190728192417.GG6088@mit.edu> <20190729195827.GF169027@gmail.com>
 <20190731183802.GA687@sol.localdomain>
 <20190731233843.GA2769@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731233843.GA2769@mit.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_181143_546766_797E40A4 
X-CRM114-Status: GOOD (  31.11  )
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

On Wed, Jul 31, 2019 at 07:38:43PM -0400, Theodore Y. Ts'o wrote:
> On Wed, Jul 31, 2019 at 11:38:02AM -0700, Eric Biggers wrote:
> > 
> > This is perhaps different from what users expect from unlink().  It's well known
> > that unlink() just deletes the filename, not the file itself if it's still open
> > or has other links.  And unlink() by itself isn't meant for use cases where the
> > file absolutely must be securely erased.  But FS_IOC_REMOVE_ENCRYPTION_KEY
> > really is meant primarily for that sort of thing.
> 
> Seems to me that part of the confusion is FS_IOC_REMOVE_ENCRYPTION_KEY
> does two things.  One is "remove the user's handle on the key".  The
> other is "purge all keys" (which requires root).  So it does two
> different things with one ioctl.
> 

Well, it's either

1a. Remove the user's handle.
	OR 
1b. Remove all users' handles.  (FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)

Then

2. If no handles remain, try to evict all inodes that use the key.

By "purge all keys" do you mean step (2)?  Note that it doesn't require root by
itself; root is only required to remove other users' handles (1b).

It could be argued that (2) should be a separate ioctl, so we'd have UNLINK_KEY
then LOCK_KEY.  But is there a real use case for this split?  I.e. would anyone
ever want to UNLINK_KEY without also LOCK_KEY?  Is that really something we
want/need to support?  I'd really like the API to be as straightforward as
possible for the normal use case of locking a directory, and not require some
series of multiple ioctl's, which would be more difficult to use correctly.

> > To give a concrete example: my patch for the userspace tool
> > https://github.com/google/fscrypt adds a command 'fscrypt lock' which locks an
> > encrypted directory.  If, say, someone runs 'fscrypt unlock' as uid 0 and then
> > 'fscrypt lock' as uid 1000, then FS_IOC_REMOVE_ENCRYPTION_KEY can't actually
> > remove the key.  I need to make the tool show a proper error message in this
> > case.  To do so, it would help to get a unique error code (e.g. EUSERS) from
> > FS_IOC_REMOVE_ENCRYPTION_KEY, rather than get the ambiguous error code ENOKEY
> > and have to call FS_IOC_GET_ENCRYPTION_KEY_STATUS to get the real status.
> 
> What about having "fscrypt lock" call FS_IOC_GET_ENCRYPTION_KEY_STATUS
> and print a warning message saying, "we can't lock it because N other
> users who have registered a key".  I'd argue fscrypt should do this
> regardless of whether or not FS_IOC_REMOVE_ENCRYPTION_KEY returns
> EUSERS or not.

Shouldn't "fscrypt lock" still remove the user's handle, as opposed to refuse to
do anything, though?  So it would still need to call
FS_IOC_REMOVE_ENCRYPTION_KEY, and could get the status from it rather than also
needing to call FS_IOC_GET_ENCRYPTION_KEY_STATUS.

Though, FS_IOC_GET_ENCRYPTION_KEY_STATUS would be needed if we wanted to show
the specific count of other users.

> 
> > Also, we already have the EBUSY case.  This means that the ioctl removed the
> > master key secret itself; however, some files were still in-use, so the key
> > remains in the "incompletely removed" state.  If we were actually going for
> > unlink() semantics, then for consistency this case really ought to return 0 and
> > unlink the key object, and people who care about in-use files would need to use
> > FS_IOC_GET_ENCRYPTION_KEY_STATUS.  But most people *will* care about this, and
> > may even want to retry the ioctl later, which isn't something youh can do with
> > pure unlink() semantics.
> 
> It seems to me that the EBUSY and EUSERS errors should be status bits
> which gets returned to the user in a bitfield --- and if the key has
> been removed, or the user's claim on the key's existence has been
> removed, the ioctl returns success.
> 
> That way we don't have to deal with the semantic disconnect where some
> errors don't actually change system state, and other errors that *do*
> change system state (as in, the key gets removed, or the user's claim
> on the key gets removed), but still returns than error.
> 
> We could also add a flag which indicates where if there are files that
> are still busy, or there are other users keeping a key in use, the
> ioctl fails hard and returns an error.  At least that way we keep
> consistency where an error means, "nothing has changed".
> 
> 	    	     	   	  	   - Ted

Do you mean use a positive return value, or do you mean add an output field to
the struct passed to the ioctl?

The latter might be more error-prone, since it invites bugs where a directory
silently fails to be locked, because the second field was not checked.

Either way note that it doesn't really need to be a bitfield, since you can't
have both statuses at the same time.  I.e. if there are still other users, we
couldn't have even gotten to checking for in-use files.

> 
> P.S.  BTW, one of the comments which I didn't make was the
> documentation didn't adequately explain which error codes means,
> "success but with a caveat", and which errors means, "we failed and
> didn't do anything".  But since I was arguing for changing the
> behavior, I decided not to complain about the documentation.
> 

Yes, in any case the FS_IOC_REMOVE_ENCRYPTION_KEY documentation needs
improvement.  I have some updates pending for it.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
