Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4970C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 660B8206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:39:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3BmHnXmY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMRMh73o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 660B8206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9FebT2wQKF22V7+X0GehGbZcbU7ze2d55wsylxRAZ/A=; b=3BmHnXmYRbnGtk5rxnbSciCQi
	eHJoQ4WYlzEMPbuyE7ALPsCYjDHBoTbpLDaRRZvGInCp1lJfGEtqfZvf7uSdmPqIG9o18nWcqcAWL
	aTjf+4HGkYIt57/ac9ODNJUN5JCX5DLmtSC7To2c9xFqahWRbs/H6T8ry/O52d2ccZXf7SwmqhEaS
	ynI/8/1pqz8uYz22Qji8ui+d0yIFRqZim2rqtaqry+mu+k8agrDTliniOn3g6yrgelV12HjI1jbPZ
	93rREMo9ag1U8+VUqTRzb5MEzaiv74Irt2bgwN785GJSxitxa9v8ySZ5rFd/w1QOyv+Tih/O8oZLW
	8tqywpc0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcHN-0003Y0-2Z; Tue, 24 Nov 2020 17:39:01 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcHL-0003WV-6M
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:39:00 +0000
Received: by mail-qv1-xf44.google.com with SMTP id p12so8813724qvj.13
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Km12pVmBeWPgkRcOQAU5l84XavjRPJ4jqz28aKaNPFE=;
 b=qMRMh73o0YdpLAudiX8NPmCDY1bWM9OqQpg0RgHiyT+mlhnf0MZE5Czy8Qf5TqqFXj
 rj0mrD0ci08BBaP1QvOdQSlNYqt4OJVZLsc2rhNHZGmlnQEUH2P7sLZGRMA7ZcG7MS17
 yG8VIyxJ1lw+SyIO+IffHqOfCRSVn1pBmEJnkOVku1COq8LlNZb39TrX/RGHB52cYbib
 i+ykMchrdGixNcqG6wF1woJvO40gLVLsETP5ex6q4w5pbpO9xSAgvvJXfB6Yw0WWCqLF
 nDEPDCAPTAHfrqXDPn19OFx798DWMB961lVkvHrRd6Il2RPmsuogUvJSPGip8MEuWX9g
 QyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=Km12pVmBeWPgkRcOQAU5l84XavjRPJ4jqz28aKaNPFE=;
 b=tP5T9AknHz6EOJuKLzDUVkLQM8IsWPGoNBaoFJmtHJ6cNKYeR5KBGJ1UAaWQJbTB7F
 cwMAME3kc1fxKTagB1Pcd6db08EBH3kLUkRa9UcyFa0ca2ELxEfBCxRlTTgY3omrk21W
 i+Uc0OXth8T/6aGxrOMRGOiLpJ+OzB8tO2QLPbEoBnOarnFijcZ9ObNOJ8DKkPJvaApy
 bl22OEF1821EWgqFgEczH4bWxC+Pbcgd1LuMaGuz9FsWiTGuhs4JMjALzd6rn9O91oEW
 ZDtIwJMzYsIqPzcTge/kK/EpiwXOePslqj0rBtdf7mZMwm1WIgt/ksZ/fcJ2f5jNL/kI
 1Cmw==
X-Gm-Message-State: AOAM531vqiPsx4TwxfufKOAkVzlTZbRBKpH9aaMCWndPRIuMQKPMvCe0
 kC8eXe5rt6KMJ+YwqY3Wt28=
X-Google-Smtp-Source: ABdhPJx2viG2YUIcT9pxnUmh9SMKJ+iaGPuLa9sp1d1smXeKSZjMmg4Jo+Hs7YyRPHzhOtS6yXj/uA==
X-Received: by 2002:a0c:f7cc:: with SMTP id f12mr5949753qvo.0.1606239537123;
 Tue, 24 Nov 2020 09:38:57 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id b3sm13138042qte.85.2020.11.24.09.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:38:56 -0800 (PST)
Date: Tue, 24 Nov 2020 12:38:34 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 17/45] init: refactor name_to_dev_t
Message-ID: <X71FGgQtvXHTHU0V@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-18-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-18-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_123859_295346_D22F51B6 
X-CRM114-Status: GOOD (  12.97  )
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

On Tue, Nov 24, 2020 at 02:27:23PM +0100, Christoph Hellwig wrote:
> Split each case into a self-contained helper, and move the block
> dependent code entirely under the pre-existing #ifdef CONFIG_BLOCK.
> This allows to remove the blk_lookup_devt stub in genhd.h.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
