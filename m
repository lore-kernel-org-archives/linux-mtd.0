Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F8FD5A6DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2024 05:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87xdo/n+wYADDhcxUCCvbGt9JHShgwwUOC2J3C12Wc0=; b=GAef8CffBbEClH
	6UHrBAL8eC0ic30TxAV3hOgHHGt/eFJe2JBQ+31ATX9XARoUk+wOTSfPTBb0wCL/ilgVdGLTDZjsQ
	kGXnoKfGWqquQqt5bhEnJ6yUF4a9gLfXNURm3vQtDdcZg8V/xvCdh1D5WcUtN4cBmOXeK4cH6ayNm
	OxZSFrFPSw77ZvgrGyEiz4B4JFUHCAmm1ql9tnyeRzIV7gHjmMm7Svr3vOu9p2tXhSUiNpvYFo9pe
	arhwRZ9Kw6RivfV1w18INvzjOXfnF2OVEC133KiBEBpienzUs4ak048gjqAHgUZ5OzMO0EaY1clhG
	/jKAxi9GxoFoawWB3Kdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFoKW-00000009gcu-1sGj;
	Tue, 26 Nov 2024 05:41:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFoKT-00000009gcR-3pmZ
	for linux-mtd@lists.infradead.org;
	Tue, 26 Nov 2024 05:41:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-211fcadd960so35235915ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 21:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732599701; x=1733204501; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ZIXv+9dxOLvX44jgEosCeJ1ZkgG3xlaNHk54kHEnho=;
        b=zk2iTq9tLvA0gxwPmTGW5OZTVARxj7QvpFS6ar1jgmmrO0DxKNOgUV/1UYipIOhoDg
         Et7lWKgKqh5U+1Dml+i4yulntMCUyY61TL8hsK0iHA1ZZnHrGbyc8dWTIClKerAYXj2P
         pJdJPqQsCuLMlzbN8wd/J5FAPHWpZp5i83OFbsJvBX96IF+l42S6UvH2Zj+Pxoa7IK0t
         axmYEgwNX8jsha/oNDaN3j4dvTBGYPsg5qr3dRdsQWkbAVxfjEyOq5/nF1QlDWXhs4j2
         n49IWrDo4ublr3E1qJob2SmHTl+kcmCBA1uPJKnCz+LggZTdL1GzTxg6oZCYx1QHPMea
         hR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732599701; x=1733204501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZIXv+9dxOLvX44jgEosCeJ1ZkgG3xlaNHk54kHEnho=;
        b=iXH0E0BmjyzbnR1Szqspr2U/xIOYkvhvwqnOAvlTk/T9YZ9xFdsJTw28I3CeYDFlMu
         Ia6e5nUzCk/HdiozoG3tio76MUS12lgWSAopMYMJPb/jKwVHe8moHBqc3lTyTCnJaK8A
         J3VknVcrXC8P2Jp7uOvJ4xolQbzKI94CWjPhJUg8Nu3qMLD4NUuDo4Q9WFAKP+LWWbJ0
         kNpXoY7QbnnZmX8DIRsFcbjn50uqogMwhIioW16phqHqFBhqGjzF8B9NGjhomNUgOERR
         HjqbcMap6XcnKZoktbNiyOY4v/oyOrzCnk12FFl3Qm7SORWIACymdhDTgW+BzsA6BpDg
         H5GA==
X-Forwarded-Encrypted: i=1; AJvYcCVWJOYHuAMhdxIdjU2W/skL7zPzzOWCAUtdTt/maLbyCOdjw3U4rfI9favII1C7pvJlcy8slbxU6r0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw2DYdtl5EhQjOmUvwMKTkMJDQcU09giOxcHJ3Woa+sM3jZVgl
	fk0FmXAMvQfnRgG52GWWY0bNa/7VpOT4aGi39IQsjkHBPUSkPeYHj2CB+KzVlg==
X-Gm-Gg: ASbGncsrA83CD9dVpC/wQrj4mN+twkVumB8PlKw6w/q6tubBa7ucpB2XCvswUKdGtom
	VauI++jNt3j6qnfh3z/u+Wy2XtOmIjKox2CJfT1kOMJJoydYO4wk+gfIZ2zLztadhqVrhdeYr6B
	dmpbZj3O9R+MdAmUc0IbqnFp34JRVenHFeeMBJ6JEXq3RwmqqWg4kci9OYmnlC+EwSZv7oexzan
	lK+wDHi6y1mLeLbwv4M007kYrumhvFyPlc6YscagCwagBTGhAXMkb9itfe3UEs=
X-Google-Smtp-Source: AGHT+IGRS+i8V50r8qVF0iygtYyP45FI8jr12E9Od5qn87IuCcU2RB0hrEDLVVUAawQahHHo56Qlbg==
X-Received: by 2002:a17:902:c94c:b0:20c:9d9e:9049 with SMTP id d9443c01a7336-2129f228d84mr271690485ad.22.1732599701043;
        Mon, 25 Nov 2024 21:41:41 -0800 (PST)
Received: from thinkpad ([220.158.156.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc11e43sm75706875ad.170.2024.11.25.21.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 21:41:40 -0800 (PST)
Date: Tue, 26 Nov 2024 11:11:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 2/3] mtd: rawnand: qcom: Fix onfi param page read
Message-ID: <20241126054135.5v7f5ln5vwc64eys@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-3-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241122085933.2663927-3-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_214141_957957_C5BA25A0 
X-CRM114-Status: GOOD (  25.59  )
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

T24gRnJpLCBOb3YgMjIsIDIwMjQgYXQgMDI6Mjk6MzJQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKClBsZWFzZSBjaGFuZ2Ugc3ViamVjdCB0bzoKCm10ZDogcmF3bmFuZDogcWNvbTogRml4
IGxhc3QgY29kZXdvcmQgcmVhZCBpbiBxY29tX3BhcmFtX3BhZ2VfdHlwZV9leGVjKCkKCj4gRm9y
IFFQSUMgVjIgb253YXJkcyB0aGVyZSBpcyBhIHNlcGFyYXRlIHJlZ2lzdGVyIHRvIHJlYWQKPiBs
YXN0IGNvZGUgd29yZCAiUVBJQ19OQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV19uIi4KPiAKPiBx
Y29tX3BhcmFtX3BhZ2VfdHlwZV9leGVjKCkgaXMgdXNlZCB0byByZWFkIG9ubHkgb25lIGNvZGUg
d29yZAo+IElmIGl0IHdpbGwgZ2V0IGNvbmZpZ3VyZSBudW1iZXIgb2YgY29kZSB3b3JkcyB0byAx
IGluIFFQSUNfTkFORF9ERVYwX0NGRzAKCiJJZiBpdCBjb25maWd1cmVzIHRoZSBudW1iZXIgb2Yu
Li4iCgo+IHJlZ2lzdGVyIHRoZW4gUVBJQyBjb250cm9sbGVyIHRoaW5rcyBpdHMgcmVhZGluZyB0
aGUgbGFzdCBjb2RlIHdvcmQsCj4gc2luY2Ugd2UgYXJlIGhhdmluZyBzZXBhcmF0ZSByZWdpc3Rl
ciB0byByZWFkIHRoZSBsYXN0IGNvZGUgd29yZCwKPiB3ZSBoYXZlIHRvIGNvbmZpZ3VyZSAiUVBJ
Q19OQU5EX1JFQURfTE9DQVRJT05fTEFTVF9DV19uIiByZWdpc3Rlcgo+IHRvIGZldGNoIGRhdGEg
ZnJvbSBRUElDIGJ1ZmZlciB0byBzeXN0ZW0gbWVtb3J5Lgo+IAo+IFdpdGhvdXQgdGhpcyBjaGFu
Z2UgcGFnZSByZWFkIHdhcyBmYWlsaW5nIHdpdGggdGltZW91dCBlcnJvcgo+IAo+IC8gIyBoZXhk
dW1wIC1DIC9kZXYvbXRkMQo+IFsgIDEyOS4yMDYxMTNdIHFjb20tbmFuZGMgMWNjODAwMC5uYW5k
LWNvbnRyb2xsZXI6IGZhaWx1cmUgdG8gcmVhZCBwYWdlL29vYgo+IGhleGR1bXA6IC9kZXYvbXRk
MTogQ29ubmVjdGlvbiB0aW1lZCBvdXQKPiAKPiBUaGlzIGlzc3VlIG9ubHkgc2VlbiBvbiBTRFgg
dGFyZ2V0cyBzaW5jZSBTRFggdGFyZ2V0IHVzZWQgUVBJQ3YyLiBCdXQKPiBzYW1lIHdvcmtpbmcg
b24gSVBRIHRhcmdldHMgc2luY2UgSVBRIHVzZWQgUVBJQ3YxLgo+IAo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4gRml4ZXM6IDg5NTUwYmViMDk4ZSAoIm10ZDogcmF3bmFuZDogcWNvbTog
SW1wbGVtZW50IGV4ZWNfb3AoKSIpCj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVp
Y19tZGFsYW1AcXVpY2luYy5jb20+CgpSZXZpZXdlZC1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFt
IDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZz4KCi0gTWFuaQoKPiAtLS0KPiAKPiBD
aGFuZ2UgaW4gW3YyXQo+IAo+ICogVXBkYXRlZCBjb21taXQgbWVzc2FnZQo+IAo+ICogQWRkZWQg
c3RhYmxlIGtlcm5lbCB0YWcKPiAKPiAqIFJlcGxhY2VkIHRoZSBidWZfY291bnQgdmFsdWUgb2Yg
NTEyIHdpdGggdGhlIGxlbiBpbiBieXRlcy4KPiAKPiBDaGFuZ2UgaW4gW3YxXQo+IAo+ICogUmVz
b2x2ZWQgdGhlIGlzc3VlIHdpdGggcmVhZGluZyBhIHNpbmdsZSBjb2RlIHdvcmQgaW4gdGhlIHBh
cmFtZXRlcgo+ICAgcGFnZSByZWFkCj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYyB8IDEyICsrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXgg
Y2M1OTQ2MWRmNzJlLi4zMWVjM2RiMTI0NmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5k
Yy5jCj4gQEAgLTI4NTksNyArMjg1OSwxMiBAQCBzdGF0aWMgaW50IHFjb21fcGFyYW1fcGFnZV90
eXBlX2V4ZWMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgIGNvbnN0IHN0cnVjdCBuYW5kXwo+ICAJ
Y29uc3Qgc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyID0gTlVMTDsKPiAgCXVuc2lnbmVkIGlu
dCBvcF9pZCA9IDA7Cj4gIAl1bnNpZ25lZCBpbnQgbGVuID0gMDsKPiAtCWludCByZXQ7Cj4gKwlp
bnQgcmV0LCByZWdfYmFzZTsKPiArCj4gKwlyZWdfYmFzZSA9IE5BTkRfUkVBRF9MT0NBVElPTl8w
Owo+ICsKPiArCWlmIChuYW5kYy0+cHJvcHMtPnFwaWNfdjIpCj4gKwkJcmVnX2Jhc2UgPSBOQU5E
X1JFQURfTE9DQVRJT05fTEFTVF9DV18wOwo+ICAKPiAgCXJldCA9IHFjb21fcGFyc2VfaW5zdHJ1
Y3Rpb25zKGNoaXAsIHN1Ym9wLCAmcV9vcCk7Cj4gIAlpZiAocmV0KQo+IEBAIC0yOTExLDcgKzI5
MTYsMTAgQEAgc3RhdGljIGludCBxY29tX3BhcmFtX3BhZ2VfdHlwZV9leGVjKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsICBjb25zdCBzdHJ1Y3QgbmFuZF8KPiAgCW9wX2lkID0gcV9vcC5kYXRhX2lu
c3RyX2lkeDsKPiAgCWxlbiA9IG5hbmRfc3Vib3BfZ2V0X2RhdGFfbGVuKHN1Ym9wLCBvcF9pZCk7
Cj4gIAo+IC0JbmFuZGNfc2V0X3JlYWRfbG9jKGNoaXAsIDAsIDAsIDAsIGxlbiwgMSk7CgpuYW5k
Y19zZXRfcmVhZF9sb2MoKSBkb2VzIGNoYW5nZXMgdGhlIHJlZ2lzdGVyIG9mZnNldCBiYXNlZCBv
biBRUElDIHZlcnNpb24uIFNvCndoYXQgZXhhY3RseSB5b3UgYXJlIHRyeWluZyB0byBmaXggaGVy
ZT8KCi0gTWFuaQoKPiArCWlmIChuYW5kYy0+cHJvcHMtPnFwaWNfdjIpCj4gKwkJbmFuZGNfc2V0
X3JlYWRfbG9jX2xhc3QoY2hpcCwgcmVnX2Jhc2UsIDAsIGxlbiwgMSk7Cj4gKwllbHNlCj4gKwkJ
bmFuZGNfc2V0X3JlYWRfbG9jX2ZpcnN0KGNoaXAsIHJlZ19iYXNlLCAwLCBsZW4sIDEpOwo+ICAK
PiAgCWlmICghbmFuZGMtPnByb3BzLT5xcGljX3YyKSB7Cj4gIAkJd3JpdGVfcmVnX2RtYShuYW5k
YywgTkFORF9ERVZfQ01EX1ZMRCwgMSwgMCk7Cj4gLS0gCj4gMi4zNC4xCj4gCgotLSAK4K6u4K6j
4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
