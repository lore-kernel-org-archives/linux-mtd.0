Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD13C63777
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:38:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B70E8206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eb4vhAsv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5nEHa58"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B70E8206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EwbMwKLZPUuU+3scMjcZ8FuAcnUoHS7pw3hHCpQ9scQ=; b=Eb4vhAsvqr2tvbJfjiPWKGn18
	YI3nbcGOyGcf4WmLNY0/2Q8Qo19+XUGfBAYPo+LUm5LKwYeVkS+ed+LApECTZP9XHbg7Bu1b5j3eq
	kwrujlXEgyQUY6FfKZRbm3AG1YuNRIgAQXD2apgJYYFpoUSv873CGcGojBY+fbci8IrWJsXCsxL83
	xHXswP1pzRafAJM3zt3l5L0SfzPcIi4dTYNN+n6F3nr68eTvWqkTOpa5pu5tKKOC25UJNKOiiChKo
	qoktQE/JHrwDeLKGFPxLjHFOYBlTf6CEY3pfaYLEjhPP5syA24uXGosdnEXE1UMBYrYBRxnm217QB
	y8kNI+wEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcGG-00039u-9m; Tue, 24 Nov 2020 17:37:52 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcGD-00038Y-5j
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:37:49 +0000
Received: by mail-qk1-x742.google.com with SMTP id z188so10062011qke.9
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wOTAYzxGcPu7PN/+w1SzvPIVnfCkyOLysxq7PCKNFLc=;
 b=S5nEHa589iEpXYy2XcA6lRL7T7kP7ehDm9Bouqy1TnodFVSNw+U8eEGfZTJYqfio3r
 aIIXt6yzwSLgwAXuhqGZj4J0YKEc8mQF148TodMgN6CoPRzSm84R92521SCDHI4hoxuk
 PrhKXiEWiiWgA90gCoz9PIlh8ZPWrsLSXPz4r2Y++1aYQUvVlK+d6BRd/FHjM9xPm2Hs
 6bb0egK3xiad8BkBdBGUWpDfzh4paEIzt947869TGDizd9+eyC5CHgWZWOK8SY4CO5vu
 4gCZeAvqJwOZ5TwMcQFDDPh62cYWKSsPb62iSf4+2HH9Z1OX9VZ9xWj9lq9Oe9yG0Mbo
 CB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=wOTAYzxGcPu7PN/+w1SzvPIVnfCkyOLysxq7PCKNFLc=;
 b=PG3NhYi8wmln/F11g3pKqJGzmGw9UMWsiG6Ys0bNNuxdmX+H5cpqY7zFE4Kk0ofkGQ
 rfC8OgNKE4XPEawXIMuICtDbtIKAmfevyN7xG4Fzg1bcmM2oJY8bIJ6AdIFzN/VtmJ/q
 3LHzjlbBKm9GRx73MfdSATtIoN2Dw1f5tAdHn/W1JybnFu1Xz+lE4zOFxsRyBu118jnT
 qjeoY/8RPK9btEjIOymsikQhMSeoIG2rrD3nLIFeBI5D1R8wK4SBYuaTRAXPCaDa81hm
 CRin2ulDnJnFLn+cdMNaiQHtNGal3mHYbnNLz7qm9BUKYBNHDfqVj+4Ep6dUWrI6wjnL
 q0zA==
X-Gm-Message-State: AOAM530hqADwzwl0Zive+VkFpbY3yRI4EO1Ymsp7fQVrD9iPSXPmyuSS
 odScueHt6ZSkMTKQxg7Lyc0=
X-Google-Smtp-Source: ABdhPJyBD8adSd77vYvAq958zJMB+ltr44tGztKokoaCAzhoNqA4YXMUBiY2USQm4Mo3NyM012Iq6w==
X-Received: by 2002:a05:620a:11a4:: with SMTP id
 c4mr6030355qkk.8.1606239467443; 
 Tue, 24 Nov 2020 09:37:47 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id s3sm13993894qtd.49.2020.11.24.09.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:37:46 -0800 (PST)
Date: Tue, 24 Nov 2020 12:37:23 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/45] block: add a bdev_kobj helper
Message-ID: <X71E05jyb3JdxRti@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-14-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-14-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_123749_313960_BEE9836F 
X-CRM114-Status: GOOD (  11.77  )
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

On Tue, Nov 24, 2020 at 02:27:19PM +0100, Christoph Hellwig wrote:
> Add a little helper to find the kobject for a struct block_device.

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
