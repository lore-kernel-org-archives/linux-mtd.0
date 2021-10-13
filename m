Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A575EC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 08:06:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7605060EB4
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 08:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7605060EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nr6LDS46GLCvE7pZ4wIoCUfNCSd7gz+/y3ZtDlppXHE=; b=2P/QrzPrduVj7p
	Nkptw49TVeGPSvmGUDZH3dWlgpMzYmTmT3J67ZiaBAGlF01gPTKJM78AvAXF0ydgPBFCtKpRxomOl
	OkQBnbwJMPDN9sB3WJZ5gI89zIhcQtyoeU6xGMswx5zMBvB9jWBDoslsPda4GXN1wpdsHrms78NaA
	RJh8qbPF6cvBkY196/OdqJYOLZLpkiFF7bsmv7/Kv+/o0WEKjqtKfAU6CXkvLnIHPCWFudVxqFMuC
	0YMQ/dFm/759u5QXXFisHNcc9zXVHQFBhsja7Fas3o9Xa0Xbb5XqLecUcu98PgyA+uKqMwdNFtzRX
	p6d/LMc8FIFpO7+Upr2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZGD-00FUit-0o; Wed, 13 Oct 2021 08:05:14 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXq7-00FAHS-6p
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:34:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id f21so1129446plb.3
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6VbHD8PBwfaj43ljVUZZGyMj52YEmx4jfqAsGhf6+JQ=;
 b=AvobKbPMrQUDEUEp6fPFubcGItxc/wnKkqnDSAjF2JOJIzD6GaHgOkeTfLVH2dVkY7
 athTU5gaBp9pQ5+vN8pGXUoM6NXB9m94GmbcWoYtzrCupD5haSLJb51jgUAYN2bie92y
 Cw/fWMm7nAHe57gHGr8VcvjTAn4+/uHsWTDDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6VbHD8PBwfaj43ljVUZZGyMj52YEmx4jfqAsGhf6+JQ=;
 b=evqqzKB8sI4ZTUl16wG+C3LOCCQqH60xXC7AucTm9Vc8kTU9XFpbmbg6yMirVkRyJd
 09P8o1itNhXagfqLEzhUUOs33KQeV79AADzh0xlRNQAW0iG/2e3FtKI9xSxmRtZrZGVf
 hJIPaHgxX90wznSe6o6zHC/y7hVh54Gb7rYQqxM7KbqW1icNxSyoyd8J3hniK9K7gtiJ
 BC1FT1qESdC7I5dSxXi3+BI0ZCYrf9cILo7jzFImuEydXnYDVztpBxA5YrBy85FWgIo2
 JZHWyPaUFQugC00cVzOg+5AmwalHy/ElvbqyNkcDyBGL4RG9PPXD7HNV8TXJXWp+anqR
 9q2Q==
X-Gm-Message-State: AOAM530tYSZQTwfznElwS4WyuvLh6N0obEp80rFtHG/uCYXLmIKDtgPV
 Zy2MZ2b3uUIwFLM+BWszrHNWEA==
X-Google-Smtp-Source: ABdhPJyCtmPDTqSGxs9iwHCnitZ1F86E6zXvgsm3yviJEZQtBzg0xs5Q4LZVn9iTvPOonDA6xdZ1cg==
X-Received: by 2002:a17:902:f683:b0:13f:2fbe:498f with SMTP id
 l3-20020a170902f68300b0013f2fbe498fmr18917273plg.17.1634106850602; 
 Tue, 12 Oct 2021 23:34:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t3sm13004045pfb.100.2021.10.12.23.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:34:10 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:34:09 -0700
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
Subject: Re: [PATCH 29/29] udf: use sb_bdev_nr_blocks
Message-ID: <202110122334.7A3E933D@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-30-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-30-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_233411_303427_8E16535E 
X-CRM114-Status: GOOD (  10.98  )
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

On Wed, Oct 13, 2021 at 07:10:42AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
