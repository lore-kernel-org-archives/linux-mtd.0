Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A475C56202
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 21:21:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0EBE20857
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 21:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rsc/4Dk8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkzooPxJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0EBE20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cVRrvbn1SjUgW+fPP622VbjhJfO3h9x0xrtD3D0u/Ig=; b=Rsc/4Dk8vOdj8VvjFAQcWWNnP
	P3I1vwXRPQgDUrSP020ZGEDYnuax/WllVfBgUY9Tc6IOanjjqUIrbXjNAkHU2ZbHJYQSrRWK6BRUm
	195yf/pmd4SZyJcD5gVn6D5uNlHt2DS1PJJqxcOXs51IIV4mboRDFcDVmfQXby3tJLJUlwy5kSHJf
	w+qlvTUyMq1wFFJW/qb8e49LeSMNYgqyhXy8gU3+NlKkQM1kQH0eJIM8lVdRlKFQZYcUHEN4M/2ia
	RMmAemxwUMcEM4Ur1A+blU7lSLGMlJEtvkGSo1nZNYqy8bXS2Bcc/nw5x2bSQxfA7G9vr0e4J/Spr
	jZJYxOxuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khfka-0001IL-SB; Tue, 24 Nov 2020 21:21:25 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khfkW-0001Gg-Jx
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 21:21:22 +0000
Received: by mail-qk1-x744.google.com with SMTP id q5so459167qkc.12
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 13:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7Y3MLcmrdxWQffIhMnyKnSmG7B3ov7cDZAqFDsa+q7k=;
 b=JkzooPxJ8GeNrayRsu98YvwsNpW2uc9rVRoj4imwYpA6JzY+Piu1EJS2IziPBdeDkF
 Ow5qmzMcHaeZs2+oG1fSVsEAssWG0DO4F1vW/5P9q+2+DEbGyYUH1jozKg00Go0h3+ja
 YVkgi/EGLciFHd/Iul8YpgRz7FCu1kfvXaFXbSFsbyZTqz8JAJ48o8dWwKmdI5uElByj
 9UjvAnbnEBhxu3Tw7tEroOvSCxNENuu6nvEC1MTUGX0lcXIIF4ARzithi6KpCvnT/fAl
 Mp0ipaM81mRq+veWggOWfzfqSyIb3Y60deO3bam/RyYuBfYbgPa2E9CAR1VR8pj1MpV8
 kFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=7Y3MLcmrdxWQffIhMnyKnSmG7B3ov7cDZAqFDsa+q7k=;
 b=rLeLuRv9vzNiJHVz5Bv3H+8d5V6ASBs8YKdbeTbMqoocT+sjAg+DcrUDV3vymPJ3S5
 0Fl6G8b6WEk76pZ9HXLxbxgOtjoXBPGbX1LJjLjhSXua1RobVq02JtpjzXZG1iiNsgxF
 FOmuNXiz3MyLBH8xGGqH22tVcaoQ/NvouyZpFVbjEr8a6FPAvBIiDAnsMh8bWQ6Thwm4
 65MhUuyiObP19cpmDHkmK0ERJx/Y1z7vprwdOtx8MGVIcerDFdAllTCT493wvP1yip7x
 dClCrjCDXeAioF65aF2yseB6kACjHfhC0+K5Z2ufZ7V4KEneltd0dcTFQ9AdALFd+YMt
 yceg==
X-Gm-Message-State: AOAM533IrWf4YRyjbFbXGw8CLk+rUrfllV/bwmDoHmyS3V0/yhhxMGAc
 nQIcEUunZCda3OL3Fhk0ZmA=
X-Google-Smtp-Source: ABdhPJx26oBT8NwtvheSnoKT8jLyoQC45bZaDNVCxy9rquKXHNVFfdT0K9nlXQGVBdDZtOMR/OxmVA==
X-Received: by 2002:a37:9ed3:: with SMTP id h202mr199931qke.126.1606252879118; 
 Tue, 24 Nov 2020 13:21:19 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id y44sm292925qtb.50.2020.11.24.13.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:21:18 -0800 (PST)
Date: Tue, 24 Nov 2020 16:20:56 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 29/45] block: initialize struct block_device in bdev_alloc
Message-ID: <X715OP+dR8KzH1wA@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-30-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-30-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_162121_607017_CD5D2B35 
X-CRM114-Status: GOOD (  11.56  )
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

On Tue, Nov 24, 2020 at 02:27:35PM +0100, Christoph Hellwig wrote:
> Don't play tricks with slab constructors as bdev structures tends to not
> get reused very much, and this makes the code a lot less error prone.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
