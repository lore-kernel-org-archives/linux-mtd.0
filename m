Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36853C83014
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 21:13:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B57121D7F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 21:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQHCAoXo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NfbkqhzX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B57121D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P24wWEAYkGgRQH8Y15Xe+Pl7eBHmuEtiZucZkbwUdEI=; b=BQHCAoXoRUcXXUgrJ5Jxs5fHH
	o1IsMjVdSBZ2Di6EDh5+K9ppYLnGjweHO2u/U44+0mSR14gml5ux28AXQEJ2WdAqCTvrk6Hu3E1OJ
	0c6xopfiUg2UqAunJLTgOhyXjiJEkrSFX+tJqo1HFwBjsToamCiOqCluJP+ElnpLfGd07AzNyFlSs
	c5JsjrAajybcNd8mdJNLqMyQaUzGRHbv/wI1iVaN8D8bYLeEQrRvy1QwfMyb5BnYWyrrlRY6ABB+H
	hQqQbUyLpEdsUEOOQ8XqXzmRM2Ft4UaYwU39916AmoIp/0VnUCEwPkISo7cNpIkk8X3UUQryAIdGE
	GcRB8b19w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkCwd-0002WY-HW; Tue, 01 Dec 2020 21:12:19 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkCwa-0002WE-BM
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 21:12:17 +0000
Received: by mail-pg1-x543.google.com with SMTP id e23so1953852pgk.12
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 13:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eKDkcpBHYJ418QnKHndhzHHrqp0qTvvUo1Ka4JFkIjs=;
 b=NfbkqhzXRx6xdHtZ4P5YsCq1Gh3ULOW6s+lWcdGuoQIQTXQtJf4FKlWF2M5LDdC5pg
 Y5gXlGQ7gysPCZ5vleJ/HGiDLKqdNfjZpu/ZgrMImWU5uBLkQscHMtAXLlEroCsq5QCQ
 m/4z7Y3kS2bKUmFcVV4HAbCA7ZKNm+GED9ByU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eKDkcpBHYJ418QnKHndhzHHrqp0qTvvUo1Ka4JFkIjs=;
 b=GrqLb5GU446MA7tnwS2p7qVfCAAdcFTSlZjXq1nEsm0deg9Gs6B2gEgc6ABjJindfJ
 +T26Dgw4Bd8yxrTi6hh7PEAO1OfB2qmwXNhGuIqnrDAUcIGcLOKJxUEat2wyycFY/D5X
 V1XXl+ByCY37SROizNEVWmGdhrd8grzbbIcW+sopg0JjAPwu2CTqtUAmN4bAWTsQzBkw
 WRnVlz3j0EU3mTna3y5WaUB907zk8jFUbHjlYfKsRNG4lcPwQx1pP5Egxdf2jmIkLp0y
 fGJeuGXtGukIyTBIxoLDX1aXtnt4zdWOOqvZjg7O+ykEzg68KxPa2PLctdjDQYo5x9l3
 e1lA==
X-Gm-Message-State: AOAM5320rEq2hMVbzEp//0aju/l+1WlMZzMEO0WaOudxQtvogMhuJ2eH
 TjBrj5ti7ehGwn35JJV6SQvzew==
X-Google-Smtp-Source: ABdhPJxiQYvA+XXPUoSkXs1JD6os1hp4Kj00buq/VcWl/IZVckV7jqtQ4p9UdygLUvqC2QBoW0FXew==
X-Received: by 2002:a63:6405:: with SMTP id y5mr3568055pgb.445.1606857133780; 
 Tue, 01 Dec 2020 13:12:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e14sm455396pgv.64.2020.12.01.13.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 13:12:12 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 Christoph Hellwig <hch@lst.de>, Colin Cross <ccross@android.com>,
 Anton Vorontsov <anton@enomsg.org>, Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH 1/9] pstore/zone: cap the maximum device size
Date: Tue,  1 Dec 2020 13:11:21 -0800
Message-Id: <160685706687.2724892.9289969466453217944.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016132047.3068029-2-hch@lst.de>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-2-hch@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_161216_491132_1C803752 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: linux-mtd@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 16 Oct 2020 15:20:39 +0200, Christoph Hellwig wrote:
> Introduce an abritrary 128MiB cap to avoid malloc failures when using
> a larger block device.

I've applied 1-3 of the series to for-next/pstore, thanks!

[1/9] pstore/zone: cap the maximum device size
      https://git.kernel.org/kees/c/cbf82e35031b
[2/9] pstore/blk: update the command line example
      https://git.kernel.org/kees/c/45a8af4412b1
[3/9] pstore/blk: remove {un,}register_pstore_blk
      https://git.kernel.org/kees/c/b6f8ed33ab2b

(I tweaked #3 with a small added comment.)

-- 
Kees Cook


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
