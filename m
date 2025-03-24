Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461EEC36002
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Mar 2025 22:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:To:References:
	Date:Subject:Mime-Version:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xx/TYQaSvCTez0CQBONdTC1bq5tA57Rb3W019rc8Kw=; b=q81+TjjkmolK3M
	2ufxkMlkfpsyt15bwkETAyFU8iOlWq+j+mVXDXkXlslz+Wwo9dAmUJ6tCqLkGwrhVqhfEFlzNI35h
	biu06RGRGfp9A1RVK5kfmR7it9iAMHMlRHfU6eAA5jsRzHeDu/zojGcuLoIPDhEhPMcHgNoIjYRAY
	N1L6Je6ZtIcK/z6dSSryzhuDuWDMo/e9/xvGQIUf9LusUQLD/ryUaTH1jezfTyZo0Atz/qeA6A6T4
	GFjjz1VdeolUFdRiyV6iVnrQXx/avRsTP6nxjko6O+o6NPiV0SUwAVQeJNQ69DW/gREAxAaHkFqr7
	7CZhJHCkDBeXQyk3mLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twqfD-00000004SZg-3f9X;
	Mon, 24 Mar 2025 22:52:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twqfA-00000004SZL-3RDz
	for linux-mtd@lists.infradead.org;
	Mon, 24 Mar 2025 22:52:58 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so749409866b.0
        for <linux-mtd@lists.infradead.org>; Mon, 24 Mar 2025 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kohlschuetter-com.20230601.gappssmtp.com; s=20230601; t=1742856775; x=1743461575; darn=lists.infradead.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROXjshe1+EcXLHfxE8W+zRLqJexK1VAWPCWFr+Zrm80=;
        b=WkDY/jHlwATYnln08xAiNONuGYT1TlJweW3tkmnqNzf7u6ZfA7hpIvmvW8uV9xgTha
         vsFgYTDFIVmBo9utrqg4ULTYNHLGyOaiVoQvKjbDGENrtXDoXDkma9Kkr8b45BfUGOV1
         aJ+DqDMVemvuSoybKO8VhwJ8SAgD9L8mvGHXdHsI9spa31p0z26guBOk+avm03h1Hi8D
         OZSX35l8Aq9+UCQI1mHjh3dNtX9ydeQRP7f3nwJ0Ys8KCHDnKKCkfOnyvdqBLBbvDSZt
         ehuUXNSQu1Pf844E5bKcvjJwpryiK5/PbWaIGnDMwmH+m98B3jzJ36dJUL1rsiOThNAz
         Sb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742856775; x=1743461575;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROXjshe1+EcXLHfxE8W+zRLqJexK1VAWPCWFr+Zrm80=;
        b=vETbWrLu4yZKHfQa0uwbGeP2FBkL56h0wij5V0LJyuqjIClaIhpc/fppPM7GWHYPmt
         mI6NaTTzzK+nXqvXGAdmU0cZkF5p2fcJFm3PfH7YxwGFqJgnwFOzAJUpk5DTZD+K6Hf1
         Ab/30HsFP740tyS2/PnAhnj8/x9CAhpPJb9FgNUHAF6UED+3fhlVpKRSTF1IaaxllcmX
         n7dwn5hVm3AUMYeaWQIa0hmdVSVx/TJIFJa21QTD0oseTebTavolMWsxea8F4B9/T6wA
         HTtpHnx7b0ViL/LqVhtPdBVDynd36AVd2z8QZIoSCNmwE709a7wwK32+JT6X22bRVmnK
         iVvA==
X-Gm-Message-State: AOJu0YydzhkgqDfKmU5uq/JwNQSSVyjPS7Yyz5WykxswF48u4UcRVFmD
	IOIz4dNOV758n9q1H9b/vk3DMQNQYQIgAdyMZF4dREpEJ3ET3St98QKML7K7ExXf5VSDQxUILSN
	l
X-Gm-Gg: ASbGnctmTmXMekQOVBhYZHIzuc1o4n+/Lts3P98nd0vdHuwN83FLWamsYbCyNPlKNIN
	COF/hb6TMOKXdspkP0hXH7LiSZ+ocYj3ni6G2NDVvv778Q9mn4mey2au2xg5Z54UyhbYTRBlG/9
	e3SNXwsDqbyPCrc/nd+Y2jCgSc9IeLAo6lZPpUGkofqQtbxQr8yKGK+ktCiEucFet5bxFodjWpi
	yhfKynMSSsW32RRqdERS7UIWHZeIfAWDscFx9NiuP4bJxSSsZ10r9MyabA3cKPqVL+/v0OLazUW
	dwmY5dDC7SCTfOn2uZlvlrDim9agMDuWJTItVe701HE9iXm42Tp2dXTdxpC9VC7q8W0y
X-Google-Smtp-Source: AGHT+IFV8E23qe8JR4iCyH9ewjHwwEz41q+5sa72aXgG8UO0aMDo/UEiL931RNB6J+971olsEgUUWA==
X-Received: by 2002:a17:906:dc89:b0:ac3:eb29:2aed with SMTP id a640c23a62f3a-ac3f210904emr1480945866b.16.1742856774590;
        Mon, 24 Mar 2025 15:52:54 -0700 (PDT)
Received: from smtpclient.apple ([91.64.76.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef93e0e5sm746962766b.86.2025.03.24.15.52.54
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Mar 2025 15:52:54 -0700 (PDT)
From: =?utf-8?Q?Christian_Kohlsch=C3=BCtter?= <christian@kohlschutter.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: Cannot flash SPI-NOR MX25U6435F on Odroid N2+
Date: Mon, 24 Mar 2025 23:52:53 +0100
References: <8D10D785-2C5A-4695-8BC1-C7F54050211A@kohlschutter.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <8D10D785-2C5A-4695-8BC1-C7F54050211A@kohlschutter.com>
Message-Id: <9E576118-44E4-481C-9F68-6CFEDD456578@kohlschutter.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_155256_860639_45FD9E69 
X-CRM114-Status: GOOD (  15.50  )
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

UFM6IEl0IHNlZW1zIHRvIHdvcmsgd2hlbiBmbGFzaGluZyBhIHNlY29uZCB0aW1lIChpLmUuLCBj
YWxsaW5nIGZsYXNoY3Agd2l0aCB0aGUgc2FtZSBhcmd1bWVudHMgb25jZSBtb3JlKS4KCklzIHRo
ZXJlIGEgdGltaW5nIHJlcXVpcmVtZW50IGJldHdlZW4gZXJhc2UgYW5kIHdyaXRlPyBJcyBpdCBh
IGJ1ZyBpbiBtdGQtdXRpbHMgdGhhdCB3ZSBqdXN0IGRvbid0IGhpdCB3aXRoIHRoZSBjdXN0b20g
NC45IE9kcm9pZCBrZXJuZWw/Cgo+IE9uIDI0LiBNYXIgMjAyNSwgYXQgMjM6MDksIENocmlzdGlh
biBLb2hsc2Now7x0dGVyIDxjaHJpc3RpYW5Aa29obHNjaHV0dGVyLmNvbT4gd3JvdGU6Cj4gCj4g
SGkgYWxsLAo+IAo+IEknbSB0cnlpbmcgdG8gZmxhc2ggdGhlIE1YMjVVNjQzNUYgOE1CIFNQSS1S
T00gaW50ZWdyYXRlZCBpbiBPRFJPSUQgTjIrIGJvYXJkcy4KPiAKPiBVc2luZyBMaW51eCA2LjE0
IChvciBhbnkgb3RoZXIgcmVjZW50IG1haW5saW5lIGtlcm5lbCksIEkgY2FuJ3Qgc2VlbSB0byBn
ZXQgYW55IGNoYW5nZXMgcGVyc2lzdGVkOgo+IAo+IHN1ZG8gZmxhc2hjcCAtdiB1LWJvb3Quc3Bp
LmJpbiAvZGV2L210ZDAKPiBFcmFzaW5nIGJsb2NrczogMjg5LzI4OSAoMTAwJSkKPiBXcml0aW5n
IGRhdGE6IDExNTVrLzExNTVrICgxMDAlKQo+IFZlcmlmeWluZyBkYXRhOiAxMGsvMTE1NWsgKDAl
KUZpbGUgZG9lcyBub3Qgc2VlbSB0byBtYXRjaCBmbGFzaCBkYXRhLiBGaXJzdCBtaXNtYXRjaCBh
dCAweDAwMDAwMDAwLTB4MDAwMDI4MDAKPiAKPiBSZWxldmFudCBrZXJuZWwgY29uZmlnczoKPiBD
T05GSUdfTVREX1NQSV9OT1I9bQo+IENPTkZJR19NVERfU1BJX05PUl9TV1BfRElTQUJMRT15ICAj
IGRvZXMgbm90IG1ha2UgYSBkaWZmZXJlbmNlCj4gCj4gV2l0aCB0aGUgc2FtZSB1c2VybGFuZCB0
b29scyAobXRkLXV0aWxzIDIuMi4xLXIwIHJ1bm5pbmcgb24gQWxwaW5lIExpbnV4KSwgZmxhc2hp
bmcgc3VjY2VlZHMgd2hlbiB1c2luZyB0aGVpciBjdXN0b20ga2VybmVsIChiYXNlZCB1cG9uIDQu
OS4zMzc7IG9kcm9pZGcxMi00LjkueSBicmFuY2ggZnJvbSBodHRwczovL2dpdGh1Yi5jb20vaGFy
ZGtlcm5lbC9saW51eCkKPiAKPiBOb3RlIHRoYXQgYm90aCBrZXJuZWxzIG5lZWQgYSBjdXN0b20g
RFRCIHRvIGVuYWJsZSBTUEkgKHNlZSBpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMi5kdHNpKS4KPiAK
PiBMaW51eCA2LjE0IG5lZWRzIHRoZXNlIGFkZGl0aW9uYWwgZW50cmllcyB0byBtZXNvbi1nMTJi
LW9kcm9pZC1uMi1wbHVzLmR0cyAob2Ryb2lkJ3MgNC45LjMzNyBuZWVkcyBzaW1pbGFyIGNoYW5n
ZXMpCj4gCj4gJnNwaWZjIHsKPiAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICAgICAgICBwaW5j
dHJsLTAgPSA8Jm5vcl9waW5zPjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCj4gICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKPiAKPiAgICAgICAgbXgyNXU2NDogZmxhc2hAMCB7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAgICAgICAgICAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+Owo+ICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+OyAgICAg
ICAgICAgICAKPiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm14aWN5LG14MjV1NjQzNWYi
LCAiamVkZWMsc3BpLW5vciI7Cj4gICAgICAgICAgICAgICAgcmVnID0gPDA+OyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJl
cXVlbmN5ID0gPDEwNDAwMDAwMD47ICAgICAgICAgICAgICAgICAKPiAgICAgICAgfTsKPiB9Owo+
IAo+ICZzZF9lbW1jX2Mgewo+ICAgICAgICBwaW5jdHJsLTAgPSA8JmVtbWNfY3RybF9waW5zPiwg
PCZlbW1jX2RhdGFfNGJfcGlucz4sIDwmZW1tY19kc19waW5zPjsKPiAgICAgICAgYnVzLXdpZHRo
ID0gPDQ+Owo+IH07Cj4gCj4gQW55IGhlbHAgcG9pbnRpbmcgbWUgaW4gdGhlIHJpZ2h0IGRpcmVj
dGlvbiBpcyBncmVhdGx5IGFwcHJlY2lhdGVkLgo+IAo+IFRoYW5rcywKPiBDaHJpc3RpYW4KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
