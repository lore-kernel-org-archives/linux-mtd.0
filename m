Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA456C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 18:36:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FDCC206A2
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 18:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uh3JVNnv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MquIZTsU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FDCC206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0ujJoQ7Ij0qHnF1UzlcEqbiYXU+N51yzYs8XmIsd4s=; b=uh3JVNnv5DUvia
	SIrFW4VRllw7JTRCVRAGsKbbIlnCXn6U0ZVz5KtJDVUIZ4z9Xl/04mAUbcoivjrIcHm5Naxcv3o4b
	qPT9Z6p6dmbE5gRbaofs92NsKa/UC7FNfn3ulqID1lGruJ6wbY5U8CS/8rZFfW599FW2fXL5YsSvB
	ffwoyUKGxllyqYR2Yxa/mV2IoAQoXRmFdiJKoQlIbfsULyz0id4hCa1VIqG0j05E+IRzluO1wN6mF
	CXHoHqyo3KX3LjWLAvIzf2xnTPPaMyouidVWulffvRAdt6HGQau6MsUp46q+BoVETqa79FQVJryvI
	FETX7AjLBPeZmyeyJ6NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htFvn-0005PD-AX; Thu, 01 Aug 2019 18:36:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htFvi-0005Ou-Fy
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 18:36:00 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A69AF20838;
 Thu,  1 Aug 2019 18:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564684558;
 bh=gB6PyZEe+LT2zwLazfeSEmIf0CwJ4IcRfXQcgvcxbFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MquIZTsU8wzEJgSrwgxzGWtZqkxFhVTCYq6QrJJLnPM6KwsW0T8C3WWZsTraCMjjQ
 5g6AGpL+daDUfYaJEdx3AyvV59heDDgN8B3v4YETC/cgGivPPIhc6lmBEiW4x2dbKX
 GKk+FYf1mTe1wIMJ7aSr+X86F0F7fkDkHxHh6t4s=
Date: Thu, 1 Aug 2019 11:35:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v7 07/16] fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
Message-ID: <20190801183554.GA223822@gmail.com>
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
 <20190801011140.GB687@sol.localdomain>
 <20190801053108.GD2769@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801053108.GD2769@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_113558_567843_2BED0ECC 
X-CRM114-Status: GOOD (  34.81  )
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

On Thu, Aug 01, 2019 at 01:31:08AM -0400, Theodore Y. Ts'o wrote:
> On Wed, Jul 31, 2019 at 06:11:40PM -0700, Eric Biggers wrote:
> > 
> > Well, it's either
> > 
> > 1a. Remove the user's handle.
> > 	OR 
> > 1b. Remove all users' handles.  (FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)
> > 
> > Then
> > 
> > 2. If no handles remain, try to evict all inodes that use the key.
> > 
> > By "purge all keys" do you mean step (2)?  Note that it doesn't require root by
> > itself; root is only required to remove other users' handles (1b).
> 
> No, I was talking about 1b.  I'd argue that 1a and 1b should be
> different ioctl.  1b requires root, and 1a doesn't.
> 
> And 1a should just mean, "I don't need to use the encrypted files any
> more".  In the PAM passphrase case, when you are just logging out, 1a
> is what's needed, and success is just fine.  pam_session won't *care*
> whether or not there are other users keeping the key in use.

But in both cases, we still need to do the same things if the last user is
removed: remove the master key secret, try to evict the inodes, and (if all
inodes could be evicted) unlink the key object from the filesystem-level
keyring.  So the ioctls would be nearly the same; it's just the
"remove key user(s)" step that would be different.

So in my view, these are variants of the same action, which is why it's a flag.
Likewise, there aren't separate ioctls for v1 and v2 policy keys, since
adding/removing those are variants on the same actions, and it allows the ioctls
to be extended to v3 in the future if it ever becomes necessary.

Now, I don't have *that* much of an issue with making it an separate ioctl
FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS.  We can make them call the same function
internally, with a bool argument to distinguish the two ioctls.  It just seems
like an unnecessary complication.

> 
> The problem with "fscrypt lock" is that the non-privileged user sort
> of wants to do REMOVE_FLAG_KEY_FLAG_FOR_ALL_USERS, but they doesn't
> have the privileges to do it, and they are hoping that removing their
> own key removes it the key from the system.  That to me seems to be
> the fundamental disconnect.  The "fscrypt unlock" and "fscrypt lock"
> commands comes from the v1 key management, and requires root.  It's
> the translation to unprivileged mode where "fscrypt lock" seems to
> have problems.

"fscrypt lock" actually doesn't exist yet; it's a missing feature.  My patch to
the fscrypt tool adds it.  So we get to decide on the semantics.  We don't want
to require root, though; so for v2 policy keys, the real semantics have to be
that "fscrypt lock" registers the key for the user, and "fscrypt unlock"
unregisters it for the user.

One could argue that because of this they should be named "fscrypt register_key"
and "fscrypt unregister_key".  However, in the vast majority of cases these will
be run as a single user, with a key that is not shared with any other user.

[In fact, I recently changed the fscrypt tool to automatically set mode 0700 on
new encrypted directories, since most people found it surprising that their
unlocked encrypted files weren't private to them by default.  So if someone
wants to share their encrypted directory with another user, they now also need
to explicitly chmod it, unless the root user is involved.]

So presenting the commands as locking/unlocking a directory is a useful
simplication that makes them much easier to use, IMO.  People shouldn't need to
understand multi-user key registration in order to unlock/lock their personal
encrypted directories.

And if "fscrypt lock" does nevertheless hit the case where other users remain, I
think it would be most user-friendly to print a warning like this:

	Directory not fully locked; other users have added the key.
 	Run 'sudo fscrypt lock --all-users DIR' if you want to force-lock the directory.

We *could* make the --all-users option a separate subcommand like
"fscrypt force_lock", but again to me it seems like a variant of the same thing.

> > > It seems to me that the EBUSY and EUSERS errors should be status bits
> > > which gets returned to the user in a bitfield --- and if the key has
> > > been removed, or the user's claim on the key's existence has been
> > > removed, the ioctl returns success.
> > > 
> > > That way we don't have to deal with the semantic disconnect where some
> > > errors don't actually change system state, and other errors that *do*
> > > change system state (as in, the key gets removed, or the user's claim
> > > on the key gets removed), but still returns than error.
> > > 
> > 
> > Do you mean use a positive return value, or do you mean add an output field to
> > the struct passed to the ioctl?
> 
> I meant adding an output field.  I see EBUSY and EUSERS as status bits
> which *some* use cases might find useful.  Other use cases, such as in
> the pam_keys session logout code, we won't care at *all* about those
> status reporting (or error codes).  So if EBUSY and EUSERS are
> returned as errors, then it adds to complexity of those programs
> whichd don't care.  (And even for those that do, it's still a bit more
> complex since they has to distinguish between EBUSY, EUSERS, or other
> errors --- in fact, *all* programs which use
> FS_IOC_REMOVE_ENCRYPTION_KEY will *have* to check for EBUSY and
> ESUSERS whether they care or not.)
> 

I see it a little differently: I'd prefer for the API to be "secure by default",
i.e. it tries hard to really remove the key, and it returns an error if it
couldn't really be removed (but still did as much as possible).  And if the
caller is fine with some case(s) where the key wasn't truly removed, then they
can just explicitly handle those case(s).

You're suggesting the opposite: the ioctl will return 0 if the key was
unregistered for current user only, or if some files are still in use; and if
someone cares whether the key was *really* removed, then they'd need to check
the additional status bits.

That's easier to misuse in the more important ways, in my view.  Now, it's not a
huge deal, as the API provides the same information either way, and regardless
of which one we choose, I'll make sure it's used correctly in fscrypt, Android,
Chrome OS, etc...

> > Either way note that it doesn't really need to be a bitfield, since you can't
> > have both statuses at the same time.  I.e. if there are still other users, we
> > couldn't have even gotten to checking for in-use files.
> 
> That's actually an implementation detail, though, right?  In theory,
> we could check to see if there are any in-use files, independently of
> whether there are any users or not.
> 

Yes, but wouldn't people assume that if the bitfield is provided, that all the
bits are actually filled in?  Remember that to determine the "in-use files" bit
we have to actually go through the inode list and try to evict all the inodes.
That's not really something we should be doing before the last user is removed.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
