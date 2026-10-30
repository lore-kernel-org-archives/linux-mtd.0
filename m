Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DED606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 03:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QT0yRQMh;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=WaKDoYmI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1EYB8WyBBV9+55/H2GMB5nVM9gewOO8XdbcILiSlgss=; b=QT0yRQMhNAJmXCv5Nr2WDWttFL
	Wl8mWxs2jAg/rLLfrCFcHqc6sw555//b6Lza23p+gOphZVDrAoBGMBOLgEdnhyTX/4kjnJPlmc+6Z
	4EsGHdFEFwh/sHxBW+0HinNvyOVnBWH/u1teo+UV62qJZnZzlOpBpZZno4YzPjE+CpcupyC6r2eY8
	5Bjt1bJwc5ekAsHrLojR0jNf4lPAoE8DqWBz5Q4GU8/gx6LbO/aXpVoAplQMjWc4CqsUaQ6XG20bG
	v9fyV5gbgdZiSFLqPPUjrM0yA9deVAkZD3pspHXETuJI+vwRHaFyJ1OZgKeTF5T4gQpnEy/B9MHWv
	eTmVn6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcsa-0000000Aheg-0EKt;
	Fri, 30 Oct 2026 03:02:08 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcsW-0000000AheH-3l4e
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 03:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793329322; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=CHLQ7b2LcR7am1RKbZkh1e8kwZYbJ2OrwqImdsIBbbw=;
	b=WaKDoYmImZL2XGpHv9O0NdKAl18cu7eS4ll7BVV5ugaEJJR6R07+QUGfWTNCJzVoF4DYe5Uy1B8j7npm8wUXIAde9BcoA8/mZjlGRNjZ6itOJKadVGZTC1MhcxqYJKIPOpR70x6a22glw/9dUjdFxVXU9OEMhzklVdhWPX2TOAU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R531e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XDkxfAa_1793329318;
Received: from 30.221.129.214(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XDkxfAa_1793329318 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 30 Oct 2026 11:01:59 +0800
Message-ID: <736cc238-0af8-417b-bf3f-5e8b002badaf@linux.alibaba.com>
Date: Fri, 30 Oct 2026 11:01:58 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/34] ocfs2: don't set SB_RDONLY after filesystem
 errors
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-mm@kvack.org,
 ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-btrfs@vger.kernel.org, gfs2@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-20-2f44f64f0b66@kernel.org>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-20-2f44f64f0b66@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_200205_352931_6EA9523B 
X-CRM114-Status: GOOD (  10.36  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/30/26 12:07 AM, Christian Brauner wrote:
> With errors=remount-ro, the default, ocfs2_handle_error() sets SB_RDONLY
> without holding s_umount. If that happens while the filesystem is frozen
> through bdev_freeze() thaw_super() leaves the s_writers rwsems locked.
> Writers hang and so does umount because ocfs2_shutdown_local_alloc()
> needs sb_start_intwrite().
> 
> The soft read-only state doesn't stop modifications on its own. Every
> read-only mount sets it and those still need transactions for recovery,
> the local alloc and the truncate log. Everything else was stopped by the
> VFS because of SB_RDONLY. So call sb_set_emergency_ro() instead which
> keeps it that way, and keep setting SOFT_RO for the existing
> ocfs2_emergency_state() checks.
> 
> The xattr and ACL setters get a check of their own because ecryptfs
> calls them without write access on the lower mount. It sits in the xattr
> handlers and not in ocfs2_xattr_set() because chmod and setfacl store
> the ACL through it after the new mode was already committed.
> 
> Quotas aren't enabled at mount in the error state because that writes
> the quota files. ocfs2_sync_fs() doesn't flush anything anymore and a
> remount to read-only doesn't suspend quotas. Q_GETQUOTA, Q_GETNEXTQUOTA
> and Q_SYNC can still start transactions. I've left that alone.
> 
> Writes through file descriptors opened before the error fail with EROFS
> and umount completes instead of hanging.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Looks fine.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
