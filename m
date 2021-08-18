Return-Path: <SRS0=f8pO=NJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE267C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 06:28:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7960B60F11
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Aug 2021 06:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7960B60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVyaQcynMJWJwEQI6za/P+1BArpwoZeMh1Ufx3hx/Ao=; b=N/P48NtwvUWW1/
	jT+hLFzhuVJsfUbx3BzP7Sl/6k1db+83OjKFYbOUnaFRHyoNSFuO5H/2XqKfxXodei5vidFnTD5Vj
	BOYwKCeU2aIpPxDJLt5Oqg/oM5zJnvHcM/+CLd/GB/pJ3KdC4Rl7FNtXZLfOffbK5cmWu1GYn7Fic
	X42i1w0tAJpafhOQ3iUF6S8NRNxwdirJgDsnT0JPyBjYvhjuANtw3/VedIU66XoDCXUr2/X9GNhiq
	fMfm6wDCOau/vTIBZg01HwjwyZFuYlJsd22CKE9+hpRFDauBNFgfD6MZQOlNA6Ul4vCb1QSgXHLXa
	HOnZBS4J03azmu0j2WUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGF2y-004Mxa-8e; Wed, 18 Aug 2021 06:27:32 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGF2s-004Mvw-Cy
 for linux-mtd@lists.infradead.org; Wed, 18 Aug 2021 06:27:30 +0000
Received: by mail-pg1-x535.google.com with SMTP id o2so1193367pgr.9
 for <linux-mtd@lists.infradead.org>; Tue, 17 Aug 2021 23:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ynpJGQ+aoMGoVR3/TzuLa6jhj83G7NCnezbFysKyDck=;
 b=rkMxRzllxsu72p9VoE+F1Y2uNFqfHroY89seElO0F/IF9+njGBhH+JhTjiV6p10xBW
 RZkVVmBoHTbmBO5qy0Cu5P7Yjfpn+Q0pDbpgd//DyVd9iIE8FToCC+snGEMZelh3paY/
 +hPtSq0td+yzw80H6HXZomYGW6ujPphQgl+LDlsExLGmraR/J0ZHNe7yOVInyCFXmT/P
 91wgqIKeFsyocJA7qECcUweDwMNTMng3I+m8yWPcUOWHp3ukJGcj7wwvK4fm1T2uIjDm
 QM2rYu2cAoeXaM+8hLCXU5bhhQmCXVpZaudJg93f24DbqOKNah/15WaZUn/RqJ/MrtRh
 mNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ynpJGQ+aoMGoVR3/TzuLa6jhj83G7NCnezbFysKyDck=;
 b=K6Dzwu5ISVgT9qn1up3v99loj//rPY0sew/xgvCjahJpf270cwQAjJCNomv46rCsWR
 LH/3etc3UgE855ZpS+V1cSDbQHKBJY2fDbqq2dmA/EZFM1+5bCTLkYM3oWRKo7NanIoQ
 9HL8Sk7ol9+OSI7G2s7qkwSkXxbCNCnsg5CLVThzER/5RBAAhTlm0vSNXr/fEMSuBc9a
 Bru/KDR7NjK7yxnnXmGdwcy+bGfNMC9d6d098KAq1OoLVHHcoZAr/oALRBE7O7WBNyTE
 9NIBc8DAMzQ/jGOHWqLgM2QmpWQuW9hxM/fGOTk4gNst7iqfCApBB9TX1itzXdvaeW+g
 UlIw==
X-Gm-Message-State: AOAM531ibBjX2RL0cPJl1cYReXqhw2PWLe9iVHbsuHMK+bCYzckLVxM+
 rJIBpIfibXZHK5WwFeooXJ2Jtw==
X-Google-Smtp-Source: ABdhPJyUhfdCbjMBESEOiqAS08eZgxAs7V5/0XRqW4UZTe3K4OmwyniXAPYZlVBrx4vmpFlW5lQzVA==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id
 t15-20020a62ea0f0000b02903198eef5ff1mr7706167pfh.74.1629268045601; 
 Tue, 17 Aug 2021 23:27:25 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id l12sm4457595pff.182.2021.08.17.23.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 23:27:24 -0700 (PDT)
Date: Wed, 18 Aug 2021 11:57:23 +0530
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
Message-ID: <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
References: <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_232726_556856_15A438A7 
X-CRM114-Status: GOOD (  24.38  )
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

T24gMTgtMDgtMjEsIDA5OjIyLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMTguMDguMjAyMSAw
ODo1OCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gPiBXaGF0IGFib3V0IGNhbGxpbmcgZGV2
X3BtX29wcF9zZXRfcmF0ZShkZXYsIGNsa19nZXRfcmF0ZShkZXYpKSBoZXJlCj4gPiBpbnN0ZWFk
ID8gVGhhdCB3aWxsIHdvcmssIHJpZ2h0ID8gVGhlIGFkdmFudGFnZSBpcyBpdCB3b3JrcyB3aXRo
b3V0Cj4gPiBhbnkgc3BlY2lhbCByb3V0aW5lIHRvIGRvIHNvLgo+IAo+IEl0IHdpbGwgd29yaywg
YnV0IGEgZGVkaWNhdGVkIGhlbHBlciBpcyBuaWNlci4KPiAKPiA+IEkgYWxzbyB3b25kZXIgbG9v
a2luZyBhdCB5b3VyIGdyM2QuYyBjaGFuZ2VzLCB5b3Ugc2V0IGEgc2V0LW9wcAo+ID4gaGVscGVy
LCBidXQgdGhlIGRyaXZlciBkb2Vzbid0IGNhbGwgc2V0X29wcF9yYXRlIGF0IGFsbC4gV2hvIGNh
bGxzIGl0Cj4gPiA/Cj4gCj4gZGV2X3BtX29wcF9zeW5jKCkgY2FsbHMgaXQgZnJvbSBfc2V0X29w
cCgpLgoKT2theSwgcGxlYXNlIHVzZSBkZXZfcG1fb3BwX3NldF9yYXRlKCkgaW5zdGVhZCB0aGVu
LiBOZXcgaGVscGVyIGp1c3QKYWRkcyB0byB0aGUgY29uZnVzaW9uIGFuZCBpc24ndCBkb2luZyBh
bnl0aGluZyBzcGVjaWFsIGFwYXJ0IGZyb20KZG9pbmcgY2xrX2dldF9yYXRlKCkgZm9yIHlvdS4K
Cj4gPiBBbmQgaWYgaXQgaXMgYWxsIGFib3V0IGp1c3Qgc3luY2luZyB0aGUgZ2VucGQgY29yZSwg
dGhlbiBjYW4gdGhlIGdlbnBkCj4gPiBjb3JlIGRvIHNvbWV0aGluZyBsaWtlIHdoYXQgY2xrIGZy
YW1ld29yayBkb2VzPyBpLmUuIGFsbG93IGEgbmV3Cj4gPiBvcHRpb25hbCBnZW5wZCBjYWxsYmFj
aywgZ2V0X3BlcmZvcm1hbmNlX3N0YXRlKCkgKGp1c3QgbGlrZQo+ID4gc2V0X3BlcmZvcm1hbmNl
X3N0YXRlKCkpLCB3aGljaCBjYW4gYmUgY2FsbGVkIGluaXRpYWxseSBieSB0aGUgY29yZSB0bwo+
ID4gZ2V0IHRoZSBwZXJmb3JtYW5jZSB0byBzb21ldGhpbmcgb3RoZXIgdGhhbiB6ZXJvLiBvcHAt
c2V0LXJhdGUgaXMKPiA+IHRoZXJlIHRvIHNldCB0aGUgcGVyZm9ybWFuY2Ugc3RhdGUgYW5kIGVu
YWJsZSB0aGUgc3R1ZmYgYXMgd2VsbC4KPiA+IFRoYXQncyB3aHkgaXQgbG9va3MgaW5jb3JyZWN0
IGluIHlvdXIgY2FzZSwgd2hlcmUgdGhlIGZ1bmN0aW9uIHdhcwo+ID4gb25seSByZXF1aXJlZCB0
byBiZSBjYWxsZWQgb25jZSwgYW5kIHlvdSBhcmUgZW5kaW5nIHVwIGNhbGxpbmcgaXQgb24KPiA+
IGVhY2ggcmVzdW1lLiBMaW1pdGluZyB0aGF0IHdpdGggYW5vdGhlciBsb2NhbCB2YXJpYWJsZSBp
cyBiYWQgYXMgd2VsbC4KPiAKPiBXZSBkaXNjdXNzZWQgdmFyaWFudCB3aXRoIGdldF9wZXJmb3Jt
YW5jZV9zdGF0ZSgpIHByZXZpb3VzbHkgYW5kIFVsZgo+IGRpZG4ndCBsaWtlIGl0IGVpdGhlciBz
aW5jZSBpdCBzdGlsbCByZXF1aXJlcyB0byB0b3VjaCAnaW50ZXJuYWxzJyBvZiBHRU5QRC4KCkht
bSwgSSB3b25kZXIgaWYgdGhhdCB3b3VsZCBiZSBhIHByb2JsZW0gc2luY2Ugb25seSBnZW5wZCBj
b3JlIGlzCmdvaW5nIHRvIGNhbGwgdGhhdCByb3V0aW5lIGFueXdheS4KCi0tIAp2aXJlc2gKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
