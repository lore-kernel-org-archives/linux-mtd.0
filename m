Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23EBC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:33:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF2A608FE
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFF2A608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqlBigXIXo5dQWSdgl6xiPNpvmYTVF1mibGzdVzwFDk=; b=n596z9MFMS8G3+
	wabndR5aUskJndkykrlobVE9WId055UI9YrghOUFpMrq846ulE87v1FepuqQtFjfUzzkc6ubSXRUF
	Y4YfiLxg9R3nUaS9gAQz2sebFqnVMRGGuDzOSx1kahTbTnOSy/LaRUJBWX4HR4kqlrcPx7qOfswSE
	xUuYCwFN+0CgZZToQSHPGSyTWMVwQo/AyD7t+wHlZNDHK8oTbB7x4zjIHkLf/ErAAYA9rTDbafQqR
	5IWLw36xJKQPkt5s+fSAdsTB13uxpgHLIxPdSp3bcVcFIwhuYQ1hLnCAtja6T4BsL2a1GLB5T1Paq
	azD2N0UsnWMZHiii6a+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYk5-00FNRw-AX; Wed, 13 Oct 2021 07:32:01 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXS4-00F5hB-UQ
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:09:22 +0000
Received: by mail-pg1-x52e.google.com with SMTP id a73so1335160pge.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qqwh23O6V/63P0yRnTO77bOtLRcytQL2fAyeRI5kB34=;
 b=CXM9rJHHK73rEQgm0mgdKmXS/wAofOl4OFPnwKac/DX3XFO3SZF+VUOO6mlfTZkIDy
 UTW+b9/6/6WoMA5ZI2y3esBG93Aw5k00FZrNw4PEm0iPy6yRGylzqCSKEzZCYiYZiEa0
 Gvi4MQ98yBAEGpxPU0vceWRTRPKnOulu8VFrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qqwh23O6V/63P0yRnTO77bOtLRcytQL2fAyeRI5kB34=;
 b=mSdjadZKPmUJ+yl+63ZT6TKXcH8XUtWd9S+aeCyQol46f5IxdkPCOBP5XdvhhxGbWG
 KCZm7m+U+DSuykIpMn/9UO31VK/IHoULuhwkDjAGxV69YGSGzQcbDKGJPfyv38cp4xAg
 nIqwe9xWZmcdp/esrtbwiU8RmTn7qTmK99ulRs56h9Cjbc0fdgaIrNEQlw7pQ6uaU+Aq
 ZRlAXuBqAwJzKIxBhrLs33VlcxTDZyGLs44jS7btGkiHQ52uKKD5Mxd1ROXMBFZpDF3H
 pIi3vAgmNPU0efW0wAm91Vhgnw+0r2ZCkRnPkdW+zKjeooUmsuYojubjMKmdNAjYToY0
 0fcg==
X-Gm-Message-State: AOAM533sGVTngBlONy2di0P6qRtm0rLfXA9lSAMAAbRnPix95VCKyV1K
 F3cYTOeAz//oHSdTs0RRKDZvhA==
X-Google-Smtp-Source: ABdhPJzPVB6suksbrVxsW8arxDgbrt+zmZKpBhbvkmkjyXI+mBKX9gJNh2h2afCA7c0GFA7FKUgXzA==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr26426089pgh.7.1634105359458; 
 Tue, 12 Oct 2021 23:09:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e6sm12787858pfm.212.2021.10.12.23.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:09:18 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:09:17 -0700
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
Subject: Re: [PATCH 01/29] bcache: remove bdev_sectors
Message-ID: <202110122309.010F81F49A@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-2-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_230921_057628_4B5B6874 
X-CRM114-Status: GOOD (  10.44  )
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

On Wed, Oct 13, 2021 at 07:10:14AM +0200, Christoph Hellwig wrote:
> Use the equivalent block layer helper instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
