Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EFEC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 14:42:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36B320656
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 14:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IoUF90Jh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqnjRWjI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A36B320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ff3LSpgJ6Uw7l6GM34GuCjlOXOcZMlgc32/wkUQwQjw=; b=IoUF90JhSIlh5s
	DBfKkLmE457l3lEl8HwlEmnbSNznAQxF4kjMH+w7nBnWgaOMPPzYlfeAIifI1D/ykDMM0mcp63IuA
	Ug68J1c/x/1zXTIMAL7IzzRG18Ktm4+mbm+GNDVSfG437k7SnYJVbAQ/CL5bzVEkR3/gHgzHUkx28
	MScs/yBrKo938GKT/gNirMpSCmX03sXv7/qzmsBnTaK+hVyfpkFPjXjDtn3FEp/oOLEpH0O5sw2Cq
	DBkr/py433DyWoP0ijbe+89nNfWcwBZ7gFUsXqR7FAH059fyNNNpYFT/7uaU0j+dCR6wjrSC0a6Ze
	nEWb5K8E4I7ZU+o2vN7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL7Ue-0005iJ-9v; Mon, 29 Apr 2019 14:42:56 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL7Ub-0005hc-EC
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 14:42:54 +0000
Received: by mail-lf1-x143.google.com with SMTP id u17so8227367lfi.3
 for <linux-mtd@lists.infradead.org>; Mon, 29 Apr 2019 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H+FUhoAG0fL/FjGxEsCS+PUjM/aNhQ8xffw+Uis7okk=;
 b=OqnjRWjIkIWfMSl6TLYqvoVGZTIodXRpmxOG3jqpcZYB+Aye6qqATR+S2FNwFmeKK1
 I9V3FDjAszSWtSa4QcMB2Ap8X+n3Vm7OlaWVJQ8bt5niHkBrR0xjl43mRdLm+DTaeS9T
 pk+x5W2VjsALPWa3UjxR4Zq9qFrC8Wtrn9vmwd0owFjp+cYL+q51ntFWN4Dyane918Jx
 hXJVMgnqfTxhUZrb+COweBf8/dn4oyP3Ke+q+qFsgy3fpVWB/7LUDCPciCCNgBuT9cju
 9TMNbBpNXWed6EX8rC7wGevRFU67enf5yAwNZHqkqNTrwEbk6ZAktksFyBmVLtPjuc/X
 kBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+FUhoAG0fL/FjGxEsCS+PUjM/aNhQ8xffw+Uis7okk=;
 b=ERCeboh6ZGDINtoeQE+uhjJZokXR9sxGfq2k+Wy+lir1nf2UmCjIzPz4VMpgQZnRu2
 yTrhNSjcTUWfcYxjnZtyqCzGgaTB7YqQLr+tupIJz/CwqAj/ouA4EAdzHi7VhRqme2T+
 78o15CuNWj0S8kQ8h1r9MiE88sr7aOfEEYt/2c5UxHQkjBdYWvMTCmwMsxUY4BYxgUMA
 3jr2SnGKaZTuRTiiIYxpyzUFuGbvXkKVYijARrNAWXTyMKuBGha9pXqmrlea5qqNPuLo
 e7fkWCAIot9oXOc7EJC8XB3kwGnyqQ5Qap1Zf5ukmhpzjtcd9Xno9DFIJuwDB/NHmtTN
 5RUQ==
X-Gm-Message-State: APjAAAWM1BdLhK7UkSsKZnOJABX0fuxoiIWMYTyf/Rn2Go5NKIoU0JyW
 G2uQhKxOy73qxRtB67OVGwo=
X-Google-Smtp-Source: APXvYqzyknSkge7EA+KXTt5slr4ggcDQid3eyM3jg8HEnwSHC6GOo2KwrkuoDuhiJTUvNFhhsfK2FA==
X-Received: by 2002:a19:384d:: with SMTP id d13mr13068296lfj.38.1556548971256; 
 Mon, 29 Apr 2019 07:42:51 -0700 (PDT)
Received: from acerlaptop.localnet ([2a02:a315:5445:5300:605a:8802:3f56:a345])
 by smtp.gmail.com with ESMTPSA id
 l79sm7371044lfe.92.2019.04.29.07.42.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Apr 2019 07:42:49 -0700 (PDT)
From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/5] mtd: onenand/samsung: Add device tree support
Date: Mon, 29 Apr 2019 16:42:47 +0200
Message-ID: <1813629.D8pu8sOiIg@acerlaptop>
In-Reply-To: <20190429101928.265998b5@xps13>
References: <20190426164224.11327-1-pawel.mikolaj.chmiel@gmail.com>
 <20190429101928.265998b5@xps13>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_074253_503668_D2EB9020 
X-CRM114-Status: GOOD (  13.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 kyungmin.park@samsung.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gcG9uaWVkemlhxYJlaywgMjkga3dpZXRuaWEgMjAxOSAxMDoxOToyOCBDRVNUIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gSGkgUGF3ZcWCLAo+IAo+IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29s
YWouY2htaWVsQGdtYWlsLmNvbT4gd3JvdGUgb24gRnJpLCAyNiBBcHIgMjAxOQo+IDE4OjQyOjE5
ICswMjAwOgo+IAo+ID4gVGhpcyBwYXRjaHNldCBhZGRzIGRldmljZSB0cmVlIHN1cHBvcnQgdG8g
U2Ftc3VuZyBPbmVOQU5EIGRyaXZlci4KPiA+IEl0IHdhcyB0ZXN0ZWQgb24gU2Ftc3VuZyBHYWxh
eHkgUyBhbmQgU2Ftc3VuZyBHYWxheHkgUyBGYXNjaW5hdGUgNEcsCj4gPiBhbiBTYW1zdW5nIFM1
UFYyMTAgYmFzZWQgbW9iaWxlIHBob25lcy4KPiA+IAo+ID4gVG9tYXN6IEZpZ2EgKDUpOgo+ID4g
ICBtdGQ6IG9uZW5hbmQvc2Ftc3VuZzogVW5pZnkgcmVzb3VyY2Ugb3JkZXIgZm9yIGNvbnRyb2xs
ZXIgdmFyaWFudHMKPiA+ICAgbXRkOiBvbmVuYW5kL3NhbXN1bmc6IE1ha2Ugc3VyZSB0aGF0IGJ1
cyBjbG9jayBpcyBlbmFibGVkCj4gPiAgIG10ZDogb25lbmFuZC9zYW1zdW5nOiBBZGQgZGV2aWNl
IHRyZWUgc3VwcG9ydAo+ID4gICBkdC1iaW5kaW5nOiBtdGQ6IG9uZW5hbmQvc2Ftc3VuZzogQWRk
IGRldmljZSB0cmVlIHN1cHBvcnQKPiA+ICAgbXRkOiBvbmVuYW5kL3NhbXN1bmc6IFNldCBuYW1l
IGZpZWxkIG9mIG10ZF9pbmZvIHN0cnVjdAo+ID4gCj4gPiAgLi4uL2JpbmRpbmdzL210ZC9zYW1z
dW5nLW9uZW5hbmQudHh0ICAgICAgICAgIHwgNDYgKysrKysrKysrCj4gPiAgZHJpdmVycy9tdGQv
bmFuZC9vbmVuYW5kL3NhbXN1bmcuYyAgICAgICAgICAgIHwgOTQgKysrKysrKysrKysrKy0tLS0t
LQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygt
KQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL3NhbXN1bmctb25lbmFuZC50eHQKPiA+IAo+IAo+IEkgdGhpbmsgeW91IHNob3VsZCB1
c2UgIm10ZDogb25lbmFuZDogc2Ftc3VuZzoiIGFzIHByZWZpeC4KPiAKPiBUaGFua3MsCj4gTWlx
dcOobAo+IApIaSBNaXF1w6hsCgpJJ2xsIGZpeCBhbGwgaXNzdWVzIGFuZCBzZW5kIG5ldyB2ZXJz
aW9uIG9mIHBhdGNoc2V0LgpUaGFua3MgZm9yIHJldmlldyBhbmQgY29tbWVudHMKCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
