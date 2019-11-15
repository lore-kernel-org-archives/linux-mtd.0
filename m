Return-Path: <SRS0=wpvZ=ZH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49EDC432C3
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2019 17:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96B4E2073B
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2019 17:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lyq/Qq0+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96B4E2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FI0G7KtP9PGwdgg2t+7vH2ptGYYsMPlut2dcAiWHOU=; b=Lyq/Qq0+kDTSU4
	jZLU5pqjh4ykVLOfv/M8W7vfjd2nYrgs6DXH9d7Q53KvztAVyDjLJ8YSFshR669iMFXmz9F8U7tmm
	YJq2PkGZho+S8gic+ZZePGEE2VKks+bLXZLHBXude6xQiguLkhQlmakKb8TMpUWCL1fkPUdn2Dunq
	a09bKag3ZPolE5QWjfL6iP6i9k06RXLOyvCNbGD5Avv4jt9LptXfwSFdzc3jQ6htKLP2NytnqsQgX
	zYKo2nNXjZ5fnYL2xiw68AcNd5l/QsP9Hs6QIEfnTiQvUl+gQdLFRAmuRBsaE8yaUl3Y5cWu6oVq3
	pQhU8QZUzy7w6HKYibug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVfQ1-0001gS-Gy; Fri, 15 Nov 2019 17:30:01 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVfPz-0001fV-6p
 for linux-mtd@lists.infradead.org; Fri, 15 Nov 2019 17:30:00 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Nov 2019 09:29:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="288613668"
Received: from sgaffney-mobl3.amr.corp.intel.com (HELO localhost)
 ([10.252.4.81])
 by orsmga001.jf.intel.com with ESMTP; 15 Nov 2019 09:29:45 -0800
Date: Fri, 15 Nov 2019 19:29:44 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>,
 linux-mtd@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, g@linux.intel.com
Subject: Re: [PATCH] fscrypt: support passing a keyring key to
 FS_IOC_ADD_ENCRYPTION_KEY
Message-ID: <20191115172944.GB21300@linux.intel.com>
References: <20191107001259.115018-1-ebiggers@kernel.org>
 <20191113203550.GI221701@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113203550.GI221701@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_092959_260144_1A7C3C38 
X-CRM114-Status: GOOD (  22.04  )
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

On Wed, Nov 13, 2019 at 12:35:51PM -0800, Eric Biggers wrote:
> On Wed, Nov 06, 2019 at 04:12:59PM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Extend the FS_IOC_ADD_ENCRYPTION_KEY ioctl to allow the raw key to be
> > specified by a Linux keyring key, rather than specified directly.
> > 
> > This is useful because fscrypt keys belong to a particular filesystem
> > instance, so they are destroyed when that filesystem is unmounted.
> > Usually this is desired.  But in some cases, userspace may need to
> > unmount and re-mount the filesystem while keeping the keys, e.g. during
> > a system update.  This requires keeping the keys somewhere else too.
> > 
> > The keys could be kept in memory in a userspace daemon.  But depending
> > on the security architecture and assumptions, it can be preferable to
> > keep them only in kernel memory, where they are unreadable by userspace.
> > 
> > We also can't solve this by going back to the original fscrypt API
> > (where for each file, the master key was looked up in the process's
> > keyring hierarchy) because that caused lots of problems of its own.
> > 
> > Therefore, add the ability for FS_IOC_ADD_ENCRYPTION_KEY to accept a
> > Linux keyring key.  This solves the problem by allowing userspace to (if
> > needed) save the keys securely in a Linux keyring for re-provisioning,
> > while still using the new fscrypt key management ioctls.
> > 
> > This is analogous to how dm-crypt accepts a Linux keyring key, but the
> > key is then stored internally in the dm-crypt data structures rather
> > than being looked up again each time the dm-crypt device is accessed.
> > 
> > Use a custom key type "fscrypt-provisioning" rather than one of the
> > existing key types such as "logon".  This is strongly desired because it
> > enforces that these keys are only usable for a particular purpose: for
> > fscrypt as input to a particular KDF.  Otherwise, the keys could also be
> > passed to any kernel API that accepts a "logon" key with any service
> > prefix, e.g. dm-crypt, UBIFS, or (recently proposed) AF_ALG.  This would
> > risk leaking information about the raw key despite it ostensibly being
> > unreadable.  Of course, this mistake has already been made for multiple
> > kernel APIs; but since this is a new API, let's do it right.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> David and Jarkko, are you okay with this patch from a keyrings subsystem
> perspective?

Thanks for reminding. Still catching up with keyring. I gave some
feedback to the patch.

/Jarkko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
