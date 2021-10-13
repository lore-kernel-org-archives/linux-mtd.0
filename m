Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CD9C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8F8A60C4B
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8F8A60C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myn8e+kdCs0t6S+vtUINR3stR2HUZpyeSh6vHfahrTc=; b=iIh9QRQB2A8mK+
	SNzB2x7Jpp5oNvrChQZkNxyphj7c6zJNElyAhh7ANCxHGz4+pJfInqDrST6UobeBKhzA7A4lDGmd3
	7TLt9zjD8JkSnm3YcBKLOE7mJVuccTeGZJXyv1dCJrCGwvjKoLr9ozZEimwptaHun9h2eGQOTQG6U
	5TazU3z98tg8fdWJLw75nEuBObnRadPfNM9+QFyzeQky19idw4iuRq7NZapEX54G/gMpAIliZH5b+
	ZK/ZwWLUYhWYQt7HD3aApwLalE0fbt5OXLBeOWYmVNqvZ9uHVE/QolDVT5EY0uhNdU+XDH6xeuZ2p
	dLl03cQy5RjgytppQlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYp6-00FOzi-Vo; Wed, 13 Oct 2021 07:37:13 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXVW-00F6RW-QU
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:12:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id f5so1278012pgc.12
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1H1JJFKjz05y5oj0p755Wd9Nps08CHOHEplJ5Y1g+2w=;
 b=FnlM9CdvccmU4HmqmwsZQ6mwcBwOhpuSMmvAcPJz12hGrzMLx0wE72HESKXT/FSdf4
 7+542Lua7V4TbazDGNap5DO9Pfw7c/uG+qyBy3qJkapOn+6ER85tMNMzt8DzCatnHQL8
 8qEBnbzhJGY53T8EWVA6JlX/GqGluU0pFlO7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1H1JJFKjz05y5oj0p755Wd9Nps08CHOHEplJ5Y1g+2w=;
 b=j7tSQvT+D5vE3C23+XziUfw8P8uq33gRnmzjJyIOJkjNk4rQBXyj97hC5O14a/w8HY
 kuOqmdc+sRM084bPHvBOXuYKciPk3OEmzD67riEVtRZurq1iFnvlnxYr6zKjtXia6eb4
 6yi42PpKMS9U7mL8OVWfcWxjVKkJXMzWryPKuxWgq1XHVYit4I/v+4OJXysfXZWPhrAn
 NtX2+YY0KUWFK0xw37a2UmXF5Tx6dtPO/RBIDDAr/W0FymjfvYQHBXMaR3PiBDwGcuOQ
 JK7cRKgAB7U3JlmJ/FwcBHc4AvkDJRHVm51PnG2FViwfcH8sbcNEBzDlQEtvCA0oCl4W
 RWZw==
X-Gm-Message-State: AOAM530cBBf2+4FWbSrjtzzb7dieACMTcUWt1HEPbGggkaP+2I/DaIO4
 Cr/B+qF5mbP1p2h6slc32NMJ2A==
X-Google-Smtp-Source: ABdhPJyo2VCUKF6kjMdrI9PCDmpBjFpUCoF94Pv9htxPPsmjtX3akcms7YpvLn8ozHxuI/GsrlutsQ==
X-Received: by 2002:aa7:91c2:0:b0:44c:a5a4:43d4 with SMTP id
 z2-20020aa791c2000000b0044ca5a443d4mr35433093pfa.20.1634105573663; 
 Tue, 12 Oct 2021 23:12:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z124sm12774767pfb.108.2021.10.12.23.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:12:53 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:12:52 -0700
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
Subject: Re: [PATCH 04/29] md: use bdev_nr_sectors instead of open coding it
Message-ID: <202110122311.B43459E21@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-5-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_231254_918598_85ECD732 
X-CRM114-Status: GOOD (  12.74  )
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

On Wed, Oct 13, 2021 at 07:10:17AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I think it might make sense, as you suggest earlier, to add a "bytes"
helper. This is the first user in the series needing:

	bdev_nr_sectors(...bdev) << SECTOR_SHIFT

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
