Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4F7C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 20:36:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0329A2067B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 20:36:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cLpqGE58";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9HpL7Sh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0329A2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvVgmymWBYh/s7/+3FomVDTMAGUShMsEz8Gsqw1/V9E=; b=cLpqGE585QAVXw
	0d6HtSTiliTxYdkBxJHOiBfCw1y8gKzByCW5pkciCnyLBNnhvzp2dsFXCuLr1dUijhios7WJXO3BV
	7CQgmN/amVWClmTUMlshReC2RBazgO4+5VjYsRcZ7BtgLth1wpfbPag170x0MO1v9ObvwfoP+/Fo/
	p4LHrUb7GwXaXLz+41Tye3W9pjFcnAKxsASkDGLGkPErkyDF7n1QoovCmcI/aCKsNfC5mfYSFnWWH
	jSSI241vbueOT4zleHGSXrCYIN5F+gotym5eH2JPTLCkMbR43/EYTUthz6HoLDt36qq40cKzJrBPm
	G8qj8UpERYEmW6Da6leA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUGQ2-0004Me-T5; Mon, 11 Nov 2019 20:36:14 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUGPz-0004Lj-KS
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 20:36:13 +0000
Received: by mail-il1-x141.google.com with SMTP id u17so8438318ilq.5
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2019 12:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RhwkYq4Xoz6qbJxRjALfE8MZM5xtYEgYwlSWURLNNtQ=;
 b=B9HpL7ShmycybCbB/KdQWKQzEjjgaaa2GSg05G+IyWGcNoKGdgq+i3AiZZCpkls2rS
 gWMgTexeJ+B4g7hN2MsYpn0sfu/aBgzJ6zU7levUDZ604CgComvqjicKfg73ofP3OH25
 9ycCPobwBCJUpzAIFobC/0KchLKnUC7Z6IiPn2X8cpZQ/YAbllHMWVb/3AMBcBaf4KoW
 dScRXQubsprrYmMAUXK6/M3tTpcYw7KrdK55qvc1kEfnPqYpfwtGm1Vm/W2RlRZstHAo
 R7Y38IjXOHk9FgG6h87nYylUA5Q04K6tz486W2iWPF60eTVLBAjh/3o1o4P8F0lQR7mt
 mjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RhwkYq4Xoz6qbJxRjALfE8MZM5xtYEgYwlSWURLNNtQ=;
 b=p17MedqETCXPdvT55jTMRHJANHzyX5l+OU/NUBLd/PFjr0DvE1xfp0qFOgaRztjvVZ
 YZ8g1lfnj/00ZmCG7BcROKGYzGt15eAM0SQnOcdpCNnqY1MfflBXAwrRSkVifeNNkj1e
 ch0tDDaIyHmmOcLF1/P72sxGiuKnZAVGtCoQ7P0/b6vqzfilRFB8CetscW9T1x521MCR
 NZO+obas6iGefSpP6aUfsY6l3xpfIBdJavMrxM0/tMHsNs4qX2T9bjkD2XgfyEC+Q1W3
 o/i35tXVMqpUZhUEDHYHNCC47gGgWlerg2YjiPqT8NY03Km3NQZdIS0UrpJar2EH4V0o
 hcEQ==
X-Gm-Message-State: APjAAAWZK3vekwafE/urLelTMZha71m5i6x2rts08VAlAkc7MkoNEB8q
 ROJSZCkmsQJeriRNgeCWRz+XKylNK6yEcYEPc7M=
X-Google-Smtp-Source: APXvYqw/oX9kFdOdp1RxxwqQqOlb8BoSGIn/0vDLMRtz4c5Dc3hYdAWfMCCtxk3vtpCQEBmY83VIYWpzy68OPyIjcJo=
X-Received: by 2002:a92:7786:: with SMTP id
 s128mr33173924ilc.204.1573504569865; 
 Mon, 11 Nov 2019 12:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20191021193343.41320-1-kdasu.kdev@gmail.com>
 <20191105200344.1e8c3eab@xps13>
 <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
In-Reply-To: <1718371158.75883.1572995022606.JavaMail.zimbra@nod.at>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 11 Nov 2019 15:35:59 -0500
Message-ID: <CAC=U0a3_OKJ7Fza_5WAst1BZjGm+4e-JvgZZ_QYpL1m5siTYEA@mail.gmail.com>
Subject: Re: [PATCH] mtd: set mtd partition panic write flag
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_123611_697382_E6DBB749 
X-CRM114-Status: GOOD (  18.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UmljaGFyZCwKCk9uIFR1ZSwgTm92IDUsIDIwMTkgYXQgNjowMyBQTSBSaWNoYXJkIFdlaW5iZXJn
ZXIgPHJpY2hhcmRAbm9kLmF0PiB3cm90ZToKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwg
LS0tLS0KPiA+IFZvbjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gQW46ICJLYW1hbCBEYXN1IiA8a2Rhc3Uua2RldkBnbWFpbC5jb20+Cj4gPiBDQzogImxp
bnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImJjbS1rZXJuZWwtZmVl
ZGJhY2stbGlzdCIgPGJjbS1rZXJuZWwtZmVlZGJhY2stbGlzdEBicm9hZGNvbS5jb20+LAo+ID4g
ImxpbnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+LCAiRGF2aWQgV29v
ZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4sICJCcmlhbiBOb3JyaXMiCj4gPiA8Y29tcHV0
ZXJzZm9ycGVhY2VAZ21haWwuY29tPiwgIk1hcmVrIFZhc3V0IiA8bWFyZWsudmFzdXRAZ21haWwu
Y29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJWaWduZXNoIFJhZ2hhdmVuZHJhIgo+
ID4gPHZpZ25lc2hyQHRpLmNvbT4KPiA+IEdlc2VuZGV0OiBEaWVuc3RhZywgNS4gTm92ZW1iZXIg
MjAxOSAyMDowMzo0NAo+ID4gQmV0cmVmZjogUmU6IFtQQVRDSF0gbXRkOiBzZXQgbXRkIHBhcnRp
dGlvbiBwYW5pYyB3cml0ZSBmbGFnCj4KPiA+IEhpIEthbWFsLAo+ID4KPiA+IFJpY2hhcmQsIHNv
bWV0aGluZyB0byBsb29rIGludG8gYmVsb3cgOikKPgo+IEknbSBzdGlsbCByZWNvdmVyaW5nIGZy
b20gYSBiYWQgY29sZC4gU28gbXkgYnJhaW4gaXMgbm90IGZ1bGx5IHdvcmtpbmcgOykKClRoYW5r
cyBmb3IgcmV2aWV3aW5nIHRoaXMuIEhvcGUgeW91IGFyZSBmZWVsaW5nIGJldHRlciBub3cuCgo+
Cj4gPiBLYW1hbCBEYXN1IDxrZGFzdS5rZGV2QGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAyMSBP
Y3QgMjAxOSAxNTozMjo1Mgo+ID4gLTA0MDA6Cj4gPgo+ID4+IENoZWNrIG10ZCBwYW5pYyB3cml0
ZSBmbGFnIGFuZCBzZXQgdGhlIG10ZCBwYXJ0aXRpb24gcGFuaWMKPiA+PiB3cml0ZSBmbGFnIHNv
IHRoYXQgbG93IGxldmVsIGRyaXZlcnMgY2FuIHVzZSBpdCB0byB0YWtlCj4gPj4gcmVxdWlyZWQg
YWN0aW9uIHRvIGVuc3VyZSBvb3BzIGRhdGEgZ2V0cyB3cml0dGVuIHRvIGFzc2lnbmVkCj4gPj4g
bXRkIHBhcnRpdGlvbi4KPiA+Cj4gPiBJIGZlZWwgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIHdp
dGggdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24KPiA+IHJlZ2FyZGluZyBwYXJ0aXRpb25zIGJ1
dCBJIGFtIG5vdCBzdXJlIHRoaXMgaXMgdGhlIHJpZ2h0IGZpeC4gSXMgdGhpcwo+ID4gc29tZXRo
aW5nIHlvdSBkZXRlY3RlZCB3aXRoIHNvbWUga2luZCBvZiBzdGF0aWMgY2hlY2tlciBvciBkaWQg
eW91Cj4gPiBhY3R1YWxseSBleHBlcmllbmNlIGFuIGlzc3VlPwo+ID4KPiA+IEluIHRoZSBjb21t
aXQgbG9nIHlvdSBzYXkgImNoZWNrIG10ZCAoSSBzdXBwb3NlIHlvdSBtZWFuIHRoZQo+ID4gbWFz
dGVyKSBwYW5pYyB3cml0ZSBmbGFnIGFuZCBzZXQgdGhlIG10ZCBwYXJ0aXRpb24gcGFuaWMgd3Jp
dGUgZmxhZyIKPiA+IHdoaWNoIG1ha2VzIHNlbnNlLCBidXQgaW4gcmVhbGl0eSBteSB1bmRlcnN0
YW5kaW5nIGlzIHRoYXQgeW91IGRvIHRoZQo+ID4gb3Bwb3NpdGU6IHlvdSBjaGVjayBtdGQtPm9v
cHNfcGFuaWNfd3JpdGUgd2hpY2ggaXMgdGhlIHBhcnRpdGlvbnMnCj4gPiBzdHJ1Y3R1cmUsIGFu
ZCBzZXQgcGFydC0+cGFyZW50LT5vb3BzX3BhbmljX3dyaXRlIHdoaWNoIGlzIHRoZSBtYXN0ZXIn
cwo+ID4gZmxhZy4KPgo+IElJVUMgdGhlIHByb2JsZW0gaGFwcGVucyB3aGVuIHlvdSBydW4gbXRk
b29wcyBvbiBhIG10ZCBwYXJ0aXRpb24uCj4gVGhlIHRoZSBmbGFnIGlzIG9ubHkgc2V0IGZvciB0
aGUgcGFydGl0aW9uIGluc3RlYWQgZm9yIHRoZSBtYXN0ZXIuCj4KPiBTbyB0aGUgcmlnaHQgZml4
IHdvdWxkIGJlIHNldHRpbmcgdGhlIHBhcmVudCdzIG9vcHNfcGFuaWNfd3JpdGUgaW4KCkhvdyBk
byBJIGdldCBhY2Nlc3MgdG8gdGhlIHBhcnRzIHBhcmVudCBpbiB0aGUgY29yZSA/LiBNYXliZSBJ
IGFtCm1pc3Npbmcgc29tZXRoaW5nLgoKPiBtdGRfcGFuaWNfd3JpdGUoKS4KPiBUaGVuIHdlIGRv
bid0IGhhdmUgdG8gdG91Y2ggbXRkcGFydC5jCj4KPiBUaGFua3MsCj4gLy9yaWNoYXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
