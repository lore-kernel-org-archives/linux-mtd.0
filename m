Return-Path: <SRS0=8j8Y=QY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07657C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Feb 2019 00:29:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C994C2190C
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Feb 2019 00:29:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5T4VbLD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C994C2190C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fx0z1Egj5Tm7sskVdDmxCWzSZ/zLmEGbJCYaxp0Zyrs=; b=c5T4VbLDHUwXpP
	PkmqXNzGd1Cpxr69h5dSuokeOhZ89sErWbhvjrpPWTn/8o3KO1zr54dv29xgFJdBmBDKdt3sjGrLP
	jBvdEOF63H/u1ClvdjKG/6k8qcVlD3lphY7mH8iocqOIQciB65YnMmrsux3KGTIBZU19yKXicL56v
	tdmMa6Pta97yfJmoLyOy0xG2HWYFVIDp2yqwvQtcKNXVoX0RIX6UD5dxEGPWDTwtQ9ANZvYFHnRma
	Cv2HJyE98CUa/DplWB0bbTkRj2VYZ1STVtUQrggAeP7N1XARiF4RbvLuai6M4VfKt37Wg3WttbaVA
	mbgY5yP/Yc/eQivOmYag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvAL8-0005ZT-LG; Sun, 17 Feb 2019 00:29:50 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvAKz-0005WB-Ci
 for linux-mtd@lists.infradead.org; Sun, 17 Feb 2019 00:29:43 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.91 #2 (Red Hat
 Linux)) id 1gvAI8-0002rx-Ve; Sun, 17 Feb 2019 00:26:45 +0000
Date: Sun, 17 Feb 2019 00:26:44 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [PATCH v2] vfs: don't decrement i_nlink in d_tmpfile
Message-ID: <20190217002644.GT2217@ZenIV.linux.org.uk>
References: <20190214234908.GA6474@magnolia> <20190215223925.GO32253@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190215223925.GO32253@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190216_162941_431293_8942F4B5 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: linux-xfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 tytso@mit.edu, linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 richard@nod.at, yuchao0@huawei.com, hughd@google.com, josef@toxicpanda.com,
 adrian.hunter@intel.com, hch@infradead.org, clm@fb.com,
 adilger.kernel@dilger.ca, linux-mtd@lists.infradead.org, jack@suse.com,
 dsterba@suse.com, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 amir73il@gmail.com, linux-mm@kvack.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 15, 2019 at 02:39:25PM -0800, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> d_tmpfile was introduced to instantiate an inode in the dentry cache as
> a temporary file.  This helper decrements the inode's nlink count and
> dirties the inode, presumably so that filesystems could call new_inode
> to create a new inode with nlink == 1 and then call d_tmpfile which will
> decrement nlink.
> 
> However, this doesn't play well with XFS, which needs to allocate,
> initialize, and insert a tempfile inode on its unlinked list in a single
> transaction.  In order to maintain referential integrity of the XFS
> metadata, we cannot have an inode on the unlinked list with nlink >= 1.
> 
> XFS and btrfs hack around d_tmpfile's behavior by creating the inode
> with nlink == 0 and then incrementing it just prior to calling
> d_tmpfile, anticipating that it will be reset to 0.
> 
> Everywhere else, it appears that nlink updates and persistence is
> the responsibility of individual filesystems.  Therefore, move the nlink
> decrement out of d_tmpfile into the callers, and require that callers
> only pass in inodes with nlink already set to 0.

NAK.  You are changing semantics of existing helper, requiring to add
boilerplate to existing users.  With zero indication that such need
has appeared - no warnings, etc.

If you need a variant that wouldn't do nlink decrement, just add it
and turn the existing one into a wrapper.  Yield smaller patch, at that...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
