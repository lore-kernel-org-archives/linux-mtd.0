Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867DC606A320
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 01:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r7aOy5IL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=mq7w0PoV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GS9i9gHs5ZQVeW/md0h4Re5ErfNjbYVibXWdvOFgHh0=; b=r7aOy5ILmqCUBs9t27QmhQdpwG
	aIXx48sYYeAI9c0XY50LqhbvcQX5o3qfs6MqPvSLsZIYzfBPoHz01BBRNyananKI38y4ZBHhrJbtb
	nPGl0myFrbelN3nL8KuxE3X2AcO+HfxUeJth6hRRFgZAadsQZB5s2/RkN7XgCLCQWZClQKmpv7MR3
	Dlnf4S37APkvbvG66RrLqQCtSLfiD6sffNN1xrWDC5nZj7/WqscNNYdXFEERjzZbr5q9Biq+ailE8
	otalVx7VicARqOx7gVYpRkh/lBQCgOA5mbz/lF6AIn4AdeowalK8WoZbwkDyKd0hiYfjlSQ+A48B/
	9Ukrfu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxBD-00000005NmG-1C6C;
	Wed, 11 Nov 2026 01:31:15 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxB8-00000005NlY-1wjU
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 01:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794360664; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=fz7Db6YPpucPps2P9eFgAPZMsl4Z2nZBpO1+iQqdPhM=;
	b=mq7w0PoVXCwu1IX5ivmHA8As80sOmn10inPCZOG+QhlYp6qb0mg+dgSd17z1pXOsln4JJ09DELsc+5awHi3JyuM1vG3mkZkxNGxXiVtr8wj0fz65Fmeo+JddfxQeZaPB2cDKH76kna5eWQAcDs3+9zCCKwZ7z1M/3EU9JhzwAZ0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XEX6F-L_1794360662;
Received: from 30.221.145.127(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEX6F-L_1794360662 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Nov 2026 09:31:03 +0800
Message-ID: <f6cdf5d0-9468-48cb-9bfb-0cc41b46c7fe@linux.alibaba.com>
Date: Wed, 11 Nov 2026 09:31:01 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/34] ocfs2: keep the current mount options on remount
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.com>,
 ecryptfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 exfat@lists.linux.dev, linux-mm@kvack.org, ntfs@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org,
 gfs2@lists.linux.dev, linux-efi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-19-2f44f64f0b66@kernel.org>
 <0a8576a4-e397-4a49-ab0e-8f0f32bf2642@linux.alibaba.com>
 <20261110-zerfallen-meiden-wacholderbeere-a90ac157e063@brauner>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261110-zerfallen-meiden-wacholderbeere-a90ac157e063@brauner>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_173110_666274_B848952E 
X-CRM114-Status: GOOD (  12.47  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/11/26 5:52 AM, Christian Brauner wrote:
> On Fri, Oct 30, 2026 at 10:58:52AM +0800, Joseph Qi wrote:
>> ocfs2_reconfigure() decides the transition from fc->sb_flags alone without
>> sb_flags_mask test, unlike reconfigure_super(). And fspick() passes
>> fs_context_for_reconfigure(target.dentry, 0, 0). So on a read-only mount:
> 
>> So it seems we should test sb_flags_mask as well?
> 
> No, that's a generic bug. I fixed that in reconfigure_super() with
> "super: keep the read-only state if a reconfiguration doesn't change it".
> That is in vfs-7.5.super (cf. [1]). This series depends on that work.
> 
> If SB_RDONLY isn't in sb_flags_mask it fills in the current read-only
> state. So ocfs2_reconfigure() sees SB_RDONLY and stays read-only. ocfs2
> is one of the 23 filesystems listed there that only look at
> fc->sb_flags.
> 

Now it looks fine.
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>

>> The same falls out of a legacy remount whose flags omit MS_RDONLY.
> 
> No, do_remount() always passes MS_RMT_MASK which includes MS_RDONLY. A
> remount without MS_RDONLY asks for read-write.
> 
> Thanks for the review!
> 
> [1]: https://lore.kernel.org/r/20261011-work-super-fixes-core-v1-11-c727176c5b53@kernel.org



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
