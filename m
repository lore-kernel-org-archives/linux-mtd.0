Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B7AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E1F60EDF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2E1F60EDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+7O928oYLk85dWcSwDLE+4gIlYA5wipIjrvCmRCjMw=; b=qHK6JbX8OVdbZ2
	KkezRTpELD1hO2PIwD/Om6VjiHQ5UTFz1B+9z2p40+X5zggX+cjDruuRwX82onBFkzRfiakAFfvO5
	3NSJBvrZNDXPsnCZ9LLBvMww5E/h+B66pYHmMBlczgD7YWVoVT++iMqYfbuRQyy+JJsWk14o8/3d3
	7yGuNaWGnxLRUmTMZegxp/gPC6+EVLuaU4sZI38n6Ayf9U3EB7HCEjNiz9Vz13+8/XgQu7zs4zr0L
	QyAZR55Opf5NpbND4MKFpwnaLVnnpLEvCaNmA6Xp2xVMK283cFEwQRW5cWXSM64XbqfnfiwG7cW0u
	+YmI5q7JHNN8J8wX4y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYmV-00FOBm-Jt; Wed, 13 Oct 2021 07:34:31 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXSu-00F5t2-H6
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:10:13 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so1408788pjb.3
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HKDYpp4YSVsNULamooLUjhsr3ltG6/c66elTMRrkKgQ=;
 b=NoF0hG29o29DKsntYKpCXV92mD6h6EMom48z8tQzSN8FHu905ky+Xz3bE0nNtk4PY1
 0HNqwx/qtRzx7vXjuatnB9t9z2CQvezADG+ChrPjw5Rsdx9XyUR9gAFLAQnuxS6pqLaj
 euLxlv/sHfBVUNSEFnk9jxaM9RIcQ1jZpnz4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HKDYpp4YSVsNULamooLUjhsr3ltG6/c66elTMRrkKgQ=;
 b=KA0WKJKg9VybeHIUvIxS725ipOzsetCPXDh6nDDBmDi5oI6j0940Mjs2Lw+DPl0ayw
 Rzo8KJaqEQjcYXxmlOjunecTZqwOWyq20+ibKlEAepUcBdNX+8bQf4OqyEtOrEfz5z2A
 k5bSWeCPT+O4ah6HxVtVV8kg90EdihCZxjkcvYVYkhiefKZAxZjYpZd0mk4p7+W7H4uF
 LS0PJ9cAFVfzGSsckeE8/KHRFwj9WsN9UOSEtGqnuiCQwApESS+O6CYiboOOIkncloUP
 xODkbXp8+UeNYnKzJLyutRRuo2UIV2Ee8c5d4PZxvVmjLP28SQ1LMdtnQXoEL5D2+Vge
 33sg==
X-Gm-Message-State: AOAM532B4do/K7H9A6I1W5jxY2/JzChYnH/W1zGPqFGiQpYc11Svj2Df
 8NTUd2TNcQ8/iCLXBJBZxC9fqg==
X-Google-Smtp-Source: ABdhPJyI6aPzBzGRPPEaJuKfUq0XfZkLrckDtvce+rfY8Gu3TkNHDTrcv1RgahLv6GETviOJpuuK3w==
X-Received: by 2002:a17:902:f691:b0:13f:2034:7613 with SMTP id
 l17-20020a170902f69100b0013f20347613mr24197069plg.81.1634105411698; 
 Tue, 12 Oct 2021 23:10:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z24sm5259621pfr.141.2021.10.12.23.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:10:11 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:10:10 -0700
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
Subject: Re: [PATCH 03/29] dm: use bdev_nr_sectors instead of open coding it
Message-ID: <202110122310.36F4C08@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-4-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_231012_609982_E48B7820 
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

On Wed, Oct 13, 2021 at 07:10:16AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
