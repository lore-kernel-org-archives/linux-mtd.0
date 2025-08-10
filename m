Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457CEC87FCA
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 14:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiRaXAvutkaqNbxHD1oPDA4xWB/eWBD+eiUVE3Ti7tQ=; b=i2zDYavoqFolCc
	WIVzsp5ocMqR3FVYiSP5LEb2xrTBFhjHL+eo18D0LTT4g+3u+JV+dv/mPjhJcODtt8sw2XBpEqNH4
	x0y7TP204gZgwy3rar9Y7ydnjQGAvUgZZ/ZRRLz/SZ5ayn+HSwUJgvENP9Ha+6qlah8DGFFqQApd4
	G/3jls08Kt1J6Rp03tnZsXmn9oPd/i57lOFjKW35jvW2xDgEjD1GrnAMEG3uKLc48YXi4nSmC842H
	x2EH/A9mmvOnF4SLxPXJn07NmFm/MXQyDC0FnbupDtgNDsTr1jbf3OrgrdmehKW0WshBl+H/qZSS5
	kfSS+ZORXb2qgDmvQHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7Mx-00000005iNl-1R9l;
	Sun, 10 Aug 2025 14:49:55 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7Mv-00000005iNZ-2w7q;
	Sun, 10 Aug 2025 14:49:53 +0000
Date: Sun, 10 Aug 2025 07:49:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, fsverity@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
	ceph-devel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v5 00/13] Move fscrypt and fsverity info out of struct
 inode
Message-ID: <aJixkUfWPo5t8Ron@infradead.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> This is a cleaned-up implementation of moving the i_crypt_info and
> i_verity_info pointers out of 'struct inode' and into the fs-specific
> part of the inode, as proposed previously by Christian at
> https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/

I would really much prefer to move fscrypt to use a hash lookup instead
of bloating all inodes for a each file system supporting it, even if
very few files on very few file systems are using it.  With the fsverity
xfs series posted again this is becoming personal :)

You mentioned you were looking into it but didn't like the rhashtable
API.  My offer to help with that still stands.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
