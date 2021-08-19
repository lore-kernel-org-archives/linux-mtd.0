Return-Path: <SRS0=z9um=NK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E314C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 06:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F06C61106
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Aug 2021 06:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F06C61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sI6qUhyJ2faT+sfJbfFtehQxZRtXszTHTXH3OwQ0TxA=; b=1u1UCNNbxJraj2
	tjz1AWIBgodYx94elykdBbRT4CpUrQ1agPNykhnJ+kybG/fsXbXcooSdDsqyQ7ZowX12T+Yl1QV7K
	xuGP34+nOm+iAuVMxSqnsgHe0QBhRPwgeJiTj/snnN0hbUvva67BDLo59BpLLbcwsTps49WIA7aRr
	zS2+1CbbKSweyVbYFviGEpODFDUspCdtmhv/W23lNvG0yFrC0HJvHPdGQ3DsWC5lXkTeEFndOjUiF
	7aklZLJ8ICfdGv+QPjC7J1FRR5/J0ldgB/Ne8+E3PzRxN6fss8U4yhqZYVg8fyaieYj0TKQoqDz4O
	1zNDgkCavZX+ZzRdEDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGbMu-007KDo-I3; Thu, 19 Aug 2021 06:17:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGbMo-007KCF-MC
 for linux-mtd@lists.infradead.org; Thu, 19 Aug 2021 06:17:34 +0000
Received: by mail-pj1-x1034.google.com with SMTP id n5so4230876pjt.4
 for <linux-mtd@lists.infradead.org>; Wed, 18 Aug 2021 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Z7TQEkkTOfvT3y1VcK9cbeGmLxLBDuWce4oY9e31CIQ=;
 b=n8Z7pceL3Q1hHrYhRGbE2Ft6ysYoV2T29GwsgsIk5zym7iZcje0CXVg1jI36aNnFP1
 wEt31EiA2dUBQwlv5rK6Pb4jBRjUZnVnX9lq3yYWlZnsAiqoC84b2+sIg5qRcoOEikt2
 Bl5OLXFHBLycojOK68FIhPW3b2fskqhF3vr/eyYOYKdL7QspG0UOJAgIVnJ/rUe4LZFr
 9Mx+8O2v0d2rHrH3yazUPQGMQQQiYdzhDIVBgB1HMOdlKqueyQlS0Pa++oE7KDNseaKY
 ZqQcskpZ4qIHBPun+Nz8BNcPrFRsCGUIgrdD9AWMNWaoX41LuxEow35zOBfD0rRFPHfn
 o2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Z7TQEkkTOfvT3y1VcK9cbeGmLxLBDuWce4oY9e31CIQ=;
 b=judULIvuODAl6r8aTc1SjVr2JvZ7409qcAbs11aG2eajKeKmQLlmmgtwc3obwuGOP0
 jLmjiiyFrAIq61dy68a10OM8kO19vxCFe5xe8oXFwh0qTWdPWr0mehfHTdrdGe/9/4uK
 vXqBQoDZRmggeQRlhBqJ97BA8P/BZgld7wMsngY0eoeMEqrSI1EiaRMOXP+207ByS728
 aezZqqEwz1hSfGp6Y2V4uUiDPtXA0EHiLiQCvNqh8JgmqK7sPbGgxChQtV5gtPd7Vy7K
 WvtZGodOhnXYaPmpSgEUPRN9FTmsgjxT+Hh30ykHo5EI3Z4WK0pS44Wiqd1RGFPfcR6M
 LfgA==
X-Gm-Message-State: AOAM5328x4axU7c+dttDvpJqRbboAsGT27sEJFqrtXRRRGFzpFr7623N
 t3QpHH18RMhtfVGZmy7nBf5r3A==
X-Google-Smtp-Source: ABdhPJwi8ECnFjz7ftlBUkQP1U01xvcbaFwYmCvSxRCVadF/ZCBCreA9Xq0KVJGpteNV1tSqbtF8Eg==
X-Received: by 2002:a17:90a:ce88:: with SMTP id
 g8mr13456163pju.116.1629353849006; 
 Wed, 18 Aug 2021 23:17:29 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id r18sm2222724pgk.54.2021.08.18.23.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 23:16:53 -0700 (PDT)
Date: Thu, 19 Aug 2021 11:46:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210819061617.r4kuqxafjstrv3kt@vireshk-i7>
References: <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1314a47-9e8b-58e1-7c3f-0afb1ec8e70a@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_231730_761709_23EACECC 
X-CRM114-Status: GOOD (  25.12  )
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

T24gMTgtMDgtMjEsIDE4OjU1LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTguMDguMjAyMSAx
Mjo0MSwgVWxmIEhhbnNzb24g0L/QuNGI0LXRgjoKPiAKPiBFaXRoZXIgd2F5IGdpdmVzIHRoZSBl
cXVhbCByZXN1bHQuIFRoZSBuZXcgY2FsbGJhY2sgYWxsb3dzIHRvIHJlbW92ZSB0aGUKPiBib2ls
ZXJwbGF0ZSBkZXZfcG1fb3BwX3NldF9yYXRlKGNsa19nZXRfcmF0ZSgpIGNvZGUgZnJvbSB0aGUg
cnBtLXJlc3VtZQo+IG9mIGNvbnN1bWVyIGRldmljZXMsIHRoYXQncyBpdC4KCkl0IG1heSBub3Qg
YmUgZXF1YWwsIGFzIGRldl9wbV9vcHBfc2V0X3JhdGUoKSBtYXkgZG8gYWRkaXRpb25hbCBzdHVm
ZiwKbm93IG9yIGluIGEgbGF0ZXIgaW1wbGVtZW50YXRpb24uIEN1cnJlbnRseSBpdCBvbmx5IGRv
ZXMKcmVndWxhdG9yX2VuYWJsZSgpIGFzIGEgc3BlY2lhbCBjYXNlLCBidXQgaXQgY2FuIGJlIGNs
a19lbmFibGUoKSBhcwp3ZWxsLiBBbHNvLCB0aGlzIHRyaWVzIHRvIHNvbHZlIHRoZSBwcm9ibGVt
IGluIGEgdHJpY2t5L2hhY2t5IHdheSwKd2hpbGUgYWxsIHlvdSB3YW50ZWQgd2FzIHRvIG1ha2Ug
dGhlIGdlbnBkIGF3YXJlIG9mIHdoYXQgdGhlCnBlcmZvcm1hbmNlIHN0YXRlIHNob3VsZCBiZS4K
CllvdXIgZHJpdmVyIGNhbiBicmVhayB0b21vcnJvdyBpZiB3ZSBzdGFydGVkIHRvIGRvIG1vcmUg
c3R1ZmYgZnJvbQp0aGlzIEFQSSBhdCBhbm90aGVyIHRpbWUuCgo+ID4gZGV2X3BtX29wcF9zZXRf
cmF0ZSgpIGlzIGJlc3QgY2FsbGVkIGZyb20gY29uc3VtZXIgZHJpdmVycywgYXMgdGhleQo+ID4g
bmVlZCB0byBiZSBpbiBjb250cm9sLgo+ID4+IFdoYXQgd2UgbmVlZCBoZXJlIGlzIGp1c3QgY29u
ZmlndXJlLiBTbyBzb21ldGhpbmcgbGlrZSB0aGlzIHRoZW46Cj4gVGhlIGludGVudCB3YXNuJ3Qg
dG8gdXNlIGRldl9wbV9vcHBfc2V0X3JhdGUoKSBmcm9tCj4gX19nZW5wZF9kZXZfcG1fYXR0YWNo
KCksIGJ1dCB0byBzZXQgZ2VucGQtPnJwbV9wc3RhdGUgaW4gYWNjb3JkYW5jZSB0bwo+IHRoZSBo
L3cgY29uZmlndXJhdGlvbi4KClJpZ2h0LgoKPiBPbiBUZWdyYSB3ZSBoYXZlIGEgY2hhaW4gb2Yg
UERzIGFuZCBpdCdzIG5vdCB0cml2aWFsIHRvIGNvbnZlcnQgdGhlCj4gZGV2aWNlJ3MgT1BQIGlu
dG8gcHN0YXRlIGJlY2F1c2Ugb25seSB0aGUgcGFyZW50IGRvbWFpbiBjYW4gdHJhbnNsYXRlCj4g
dGhlIHJlcXVpcmVkIE9QUC4KClRoZSBkcml2ZXIgc2hvdWxkIGp1c3QgYmUgcmVxdWlyZWQgdG8g
bWFrZSBhIGNhbGwsIGFuZCBPUFAvZ2VucGQgY29yZQpzaG91bGQgcmV0dXJuIGl0IGEgdmFsdWUu
IFRoaXMgaXMgYWxyZWFkeSBkb25lIHRvZGF5IHdoaWxlIHNldHRpbmcgdGhlCnBzdGF0ZSBmb3Ig
YSBkZXZpY2UuIFRoZSBzYW1lIGZyYW1ld29ya3MgbXVzdCBiZSBhYmxlIHRvIHN1cHBseSBhCnZh
bHVlIHRvIGJlIHVzZWQgZm9yIHRoZSBkZXZpY2UuCgo+IFZpcmVzaCwgcGxlYXNlIHRha2UgYSBs
b29rIGF0IHdoYXQgSSBkaWQgaW4gWzFdLiBNYXliZSBpdCBjb3VsZCBiZSBkb25lCj4gaW4gYW5v
dGhlciB3YXkuCgpJIGxvb2tlZCBpbnRvIHRoaXMgYW5kIGxvb2tlZCBsaWtlIHRvbyBtdWNoIHRy
b3VibGUuIFRoZQppbXBsZW1lbnRhdGlvbiBuZWVkcyB0byBiZSBzaW1wbGUuIEkgYW0gbm90IHN1
cmUgSSB1bmRlcnN0YW5kIGFsbCB0aGUKcHJvYmxlbXMgeW91IGZhY2VkIHdoaWxlIGRvaW5nIHRo
YXQsIHdvdWxkIGJlIGJldHRlciB0byBzdGFydCB3aXRoIGEKc2ltcGxlciBpbXBsZW1lbnRhdGlv
biBvZiBnZXRfcGVyZm9ybWFuY2Vfc3RhdGUoKSBraW5kIG9mIEFQSSBmb3IKZ2VucGQsIGFmdGVy
IHRoZSBkb21haW4gaXMgYXR0YWNoZWQgYW5kIGl0cyBPUFAgdGFibGUgaXMgaW5pdGlhbGl6ZWQu
CgpOb3RlLCB0aGF0IHRoZSBPUFAgdGFibGUgaXNuJ3QgcmVxdWlyZWQgdG8gYmUgZnVsbHkgaW5p
dGlhbGl6ZWQgZm9yCnRoZSBkZXZpY2UgYXQgdGhpcyBwb2ludCwgd2UgY2FuIHBhcnNlIHRoZSBE
VCBhcyB3ZWxsIGlmIG5lZWRlZCBiZS4KCi0tIAp2aXJlc2gKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
