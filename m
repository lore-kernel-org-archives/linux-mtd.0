Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F462C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:38:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0956660FDA
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0956660FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1pyAXccDx7SLl6Em66e8sAzp+pyjimyxT6WFbbYrX4=; b=yWGcTJLOM+1O/n
	Ydj0G/RaeQjrJiqgIw4ezeoN6MbkBHJzB5f8NEi5GjoaaBy8gp0ybjIJzYRRn1zlZCJPe9oyaHvMn
	5ujzVv1kWqAq2ovm+FceX73Vc4xVQe7IFL1Z1Giqd7WcNhu5fXyn7zWrq3H2rDl14xOVuM0mRoEu0
	3NhZDhl8gVmqdIHS75iq/KjNsUZblMY/bNqikrxkVPic9+hAVMdWNVcToeUO9WqJ7V8VmAGJtwRhW
	a5zrRcyzAFShMejJnSIvItyaF4+w5Wuhmt4IFv1wofEvWETG2xnll0WeAI8QuoeOXPsjpFmgQMbSx
	JKepg4FeKm6uZdDB9j6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYq9-00FPIx-1s; Wed, 13 Oct 2021 07:38:17 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXWq-00F6oW-0a
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:14:18 +0000
Received: by mail-pg1-x536.google.com with SMTP id r2so1292065pgl.10
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ohUOQyC8vv5S9fFmDSqrC2HGxb4XvUeywx+2/I7KWZo=;
 b=frRmuaPa3nXR7lxMr1CNNPYB3c6MDWaV+IHcoR+XuNXpKLmcDJudjmJiNd/vJuYFPn
 yeOjEGluCsqDt4qWvY1oHVWaypcD/6hEY+cvzA7LDBwWjS32G63Wnxe8e0GGmx9dGa0p
 xQzhoygleJQrWshzo5X8hdFcW2UVxu2kZRAXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ohUOQyC8vv5S9fFmDSqrC2HGxb4XvUeywx+2/I7KWZo=;
 b=FF75oQ7ThvEAXdbMJeKhvfTd9gc8IzsPQXnbmJK6vKcsacB9WP+wVW7aVz+f7x0lb6
 N3gIbsDxRzCZ5Z72i2xV2F+Tm74hcxWKHEgMD0HNixrf4PSNtWx5pIhmtXHJWHk6dgaT
 dphpMB36UoyA30giCJQeQQOidlr28S2jgYVgRuBkVrs1IsviDRD3X+DhXXUCVkYftZOu
 T2z18y2TfIqUJbpa0R7DA7AEMUC4MWIQvlSypiSJJm3WBSncSeXCwd4eUYj1IybXG1mR
 J2ZEfoGhNsfTqQFgsvYnovp0azJO0IxVe7nSC/+aENgW2Z6poHZneChEYH0V781Vclc7
 z1WQ==
X-Gm-Message-State: AOAM5338fm6XVLX1uqbkYJ5uKA/Ya52jXY6cZsgTq6DJFFFHJMPeJeRP
 Tb3m1RfjT0IuzvzVzbbjiIVYDg==
X-Google-Smtp-Source: ABdhPJwNMNbppcyyaPyGGktYQSHeAypT2bIkLVBhhieDA7TSPn60W6m8F7nQfgJZ/E5a6hMyK4Ynow==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr26380948pgh.190.1634105655240; 
 Tue, 12 Oct 2021 23:14:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t8sm10813622pgk.66.2021.10.12.23.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:14:15 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:14:14 -0700
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
Subject: Re: [PATCH 09/29] fs: simplify init_page_buffers
Message-ID: <202110122314.664187AA@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-10-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_231416_100673_C76A8655 
X-CRM114-Status: GOOD (  10.61  )
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

On Wed, Oct 13, 2021 at 07:10:22AM +0200, Christoph Hellwig wrote:
> No need to convert from bdev to inode and back.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
