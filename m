Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33ACAC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F186101A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 15:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2F186101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FiE31kqWKo/pTCcxiPuh7oHeImU8k4ZlvgsM5xZ0Qg4=; b=TRD4OVMZMsqxJf5sc9oWg1XMOG
	6XlSP5u2unvx4BXjinPpE2WK5C7cWtQJ6H4X6EL0wNbkNXAnucyDhDg6rl3bSQG6ruHWQW2XNGO3s
	k9xUkPmwNdEqyB7i5kP1hKi7F5GDhW1DQlIBfjgEpGUoEmiJFu+X1L/qxt9k6lD/Er6dnbZ21NwgL
	ez2anpGWiRmgPBAArhBN/e7JlEb0ZIegdlyKg4/qA2LKP1qElWrcw4n0lmqTKOn4Nq2SHc8zL/Rww
	Yugk/5iUo7P47LaeZelTvTdTIqBRtBV6RFO08YrnYmm5+bjoFTYAaxWorXuiwYNbJGqJQ5ZNXiDqJ
	4eiTQzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGNud-0067Qw-9i; Wed, 18 Aug 2021 15:55:31 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGNuX-0067P7-Iu
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 15:55:29 +0000
Received: by mail-lj1-x232.google.com with SMTP id y6so5993549lje.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FDEHOwK/tV+p4BwibJ2eZxjOpc4MiqVcjf+8RCPnl/I=;
 b=H0RQfIKG86hjucXIS4WiNewr/HEa0soca6FW/SoC/rnEEopBHfFKy8EBd0pGQounk/
 Oq9/0nUk373C3fZI609KQfoxLIlCX33VL4jD/UoSCTP1jNz94LT73hGlRg0OGe2pZPMl
 Oibirrv4BUfG5Z6A9XvafJxus+f47S5hMtsDMR0PfSid8tbadkJELX8svkntbABSkpcD
 RimCcpLAmvdux+9g7Wlco/fYko0MP+hTZL/CMoVJHvmpnxNhBGRdHEtQ4ME9XbOrtsOg
 Ou9Bf0Prbo4kHm9SvJmQDHot8vFIRpjN5c2/oXbQGbbtlY4/TvTgQHm5WSs8SXzEzrL/
 q0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FDEHOwK/tV+p4BwibJ2eZxjOpc4MiqVcjf+8RCPnl/I=;
 b=bIEDOgn04ZhA9p+1UQ//e4S3lggbsAr05Ws9VDCrv3ctX4qMoiifIw5+2/i8CIhLQU
 DMX2osB98iu57O4DP2ycaE8rB23wRTMQJksqz8SKv37azitOu+nCjDkdz4lIo7AcplUY
 4PHNXBmOB+5iQB3uy7wSvAT4NILTIvXy0004/42pV9F3LMwXCpQUXzeC4xiZ41mLlDA5
 Gd3CADdboAHDqZEUnW5S9oFQ1jZ/AYloNkXtXj/umnCaCZkWyTtXwO/2kfc1n9w8TRex
 bxHjzETyy5RN43/7HkY3GPBGW+V7JVuQrK/SXDFAXHVhg+0PhvDbgEhU6KDcnVR/zFJR
 Qmdg==
X-Gm-Message-State: AOAM533hECX5E3cVljOkk/eGMvWLXM07hJ9fSHcTtE2tUgkfCJpBHK4z
 Q0Ifdlf16nfFQ6UdCCwnQc0=
X-Google-Smtp-Source: ABdhPJwH2B3VgRzJIvI+pIkKDsVXz6Nb3IHX68qBDgW7hPMqkLurd3vlILu0yEDQld58r5qYiUr6VQ==
X-Received: by 2002:a2e:300a:: with SMTP id w10mr8608460ljw.510.1629302124200; 
 Wed, 18 Aug 2021 08:55:24 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id y8sm7917lfh.249.2021.08.18.08.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:55:23 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-spi@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
References: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
Date: Wed, 18 Aug 2021 18:55:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_085525_684465_4B62C310 
X-CRM114-Status: GOOD (  20.41  )
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

MTguMDguMjAyMSAxMjo0MSwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPiBPbiBXZWQsIDE4IEF1
ZyAyMDIxIGF0IDExOjE0LCBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPiB3
cm90ZToKPj4KPj4gT24gMTgtMDgtMjEsIDEwOjI5LCBVbGYgSGFuc3NvbiB3cm90ZToKPj4+IE1l
IGFuZCBEbWl0cnkgZGlzY3Vzc2VkIGFkZGluZyBhIG5ldyBnZW5wZCBjYWxsYmFjayBmb3IgdGhp
cy4gSSBhZ3JlZWQKPj4+IHRoYXQgaXQgc2VlbXMgbGlrZSBhIHJlYXNvbmFibGUgdGhpbmcgdG8g
YWRkLCBpZiBoZSBpbnNpc3RzLgoKRWl0aGVyIHdheSBnaXZlcyB0aGUgZXF1YWwgcmVzdWx0LiBU
aGUgbmV3IGNhbGxiYWNrIGFsbG93cyB0byByZW1vdmUgdGhlCmJvaWxlcnBsYXRlIGRldl9wbV9v
cHBfc2V0X3JhdGUoY2xrX2dldF9yYXRlKCkgY29kZSBmcm9tIHRoZSBycG0tcmVzdW1lCm9mIGNv
bnN1bWVyIGRldmljZXMsIHRoYXQncyBpdC4KCj4+PiBUaGUgaW50ZW50IHdhcyB0byBpbnZva2Ug
dGhlIG5ldyBjYWxsYmFjayBmcm9tIF9fZ2VucGRfZGV2X3BtX2F0dGFjaCgpCj4+PiB3aGVuIHRo
ZSBkZXZpY2UgaGFzIGJlZW4gYXR0YWNoZWQgdG8gaXRzIGdlbnBkLiBUaGlzIGFsbG93cyB0aGUK
Pj4+IGNhbGxiYWNrLCB0byBpbnZva2UgY2xrX2dldF9yYXRlKCkgYW5kIHRoZW4gZGV2X3BtX29w
cF9zZXRfcmF0ZSgpLCB0bwo+Pj4gdXBkYXRlIHRoZSB2b3RlIGFjY29yZGluZyB0byB0aGUgY3Vy
cmVudCBzdGF0ZSBvZiB0aGUgSFcuCj4+Cj4+IEkgd291bGRuJ3QgY2FsbCBkZXZfcG1fb3BwX3Nl
dF9yYXRlKCkgZnJvbSB0aGVyZSwgc2luY2UgaXQgbWVhbnMKPj4gY29uZmlndXJlIGFuZCBlbmFi
bGUgKGJvdGgpIGZvciBkaWZmZXJlbnQgcmVzb3VyY2VzLCBjbGssIHJlZ3VsYXRvciwKPj4gZ2Vu
cGQsIGV0Yy4uCj4gCj4gUmlnaHQsIGdvb2QgcG9pbnQhCj4gCj4gZGV2X3BtX29wcF9zZXRfcmF0
ZSgpIGlzIGJlc3QgY2FsbGVkIGZyb20gY29uc3VtZXIgZHJpdmVycywgYXMgdGhleQo+IG5lZWQg
dG8gYmUgaW4gY29udHJvbC4KPj4gV2hhdCB3ZSBuZWVkIGhlcmUgaXMganVzdCBjb25maWd1cmUu
IFNvIHNvbWV0aGluZyBsaWtlIHRoaXMgdGhlbjoKVGhlIGludGVudCB3YXNuJ3QgdG8gdXNlIGRl
dl9wbV9vcHBfc2V0X3JhdGUoKSBmcm9tCl9fZ2VucGRfZGV2X3BtX2F0dGFjaCgpLCBidXQgdG8g
c2V0IGdlbnBkLT5ycG1fcHN0YXRlIGluIGFjY29yZGFuY2UgdG8KdGhlIGgvdyBjb25maWd1cmF0
aW9uLgoKT24gVGVncmEgd2UgaGF2ZSBhIGNoYWluIG9mIFBEcyBhbmQgaXQncyBub3QgdHJpdmlh
bCB0byBjb252ZXJ0IHRoZQpkZXZpY2UncyBPUFAgaW50byBwc3RhdGUgYmVjYXVzZSBvbmx5IHRo
ZSBwYXJlbnQgZG9tYWluIGNhbiB0cmFuc2xhdGUKdGhlIHJlcXVpcmVkIE9QUC4KClZpcmVzaCwg
cGxlYXNlIHRha2UgYSBsb29rIGF0IHdoYXQgSSBkaWQgaW4gWzFdLiBNYXliZSBpdCBjb3VsZCBi
ZSBkb25lCmluIGFub3RoZXIgd2F5LgoKWzFdCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9saW51eC10ZWdyYS9wYXRjaC8yMDIxMDcwMTIzMjcyOC4yMzU5MS0zLWRpZ2V0eEBn
bWFpbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
