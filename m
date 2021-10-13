Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849EBC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A15560EDF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A15560EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+wcxZD5a8ukEGhkA9cI3p51q3LW5PNDBUplE8odPGU=; b=B/p+2HlE/ZofSV
	c8fRzPvofFth8IUQIpadsBpXZtoMouF6zx80uQA337dT8/LIJk6pC0AZdlRRvAKZP3KUNXZNUER/Y
	IZAnwl+ZRT5PcVNaZBd0j65PVy/WbVh7ahCc7SY7UtrtOVYEu71Fc7McWy3ZMF7CNHmBoCRjE6FtQ
	9zekkB++NkZ2gc7elazhdTaVwDGNHqBiHL0dgj3kbqh1gRs+dJac0KuFD2KVltcB98QVSE3XR5KnH
	i2gSdxW4sGcN0OE85jJBQrUZWgW96Onjo57AgyPu2Xc5H6MrLIjkOvs5Is9tbntpJ5ymndFrDT6wR
	g3oYr/lqZedWPgBQxEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYwY-00FQqw-SS; Wed, 13 Oct 2021 07:44:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXZE-00F7NL-VC
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:16:46 +0000
Received: by mail-pf1-x431.google.com with SMTP id m26so1542912pff.3
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WC8qlO5hS71mDqsT8bl0w3ijZFYGEZDCAo8tBaqenJs=;
 b=aGzx5g9EmfagK2VYJKbeonxVbvTyFyy8ubTg44u1Ahx/MTDIDSZon1W91/+YJyEM+w
 qj/Bi7I6qMRTurFfMFJfRoGMnC8vVMBa/lQEQP7VCzyqkR4kCDSqk5gFGwAkYxrRmLwC
 vKA47OmSM4jrpJqdnIRH8x1Z1vvipau07Niuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WC8qlO5hS71mDqsT8bl0w3ijZFYGEZDCAo8tBaqenJs=;
 b=EXYbYcOsK4Izgjj5eyUvvRshjpwt/wpt0Em8T9X978xeExKKVlNQkKNtxR4FK2b3NZ
 ILgOE3wUFmrjfJO/7VBFvO9gqM7cRwavfGEXumjom/wNvRLWoc2xPYJT6jQV61UA2ASl
 J3k/p5nFz7e99ND9ehCwFYXUkjPmO+jZ6/wt5KtJapywLPHlQHVqhOFQfBqPjZlAe2ig
 1Cc0NEhFuzdbzFD5yShrNscArKmIx6TmTpBHe5Blq9Y27b5bF8HPsz/pgc1pw0RrvWrK
 EjQZ+CkjhsClHdpvuvIrWzVDOsFcIdPCZAzSkE7xn8B6ZKbf8ni/fIWiIolH2nRV8P+6
 bx/Q==
X-Gm-Message-State: AOAM532nOh+zhz1WRfhC+6MDZFWJob3YbQRnA2Pkzbsu80sYQPc9l3Yt
 zdaPJTcAX+BvMC/czED1R9mi/Q==
X-Google-Smtp-Source: ABdhPJywBNvyfgfyQbknPTYchwSJjS8lkA7Ed3FT30CWk3r+y/Lrw7XBaVRa792lS0jCj03fnTC0tQ==
X-Received: by 2002:a62:1b8e:0:b0:44c:9318:f6e1 with SMTP id
 b136-20020a621b8e000000b0044c9318f6e1mr36636622pfb.84.1634105804176; 
 Tue, 12 Oct 2021 23:16:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z4sm13596761pfz.99.2021.10.12.23.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:16:43 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:16:43 -0700
From: Kees Cook <keescook@chromium.org>
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
Subject: Re: [PATCH 14/29] hfs: use bdev_nr_sectors instead of open coding it
Message-ID: <202110122316.C8D15CD2@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-15-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_231645_047488_544B8D8B 
X-CRM114-Status: GOOD (  11.67  )
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

On Wed, Oct 13, 2021 at 07:10:27AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
