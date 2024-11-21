Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26676D75BC8
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 06:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWzB2mx5b4X+LV+h4tyv5YArSWML9w05Hvlc+rNXm0g=; b=EBzGWFzR2LMDse
	aUFUMf7H8aL+yr1hfviF8JnfAA7z5WRdzBIPTYSzg5Gr1ov+3Hynds+gEwOlF3gq/vkPPpKfd0cYH
	KGJ2vHa54FmV9fiaaDA1TI+kkh3WJUTPKcRYe6TPIzEnPFpD/QVTsL6fSiwSRw0Jy7QIkjd4mI6b4
	fbooTbIOGRWZMwlk9wFsrfD7/hvzNqCWaEUmH+qppVWuMnbA/nE9agL7IHzCp0K9Knr6HTDLLd0hu
	g7sTpxXkGR2o1vBbfHUQR33dypjpr2IZXg5rKv1Y2x/HuHGqMxnDhUfMr9+W0O7BJRg4DBW/fyvNy
	RAb1nBUUt5PeZKm0akUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE19l-0000000GyCM-2fK0;
	Thu, 21 Nov 2024 06:59:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE19j-0000000GyC0-1fKy
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 06:59:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2128383b86eso5121505ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2024 22:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732172350; x=1732777150; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CX+T3EFfpXGMGIEPeCbVEAvdRt7ONV0jadH9gWqGSx4=;
        b=CvTZUg9G3PEzH4Ea9yr2UAhtBePf1Wvx2QjM1Q2ZNNOwTVruWXqsgwnkmmT4iC7lUW
         Da/rfNP9XCn0x6l0NloXSzFrprrCdEbAnm/MTSX1L0QlCj/EGa7+0qJWxLfiJVj6W9rP
         twX1rRMH5QD/62rYgHlMIpxd81ja6+dOGCF6I+27vFPCm6nFbJ3qnhZ2aNrvoLK9958q
         CNv+ZQ61j0nW8FBe4TGXAfTJho8aNzRTovTuVt4Hpsckdj1Buc1coeSuBAApXRO88QtH
         3dKCgM/bO6/gHQebO+C46ELohToBLRFEeEG7sbUTOZS3FHhSx9bMhlJO3YwHkUgYXaJE
         Ub9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732172350; x=1732777150;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CX+T3EFfpXGMGIEPeCbVEAvdRt7ONV0jadH9gWqGSx4=;
        b=wDx56HwT1LqOm+xmxPUC6S5JeZlKBUALGRX6nNDS8KbiULtjOY8QeZ19/wVyT4lEQu
         11pHFGdRfeWU2RWRpN7gWLqHOogwZAvamjQ2cfqkFI+3h4jpKWDgHP6HCM8Jlr/hIlWe
         J8MvZ64IHiGJsGalYq88IRsOLAUWME+Dw6jJKSVOtpdID3OvFJHdp3VK0YNHUwWwNdDU
         hb96Riw6EIrKX9H7O+9V4/Sh3dzbkQSGiohcywT02Tj+C4vceLaNmp+ZT4TCmHu7A2PW
         6zVthnX+TdUgaVoS6Os8stTQCVvSurB8Y6v2pf0hX8/80x0aGuUARsGL6lKcBiLVYIe8
         xONQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZaFaYF3Xo2B3LUsZZHLi3jRcORFZ20lgditC0SHGudx4Ay92A/FyiwHIiz0bwsy47aNlm91ka0gw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBWszF/gHkBsnh6FL0ENlQrTuRfKBfo0vWkwNxgzzwzyHaavWz
	Ety1x2ZSyTqW8BFsC7VUHNEh47ruJqPYzip5KkJgGTzvBfd0j97e6hs/O3c1jw==
X-Gm-Gg: ASbGncvR/bvFl93xw90+fD5PdivEVrAqzpOjWmfsTU78t24I85JfjYxczG/zsgpH9T5
	+U1ZkAQAMQNZ0zETVPWUW6mFyssubbu59g88pLs0hw5aKmKUQ/b4xRzaAc0SPggoIn7FhhF63zM
	m4zTE0Nv+9RiGM6KokAq42LvR9WE9jetY+1AAT4dPLLSMy2Y/XuDXu7QO/FCIHnNGPuvDkYqu6e
	Kuyo81xD6fujLnf8/i1s1elwCzXDlbsoi3ZcM1pNTDePQvfaApK9xy8i6o=
X-Google-Smtp-Source: AGHT+IF6xy4JqlxIY2wzKiDE0KR7Op32gWUTCohn9wmiX+ShLE+Z+iDAd3EWXRpCGZhAm6QQ0kCfsA==
X-Received: by 2002:a17:902:fc86:b0:212:88cc:d57b with SMTP id d9443c01a7336-21288ccd685mr16176325ad.11.1732172350039;
        Wed, 20 Nov 2024 22:59:10 -0800 (PST)
Received: from thinkpad ([120.60.72.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212878a7659sm6583555ad.87.2024.11.20.22.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:59:09 -0800 (PST)
Date: Thu, 21 Nov 2024 12:29:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 1/2] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Message-ID: <20241121065902.5w7rpjjgjqgfxpqo@thinkpad>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-2-quic_mdalam@quicinc.com>
 <20241120070115.qox54zr3yhnkqgmd@thinkpad>
 <e76e9562-f7d0-88c9-dcb6-dfcf41cdf205@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e76e9562-f7d0-88c9-dcb6-dfcf41cdf205@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_225911_453738_E9202C73 
X-CRM114-Status: GOOD (  36.07  )
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

T24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgMTE6MzM6MTNBTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiAKPiAKPiBPbiAxMS8yMC8yMDI0IDEyOjMxIFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2
YW0gd3JvdGU6Cj4gPiBPbiBUdWUsIE5vdiAxOSwgMjAyNCBhdCAwMjo1MDo1N1BNICswNTMwLCBN
ZCBTYWRyZSBBbGFtIHdyb3RlOgo+ID4gPiBDdXJyZW50bHkgd2UgYXJlIGNvbmZpZ3VyaW5nIGxv
d2VyIDI0IGJpdHMgb2YgYWRkcmVzcyBpbiBkZXNjcmlwdG9yCj4gPiA+IHdoZXJlYXMgUVBJQyBk
ZXNpZ24gZXhwZWN0cyAxOCBiaXQgcmVnaXN0ZXIgb2Zmc2V0IGZyb20gUVBJQyBiYXNlCj4gPiAK
PiA+IFlvdSBtZWFuICdRUElDIElQJyBoZXJlPyBCdXQgaXMgaXQgUVBJQyBvciBOQU5EYz8gSSBn
dWVzcyB0aGUgbGF0ZXIuCj4gSXQncyBRUElDIElQIG9ubHkuCgpIbW0sIHNvIHdoYXQgaXMgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiBRUElDIGFuZCBOQU5EYz8KCj4gPiAKPiA+ID4gYWRkcmVzcyB0
byBiZSBjb25maWd1cmVkIGluIGNtZCBkZXNjcmlwdG9ycy4gVGhpcyBpcyBsZWFkaW5nIHRvIGEK
PiA+ID4gZGlmZmVyZW50IGFkZHJlc3MgYWN0dWFsbHkgYmVpbmcgdXNlZCBpbiBIVywgbGVhZGlu
ZyB0byB3cm9uZyB2YWx1ZQo+ID4gPiByZWFkLgo+ID4gPiAKPiA+IAo+ID4gVGhpcyBkb2Vzbid0
IGNsZWFybHkgc2F5IHdoYXQgdGhlIGFjdHVhbCBpc3N1ZSBpcy4gSUlVQywgdGhlIGlzc3VlIGlz
IHRoYXQgdGhlCj4gPiBOQU5EYyBiYXNlIGFkZHJlc3MgaXMgZGlmZmVyZW50IGZyb20gdGhlIFFQ
SUMgYmFzZSBhZGRyZXNzLiBCdXQgdGhlIGRyaXZlcgo+ID4gZG9lc24ndCB0YWtlIGl0IGludG8g
YWNjb3VudCBhbmQganVzdCB1c2VkIHRoZSBRUElDIGJhc2UgYXMgdGhlIE5BTkRjIGJhc2UuIFRo
aXMKPiA+IHVzZWQgdG8gd29yayBhcyB0aGUgTkFORGMgSVAgb25seSBjb25zaWRlcnMgdGhlIGxv
d2VyIDE4IGJpdHMgb2YgdGhlIGFkZHJlc3MKPiA+IHBhc3NlZCBieSB0aGUgZHJpdmVyIHRvIGRl
cml2ZSB0aGUgcmVnaXN0ZXIgb2Zmc2V0LiBTaW5jZSB0aGUgYmFzZSBhZGRyZXNzIG9mCj4gPiBR
UElDIHVzZWQgdG8gY29udGFpbiBhbGwgMCBmb3IgbG93ZXIgMTggYml0cyAobGlrZSAweDA3OTgw
MDAwKSwgdGhlIGRyaXZlciBlbmRlZAo+ID4gdXAgcGFzc2luZyB0aGUgYWN0dWFsIHJlZ2lzdGVy
IG9mZnNldCBpbiBpdCBhbmQgTkFORGMgd29ya2VkIHByb3Blcmx5LiBCdXQgb24KPiA+IG5ld2Vy
IFNvQ3MgbGlrZSBTRFg3NSwgdGhlIFFQSUMgYmFzZSBhZGRyZXNzIGRvZXNuJ3QgY29udGFpbiBh
bGwgMCBmb3IgbG93ZXIgMTgKPiA+IGJpdHMgKGxpa2UgMHgwMUM5ODAwMCkuIFNvIE5BTkRjIHNl
ZXMgd3Jvbmcgb2Zmc2V0IGFzIHBlciB0aGUgY3VycmVudCBsb2dpYy4KPiBZZXMgY29ycmVjdC4g
SWYgUVBJQyBhZGRyZXNzID0gMHgwNzk4MDAwMCBhbmQgUVBJQ19FQkkyTkFORCBhZGRyZXNzID0g
MHgwNzliMDAwMAo+IHRoZSB0aGUgZGlmZiBpcyAweDMwMDAwLCB0aGlzIGlzIHRoZSBhY3R1YWwg
b2Zmc2V0IGV4cGVjdGVkIGJ5IFFQSUMgUlRMIGNvZGUuCj4gYW5kIFJUTCBuZWVkcyBvbmx5IDE4
LWJpdCBvZmZzZXQuCgpPa2F5LiBTbyB0aGUgZHJpdmVyIHVzZWQgdG8gcGFzcyAweDMwMDAwICsg
b2Zmc2V0IGluIG9sZGVyIHRhcmdldHMgYW5kIG9uIG5ld2VyCm9uZXMgc3RhcnRpbmcgZnJvbSBT
RFg3NSwgMHgzMDAwMCBpcyBub3QgcGFzc2VkIGNvcnJlY3RseSBkdWUgdG8gdGhlIGNoYW5nZWQK
UVBJQyBiYXNlIGFkZHJlc3MuCgpQbGVhc2UgbWVudGlvbiBpdCBjbGVhcmx5IGluIGRlc2NyaXB0
aW9uLgoKLSBNYW5pCgo+ID4gCj4gPiA+IE9sZGVyIHRhcmdldHMgYWxzbyB1c2VkIHNhbWUgY29u
ZmlndXJhdGlvbiAobG93ZXIgMjQgYml0cykgbGlrZSBzZHhwaW5uLAo+ID4gCj4gPiBQbGVhc2Ug
dXNlIGFjdHVhbCBwcm9kdWN0IG5hbWVzIGFuZCBub3QgaW50ZXJuYWwgbmFtZXMuIEkgYmVsaWV2
ZSB5b3UgYXJlCj4gPiByZWZlcnJpbmcgdG8gU0RYNTUvU0RYNjUgaGVyZS4KPiBPayAsIHdpbGwg
Y2hhbmdlIGluIG5leHQgcmV2aXNpb24uCj4gPiAKPiA+ID4gaXBxIGV0Yy4gYnV0IGlzc3VlIGlz
IG1hc2tlZCBpbiBvbGRlciB0YXJnZXRzIGR1ZSB0byBsb3dlciAxOCBiaXRzIG9mIFFQSUMKPiA+
ID4gYmFzZSBhZGRyZXNzIGJlaW5nIHplcm8gbGVhZGluZyB0byBleHBlY3RlZCBhZGRyZXNzIGdl
bmVyYXRpb24uCj4gPiA+IAo+ID4gPiBTZHhwaW5uICAgICA6IFFQSUNfUVBJQyB8IDB4MDFDOTgw
MDAgKExvd2VyIDE4IGJpdHMgYXJlIG5vbiB6ZXJvKQo+ID4gPiBTZHhuaWdodGphciA6IFFQSUNf
UVBJQyB8IDB4MDc5ODAwMDAgKExvd2VyIDE4IGJpdHMgYXJlIHplcm8pIFNhbWUgZm9yCj4gPiA+
IG9sZGVyIHRhcmdldHMuCj4gPiAKPiA+IFNhbWUgaGVyZS4KPiBPawo+ID4gCj4gPiA+IAo+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxxdWljX21kYWxhbUBxdWljaW5jLmNvbT4K
PiA+IAo+ID4gUGxlYXNlIGFkZCByZWxldmFudCBGaXhlcyB0YWcuCj4gT2sKPiA+IAo+ID4gPiAt
LS0KPiA+ID4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA5ICsrKysrKyst
LQo+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPiA+IGluZGV4IGI4Y2Zm
OTI0MGIyOC4uMzRlZTg1NTVmYjhhIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMKPiA+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9u
YW5kYy5jCj4gPiA+IEBAIC0yMDcsNyArMjA3LDcgQEAgbmFuZGNfc2V0X3JlZyhjaGlwLCByZWcs
CQkJXAo+ID4gPiAgICNkZWZpbmUgZGV2X2NtZF9yZWdfYWRkcihuYW5kYywgcmVnKSAoKG5hbmRj
KS0+cHJvcHMtPmRldl9jbWRfcmVnX3N0YXJ0ICsgKHJlZykpCj4gPiA+ICAgLyogUmV0dXJucyB0
aGUgTkFORCByZWdpc3RlciBwaHlzaWNhbCBhZGRyZXNzICovCj4gPiA+IC0jZGVmaW5lIG5hbmRj
X3JlZ19waHlzKGNoaXAsIG9mZnNldCkgKChjaGlwKS0+YmFzZV9waHlzICsgKG9mZnNldCkpCj4g
PiA+ICsjZGVmaW5lIG5hbmRjX3JlZ19waHlzKGNoaXAsIG9mZnNldCkgICgobmFuZGMpLT5wcm9w
cy0+b2Zmc2V0X2Zyb21fcXBpYyArIChvZmZzZXQpKQo+ID4gPiAgIC8qIFJldHVybnMgdGhlIGRt
YSBhZGRyZXNzIGZvciByZWcgcmVhZCBidWZmZXIgKi8KPiA+ID4gICAjZGVmaW5lIHJlZ19idWZf
ZG1hX2FkZHIoY2hpcCwgdmFkZHIpIFwKPiA+ID4gQEAgLTU2MSw2ICs1NjEsNyBAQCBzdHJ1Y3Qg
cWNvbV9uYW5kY19wcm9wcyB7Cj4gPiA+ICAgCWJvb2wgaXNfcXBpYzsKPiA+ID4gICAJYm9vbCBx
cGljX3YyOwo+ID4gPiAgIAlib29sIHVzZV9jb2Rld29yZF9maXh1cDsKPiA+ID4gKwl1MzIgb2Zm
c2V0X2Zyb21fcXBpYzsKPiA+IAo+ID4gbmFuZGNfb2Zmc2V0Pwo+IE9rCj4gPiAKPiA+ID4gICB9
Owo+ID4gPiAgIC8qIEZyZWVzIHRoZSBCQU0gdHJhbnNhY3Rpb24gbWVtb3J5ICovCj4gPiA+IEBA
IC0zNDc3LDYgKzM0NzgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHFjb21fbmFuZGNfcHJvcHMg
aXBxODA2eF9uYW5kY19wcm9wcyA9IHsKPiA+ID4gICAJLmlzX2JhbSA9IGZhbHNlLAo+ID4gPiAg
IAkudXNlX2NvZGV3b3JkX2ZpeHVwID0gdHJ1ZSwKPiA+ID4gICAJLmRldl9jbWRfcmVnX3N0YXJ0
ID0gMHgwLAo+ID4gPiArCS5vZmZzZXRfZnJvbV9xcGljID0gMHgzMDAwMCwKPiA+IAo+ID4gSG93
IDB4MzAwMDAgaXMgc3VwcG9zZWQgdG8gd29yaz8gWW91IHNhaWQgdGhlIE5BTkRjIGlnbm9yZXMg
bG93ZXIgMTggYml0cywgYnV0Cj4gPiB0aGlzIGhhcyAxN3RoIGFuZCAxOHRoIGJpdHMgc2V0Lgo+
IE5vdCB0aGlzIGFkZHJlc3MgMHgzMDAwMCwgdGhpcyB0aGUgZGlmZiBiL3cgUVBJQyBiYXNlIGFu
ZCBFQkkyTkFORCBiYXNlLiBUaGUgMTgtYml0cyB3ZSBoYXZlIHNlZQo+IG9uIHRoaXMgYWRkcmVz
cyAweDA3OTgwMDAwIGFuZCB0aGlzIGFkZHJlc3MgMHgwMUM5ODAwMC4KPiA+IAo+ID4gLSBNYW5p
Cj4gPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K61
4K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
