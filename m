Return-Path: <SRS0=66Q2=WN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1E9C3A59B
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 20:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F95521744
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 20:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bayRbPbw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PCXESTLe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F95521744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4aKunBP/qTJ5w4aFhIial3VuOZlBay+rX8mXs4vqvA=; b=bayRbPbwRMx/j7
	ZAZZ8hLUNAb0NF2Q7cZ0Ow+e4zbdJ8fEb/TcZU3gng76sqWWZpfMBulEdojlpnQg+m2AM0jUIC5yo
	0OkkaEsFaMnv8Ep4pSWukOrxyu7zsu9lQLfp6POyYfVOy6X2FYCnQItDjYveZDg6+XWi62P9Th7nI
	um4XRsqPw/w2lYxjMQjOePlxFMYkAKriPp4tKyTEcrKYIKVfkAGCYZ+OYLTlgUxI/SpHdI1ELqqyx
	cdvrYP7UUOVhf5QhRAUp7FdsNDcS5amq9RH/2b4vhbVRlucjKaFa34EzPSDNy5Y3OANId8zTdU/om
	58cxcXSDv06e1l5F5Pvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hz5mW-0004dx-Vx; Sat, 17 Aug 2019 20:58:36 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hz5mH-0004Sc-1y
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2019 20:58:23 +0000
Received: by mail-io1-xd44.google.com with SMTP id j5so13204369ioj.8
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2019 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=NuXJCtDYAF42ezbdDjEFYfu2iBTjQndKb/Edf61OrOk=;
 b=PCXESTLeUcBNUWogs1gHv/iSg/bRj7rmybc37GwKrHxDe7CTeYQGPE82FFro2CLT61
 8Q4IgUqoS7Jmsm9wuhAF9CCdJ8jA631YD8dGqkPPvzXyvuP2itYPnDRcHbp+2vkqaUSt
 u4rxsZS9lGz/LPzZ8kGOEVrnbFqSW3syoXedbPJGimP78UP/Tg6J92XflG29pM3lwatF
 OjAvDNX5+3tv2rh85pO4hmLeTRsEGL0KJ9d8KAbhP2qYNSdGVQpqF+mf38a8oxmStDJ9
 9nvCgcj7mRwE6p6VKc6zn+f1lPTm2K1/WP8Olg56A4X8/QbiEq8e7laZGSLETkAb5Egu
 FN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=NuXJCtDYAF42ezbdDjEFYfu2iBTjQndKb/Edf61OrOk=;
 b=UP1Vt+ViJLB6J//GzlmVMo/8XJyFIlbZDypHfqlH0Hyy4xx3x1E/r0HYjGFf/qaCXq
 ri+sYB7JQH5vOzuqmMLxrrFiswhi5OWf36OdcGiem9Vbr6FRa5W8ReTnlnCXgiWVTR7n
 a+N2PM18TusLGyX5m2TlcGQRKswoZEYBD8wm2ZQqaJ++Mtg2n7z7oQD+zrRQZzdTG6ns
 ehRWESvqwuikUS6FL0jr/HhtTWE2aMXDslwdIMVlcASdYZzcgOxmkmwW85rpNHrWBT7W
 uAMiV8PTXTX3b8unjXwHGNUIlUZOmmOjrqgi99aHPYg61ttWelI4KAThWbAdS/7PRF+c
 ZVPA==
X-Gm-Message-State: APjAAAXxJzkm/zetLubbz16lrgFP06WRBqCFJg9dMONZv6QnxgG0aIOz
 G6IDi3uPZPNs7RjxNMNOS4gL+A==
X-Google-Smtp-Source: APXvYqyKpLbmhNe3o5mV41HWvHYU+SiPLQTRVuTNOtg0cL831wKHUivDHHya6XYWHKa9ZnFnQ2CM9Q==
X-Received: by 2002:a6b:8f0d:: with SMTP id r13mr15237433iod.121.1566075498344; 
 Sat, 17 Aug 2019 13:58:18 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 6sm9905577iog.40.2019.08.17.13.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 13:58:17 -0700 (PDT)
Date: Sat, 17 Aug 2019 13:58:16 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/26] asm-generic: don't provide __ioremap
In-Reply-To: <20190817073253.27819-15-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171357180.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-15-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_135821_108327_1FE298BE 
X-CRM114-Status: UNSURE (   7.43  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> __ioremap is not a kernel API, but used for helpers with differing
> semantics in arch code.  We should not provide it in as-generic.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # rv32, rv64 boot
Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv


- Paul

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
