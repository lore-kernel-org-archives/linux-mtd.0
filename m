Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEDBC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:53:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 602AE64ED0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 602AE64ED0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7zoHxWIYG+guieDwlauzWqVP0OOuUL2iMkO7sHKU6Rc=; b=dPvLiztT1U3JiH1KGRPyU7/NS
	mv65ppRcIKPUYJ12KyANvWumzuoImlIzlHVvx7NheIeejopCdjValw6TvdTGNQ4mJhmRFwT3tTwyL
	jfhtX0I3BYbVcuZivx6NaaC/rT3WFuZAODWp8SIPp7KZVKTqzDEY6JOmAl8s4eE0KL7tCEdfnGFqz
	f1eC4mYtJsL1iqXEAC4R57ZZjFqf6pPD+BKpOWOEgK+ZmjuhfV//0rAXzWCihe6YjwpuqErTJ9TEp
	OigHbmBEwg7iW8VZnLREfxgtJx6cS37Rs+jpMPrXg2wk9VE25lb2sIaAQrItosXmHVRw/y/bFyYKr
	oAIxOl3dw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUja-005gEb-Na; Wed, 03 Mar 2021 16:52:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSrQ-005ETx-Ed
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=mX1oQEPcKVJjYx1zxGJSjbh+RBHjVv/IIai4iQJ5tb0=; b=c760PMLB3S9VHXff8e4HAAgRbo
 uwEctFPAQQl1BUpVR8jakflq1rNkSmp/oNeOJOX8MdwXQUH5A1KkgJMyqkpn0e7tGSndTAqOZQwc1
 kBF/Bk77PECjMlTqQgRrUYfDlBslxMflpifCe8MX391PiQPYt5jwk3r77OXS9PBQSOHxq9LihGRVC
 YQNqcMN65RhBvs07OOEemKooGTtfPdsYCvNtqUDIotNhDbTnLfm/iAd1xLk/yINt9kLVrpDLYhDXS
 6yICDIgY0AcdMgch2drBdhKcVlRJHRHX2zNbhQmBbEexdvw/iYHGh1LJb7YVZvh2PMeJvEUwrNAeL
 GCkgKe1Q==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8Rb-00HV4D-PG
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:04:30 +0000
Received: by mail-wr1-x42b.google.com with SMTP id b18so14168593wrn.6
 for <linux-mtd@lists.infradead.org>; Tue, 02 Mar 2021 09:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mX1oQEPcKVJjYx1zxGJSjbh+RBHjVv/IIai4iQJ5tb0=;
 b=G7rX3blcrB/6KfZenlUjPYCPO5X0w05gQzR1UCbZc6vBDui9uSgMSXMcSrXMjhfvcU
 60gRDupf7y5PAwUERWOG31jRjDOxuosZi33meXOabswREznANwpSeOiRgRxrskttUxxr
 j94u+xYz4nsR6rUnuC8Sw9gHA/0iszvd3jLqE0ozeHW2jyuSrqW4Q/sGjd2NtYJtZbIv
 OzzfF4LFd3XWa7cte3e7UmETKmTYyOGHvxbfV3wum1msqWJHDkSI2eculZcsRKuiXI3G
 H4LibHfQFT5Pp26CaoH4y6yc86A0Jo8Fyl3xGzAeYdvK2kDRLlV1jez/qWfOZGM9ZME2
 ZBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mX1oQEPcKVJjYx1zxGJSjbh+RBHjVv/IIai4iQJ5tb0=;
 b=TNnuBCZX3IcAJgcaDXQJml/VX3jPsJ8TxGi8myb1tlH+0fzrFyMRcy/iwOqqbwjM9t
 /Ua1L8GYPYKu2ms55Kw1GhDfGlrCXHvu8x8poI0ePlZv6cMmZt/cd45ZTmVsZ2DBLnGM
 zGB60i4OTCqsy7asvOZW6Z4ycM7CC/PJtrAxC2smZ8MUsnZnatRYuagRyxJ1Dv6kAWoc
 4pJZd0AKzDZHcKvU1Q2RK87NQfciNGRr1dGst/QOkAwLL1TmdcOx3zHucsWU1wkswZMz
 pAzlvyS+VSk97UjsqGriSDEfXEvWAatf68OAkqvSXSZYTP0lwAcCzZtiX1JYe0PMFvxk
 yRfA==
X-Gm-Message-State: AOAM530HcsCAGJz3WV6QIRlQOq3kXuFdJWG8FoJpttkCEKoqOnmRi4NM
 WoOIvpr0g/9xeEIACx/x9LcDbQ3dhhpYjA==
X-Google-Smtp-Source: ABdhPJw6o6JhRDb7uIriZcofKK/xBbS5KQXksPFDjOwmNZoxBzfpbV54NnGWtm9BySRL8EVrTr9qfw==
X-Received: by 2002:adf:f848:: with SMTP id d8mr22887378wrq.64.1614704594533; 
 Tue, 02 Mar 2021 09:03:14 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net.
 [82.252.144.192])
 by smtp.googlemail.com with ESMTPSA id u63sm3160870wmg.24.2021.03.02.09.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 09:03:14 -0800 (PST)
Subject: Re: [PATCH v2 8/9] mtd/drivers/nand: Use HZ macros
To: Miquel Raynal <miquel.raynal@bootlin.com>, rafael@kernel.org,
 andriy.shevchenko@linux.intel.com
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20210302163143.22998-1-miquel.raynal@bootlin.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ad7da99c-5385-02dc-5fbc-c9ae31903802@linaro.org>
Date: Tue, 2 Mar 2021 18:03:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210302163143.22998-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_170430_543280_8FEFAE5A 
X-CRM114-Status: GOOD (  10.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDIvMDMvMjAyMSAxNzozMSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBPbiBXZWQsIDIwMjEt
MDItMjQgYXQgMTQ6NDI6MTggVVRDLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gSFogdW5pdCBj
b252ZXJzaW9uIG1hY3JvcyBhcmUgYXZhaWxhYmxlIGluIHVuaXRzLmgsIHVzZSB0aGVtIGFuZAo+
PiByZW1vdmUgdGhlIGR1cGxpY2F0ZSBkZWZpbml0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KPiAKPiBBcHBsaWVkIHRv
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51
eC5naXQgbmFuZC9uZXh0LCB0aGFua3MuCgpBY3R1YWxseSwgSSB3YXMgZXhwZWN0aW5nIHRvIGhh
dmUgaXQgbWVyZ2VkIHRocm91Z2ggbGludXgtcG0gYXMgdGhpcwpwYXRjaCBkZXBlbmRzIG9uIDEv
OQoKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZh
Y2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8j
IS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9n
Lz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
