Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEACC63777
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:42:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A64D206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:42:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KgzOPkb9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYivczMQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A64D206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tBOyst76RYcHe7C7Tq7KAT4O4eOUcDZoaG5ph9503wc=; b=KgzOPkb9P1yzZMiyzEeNU9TGC
	l4d/ap4JFs8IfT4mr4viMGMG0r6IbkJx2odgOJBHoGMShF1P1Iv+Meu07Ai9PWTU6X5ahOCPkG/O6
	F9+pZdkHsrQffuP4+kPIZ9F/8YoB4WvsOSxTmHRrbMFl3mgJm2HjVpOGeIs3hNEoaD0H//yyWfnkx
	e7c1NGYVfOo3rfMGZtwPCvWqfZhy3RdyMivnRZeecwzm+QbyxqWEJBJpxoYqYxmMf94h+UmiUEmvj
	gqHnclp7r/OLORrossdGBBpPwMVXSRAiLiw8GJuQ9y2+Gxs6AvNvuIONekH8saJ3ve7wztNGxkPL0
	Pj+3umK6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcJp-0004ba-W0; Tue, 24 Nov 2020 17:41:34 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcJl-0004ZA-Nn
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:41:30 +0000
Received: by mail-qk1-x743.google.com with SMTP id b144so6999090qkc.13
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4ibQynBLG5sCe4CZqYbUkQUaNNDbglWF2wLslYnfqek=;
 b=jYivczMQqsxh7yyiSCMC+J2uq1jjrgFqCn4zGdT7y8l1tR+lBZj0zWSEvbd0W8jl8w
 Gi4Cj5Zx4gKHsuI0fIL4rp4709gHxtA9wRWySVLNwDnlcHxfBP3hG6ecjPkRXqH0UxZp
 xk0pqka3Sqe63I6EZOHEKoOfA/4WJiEaugJWCMjne3X9nHRMXe7fYlZPuOXRYu6gUE1t
 VJ+e81XD/b5aNX2a+wyW4GmbUwrk6CKBJ/6iNXNyc9y/IvYXsxz32um6sHRBVWQzYyqm
 IRQIL0vettN12q9xzjv+kftrmu3uKde1tlzjzfXundOzi243rFxdMC5NVy5kvvEXsk4Q
 MK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=4ibQynBLG5sCe4CZqYbUkQUaNNDbglWF2wLslYnfqek=;
 b=YOQbHGfBFPPIZ6iTCQz9z9edB6hcUrNc5zseqZhH6+UgTGLx3lphrEp4LjrETiFRzU
 YjpFwMvU/ElJTizA6CMr+mF6LrGfcWpxVVvO6qsowPC852lvNLeko2oTEYJQdcDB245g
 hsq8JJWwmuGn0qSC42iphOOFCqP984jkG0lCLVOuo3Zuq2FhafOX+1s7xi7vumcF9fH3
 QSB1Yk0WHBD0I46tSEJ2ySwbeunMs5MemZgZLsPJmyQT3PkkMAsdkUWwSLT10GRKUcF8
 lZwqN7gjH+qUyE8KkrLXMxXfsAYTuAUQ5BFdl4nB7pLdcLwJ8NMtZGIOBFbx0EbIIvTp
 9QPQ==
X-Gm-Message-State: AOAM531NWhfA1ne/WzwKbTTgt4ptyWW6bEjNW/CCaAqgPJCI0OBXu0Nd
 sjagksrY+N2KQshHmm+PRxY=
X-Google-Smtp-Source: ABdhPJwbAXPcygkLKUFdmjuytzuRV0DzFXM5PwNCTshXeMizxUWtjVUL4UzMNPmTvdVp88+fUo1SSg==
X-Received: by 2002:a37:8c41:: with SMTP id o62mr5500995qkd.240.1606239688196; 
 Tue, 24 Nov 2020 09:41:28 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id y3sm7003885qkl.110.2020.11.24.09.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:41:27 -0800 (PST)
Date: Tue, 24 Nov 2020 12:41:05 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/45] block: refactor __blkdev_put
Message-ID: <X71FsRDFtHWxVJOg@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-21-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-21-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_124129_789478_D7981D58 
X-CRM114-Status: GOOD (  12.72  )
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

On Tue, Nov 24, 2020 at 02:27:26PM +0100, Christoph Hellwig wrote:
> Reorder the code to have one big section for the last close, and to use
> bdev_is_partition.
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
