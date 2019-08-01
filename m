Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB40C433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 05:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF743206A3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 05:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d08HCkSG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF743206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsQKenk9aXEhrxRTiEazHU5Un8x30KKzlzbtLnkPq7w=; b=d08HCkSGMuvFuh
	XlTn6Dhn9L1tVPg+3MhdSHp9Cni4ixnUQuteznXi8kDCtMPFCSy9fhSAJf5xwbKh7JJRQ7H8Nfo4b
	/c03HhQNG7RDA2MhmN6prhZXug3Q6FAvfOWSzolM7OL0K0jB1JOQ4pOIQ8AkH/HYw+OJiy+qWzMVB
	U/SW/Ya8q4fwc51JOAZf/UHFfqMwkLHuWN23pXFKzBsfLNsjcmNAB/bMCB4rg6IW1lDUzz7MT9uuW
	9CLwOyrmPbwhDVLtWEkcMgtv02c5DuMq/PDTRem+/iKU9CIScgocVBe2IQ7YADNbEOwNJS6SuOdBY
	7yQFr2nsZ/CKMk6tymOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht3gL-0001Oh-Ue; Thu, 01 Aug 2019 05:31:17 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht3gI-0001OO-7N
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 05:31:16 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x715V9Rn013938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 1 Aug 2019 01:31:10 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id EEE8D4202F5; Thu,  1 Aug 2019 01:31:08 -0400 (EDT)
Date: Thu, 1 Aug 2019 01:31:08 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, Satya Tangirala <satyat@google.com>
Subject: Re: [f2fs-dev] [PATCH v7 07/16] fscrypt: add
 FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
Message-ID: <20190801053108.GD2769@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-8-ebiggers@kernel.org>
 <20190728192417.GG6088@mit.edu> <20190729195827.GF169027@gmail.com>
 <20190731183802.GA687@sol.localdomain>
 <20190731233843.GA2769@mit.edu>
 <20190801011140.GB687@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801011140.GB687@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_223114_438058_B543E49E 
X-CRM114-Status: GOOD (  21.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 06:11:40PM -0700, Eric Biggers wrote:
> 
> Well, it's either
> 
> 1a. Remove the user's handle.
> 	OR 
> 1b. Remove all users' handles.  (FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)
> 
> Then
> 
> 2. If no handles remain, try to evict all inodes that use the key.
> 
> By "purge all keys" do you mean step (2)?  Note that it doesn't require root by
> itself; root is only required to remove other users' handles (1b).

No, I was talking about 1b.  I'd argue that 1a and 1b should be
different ioctl.  1b requires root, and 1a doesn't.

And 1a should just mean, "I don't need to use the encrypted files any
more".  In the PAM passphrase case, when you are just logging out, 1a
is what's needed, and success is just fine.  pam_session won't *care*
whether or not there are other users keeping the key in use.

The problem with "fscrypt lock" is that the non-privileged user sort
of wants to do REMOVE_FLAG_KEY_FLAG_FOR_ALL_USERS, but they doesn't
have the privileges to do it, and they are hoping that removing their
own key removes it the key from the system.  That to me seems to be
the fundamental disconnect.  The "fscrypt unlock" and "fscrypt lock"
commands comes from the v1 key management, and requires root.  It's
the translation to unprivileged mode where "fscrypt lock" seems to
have problems.

> > What about having "fscrypt lock" call FS_IOC_GET_ENCRYPTION_KEY_STATUS
> > and print a warning message saying, "we can't lock it because N other
> > users who have registered a key".  I'd argue fscrypt should do this
> > regardless of whether or not FS_IOC_REMOVE_ENCRYPTION_KEY returns
> > EUSERS or not.
> 
> Shouldn't "fscrypt lock" still remove the user's handle, as opposed to refuse to
> do anything, though?  So it would still need to callh
> FS_IOC_REMOVE_ENCRYPTION_KEY, and could get the status from it rather than also
> needing to call FS_IOC_GET_ENCRYPTION_KEY_STATUS.
> 
> Though, FS_IOC_GET_ENCRYPTION_KEY_STATUS would be needed if we wanted to show
> the specific count of other users.
 
So my perspective is that the ioctl's should have very clean
semantics, and errors should be consistent with how the Unix system
calls and error reporting.

If we need to make "fscrypt lock" and "fscrypt unlock" have semantics
that are more consistent with previous user interface choices, then
fscrypt can use FS_IOC_GET_ENCRYPTION_KEY_STATUS to print the warning
before it calls FS_IOC_REMOVE_ENCRYPTION_KEY --- with "fscrypt purge_keys"
calling something like FS_IOC_REMOVE_ALL_USER_ENCRYPTION_KEYS.

> > It seems to me that the EBUSY and EUSERS errors should be status bits
> > which gets returned to the user in a bitfield --- and if the key has
> > been removed, or the user's claim on the key's existence has been
> > removed, the ioctl returns success.
> > 
> > That way we don't have to deal with the semantic disconnect where some
> > errors don't actually change system state, and other errors that *do*
> > change system state (as in, the key gets removed, or the user's claim
> > on the key gets removed), but still returns than error.
> > 
> 
> Do you mean use a positive return value, or do you mean add an output field to
> the struct passed to the ioctl?

I meant adding an output field.  I see EBUSY and EUSERS as status bits
which *some* use cases might find useful.  Other use cases, such as in
the pam_keys session logout code, we won't care at *all* about those
status reporting (or error codes).  So if EBUSY and EUSERS are
returned as errors, then it adds to complexity of those programs
whichd don't care.  (And even for those that do, it's still a bit more
complex since they has to distinguish between EBUSY, EUSERS, or other
errors --- in fact, *all* programs which use
FS_IOC_REMOVE_ENCRYPTION_KEY will *have* to check for EBUSY and
ESUSERS whether they care or not.)

> Either way note that it doesn't really need to be a bitfield, since you can't
> have both statuses at the same time.  I.e. if there are still other users, we
> couldn't have even gotten to checking for in-use files.

That's actually an implementation detail, though, right?  In theory,
we could check to see if there are any in-use files, independently of
whether there are any users or not.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
