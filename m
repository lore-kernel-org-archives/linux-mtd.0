Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5851CC64E7B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 17:52:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B4A20789
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 17:52:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fo07ZIzC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="uHFgX+4A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B4A20789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2spAHnYqDV8dJBHoInLMwYqDr3MkbksRiREIJTvLwEE=; b=Fo07ZIzCxPlcs9jtZkzNCSmy4
	C4HTZf3wVXMQpNCXoiDjcx1fUM/wB/e7ECU/CwfLhBue6G5C+WhgS0XEeQy0+a5FODX+LFxu3NZkg
	rLeLiJcnsn4fRbz9yPErjt32mm4oYY50k7q0yqKVik4nayYDDN8yDkhQwba+8wGZu+6AVZ1yYERbK
	qe2ekc7J7ee7+1R0VstZIcyF7ep9wq2ZIfbHXs3Bx87o3HuEup2MankTGPzC7YUqNIl3xTG4QCNmF
	/LQ06cwgni2Z+EYXnJlWgW9eZeftX1k5mW3mfp9lEOS45MDcd9T3ZhNJA9qwUG9p3m86V1ixNJlxI
	6tica6SPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjnLG-0006MW-1v; Mon, 30 Nov 2020 17:52:02 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjnLD-0006KF-4b
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 17:52:00 +0000
Received: by mail-pg1-x52b.google.com with SMTP id w16so10508029pga.9
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2020 09:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zGnnwAdYWjtdhwju8NcFhzJcpMrWjZbZM1FQN8kVDHg=;
 b=uHFgX+4AVkQgx7faklPk/rXQ2t3jemQG+USPU79z1ylyowIu+ubayCfcNDVRC61F46
 uOUat2OPBdrNV3C5cxDEKe++AihqW2dfiUMqAR9SSzg0pWNoXwmF7ToC19r922VtbWfr
 GnZWjiz7MwL36CuNP5a8PBDGbSSHjoQJPhU96VUc/2DTZ+eLKM46XkcINUXSEgzoNRVJ
 B4aqmPEpPNtUoWXOmsYcqMofGY6tX4m12lDRyTKN8UmgHif1BP6ersB+G7h3Dqe1BMla
 /i9GORlNNRTQ9/OCndNw/5vShhAGl68QelubQRXFJANa6CdOvdZreY4YnK+uQ2CRP4+S
 bZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zGnnwAdYWjtdhwju8NcFhzJcpMrWjZbZM1FQN8kVDHg=;
 b=WPQTygC0dIj6riHeRtSQR6qsXD41j4yHg6HQ54TB/AH3TM7ET2EF66ga/HK8BCsckm
 YYMLK83TaBkI6hwQMv0uf+dfH/rTzwZ6uo4K6xfzpVAjwSqwR17UZyAEh3yWZ5XaQRyS
 kxO7j/4ArTVYBOWVmhqrTMR0cZZm+0Pghh0SBMVXfwuOP2DW5lHe4VmlTyE1L8jEcP1+
 3i/YiWg/9O7ZdaRkhc3F6ltNfOLvUXHs63x9yxD1E82el1nNhXbA9IifAQqZzhlThKEA
 ZbW+Bd6kjyhIj6lvn63LL1LXqUfHF/kPVDrCRoJzGVTH03j9kPIlDPdF0sDAjYUIgJTJ
 RQZw==
X-Gm-Message-State: AOAM531oanwmQ6F28nH2xBK/WgAvQ5ZEUpPZXLtRbWUw0jbuxpfTLVXu
 VZ9HAMtJucSGxiJpQBIg93ifrg==
X-Google-Smtp-Source: ABdhPJwMTZsLj5SnQFza8cXET/WnIEE6pVW7Y7fE9/cYA5ZaExgItRAY6sgUO5JUjmSVf3YBKD1+nQ==
X-Received: by 2002:a62:ed01:0:b029:19a:a667:9925 with SMTP id
 u1-20020a62ed010000b029019aa6679925mr17651943pfh.35.1606758716075; 
 Mon, 30 Nov 2020 09:51:56 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id w18sm17681748pfi.216.2020.11.30.09.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 09:51:55 -0800 (PST)
Subject: Re: merge struct block_device and struct hd_struct v4
To: Christoph Hellwig <hch@lst.de>
References: <20201128161510.347752-1-hch@lst.de> <20201130171915.GA1499@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <e67ffb20-ce91-a3a7-e1f7-6fd32334abc4@kernel.dk>
Date: Mon, 30 Nov 2020 10:51:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130171915.GA1499@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_125159_212665_645940E4 
X-CRM114-Status: GOOD (  17.20  )
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/30/20 10:19 AM, Christoph Hellwig wrote:
> On Sat, Nov 28, 2020 at 05:14:25PM +0100, Christoph Hellwig wrote:
>> A git tree is available here:
>>
>>     git://git.infradead.org/users/hch/block.git bdev-lookup
>>
>> Gitweb:
>>
>>     http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/bdev-lookup
> 
> I've updated the git tree with the set_capacity_and_notify change
> suggested by Jan, a commit log typo fix and the Reviewed-by tags.
> 
> Jens, can you take a look and potentially merge the branch?  That would
> really help with some of the pending work.

Done, queued up for 5.11.

-- 
Jens Axboe


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
