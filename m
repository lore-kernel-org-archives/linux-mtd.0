Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0FAC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:34:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A00560E74
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A00560E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3pq9rj3mlghc+Cb9bVZPh5ox2DpFOhwr7vc5hfgOwA=; b=S7uofqCmcpjnh1
	YAffWjM3AivN2+QDZgzi5UfAElfek2kQWNKRVtUfOmXl2oaWMYlBbu+jl3QMkSOTnERWn1u/gCm2c
	zBp97OJSdhzC3zZTBxQwpIDoqjaU/W7BJeBVz+5xDia/ghDUskVkH3b1cxwNekANS2J5y8np0olQX
	gjNRprtXBTGOxw57OmDlb8YreDbgtpcCtqZetdy01yPSTdH7fMQn+st3GCMWHc+TZBYTEbwGGyHRK
	5CSPna3rH56Hqb94fPYO8RkVBcuGaoFJ/lZ9OMLjX4VJ7PdUjPKLTcAs6MJCoLqB3VwiJb5rhJw/p
	gZ/W+rsSWLbNeThV+/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYlE-00FNnr-3L; Wed, 13 Oct 2021 07:33:12 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXSO-00F5lt-26
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:09:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id np13so1351120pjb.4
 for <linux-mtd@lists.infradead.org>; Tue, 12 Oct 2021 23:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z0+/l2JzZcIMvRxuVnPDxpTt0N87/VTetFSC9UipIbo=;
 b=dDm5KKH54Cm+jQj+Mhb1k8rvRxfJNbsL/HRxrPpWdrzH1k+JCSsBgY9A1wItnAnyuP
 9ultcLUzRn7czy1OW9j2NX2hgXb5hjl16HGUd04L8fCWxy7FcQb0Xj95F86MpdxVurhd
 +Yoq3Vcva7UyTZ4UkXIHSgLR2MTnO/N9XCsr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z0+/l2JzZcIMvRxuVnPDxpTt0N87/VTetFSC9UipIbo=;
 b=fas+8CuYxw3maS+Fm/9pXhCZHII96V1cyL9uohDuTDc7CSiuFhH77DYHKbyFoUYTGT
 WZ61oNABT4krx+NC3zkdTYkYCWlGYwEniVulWFWUN/tD0XXC2HXyYjb0CdUiuCCr3Xxb
 AiRGRA2HexBoo0lWlF0irfCLpCZJ0x1Sdqc+CNb0QS+PUz4sEre9khXKycHsZgp6vR8v
 mXGfa9rGHncM5lDvKSv5VzcRNZi4wY2+ZClggrF51D6BlJ2/moHybKlHO5CijcArF/u8
 mAQhSHuX134sv37GOq4s47XVaqEIFx4auL/45K/Y7O41urqVUJBU/uKD3dRih+SrdAuj
 qH4A==
X-Gm-Message-State: AOAM533OpcW7xwt/uxjyeCELeje5RK+7BESKfou15K21WvWxazug6Y09
 broGpMWPS87VmCC4MUqRPmRfyA==
X-Google-Smtp-Source: ABdhPJx1Mq3qptD5w3g2Y6okZL9tWnjLnFrTXEu5gKzk6Wq6AX2hVHSkDjnl1IkjZGDzNZT+Poo5bw==
X-Received: by 2002:a17:902:b593:b0:12d:7aa5:de2d with SMTP id
 a19-20020a170902b59300b0012d7aa5de2dmr34892215pls.31.1634105379132; 
 Tue, 12 Oct 2021 23:09:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id nn14sm5323477pjb.27.2021.10.12.23.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:09:38 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:09:38 -0700
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
Subject: Re: [PATCH 02/29] drbd: use bdev_nr_sectors instead of open coding it
Message-ID: <202110122309.FB5CB2DE3@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-3-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_230940_174812_286F93D2 
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

On Wed, Oct 13, 2021 at 07:10:15AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
