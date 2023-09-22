Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B130BCD4847
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 18:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9OpM/QZrqajwz7FPt7Q0aPOQUXw1lvhw0kGLOpgaoXU=; b=0GY6H0dQ29bClX
	5d2F1osffL6lz5lstcO6UKGrSXYaAgA+V3WSDtmJNTKjDVFXuHcVwSJzPVu9bxdelYX9jZKuyh/jK
	9maz1Mfap/V0yqpIhSsVN9wYAzsdMD44yApahFheHO63Ze6bxmFpS/jWMgAwNEYzZCzZAxL63DLxM
	py+jlaRhk4pLzOvyy+Ft34Nh32kwc3CCNtb5+GC0zx3advgMdIRVtQpSuaNI65QVY/x7yPAzx9/uD
	fOnmtScEu0olMcU0IWH/a58bAMNSztYX0yBEfSnL+pYTYmHD4+6LwMV7wjknTT7jD2vTiLPRm2EoE
	9/34c0PWIOg2RRvFw9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkdt-009bJ8-0D;
	Fri, 22 Sep 2023 18:12:41 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjkdo-009bHr-0a
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 18:12:40 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5334f9a56f6so2390090a12.3
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695406351; x=1696011151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKwr2XjhB87XY1eJcNFIWSnRqkfq4gGTTTV7rcfgoQg=;
        b=oT+e5V0WASomiDxy2z5yj8dOJRiodQRbDWeA453OPjGiEv+kdoasD35UsZL0r6ICxq
         hFFsJNzIPBFvwm4toBARXHUgx1OKG9pq603VNaBzPFFCmcs3+jYTTYBRUFvp2quP6+AP
         xFVtxy4rKe+D5ydSchIiOqQlixCbuZuMPf2SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695406351; x=1696011151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKwr2XjhB87XY1eJcNFIWSnRqkfq4gGTTTV7rcfgoQg=;
        b=gERLRmS6KQOQcOH5WOoZeyn8oIguirhCoXdpov4ZEQpGaAXHMX/ZDbaMp6G364hYZI
         UvYKGM5qMgdDse3EXoPCC2vfuFMT2KHeFzm3I4EM3d7puwQwQIPADBqwYzW2OBQwDVpI
         zcogzjIvJpf5hs5oUKi2EWExj19xx1u4rLIcNNO7CIgdXzDlLcXQKoFdHEb5q8AdVmtR
         RDVrZ0kFbOqBQ0UWTTEQs/XXFLMHCA0Y23hyAjxtQil3xmomGKl2mDpSas08MwBZ8m5W
         N0CNOISTx354oafY0kmIBH6E2HPyRebmjTi1NLVIUvJPRQ6yT1INg7ig+bj5N0wQ7zpk
         kEkQ==
X-Gm-Message-State: AOJu0Yxgl7AbUM9MT8QdTPinoucAaf88gsc/deiSQcNPa3l1unsc2OuK
	HrNY1cB80y9Ips60ZQ4nQU/zk1uyaM13V0tnDSdbEQ==
X-Google-Smtp-Source: AGHT+IEhGuF05gZ1ykRj7c0nOIVSMf034rK4oo9lAlBZB3RlBbcD+8isF0isGviqL5G0fBM/1IdwSOKb/LE2mWFyyHQ=
X-Received: by 2002:aa7:dc17:0:b0:533:926:da9d with SMTP id
 b23-20020aa7dc17000000b005330926da9dmr220253edu.18.1695406351489; Fri, 22 Sep
 2023 11:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230921124459.1.I91ddcfacf9b234af5cc3eabea4b62edb31153317@changeid>
 <CAL_Jsq+WuYDU+yY98opTHr1PT-J9mFYJQBjVMnk+FSWLDUO33w@mail.gmail.com>
 <CAPnjgZ1pfxaMG1n5yOBhiOhsNrRjck1K92U7Ga=+VTY_jjjrVg@mail.gmail.com> <20230922174649.GA3320366-robh@kernel.org>
In-Reply-To: <20230922174649.GA3320366-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 22 Sep 2023 12:12:20 -0600
Message-ID: <CAPnjgZ3ojfAv=BHqOhM=-NnYqCm81Ny=PsGKiNphKTmw++fk9w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: Add a schema for binman
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, U-Boot Mailing List <u-boot@lists.denx.de>, 
	linux-mtd@lists.infradead.org, Tom Rini <trini@konsulko.com>, 
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_111236_245013_0F5D92D9 
X-CRM114-Status: GOOD (  34.50  )
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

SGkgUm9iLAoKT24gRnJpLCAyMiBTZXB0IDIwMjMgYXQgMTE6NDYsIFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMTE6MDE6MThB
TSAtMDYwMCwgU2ltb24gR2xhc3Mgd3JvdGU6Cj4gPiBIaSBSb2IsCj4gPgo+ID4gT24gRnJpLCAy
MiBTZXB0IDIwMjMgYXQgMTA6MDAsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBUaHUsIFNlcCAyMSwgMjAyMyBhdCAxOjQ14oCvUE0gU2ltb24gR2xh
c3MgPHNqZ0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gQmlubWFuWzFdIGlz
IGEgdG9vbCBmb3IgY3JlYXRpbmcgZmlybXdhcmUgaW1hZ2VzLiBJdCBhbGxvd3MgeW91IHRvCj4g
PiA+ID4gY29tYmluZSB2YXJpb3VzIGJpbmFyaWVzIGFuZCBwbGFjZSB0aGVtIGluIGFuIG91dHB1
dCBmaWxlLgo+ID4gPiA+Cj4gPiA+ID4gQmlubWFuIHVzZXMgYSBEVCBzY2hlbWEgdG8gZGVzY3Jp
YmUgYW4gaW1hZ2UsIGluIGVub3VnaCBkZXRhaWwgdGhhdAo+ID4gPiA+IGl0IGNhbiBiZSBhdXRv
bWF0aWNhbGx5IGJ1aWx0IGZyb20gY29tcG9uZW50IHBhcnRzLCBkaXNhc3NlbWJsZWQsCj4gPiA+
ID4gcmVwbGFjZWQsIGxpc3RlZCwgZXRjLgo+ID4gPiA+Cj4gPiA+ID4gSW1hZ2VzIGFyZSB0eXBp
Y2FsbHkgc3RvcmVkIGluIGZsYXNoLCB3aGljaCBpcyB3aHkgdGhpcyBiaW5kaW5nIGlzCj4gPiA+
ID4gdGFyZ2V0ZWQgYXQgbXRkLiBQcmV2aW91cyBkaXNjdXNzaW9uIGlzIGF0IFsyXSBbM10uCj4g
PiA+ID4KPiA+ID4gPiBbMV0gaHR0cHM6Ly91LWJvb3QucmVhZHRoZWRvY3MuaW8vZW4vc3RhYmxl
L2RldmVsb3AvcGFja2FnZS9iaW5tYW4uaHRtbAo+ID4gPiA+IFsyXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy91LWJvb3QvMjAyMzA4MjExODAyMjAuMjcyNDA4MC0zLXNqZ0BjaHJvbWl1bS5vcmcv
Cj4gPiA+ID4gWzNdIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2RldmljZXRyZWUvbXNn
NjI2MTQ5Lmh0bWwKPiA+ID4KPiA+ID4gWW91IG1pc3NlZDoKPiA+ID4KPiA+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9wdWxsLzExMAo+ID4gPgo+ID4gPiB3
aGVyZSBJIHNhaWQ6IFdlIGNlcnRhaW5seSBzaG91bGRuJ3QgZHVwbGljYXRlIHRoZSBleGlzdGlu
ZyBwYXJ0aXRpb25zCj4gPiA+IGJpbmRpbmdzLiBXaGF0J3MgbWlzc2luZyBmcm9tIHRoZW0gKEkg
YXNzdW1lIHdlJ3JlIG1vc3RseSB0YWxraW5nCj4gPiA+IGFib3V0ICJmaXhlZC1wYXJ0aXRpb25z
IiB3aGljaCBoYXMgYmVlbiBhcm91bmQgZm9yZXZlciBJIHRoaW5rIChiZWZvcmUKPiA+ID4gbWUp
KT8KPiA+ID4KPiA+ID4gVG8gcmVwZWF0LCB1bmxlc3MgdGhlcmUgaXMgc29tZSByZWFzb24gYmlu
bWFuIHBhcnRpdGlvbnMgY29uZmxpY3Qgd2l0aAo+ID4gPiBmaXhlZC1wYXJ0aXRpb25zLCB5b3Ug
bmVlZCB0byBzdGFydCB0aGVyZSBhbmQgZXh0ZW5kIGl0LiBGcm9tIHdoYXQncwo+ID4gPiBwb3N0
ZWQgaGVyZSwgaXQgbmVpdGhlciBjb25mbGljdHMgbm9yIG5lZWRzIGV4dGVuZGluZy4KPiA+Cj4g
PiBJIHRoaW5rIGF0IHRoaXMgcG9pbnQgSSBhbSBqdXN0IGhvcGVsZXNzbHkgY29uZnVzZWQuIEhh
dmUgeW91IHRha2VuIGEKPiA+IGxvb2sgYXQgdGhlIGJpbm1hbiBzY2hlbWE/IFsxXQo+Cj4gV2h5
IGRvIEkgbmVlZCB0bz8gVGhhdCdzIHVzZWQgZm9yIHNvbWUgdG9vbCBhbmQgaGFzIG5vdGhpbmcg
dG8gZG8gd2l0aCBhCj4gZGV2aWNlJ3MgRFRCLiBIb3dldmVyLCBJIHRob3VnaHQgc29tZXdoZXJl
IGluIHRoaXMgZGlzY3Vzc2lvbiB5b3Ugc2hvd2VkCj4gaXQgdW5kZXIgYSBmbGFzaCBkZXZpY2Ug
bm9kZS4KClllcywgdGhhdCBpcyB0aGUgaW50ZW50ICh1bmRlciBhIGZsYXNoIG5vZGUpLgoKPiBU
aGVuIEkgY2FyZSBiZWNhdXNlIHRoZW4gaXQgb3ZlcmxhcHMgd2l0aAo+IHdoYXQgd2UgYWxyZWFk
eSBoYXZlIGZvciBwYXJ0aXRpb25zLiBJZiBJIG1pc3VuZGVyc3Rvb2QgdGhhdCwgdGhlbiBqdXN0
Cj4gcHV0IHlvdXIgc2NoZW1hIHdpdGggeW91ciB0b29sLiBPbmx5IHVzZXJzIG9mIHRoZSB0b29s
IHNob3VsZCBjYXJlIGFib3V0Cj4gdGhlIHRvb2wncyBzY2hlbWEuCgpPSy4gSSBiZWxpZXZlIHRo
YXQgYmlubWFuIHdpbGwgZml0IGludG8gYm90aCBjYW1wcywgc2luY2UgaXRzIGlucHV0IGlzCm5v
dCBuZWNlc3NhcmlseSBmdWxseSBmb3JtZWQuIEUuZy4gaWYgeW91IGRvbid0IHNwZWNpZnkgdGhl
IG9mZnNldCBvZgphbiBlbnRyeSwgdGhlbiBpdCB3aWxsIGJlIHBhY2tlZCBhdXRvbWF0aWNhbGx5
LiBCdXQgdGhlIG91dHB1dCBpcwpmdWxseSBmb3JtZWQsIGluIHRoYXQgQmlubWFuIG5vdyBrbm93
cyB0aGUgb2Zmc2V0IHNvIGNhbiB3cml0ZSBpdCB0bwp0aGUgRFQuCgo+Cj4gPgo+ID4gSSBzYXcg
dGhpcyBmaWxlLCB3aGljaCBzZWVtcyB0byBleHRlbmQgYSBwYXJ0aXRpb24uCj4gPgo+ID4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sYmNtNDkw
OC1wYXJ0aXRpb25zLnlhbWwKPgo+IElJUkMsIHRoYXQncyBhIGRpZmZlcmVudCB0eXBlIHdoZXJl
IHBhcnRpdGlvbiBsb2NhdGlvbnMgYXJlIHN0b3JlZCBpbgo+IHRoZSBmbGFzaCwgc28gd2UgZG9u
J3QgbmVlZCBsb2NhdGlvbiBhbmQgc2l6ZSBpbiBEVC4KCk9LLgoKPgo+ID4KPiA+IEkgd2FzIGFz
c3VtaW5nIHRoYXQgSSBzaG91bGQgY3JlYXRlIGEgdG9wLWxldmVsIGNvbXBhdGlibGUgPSAiYmlu
bWFuIgo+ID4gbm9kZSwgd2l0aCBzdWJub2RlcyBsaWtlIGNvbXBhdGlibGUgPSAiYmlubWFuLGJs
MzEtYXRmIiwgZm9yIGV4YW1wbGUuCj4gPiBJIHNob3VsZCB1c2UgdGhlIGNvbXBhdGlibGUgc3Ry
aW5nIHRvIGluZGljYXRlIHRoZSBjb250ZW50cywgcmlnaHQ/Cj4KPiBZZXMgZm9yIHN1Ym5vZGVz
LCBhbmQgd2UgYWxyZWFkeSBoYXZlIHNvbWUgc29tZXdoYXQgc3RhbmRhcmQgb25lcyBmb3IKPiAi
dS1ib290IiBhbmQgInUtYm9vdC1lbnYiLiBUaG91Z2ggaGlzdG9yaWNhbGx5LCAibGFiZWwiIHdh
cyB1c2VkLgoKQmlubWFuIGhhcyBjb21tb24gcHJvcGVydGllcyBmb3IgYWxsIGVudHJpZXMsIGlu
Y2x1ZGluZyAiY29tcHJlc3MiCndoaWNoIHNldHMgdGhlIGNvbXByZXNzaW9uIGFsZ29yaXRobS4K
ClNvIHBlcmhhcHMgSSBzaG91bGQgc3RhcnQgYnkgZGVmaW5pbmcgYSBuZXcgYmlubWFuLGJsMzEt
YXRmIHdoaWNoIGhhcwpjb21tb24gcHJvcGVydGllcyBmcm9tIGFuICJiaW5tYW4sZW50cnkiIGRl
ZmluaXRpb24/Cgo+Cj4gVG9wLWxldmVsLCBtZWFuaW5nIHRoZSByb290IG9mIHRoZSBEVD8gVGhh
dCBzb3VuZCBsaWtlIGp1c3Qgc29tZXRoaW5nCj4gZm9yIHRoZSB0b29sLCBzbyBJIGRvbid0IGNh
cmUsIGJ1dCBpdCBkb2Vzbid0IGJlbG9uZyBpbiB0aGUgRFRCLgoKU29ycnksIEkgbWVhbiAndG9w
LWxldmVsJyB3aXRoIHJlc3BlY3QgdG8gdGhlIHBhcnRpdGlvbnMuCgo+Cj4gPgo+ID4gUmUgZXh0
ZW5kaW5nLCB3aGF0IGlzIHRoZSBtaW5pbXVtIEkgY2FuIGRvPyBBcmUgeW91IGxvb2tpbmcgZm9y
Cj4gPiBzb21ldGhpbmcgbGlrZSBhICJjb21wcmVzcyIgcHJvcGVydHkgdGhhdCBpbmRpY2F0ZXMg
dGhhdCB0aGUgZW50cnkgaXMKPiA+IGNvbXByZXNzZWQ/Cj4gPgo+ID4gSSdtIHJlYWxseSBqdXN0
IGEgYml0IGxvc3QuCj4KPiBNZSB0b28uCgpSZWdhcmRzLApTaW1vbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
