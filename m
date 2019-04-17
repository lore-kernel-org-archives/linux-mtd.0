Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A03C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 16:59:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75D7D20674
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 16:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pRCWJc2V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75D7D20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ACe8gGbiXWrnrd40jhQjGxL01LSLrLGajvFnLeTUFh8=; b=pRCWJc2VRTd5XF
	Xdai2Py3O57fidBo7ReAyTUsjwGXjioxrjOIJFPb1lv7EE92c7IrgE4e7T7UipVDBgejg1pWq37wE
	K5/VztppV0Wjl3BC7zHaK9rZROAfVr6IMIWnixHOH4EGK7jR7uwrzxbwAv7qsHY4HDS0MYxDGuZ1S
	E60gTh4VzSYiPV+GSobY2RgSRuQeoFdONMxpxdJAsxPVtM87EFFHq2K7tILVsh6ln43cU0UP+Drs+
	eCOn9Gv2jrDHMuBEzL3d/xpJvfTj3xLxOx3j7jOpgoggWgjL68Aj5fpbn8Kc3fz/rmX2sGdQ4qYCL
	6VDxiTU0b0EHx7mlHmFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGnuJ-0005pc-Nf; Wed, 17 Apr 2019 16:59:35 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGnqq-0004bH-TS
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 16:56:19 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x3HGtvvX009766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2019 12:55:57 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id DA50D420497; Wed, 17 Apr 2019 12:55:56 -0400 (EDT)
Date: Wed, 17 Apr 2019 12:55:56 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 2/2] fscrypt: cache decrypted symlink target in ->i_link
Message-ID: <20190417165556.GI4686@mit.edu>
References: <20190410202115.64501-1-ebiggers@kernel.org>
 <20190410202115.64501-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190410202115.64501-3-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_095601_569968_32DD9147 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 10, 2019 at 01:21:15PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Path lookups that traverse encrypted symlink(s) are very slow because
> each encrypted symlink needs to be decrypted each time it's followed.
> This also involves dropping out of rcu-walk mode.
> 
> Make encrypted symlinks faster by caching the decrypted symlink target
> in ->i_link.  The first call to fscrypt_get_symlink() sets it.  Then,
> the existing VFS path lookup code uses the non-NULL ->i_link to take the
> fast path where ->get_link() isn't called, and lookups in rcu-walk mode
> remain in rcu-walk mode.
> 
> Also set ->i_link immediately when a new encrypted symlink is created.
> 
> To safely free the symlink target after an RCU grace period has elapsed,
> introduce a new function fscrypt_free_inode(), and make the relevant
> filesystems call it just before actually freeing the inode.
> 
> Cc: Al Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, applied.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
