Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C383BC32753
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 23:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931972067D
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 23:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STPJQUY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931972067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKG/l1kuWMN4lOqhPVUJ8Zl+6rL63fsWZIxtRiBMUok=; b=STPJQUY3PZAM8l
	9XkGftFaA0U/Mg8GCRMKwUevqZnKD1G18wH1MqKDwXnwOaLqctYhkx1IMgWpErWrB2c5IUaFO8+ak
	VhPsM+2W+eRlCLBddqpWkmr6My75zmAfo0aAreTaqCkxN/HLv2uts8K7ao7jQzPqa59m1lFtBh0gK
	BL4fPBJwVl4QrdylQI383jh3Kytov4nsXqlSxQDt72Gg9mFzijuToM7VB3RzjM6w6HAdQMeVKJkk9
	1LFPw6qRaBKGVCYAzOAaQblZYjrP2Ih+2JWfET3QHjHDMDrQ2aXhOpejAAXDPybriH9OO/Pjwnqcu
	3qT17xMxd1YFRLggu0tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsyBI-0008VT-FR; Wed, 31 Jul 2019 23:38:52 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsyBE-0008V7-FO
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2019 23:38:50 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6VNchZY000330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Jul 2019 19:38:44 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 3EE374202F5; Wed, 31 Jul 2019 19:38:43 -0400 (EDT)
Date: Wed, 31 Jul 2019 19:38:43 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, Satya Tangirala <satyat@google.com>
Subject: Re: [PATCH v7 07/16] fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
Message-ID: <20190731233843.GA2769@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-8-ebiggers@kernel.org>
 <20190728192417.GG6088@mit.edu> <20190729195827.GF169027@gmail.com>
 <20190731183802.GA687@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731183802.GA687@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_163848_686110_71914759 
X-CRM114-Status: GOOD (  18.17  )
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

On Wed, Jul 31, 2019 at 11:38:02AM -0700, Eric Biggers wrote:
> 
> This is perhaps different from what users expect from unlink().  It's well known
> that unlink() just deletes the filename, not the file itself if it's still open
> or has other links.  And unlink() by itself isn't meant for use cases where the
> file absolutely must be securely erased.  But FS_IOC_REMOVE_ENCRYPTION_KEY
> really is meant primarily for that sort of thing.

Seems to me that part of the confusion is FS_IOC_REMOVE_ENCRYPTION_KEY
does two things.  One is "remove the user's handle on the key".  The
other is "purge all keys" (which requires root).  So it does two
different things with one ioctl.

> To give a concrete example: my patch for the userspace tool
> https://github.com/google/fscrypt adds a command 'fscrypt lock' which locks an
> encrypted directory.  If, say, someone runs 'fscrypt unlock' as uid 0 and then
> 'fscrypt lock' as uid 1000, then FS_IOC_REMOVE_ENCRYPTION_KEY can't actually
> remove the key.  I need to make the tool show a proper error message in this
> case.  To do so, it would help to get a unique error code (e.g. EUSERS) from
> FS_IOC_REMOVE_ENCRYPTION_KEY, rather than get the ambiguous error code ENOKEY
> and have to call FS_IOC_GET_ENCRYPTION_KEY_STATUS to get the real status.

What about having "fscrypt lock" call FS_IOC_GET_ENCRYPTION_KEY_STATUS
and print a warning message saying, "we can't lock it because N other
users who have registered a key".  I'd argue fscrypt should do this
regardless of whether or not FS_IOC_REMOVE_ENCRYPTION_KEY returns
EUSERS or not.

> Also, we already have the EBUSY case.  This means that the ioctl removed the
> master key secret itself; however, some files were still in-use, so the key
> remains in the "incompletely removed" state.  If we were actually going for
> unlink() semantics, then for consistency this case really ought to return 0 and
> unlink the key object, and people who care about in-use files would need to use
> FS_IOC_GET_ENCRYPTION_KEY_STATUS.  But most people *will* care about this, and
> may even want to retry the ioctl later, which isn't something youh can do with
> pure unlink() semantics.

It seems to me that the EBUSY and EUSERS errors should be status bits
which gets returned to the user in a bitfield --- and if the key has
been removed, or the user's claim on the key's existence has been
removed, the ioctl returns success.

That way we don't have to deal with the semantic disconnect where some
errors don't actually change system state, and other errors that *do*
change system state (as in, the key gets removed, or the user's claim
on the key gets removed), but still returns than error.

We could also add a flag which indicates where if there are files that
are still busy, or there are other users keeping a key in use, the
ioctl fails hard and returns an error.  At least that way we keep
consistency where an error means, "nothing has changed".

	    	     	   	  	   - Ted

P.S.  BTW, one of the comments which I didn't make was the
documentation didn't adequately explain which error codes means,
"success but with a caveat", and which errors means, "we failed and
didn't do anything".  But since I was arguing for changing the
behavior, I decided not to complain about the documentation.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
