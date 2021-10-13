Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE540C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 16:43:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7142C60C41
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 16:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7142C60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nb62o1bqFL1Ut/XmhR1Io1enn4YNqfzENlL4QoLgV+I=; b=ceqFNTfY+Rfzir
	h3wrsZ9qZs+c3VDc4h6ywUQPGAdnjxGgfisT26tcy5QwDU1scZghh5RxNKJ5vuL/Pss+SDVzSj5to
	6ZPATXGrhp3bu4g7yqI46tzFBDoeXDN3CJYj6/A2XULTP3qWCUMhV35hccCDeik4lFZI/77VamtUb
	sRriq/xSHIuZ5B2KvvE0mU8rvBZsdS2xKn2aISCKCuh9Nw+geenNYaOCW4bFsC+6sXHGpGs9ZcvFT
	nHb5tByii5SHRzfK+g+UXHsVZTVP22NWamA11WX7S8DyxY8oELp5mAUkgV0FkaDDt0PRL4POYgtKd
	LdspmvZ+buEdm4wSgOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mahLd-0004Rl-A0; Wed, 13 Oct 2021 16:43:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mahLa-0004QL-7Q
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 16:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634143397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DvE9A+LL2XADoLsMv/QT6HGglilUC7cXAXtJNsfa8lA=;
 b=f/s+gXimjLwSNfhiur1ZGhhT9g7DXU+Mxp0V/paWn4zvXi4yNJCKLjQeHTy9bZM2duOaUv
 KuSaerP4ABfoH/kd51u3nU5IoSsHeEiMftTY3g0iA7z32tUhI+u2mvhpAI//E4nm8k/F1C
 PSuoJpBSCkloXh1VChZSPWIu8TVUBvw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-1xi2oNVWOc6NLHP6P8ik9g-1; Wed, 13 Oct 2021 12:43:14 -0400
X-MC-Unique: 1xi2oNVWOc6NLHP6P8ik9g-1
Received: by mail-qt1-f200.google.com with SMTP id
 q24-20020ac84118000000b002a6d14f21e9so2503117qtl.9
 for <linux-mtd@lists.infradead.org>; Wed, 13 Oct 2021 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DvE9A+LL2XADoLsMv/QT6HGglilUC7cXAXtJNsfa8lA=;
 b=gzLW0iM8TiMGWKUGcMNzUS8fY1je4ffBWA5xGlnA37AtJ02lhCN8hghBat1a6U83Wj
 1ADpU8/CDTzPy8tGJLAbhy9vetkSFZsg91br8GjPaYV839FNg2xeoGWvnD2/Hulcpn+h
 TRkX8Cd3v81YJhAnz4Sr2f1+fUZEnKEAVHKL7hU8w+4SFbLvAXlyfoMds7KucAfkQn5m
 spnaX5Zo/lig8TItgV893HO+9p+5tsVLs0ZQB/yFqmRpV7nKgxL08ChkZroRvOTlMCd1
 7luqeaqkU+h1Sh3EjA6uKZR5gjIRGcqGw8W+3eoW6aRp33uny9uGNt9DogMizbSTNBqG
 X3yQ==
X-Gm-Message-State: AOAM531dqDX7r7HxnO07/1KWpU6Q2uCR0mP2TG6r6F9djRggbYb+sIvf
 Igwv3+St/fEugXZUT1V/+pL2g7/XX1m5+KVkbUfLDUIhQ5lul6rl924t9UBFUyrrDG8trzy1/MP
 GLmY/dHbKy1VrCBH2xGvmrd0u
X-Received: by 2002:ac8:7d02:: with SMTP id g2mr450200qtb.66.1634143393827;
 Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4uQGBl82DdkygPL4oygkwPDtljuRYBV8+ESqW4tKnOahM7pZ+SYljUTQ3BKpa4FdVi33PjA==
X-Received: by 2002:ac8:7d02:: with SMTP id g2mr450159qtb.66.1634143393507;
 Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
Received: from localhost ([45.130.83.141])
 by smtp.gmail.com with ESMTPSA id q14sm77870qtl.73.2021.10.13.09.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 12:43:12 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
 David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Theodore Ts'o <tytso@mit.edu>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
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
Subject: Re: [PATCH 03/29] dm: use bdev_nr_sectors instead of open coding it
Message-ID: <YWcMoCZxfpUzKZQ+@redhat.com>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20211013051042.1065752-4-hch@lst.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_094318_352684_5D2ACC2A 
X-CRM114-Status: GOOD (  10.43  )
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

On Wed, Oct 13 2021 at  1:10P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
