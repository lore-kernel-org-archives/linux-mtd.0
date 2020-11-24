Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6BFC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 12:27:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10058206B5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 12:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R80GWCns";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2pmLjkQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10058206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a+zO5QPuklQMUUtjkxcQO5reRmotnBJx37qLYio3+Cw=; b=R80GWCnsPkkP1ZM2fBFE9qBKB
	rtQvNGp3b8eVyOXLzbnOQuAF4R6S9p+ZYpp0aWoqUEo82V7qwgagh0os4y8J2CcUVWWQDPdyv9i7E
	kfp4XkUbP2gNsT7qnoe+teqWyd6XKCKdF03qqNYV/J1uRThSIZXvjlXRTltKuN6Rqnq9Eiylb/M/Q
	JXI3Dggq8Hf9Zj8CfjIWzhV9sME+Hvgku4Dfvwrm9MKfdvqXIQb33ymtPEWEkWwLNu/raDXuPQSLa
	a7avWHq3oT4I+t2wVGnVcZ2AhwyQonmnzOMKc3JTXYfr+S8LT7l86wOfQO94Qcm1hX0Y753On068S
	NVHpJ77yA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khXOy-00020w-M0; Tue, 24 Nov 2020 12:26:32 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khXOv-0001zO-QO
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 12:26:31 +0000
Received: by mail-qt1-x843.google.com with SMTP id t5so15893881qtp.2
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 04:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3VmFnou2nD4lcYGUPrMqThXCue7L4UhclP4oij42Kbk=;
 b=Q2pmLjkQax53DfEJqAJ++rfXRuCUfTMdSrNvTnPX432cf0gQiAL3+rv3sWj3pG2My/
 oRdarF4chfZ/NGCWEsg2aUxLBAr7DM0+LX5j3dmwR37bMrIIw9a2t0+E+kgW+uzsRvYc
 g8kM86RUe+4+vv//4l1WUE0yyA289I+AFdLve44wNIShUP964g0YZBC6/O2hSjbZ07AU
 S+AiwdwqWWOpdsi3wwn8TVFeRWE/u7jWG4pRzv/CGg3KS5VD7Ier0L558UzN4+P3vh8c
 3eIrk+wHnJy7NT29VnOUcXmovGz+97HAGUQWfQatJC0i/4bkcHptLw7Lu0lLat1XLRR0
 0C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3VmFnou2nD4lcYGUPrMqThXCue7L4UhclP4oij42Kbk=;
 b=ebM+h4H+H8cS9SMNZ3xDE2uAHxFX1r1DewkS69QxA9yiQftQkCEIV2I8NGL8gsSbJL
 K4crqjrMe9qaVWTVorg9/2rkni7i92OYqskDNU5lrke/XfllIgdXkEQcuXWmFt2h2uoH
 ZxO1sObiujrzC3wQh9FDJq3/X7/pEJmQ4z3zqPW8gj+WcqjueJu+REl0hdalFkv8hH7y
 C+WjQ1/JqpxsxG0PyfSYKspzXBqpeDMgK6i4JRQ6ifazxwqO+H3qo0E/yr1Lq5OwUeY8
 DXN929C8b4Wc/KWbm6jA55/gVV6CzHU7d3nOJVu4IRXjxTuWcIVUgcfztnJKM0YVhiqs
 s2aQ==
X-Gm-Message-State: AOAM5307ohCV8zeX7hPk159XSxMra0GAlIv8tTdCr3G0nLMgOi3iR/Do
 GAc3KOPMP6nafFY4ICbv0Mk=
X-Google-Smtp-Source: ABdhPJzEc+iLQWYgDMndDYVqthGkMbJAnqvSsODxlzYXE5vX4s2url7RgqZoX9eivJ6nNv6zlRow0w==
X-Received: by 2002:aed:3c42:: with SMTP id u2mr4081287qte.159.1606220786736; 
 Tue, 24 Nov 2020 04:26:26 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id t2sm8643187qkb.2.2020.11.24.04.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 04:26:25 -0800 (PST)
Date: Tue, 24 Nov 2020 07:26:03 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/20] blk-cgroup: fix a hd_struct leak in
 blkcg_fill_root_iostats
Message-ID: <X7z7215hVXzg3FGA@mtj.duckdns.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-2-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_072629_877965_0FDE39A1 
X-CRM114-Status: GOOD (  12.28  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 09:47:41AM +0100, Christoph Hellwig wrote:
> disk_get_part needs to be paired with a disk_put_part.
> 
> Fixes: ef45fe470e1 ("blk-cgroup: show global disk stats in root cgroup io.stat")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
