Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3535C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:35:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 733E760F38
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 04:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 733E760F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/FHtO6tx1nkfwqfJJwFp4JgIqYG+SZlhh8A5eAGnS0=; b=cAMh8hgMOfBiWr
	B+umSDEmOdp43HTWQuz+UopkHsxlg+6jecs0o37CtCSDV2Wojabvk4wCbJo6mOPF1+cSGsvj9UlH2
	0UPfDIBrpw/31jyMAS+o2MR24FOf3ZDdJ9y1CK+DQvKJCyecdLRfW39aM2pHzd7e0NDEAIGTpcjYF
	zGIpVPWWnMe/hO57AaRg3ylHIBTE5zMnd4ONDLV/hhEAeBw+gF9VEbpIsbAyM7VHUIRVUo9QXXw7r
	IUcNFw/OpDsrMQZ4wFFyg3ARaUbFL7JKYapvPZ6vizuTk3UBwZuSpGqrRJxjd9/Irph5sDl9/ttZI
	DIuXDmWIq6DFM11366Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGDHa-0048CL-In; Wed, 18 Aug 2021 04:34:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGDHU-00489L-7s
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 04:34:28 +0000
Received: by mail-pj1-x1036.google.com with SMTP id bo18so1896819pjb.0
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 21:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=eqqpYWePv3bA2FFLn8JZZpHhH3Zi1uHmK7sHrQbWFRw=;
 b=HTtKdG+zPt9q7oo6G+tDPFjywlUf2fIlTsljJrBXemAFCqVrXkLJH2J4prixqFwlWE
 J0unc6IdtxCIWudbX02SO4ATFxlaCA1/SoUQMq5P6D3Yk+OduOvpAgff7we5YXfkgCXL
 xlXEBHCz776bTxOcJUNBOjuFaUsXP9ZzpIxEjcZgNlKhHXQmSXT4WG5V74nVrjqmloLj
 jHkkS9fxFa3uYd/EQoKSWBdLGmIyIORJT1upv4QdPBmxwIAVox5/qef1kPsgzwvpXT4k
 bTjafbU59iMyj4iWu6735iceyC6eQ4HGcIB0qT1Sv4H6XxtMpHDdFpm5Po4IlPj8a0jc
 JKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=eqqpYWePv3bA2FFLn8JZZpHhH3Zi1uHmK7sHrQbWFRw=;
 b=qTnFWvv04134oZrN3Rt/7x2GnK9tq2lmVweO8m3bnIeiZWoodTDYav7j3BSyU+Wfie
 TrL4eM65MrJYMJzohYRGkbbaK4H4V7zSOKC+pKQgASMMQT2d5lqrzdzlg8u3Wv9fII/q
 LhmOpOVKYPUZNQyvI4XQcyeyXyLJX9jIrXF50p5ciaxwcMXc1YZd7wk6YUBsI9PoQUrB
 qz7gxsB9VR087F2BVPoiJWP4SpVmwaHP4KNIIgZPr7D088zWahyrdc4ozcfJK5ZbgSxD
 MKDICRYadwdhqXSaJ65vkrieyBOchRClBNiEmdw+BoO4gQZNxNbfH2qPyYd6fD3/IFqJ
 hFkw==
X-Gm-Message-State: AOAM5309eBIHQAbSmUYwi0/CaLbCjiw0VpgWdx1jf+9ztouNyUyqIIMj
 8NkFGCWcfFq3G3TzwRIBbijETA==
X-Google-Smtp-Source: ABdhPJyyJyLRvTMcV2VMadnYuEIWvMA5nKw+OEK9l2guzi40QLIRwlX68yRwxZh/lfXmuYEMO47Zng==
X-Received: by 2002:a17:90b:1983:: with SMTP id
 mv3mr940040pjb.185.1629261263184; 
 Tue, 17 Aug 2021 21:34:23 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id f5sm4152122pfn.134.2021.08.17.21.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 21:34:22 -0700 (PDT)
Date: Wed, 18 Aug 2021 10:04:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
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
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818043421.cxa4gjrzerakmxxm@vireshk-i7>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <6df0ed60-e497-0af2-09b6-a9d82f502f17@gmail.com>
 <6438bdfb-3e9e-40dd-fa7c-c79f0892e12a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6438bdfb-3e9e-40dd-fa7c-c79f0892e12a@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_213424_332171_3FB348ED 
X-CRM114-Status: GOOD (  13.16  )
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

T24gMTgtMDgtMjEsIDA3OjMwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTguMDguMjAyMSAw
NzoyOSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gPj4gVGhlIGZpcnN0IHJlc3VtZSBp
bml0aWFsaXplcyB0aGUgT1BQIHN0YXRlIG9uIHN5bmMsIGFsbCBmdXJ0aGVyIHN5bmNzIG9uCj4g
Pj4gcmVzdW1lIGFyZSBuby1vcHMuCj4gPj4KPiA+IAo+ID4gTm90aWNlIHRoYXQgd2UgdXNlIEdF
TlBEIGhlcmUuIEdFTlBEIGNvcmUgdGFrZXMgY2FyZSBvZiBzdG9yaW5nIFBEJ3MKPiA+IHBlcmZv
cm1hbmNlIHN0YXRlICh2b2x0YWdlIGluIGNhc2Ugb2YgVGVncmEpIGFuZCBkcm9wcGluZyBpdCB0
byAwIGFmdGVyCj4gPiBycG0tc3VzcGVuZCwgR0VOUEQgY29yZSBhbHNvIHJlc3RvcmVzIHRoZSBz
dGF0ZSBiZWZvcmUgcnBtLXJlc3VtZS4KPiAKPiBCeSAnaGVyZScgSSBtZWFuIGluIHRoaXMgc2Vy
aWVzLgoKSXQgaXMgc3RpbGwgbm90IGNsZWFyIHRvIG1lIHdoeSB5b3UgbmVlZCB0byB0aGlzIG9u
IHJlc3VtZSwgYW5kIG5vdApwcm9iZS4KCi0tIAp2aXJlc2gKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
