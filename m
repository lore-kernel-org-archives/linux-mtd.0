Return-Path: <SRS0=DRVm=PC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B5DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 02:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71D661130
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 02:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D71D661130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUomrWAMt0GgC2vFl/SrxYa88GGCggxE5Zvaic3ik3o=; b=j5aNWQTDyJ5p7D
	PBFpQmgDvgStvYnJt9N2/CBP5KlvIEGhu7vW/VC+HkPLaJiN0dBLpk78IxeB7zGHtovPi3uArBYIJ
	FjdhHVDzBuBA2SNT7DcJQSR6c0iZqOjvzVJxzYga/R0lEDYCp5C1V6BwK8XFBHy9ir871twXRZn1A
	lT8fORWgD2G+qAnUc28vvxE4707cRl6OKof60xR3iYx+yDSx0nORbofPqeAuaWHOsIucmR+Co+ePH
	DvYx2NzxQrF0zRzwfGZa23mptC9ORIMU7/VIcKzSJxAONolEvWWpaiZAFQyP/Hr5I/6BtOyaTIK7M
	ZVInjigcyR8bAvFw81/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maqjf-001Ji0-RN; Thu, 14 Oct 2021 02:44:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maqjc-001Jg6-1q; Thu, 14 Oct 2021 02:44:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94F2A610E7;
 Thu, 14 Oct 2021 02:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634179482;
 bh=It2mkzx6TjfzrxKa1z+glKX99V3LF5sLjb+XStt8Wuw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mzz6lXM/GRSQKnipiuaTPceCHZUCG+Zwebj9V2e3D3u8BDYOSVlhmPweg8g6YiI8d
 r+FzG9sPVr+Hk4H2lOIBtjdINIDEutvPeEs53/z+5bq+4EPnsRZGELeTPAvwoMl5bY
 D5WR/vTtqwKDBMa4OMVf2PvJL0TBX8SE4EyM+00T66l6gCQbaCkFBvjZHr4BqEXJ5u
 yuO9zeVQIl48uQmyOc9Be0MLM+3GoQiZYDItlKL+q86y0ZlJKAGDhfO7K6kMaufy3f
 D7Hd7Q0saLd9aej/pORbgOIvPmwFjh+idyJi5NYgYOFIwSmTP7R1qlYbeAyhEajjn0
 kkbqUUfNjdm3A==
Date: Wed, 13 Oct 2021 19:44:38 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
 Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
 David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Theodore Ts'o <tytso@mit.edu>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Dave Kleikamp <shaggy@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Kees Cook <keescook@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ntfs3@lists.linux.dev, reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH 11/29] btrfs: use bdev_nr_sectors instead of open coding it
Message-ID: <20211014024438.GG1594461@dhcp-10-100-145-180.wdc.com>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-12-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_194444_158364_0EE96D12 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On Wed, Oct 13, 2021 at 07:10:24AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.

Just IMO, this patch looks like it wants a new bdev_nr_bytes() helper
instead of using the double shifting sectors back to bytes.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
