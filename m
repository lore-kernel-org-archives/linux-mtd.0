Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FAEC4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 03:56:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00C96023F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 03:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A00C96023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpFJXZKoFYPY+QXd+/7s9eoqKIh4xhQsUirJx0A6bTA=; b=UzvNwTw283BR7I
	NjxvfE/gWAuLaEfDfbF1vJfCKiMR5LVGrj3+b8t2nwOtAkMK8ZeCML7HqEvbQkZW500x/o4vxdlC8
	aTHyZnqjSlEmhL5xOgxuMhDf3nQLkF0VLof7aEQAzS91ABso1S+p9NXRkj7V4N2rUfqBhgq/pxZQC
	dcRa1l5CYh3lKmTOOe7AwUXM7WA0HU+mndppMYJt3/OWqQNnU4BvZdpaG78AadO82ED4HqbBQM4JX
	NrJMVrGjamx88UQpHgXW5fPBthtQHnGNZhjIbrvsk0xLmI1gk3J9l/CuSHKCVrmlTSfTj6nJHIywE
	+SsGydypLVw9ZfQb94Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGCg8-00459o-Mi; Wed, 18 Aug 2021 03:55:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGCfz-00457T-Gt
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 03:55:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id m26so807609pff.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 20:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=VGIhwyovjc9cLTorbY5F7s7VUrCyo5ROsIE6mKdF2i8=;
 b=rsLZ+5+cs34CeKm8FdeypOasGszO5Z+LGg/gURNdpo/BaltaeBSvKidQFxg+U/P7vq
 S/zusxLUtdDoCDzHAq+gTq22WAB40n4Qkk0Ku4cXOc+uTEyaQRKWv/b52rLV4JZHB+rE
 GpTGxz7vZkIm7Ms92t/jEfqzxajkgCcDGx/hfYVqqHH+Ja2QK6EJtgOjTFD7Mons7/7z
 jRQRosrCR9tYeU2COXGJUOTnQsHGWC5eYAYHYZf+lDoWMOvzM0YqaRI8vzA1Q6qR94h5
 JdL36SX2xj7RIzuN9CFefrR3429SFDWAFHYvDz+a1OiNH/4h5wRF/0Uqw9a4yTL9NaQb
 DX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=VGIhwyovjc9cLTorbY5F7s7VUrCyo5ROsIE6mKdF2i8=;
 b=Oo8nC3Dt4MPy63RYy1rUbtlBZnF2PiVtFp+xE66yo1q9lcYjwYgpvBJQv24ZKgPWP+
 YpYWydogLx1FWG/FPLQvEzUmlPEzChmbuSWCC1KDHbkVGRj8NXnxc6OSH/UL35KxLPPQ
 FBjYktw48/cwRo9cd3I1r80lxn0c2SD8KtQHzHbMg6NJFrzUUASOImDYKEsFYiRDvJIG
 qXiO84JGc6JSjdH7VoYrRnLk+YrVHoUEP/EpW25l0Yq9yfF+ExxsD0Uoja6t0pR1bomF
 f4ZAhFYxZAIvpehUpij5D7cg4UdKbpJ58yAvSi+hYsdjitGOPrsUiXdB16OkV56iPj3+
 pGUw==
X-Gm-Message-State: AOAM533UWIhf5v28NlMIIrH17E11yHNlUY0fdNUsth4DtuTVPTc4GRmI
 v2JAqMK1ZPlKhKE2X3iwe7Owzg==
X-Google-Smtp-Source: ABdhPJxZ0gvNmqzlYvzU9rK9OQ8NNCMq9wCIZZhKFhU5FN4x6UJRSgCEgSUhRZIdfilYavV9v+XkrA==
X-Received: by 2002:a62:a20d:0:b029:35b:73da:dc8d with SMTP id
 m13-20020a62a20d0000b029035b73dadc8dmr7200457pff.54.1629258935761; 
 Tue, 17 Aug 2021 20:55:35 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id u21sm4880194pgk.57.2021.08.17.20.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 20:55:35 -0700 (PDT)
Date: Wed, 18 Aug 2021 09:25:33 +0530
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
Message-ID: <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_205539_592595_8CC201D9 
X-CRM114-Status: GOOD (  18.45  )
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

T24gMTctMDgtMjEsIDE4OjQ5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTcuMDguMjAyMSAx
MDo1NSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gLi4uCj4gPj4gK2ludCBkZXZfcG1fb3Bw
X3N5bmMoc3RydWN0IGRldmljZSAqZGV2KQo+ID4+ICt7Cj4gPj4gKwlzdHJ1Y3Qgb3BwX3RhYmxl
ICpvcHBfdGFibGU7Cj4gPj4gKwlzdHJ1Y3QgZGV2X3BtX29wcCAqb3BwOwo+ID4+ICsJaW50IHJl
dCA9IDA7Cj4gPj4gKwo+ID4+ICsJLyogRGV2aWNlIG1heSBub3QgaGF2ZSBPUFAgdGFibGUgKi8K
PiA+PiArCW9wcF90YWJsZSA9IF9maW5kX29wcF90YWJsZShkZXYpOwo+ID4+ICsJaWYgKElTX0VS
UihvcHBfdGFibGUpKQo+ID4+ICsJCXJldHVybiAwOwo+ID4+ICsKPiA+PiArCWlmICghX2dldF9v
cHBfY291bnQob3BwX3RhYmxlKSkKPiA+PiArCQlnb3RvIHB1dF90YWJsZTsKPiA+PiArCj4gPj4g
KwlvcHAgPSBfZmluZF9jdXJyZW50X29wcChkZXYsIG9wcF90YWJsZSk7Cj4gPj4gKwlyZXQgPSBf
c2V0X29wcChkZXYsIG9wcF90YWJsZSwgb3BwLCBvcHAtPnJhdGUpOwo+ID4gCj4gPiBBbmQgSSBh
bSBub3Qgc3VyZSBob3cgdGhpcyB3aWxsIGVuZCB1cCB3b3JraW5nLCBzaW5jZSBuZXcgT1BQIHdp
bGwgYmUKPiA+IGVxdWFsIHRvIG9sZCBvbmUuIFNpbmNlIEkgc2VlIHlvdSBjYWxsIHRoaXMgZnJv
bSByZXN1bWUoKSBhdCBtYW55Cj4gPiBwbGFjZXMuCj4gCj4gSW5pdGlhbGx5IE9QUCB0YWJsZSBp
cyAidW5pbml0aWFsaXplZCIgYW5kIG9wcF90YWJsZS0+ZW5hYmxlZD1mYWxzZSwKPiBoZW5jZSB0
aGUgZmlyc3Qgc3luYyBhbHdheXMgd29ya3MgZXZlbiBpZiBPUFAgaXMgZXF1YWwgdG8gb2xkIG9u
ZS4gT25jZQo+IE9QUCBoYXMgYmVlbiBzeW5jZWQsIGFsbCBmdXJ0aGVyIHN5bmNzIGFyZSBOTy1P
UHMsIGhlbmNlIGl0IGRvZXNuJ3QKPiBtYXR0ZXIgaG93IG1hbnkgdGltZXMgc3luY2luZyBpcyBj
YWxsZWQuCj4gCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTQtcmM2L3Nv
dXJjZS9kcml2ZXJzL29wcC9jb3JlLmMjTDEwMTIKClJpZ2h0LCBidXQgaG93IHdpbGwgdGhpcyB3
b3JrIGZyb20gUmVzdW1lID8gV29uJ3QgdGhhdCBiZSBhIG5vLW9wID8KCi0tIAp2aXJlc2gKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
