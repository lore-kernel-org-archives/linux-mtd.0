Return-Path: <SRS0=h6Lp=II=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACA1C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 22:48:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB7764F60
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Mar 2021 22:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BB7764F60
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mc9f6p8XXsQ2nmBDW+8Wj1Flcm4L56YuSuNtjEBmDF4=; b=Zim74j/vvlUpTmT1H/bZpDbZw
	82DbjBODmcXjnVDxyRhFXBzyxV6+hdruaY6Si8GoB9AQzoDScHQsBeNq/bzgPzYGweEygxvsZ6Xel
	Uy1fKiWFCcUa+Ny1QpxycdZc4IdskyUnSyrRfd9yDY/AxIgFGDix1YLGjJpXv0q+caPw/tD1ReLn4
	LD1wxXKXozOMMuMAYo186EwM3tVPlsptXImUr9AgntZu7a7/UUtWkAlz8WafFSi1UNZUgrup3krSN
	WTsJOF370y8Yg1uLuatLAQSqGmkqUj5cQdfTLGf30dPHO77Gh8Dh8MMDqbiEdPd0ArkH9RiXTpVfE
	qOD4T3Y+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK7cM-007vzv-C6; Wed, 10 Mar 2021 22:47:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK7cH-007vzB-3l
 for linux-mtd@lists.infradead.org; Wed, 10 Mar 2021 22:47:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id g20so149869wmk.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Mar 2021 14:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Dp9DInsVMxgWeAboBahDiDPT111NcMpaXY2ilDA9Zo4=;
 b=b31D9MRU1bFKXcV8L7Yf+L1dnbD+tOUfbPMCHx5mO+dPzZE8N7105P4EYquurdH3r/
 nuz5XqMTFB27T9BnsxahsmlmlKLGXpT8ObuVunhx1Za/DguZuVMsp+4UZgCCqdBiUBjh
 OaDbfrHTvCFHKPfRaKmUN/QKkHHCholELtncvq4nWpZnutVNKoCLMb91of7x3ofW2j4e
 IwcJOcQa3buL7iXofPZSFkeYVWeJF9Gz+m+01GWVvQnOZTGkLUmu7+InS4raQglPSOgb
 Wvq/5dbpNgWRkUbK6YlJiRl6RLd8MUp6CCefw+3mYTATjtsrWF1cyK+qQYNAHaxAvJV6
 USPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Dp9DInsVMxgWeAboBahDiDPT111NcMpaXY2ilDA9Zo4=;
 b=PUqJubYxENLviVa+6ERN1Sv4jXjANGLJOMruZTw7z7UWVkYd0yHVQ3b+dRcLJ2x6Gw
 IKZ7ZJE9LqtFXSkXMA8B1fh52c1pAAEGtWf4Mmc9cELOS83OAWrcV0bUCYEvo3DnfSsW
 5gPxjVlM4gXZTax6Im2XBMp+FVlZ9x3OvdIclIPLDw9WMD9KLmR3mgmPObHjhvUqyzTm
 OjENQXXq85U6oHDgxHDG92r61PFTenfjj3RZjFPs9x12K/E7WSdRGC075UwY/Gi12f/4
 wJ7WK5ZdNlpJ7ycXxnxukokVc96A7YNPxDH9U2VVLTvjSvyU2WQcbBs3hiAJvBkNopRC
 bFlA==
X-Gm-Message-State: AOAM531LCZB1llZFw7byCL1CjuqahVig5JDt6mQ1NMamFwXjSQgyBxvM
 zDIs51uYalrr4ytKHLxUa/8=
X-Google-Smtp-Source: ABdhPJyR/gLtCOZzQajU4mg+PApLftgolVO8nNF6Z7DmFi3vssrDLEZaY/scs1tGzbr93bGS/VhZtA==
X-Received: by 2002:a05:600c:2cd8:: with SMTP id
 l24mr5317774wmc.88.1615416464250; 
 Wed, 10 Mar 2021 14:47:44 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.gmail.com with ESMTPSA id z25sm909099wmi.23.2021.03.10.14.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 14:47:43 -0800 (PST)
Date: Wed, 10 Mar 2021 23:47:42 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Message-ID: <YElMjg/AspNSRe0A@Ansuel-xps.localdomain>
References: <20210310210812.8880-1-ansuelsmth@gmail.com>
 <20210310210812.8880-2-ansuelsmth@gmail.com>
 <5d798266-3a18-d50d-9c3e-f91bc2460fe5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d798266-3a18-d50d-9c3e-f91bc2460fe5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_224745_226370_1BC4D6DE 
X-CRM114-Status: GOOD (  22.75  )
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

T24gV2VkLCBNYXIgMTAsIDIwMjEgYXQgMTE6NDE6MjRQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IFNlZSBpbmxpbmUKPiAKPiBPbiAxMC4wMy4yMDIxIDIyOjA4LCBBbnN1ZWwgU21p
dGggd3JvdGU6Cj4gPiBEb2N1bWVudCBudm1lbS1jZWxscyBjb21wYXRpYmxlIHVzZWQgdG8gdHJl
YXQgbXRkIHBhcnRpdGlvbnMgYXMgYQo+ID4gbnZtZW0gcHJvdmlkZXIuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL252bWVtLWNlbGxzLnlhbWwgIHwgOTYgKysr
KysrKysrKysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKQo+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL252bWVtLWNlbGxzLnlhbWwKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9udm1lbS1jZWxs
cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25z
L252bWVtLWNlbGxzLnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAw
MDAwMDAwMDAuLmY3MGQ3NTk3YTZiMAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL252bWVtLWNlbGxzLnlh
bWwKPiA+IEBAIC0wLDAgKzEsOTYgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvcGFydGl0aW9ucy9udm1lbS1j
ZWxscy55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBOdm1lbSBjZWxscwo+ID4gKwo+ID4gK2Rl
c2NyaXB0aW9uOiB8Cj4gPiArICBBbnkgcGFydGl0aW9uIGNvbnRhaW5pbmcgdGhlIGNvbXBhdGli
bGUgIm52bWVtLWNlbGxzIiB3aWxsIHJlZ2lzdGVyIGFzIGEKPiA+ICsgIG52bWVtIHByb3ZpZGVy
Lgo+ID4gKyAgRWFjaCBkaXJlY3Qgc3Vibm9kZXMgcmVwcmVzZW50cyBhIG52bWVtIGNlbGwgZm9s
bG93aW5nIHRoZSBudm1lbSBiaW5kaW5nLgo+ID4gKyAgTnZtZW0gYmluZGluZyB0byBkZWNsYXJl
IG52bWVtLWNlbGxzIGNhbiBiZSBmb3VuZCBpbjoKPiA+ICsgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udm1lbS9udm1lbS55YW1sCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4g
PiArICAtIEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gCj4gSSB0aGluayB0
aGF0IHdoZW4gUm9iIHdyb3RlOgo+IAo+IE9uIDEwLjAzLjIwMjEgMDM6NTgsIFJvYiBIZXJyaW5n
IHdyb3RlOgo+ID4gSSB0aGluayB0aGlzIHNob3VsZCByZWZlcmVuY2UgbnZtZW0ueWFtbC4KPiAK
PiBoZSBtZWFudCB5b3UgdXNpbmc6Cj4gCj4gYWxsT2Y6Cj4gICAtICRyZWY6ICJudm1lbS55YW1s
IyIKPiAKPiAoeW91J2xsIG5lZWQgdG8gYWRqdXN0IGJpbmRpbmcgcGF0aCkuCj4gCj4gUGxlYXNl
IGNoZWNrIGhvdyBpdCdzIGRvbmUgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L252bWVtLyoueWFtbCBmaWxlcwo+IAo+CgpBc2lkZSBmcm9tIHRoYXQsIHNob3VsZCBJIHJlYWRk
IHRoZSBvbGQgcHJvcGVydGllcyBvciBJIGNhbiBrZWVwIHRoZQpjb21wYXRpYmxlIGFzIHRoZSBv
bmx5IG9uZSByZXF1aXJlZD8KClRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uCgo+ID4gK3Byb3Bl
cnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogbnZtZW0tY2VsbHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
