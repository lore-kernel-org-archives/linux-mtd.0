Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90CAC2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 20:24:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B951524679
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 20:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s5updPkh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="abxQROV5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B951524679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9SsZMEMnwZ3/zafwhvaUq/kNFSeUh7w72gW1fNK1beg=; b=s5updPkhOFAKL+
	RCdyxsC80ccQN6wXKCk6nkA9oK9BsDIpxZRMmTKJSRP5fHdO6BZfHvuTbnr1xpKH0AUUpWFs4vass
	Hyz8Jkx+lyeGHAD82TJUIdu/7YppOWa/vGLF0LvKlkKBCfHOx3SrcqN1rEdPTU0rIR5ZOWyoVkOMM
	2HxXrwBHgeQLa5NX8CWkemnnLlTX7aljRgCUnedBzZwOs6W8gUc0qLDYVdjrH9pcvw6MhVFgHeu4E
	QGcUFbGOiI5hTjfU3JoMqfOIUuwG+B51GhsMmNkGBhb0iITGJpTH6asngvy9e/zpjr3tCBpn7EU4p
	8SHd84ew9QwLcUqMl2/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwAvI-0002CN-IO; Mon, 27 Jan 2020 20:23:52 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwAvF-0002Bn-W5
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 20:23:51 +0000
Received: by mail-lj1-x243.google.com with SMTP id r19so12336513ljg.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2020 12:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=13J+b2VOmDQG7OJdkSeTX2kFAKorpe+KA5LU3wgch9M=;
 b=abxQROV5Vx4VAkO6Xs0uhyJGyAERc3+hIMSoDlBpjTsW4O+mgtuzTzrMEQx+GWSvag
 RFzw7+YAXX9XsfVteLAinlmWke0uGHv5KxKs0sdgaYoHp9L/P5obqdhA6+yWxgnIxnWF
 ecyLmb5lyIF6FtGB56mkl/GEJckIgMXaMoDWDKEPPlRouiNv3OQ7nACj2HM3Kc7MIzQ0
 R4xuKOPaCnP0UnzdVmGA9tdSlgs7beiM+58uKIhmVw9sQ7VYO5wLNkWaee8ryCel0tJV
 j64rJr+BsEFKCTtPSdSN6UJs8MzH4kHvdQDC88UZLLM7lGY7pYfWpHmg7zqlTZOGPwby
 eOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=13J+b2VOmDQG7OJdkSeTX2kFAKorpe+KA5LU3wgch9M=;
 b=UmoskzVOua531ipvg43KEa2mLj2NBo1r8duJ5Zp5wyiDyqm59YLMBz4U/uyAAj5ZL/
 zrZggdnI8aoki3xopGMEtATSPNmlyJf49DdFGoLMPH9flZlsiIbvJbY2kwuD+kcTNBWq
 XrB3sseWtmUCZ/QXtjXQUz4HF51OXrL3S1YKB33XJeJBN9M70+oxQD7b3des6kYnmIhq
 UTv9Sqc61+W9VrdO8kLf7OVeEz7NrUoUK9TEZ64UsmvhyeWnID3Xgh7o+QyH+1GKb8ff
 9Lgqta9j3966TKJx+2nQWTbo0hqPQPWy/Gn/JyOOTeGk4Fw6bdyqhSGzmVfWcF7rkdrw
 6Jxw==
X-Gm-Message-State: APjAAAUgrPJH3BG97GepEQs2nqghzi3CJe+2vo/veIwCtx7KGthk4o24
 7285V9zJUllRdVLqJdpKtX1uZB+jTwo=
X-Google-Smtp-Source: APXvYqyn1NshH92/xmYuMOWqh0NC16cels7xD8RtB56wnnBN6GfkT53X1d2VuZK59ZKO1dzq/k0EIw==
X-Received: by 2002:a2e:7207:: with SMTP id n7mr10003263ljc.242.1580156626576; 
 Mon, 27 Jan 2020 12:23:46 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:848:32ac:5845:9fa3:1634:7984])
 by smtp.gmail.com with ESMTPSA id b13sm8542595lfi.77.2020.01.27.12.23.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jan 2020 12:23:45 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4 0/2] mtd: spi-nor: use spi-mem dirmap API
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Organization: Cogent Embedded
Message-ID: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
Date: Mon, 27 Jan 2020 23:23:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_122350_034373_2BF4DF10 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Here's a set of 2 patches against the 'spi-nor/next' branch of the MTD 'linux.git'
repo. We make use of the spi-mem direct mapping API to let advanced controllers
optimize read/write operations when they support direct mapping. Previous versions
only had a single patch, in this version a preparatory patch was added.

The previous posting had garbage in the subject, so resending with this fixed...)

[1/2] mtd: spi-nor: split spi_nor_spimem_xfer_data()
[2/2] mtd: spi-nor: use spi-mem dirmap API

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
