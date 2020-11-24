Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE2C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FE1A206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mI/9YIrl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7LkmYjx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FE1A206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=33b1BnQQQeEye+3X2eCQqMq6OeKF7i7kBrL2fn/rbOQ=; b=mI/9YIrlcenPgQSedYMqH/FOW
	uIST/yd5ChUBj0ww2ltfO4LAqCigj9dYIn/oj4yeNhrGKKSKhIE68DxZQSKr7nCh/iBfM0l8WPWXt
	m22OAfZCrbj5yHSH6UbanHD6gpbuTl4lCLF/X6a92d8kqtmsrT85AU08IUwtVS52gEnREKAlXkuyx
	Pn0oYqPeNOqqVNZ36Y7HRis9L40cCHmLKWituFMlUC8G/qIduzOZnZgmZvXq9hposrvGWOTSFLGRb
	Vco95fHFFHHS5Oq+mIk6hOBh/8u9BKb7bs/QRr5E60puMMp1Y1x4pKwN7uZCDBTfYU0F513pFEpVs
	f71YZpkPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcH5-0003Pq-RU; Tue, 24 Nov 2020 17:38:43 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcH2-0003O8-JI
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:38:41 +0000
Received: by mail-qk1-x742.google.com with SMTP id v143so21512328qkb.2
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g4LY6zleEye3uEtWn8BHkQWiPOUg2vGvLOmcGW0MhEo=;
 b=b7LkmYjxPrHR9TH3nlGv8RR4yt2n5LXnfymO+2DyzzU25nyOq3KZcwcvGjHXs52rxS
 +2ZXS0GcpcERn/nD7GKubAB3+B2PcUxizzfKAr8S2K2+IhWzgsJmU4g5HL09fBRhhrfd
 O9DxlLMUUmPA8UQ1XMZvrQyWKKdOK7UwZVw5EW2mNWCI7GBjN/XmPhbk3TYX7y+MWxjO
 swjqQPApTPanWu4qovGXQq//Y6ENdGy9PdgI17eJIoJsi/+bV6r0YDHFS6xz5gpMJ5IK
 uIvwIkKQlKgUDmgdCif0kTpOaJ/NZcVJOzZhxhpZTTstgSJmyH2+hiJsrfoAgMEwi33G
 0McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=g4LY6zleEye3uEtWn8BHkQWiPOUg2vGvLOmcGW0MhEo=;
 b=NzATCaU7t1rgAbD7onaMNSEfRNZC1XiR0+FVlRdDDi+2CLYT6XpN6SD8uwAUlJxI4P
 KgZYezlDLu0pE6zYY7d+H6grv0v8wQGcYU3OMacSU87lR/isGkqpO8HIenU6Lvz1k2oa
 Yx7PmydwhJioxCeAQtqL9iS//qR0CeL39PhmZUsYdsk6mosNEI+CL6p2Wd4r/7KqyOuP
 VGG1FI3XQmPW/jjDaPehQR6TLwm4hW03cez+6k/7EsR4+9B5Jyuj2UhwFrP9ndvNlgUL
 s+hU6WOQfAW5HhI4PJNPjYYpXihq1YEv94hl5qKtTDHyAKMl5yPaRlejzD2LBe6K3uvJ
 NxHQ==
X-Gm-Message-State: AOAM532mXjIyHnkEdMqbUnUAjjs7L2AOK0O62biYLd/qOtX5do+GwKmC
 Po5mARMQZ6V/vVSk/oEjekM=
X-Google-Smtp-Source: ABdhPJw43+aOSAPykQeYdeX4DmgWRqK+CIO4uPy4u98lyqJL8LkKiYWD+c6leseDOSmCa64pRPr2xg==
X-Received: by 2002:a37:e40b:: with SMTP id y11mr5925723qkf.29.1606239519064; 
 Tue, 24 Nov 2020 09:38:39 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id s7sm13183950qkm.124.2020.11.24.09.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:38:38 -0800 (PST)
Date: Tue, 24 Nov 2020 12:38:16 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 16/45] block: change the hash used for looking up block
 devices
Message-ID: <X71FCKpLZLywTTT8@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-17-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-17-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_123840_675441_9C3A7B28 
X-CRM114-Status: GOOD (  12.87  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:27:22PM +0100, Christoph Hellwig wrote:
> Adding the minor to the major creates tons of pointless conflicts. Just
> use the dev_t itself, which is 32-bits and thus is guaranteed to fit
> into ino_t.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
