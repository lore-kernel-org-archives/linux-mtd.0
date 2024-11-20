Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8B2D6E2CE
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2024 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdhSushty0BqxACEMIuyi5Mv8DY7y11/+tf8TcaLajU=; b=TeTJSB/sFtNKs8
	QpC/bknJXakkMqfe0D/Ll28cvpG91Q1qqwYqU3fXrFO9aRbOsNHOyn+A4Ka9Zg9rNON9LRiU/4rIi
	fqRILl+94VUinvG8nY7e1/95Km2/UFlrDI4aXxkYU9woiFtRYKd4YpMRrd9HoALsIvFByjEOBzni3
	S6Qwfd8ehznCGc1LBcdZMdOPqS32Yf12O71c47VmTLSZqJz9s7w3f4q+hvISgi9Nh/v/o2iWPMc7E
	1WDg64iLtWJx2khdYINlyvn8UoN1Bjx6tpTOJYhyi4RejkVbX5cGCTuWB7E/ua8kIbyw142moz7s1
	0KUioz7NsaN2Pg+YNPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDenj-0000000EZlo-2N6A;
	Wed, 20 Nov 2024 07:06:59 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeiH-0000000EYgx-3Kd7
	for linux-mtd@lists.infradead.org;
	Wed, 20 Nov 2024 07:01:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ea1c455d0eso3662950a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2024 23:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732086081; x=1732690881; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ViYzAc9WLK6jLOPltHnzdk750GZoNYIYgpGNbpi34M=;
        b=jx15/TY6qKf2BENV8Jmx1bdfL6Q30xHlXzOldOam9tuNFAShM8akZRrpmwM0BkmzCm
         GNzmWhP5PpeJ55vxDKmAapAsqPqxz9ErQorFZSATr3kGH6uzzy3YrxKnLUZw2XacR7K6
         e0OPucwOGLZfnYTkvY7HfzeWinrzYaDIj5JmeRQRNwORrW52F/OhXmWH7ibTmyeb2AVY
         09QqyJEuhq5AMOT079L39YnaGj2FMOR25uVwxtJO3jvITk9qN97S8hyqvzDOw46UZpnB
         kGojVTNmoF6g+X0w4RSgY9ppQza0I63GJidIxNzjufRNiKDNvWSjLfSxxdqNP+GuH+2z
         un5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732086081; x=1732690881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ViYzAc9WLK6jLOPltHnzdk750GZoNYIYgpGNbpi34M=;
        b=DAnZqf0Jiz7tGoM76lT4faJ2QFNGAVwkdmK3MSQ8/xs6/wB+hxMf/j3Tv/vScw+zJ5
         uRUAlpaxtj7Ah8B0U9nxuPimYMqnSov+VvsC8RHk49bfIhac4gdiPMLzn35Ge73lbyai
         vPbp2uorR+pAVfdkjHWA702AbeGvZrG9dD2oL0eFVLoGjsOWpj047OkHkIi5kXxxJOf1
         n28u+cA1b+Tl+kQnyeZKEhn2ika+Y2/FcDrcLrymC6oM91Z75dYInxITcJuM2i0jySPW
         6TY7NIHUhEO3ueK1hEtSTRqBMdP0xrDsqSGb4U28HXxM03c2Arxt+0PHlFEaYl1hDjWI
         lPxA==
X-Forwarded-Encrypted: i=1; AJvYcCXOdQl4v6BJPQS8PKNLlZrs78COwR1Xgx+yxJyJ2KQdz5rQ2b5rLbJnYoDPzxQw6CMZ36HL/NHf8oM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkHN2Xs46e8NtHnXEgbCBKDSu0tKUEZh+thBYCnYpP7BwdzODb
	O8HIlG5v2QTdk0gI6Xy6BJKv6u0mubtbYTRf3Fb0gUylY8kndvKto8s6zfI5Og==
X-Google-Smtp-Source: AGHT+IHj2cuOOlfcohUcdNygmcvikQt71/Syr1p8dbOWgBZHbuuarNyAfZM+UbV1oden1U8Pt0wBMQ==
X-Received: by 2002:a17:90b:4c04:b0:2ea:6d7a:d6bc with SMTP id 98e67ed59e1d1-2eaca738f91mr1932814a91.19.1732086080860;
        Tue, 19 Nov 2024 23:01:20 -0800 (PST)
Received: from thinkpad ([120.60.129.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead031448csm561848a91.20.2024.11.19.23.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 23:01:20 -0800 (PST)
Date: Wed, 20 Nov 2024 12:31:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 1/2] mtd: rawnand: qcom: Pass 18 bit offset from QPIC
 base address to BAM
Message-ID: <20241120070115.qox54zr3yhnkqgmd@thinkpad>
References: <20241119092058.480363-1-quic_mdalam@quicinc.com>
 <20241119092058.480363-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241119092058.480363-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_230121_870620_DFDB8BB1 
X-CRM114-Status: GOOD (  23.90  )
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

T24gVHVlLCBOb3YgMTksIDIwMjQgYXQgMDI6NTA6NTdQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBDdXJyZW50bHkgd2UgYXJlIGNvbmZpZ3VyaW5nIGxvd2VyIDI0IGJpdHMgb2YgYWRk
cmVzcyBpbiBkZXNjcmlwdG9yCj4gd2hlcmVhcyBRUElDIGRlc2lnbiBleHBlY3RzIDE4IGJpdCBy
ZWdpc3RlciBvZmZzZXQgZnJvbSBRUElDIGJhc2UKCllvdSBtZWFuICdRUElDIElQJyBoZXJlPyBC
dXQgaXMgaXQgUVBJQyBvciBOQU5EYz8gSSBndWVzcyB0aGUgbGF0ZXIuCgo+IGFkZHJlc3MgdG8g
YmUgY29uZmlndXJlZCBpbiBjbWQgZGVzY3JpcHRvcnMuIFRoaXMgaXMgbGVhZGluZyB0byBhCj4g
ZGlmZmVyZW50IGFkZHJlc3MgYWN0dWFsbHkgYmVpbmcgdXNlZCBpbiBIVywgbGVhZGluZyB0byB3
cm9uZyB2YWx1ZQo+IHJlYWQuCj4gCgpUaGlzIGRvZXNuJ3QgY2xlYXJseSBzYXkgd2hhdCB0aGUg
YWN0dWFsIGlzc3VlIGlzLiBJSVVDLCB0aGUgaXNzdWUgaXMgdGhhdCB0aGUKTkFORGMgYmFzZSBh
ZGRyZXNzIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBRUElDIGJhc2UgYWRkcmVzcy4gQnV0IHRoZSBk
cml2ZXIKZG9lc24ndCB0YWtlIGl0IGludG8gYWNjb3VudCBhbmQganVzdCB1c2VkIHRoZSBRUElD
IGJhc2UgYXMgdGhlIE5BTkRjIGJhc2UuIFRoaXMKdXNlZCB0byB3b3JrIGFzIHRoZSBOQU5EYyBJ
UCBvbmx5IGNvbnNpZGVycyB0aGUgbG93ZXIgMTggYml0cyBvZiB0aGUgYWRkcmVzcwpwYXNzZWQg
YnkgdGhlIGRyaXZlciB0byBkZXJpdmUgdGhlIHJlZ2lzdGVyIG9mZnNldC4gU2luY2UgdGhlIGJh
c2UgYWRkcmVzcyBvZgpRUElDIHVzZWQgdG8gY29udGFpbiBhbGwgMCBmb3IgbG93ZXIgMTggYml0
cyAobGlrZSAweDA3OTgwMDAwKSwgdGhlIGRyaXZlciBlbmRlZAp1cCBwYXNzaW5nIHRoZSBhY3R1
YWwgcmVnaXN0ZXIgb2Zmc2V0IGluIGl0IGFuZCBOQU5EYyB3b3JrZWQgcHJvcGVybHkuIEJ1dCBv
bgpuZXdlciBTb0NzIGxpa2UgU0RYNzUsIHRoZSBRUElDIGJhc2UgYWRkcmVzcyBkb2Vzbid0IGNv
bnRhaW4gYWxsIDAgZm9yIGxvd2VyIDE4CmJpdHMgKGxpa2UgMHgwMUM5ODAwMCkuIFNvIE5BTkRj
IHNlZXMgd3Jvbmcgb2Zmc2V0IGFzIHBlciB0aGUgY3VycmVudCBsb2dpYy4KCj4gT2xkZXIgdGFy
Z2V0cyBhbHNvIHVzZWQgc2FtZSBjb25maWd1cmF0aW9uIChsb3dlciAyNCBiaXRzKSBsaWtlIHNk
eHBpbm4sCgpQbGVhc2UgdXNlIGFjdHVhbCBwcm9kdWN0IG5hbWVzIGFuZCBub3QgaW50ZXJuYWwg
bmFtZXMuIEkgYmVsaWV2ZSB5b3UgYXJlCnJlZmVycmluZyB0byBTRFg1NS9TRFg2NSBoZXJlLgoK
PiBpcHEgZXRjLiBidXQgaXNzdWUgaXMgbWFza2VkIGluIG9sZGVyIHRhcmdldHMgZHVlIHRvIGxv
d2VyIDE4IGJpdHMgb2YgUVBJQwo+IGJhc2UgYWRkcmVzcyBiZWluZyB6ZXJvIGxlYWRpbmcgdG8g
ZXhwZWN0ZWQgYWRkcmVzcyBnZW5lcmF0aW9uLgo+IAo+IFNkeHBpbm4gICAgIDogUVBJQ19RUElD
IHwgMHgwMUM5ODAwMCAoTG93ZXIgMTggYml0cyBhcmUgbm9uIHplcm8pCj4gU2R4bmlnaHRqYXIg
OiBRUElDX1FQSUMgfCAweDA3OTgwMDAwIChMb3dlciAxOCBiaXRzIGFyZSB6ZXJvKSBTYW1lIGZv
cgo+IG9sZGVyIHRhcmdldHMuCgpTYW1lIGhlcmUuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1kIFNh
ZHJlIEFsYW0gPHF1aWNfbWRhbGFtQHF1aWNpbmMuY29tPgoKUGxlYXNlIGFkZCByZWxldmFudCBG
aXhlcyB0YWcuCgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCA5
ICsrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBpbmRleCBiOGNmZjkyNDBiMjgu
LjM0ZWU4NTU1ZmI4YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMjA3
LDcgKzIwNyw3IEBAIG5hbmRjX3NldF9yZWcoY2hpcCwgcmVnLAkJCVwKPiAgI2RlZmluZSBkZXZf
Y21kX3JlZ19hZGRyKG5hbmRjLCByZWcpICgobmFuZGMpLT5wcm9wcy0+ZGV2X2NtZF9yZWdfc3Rh
cnQgKyAocmVnKSkKPiAgCj4gIC8qIFJldHVybnMgdGhlIE5BTkQgcmVnaXN0ZXIgcGh5c2ljYWwg
YWRkcmVzcyAqLwo+IC0jZGVmaW5lIG5hbmRjX3JlZ19waHlzKGNoaXAsIG9mZnNldCkgKChjaGlw
KS0+YmFzZV9waHlzICsgKG9mZnNldCkpCj4gKyNkZWZpbmUgbmFuZGNfcmVnX3BoeXMoY2hpcCwg
b2Zmc2V0KSAgKChuYW5kYyktPnByb3BzLT5vZmZzZXRfZnJvbV9xcGljICsgKG9mZnNldCkpCj4g
IAo+ICAvKiBSZXR1cm5zIHRoZSBkbWEgYWRkcmVzcyBmb3IgcmVnIHJlYWQgYnVmZmVyICovCj4g
ICNkZWZpbmUgcmVnX2J1Zl9kbWFfYWRkcihjaGlwLCB2YWRkcikgXAo+IEBAIC01NjEsNiArNTYx
LDcgQEAgc3RydWN0IHFjb21fbmFuZGNfcHJvcHMgewo+ICAJYm9vbCBpc19xcGljOwo+ICAJYm9v
bCBxcGljX3YyOwo+ICAJYm9vbCB1c2VfY29kZXdvcmRfZml4dXA7Cj4gKwl1MzIgb2Zmc2V0X2Zy
b21fcXBpYzsKCm5hbmRjX29mZnNldD8KCj4gIH07Cj4gIAo+ICAvKiBGcmVlcyB0aGUgQkFNIHRy
YW5zYWN0aW9uIG1lbW9yeSAqLwo+IEBAIC0zNDc3LDYgKzM0NzgsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHFjb21fbmFuZGNfcHJvcHMgaXBxODA2eF9uYW5kY19wcm9wcyA9IHsKPiAgCS5pc19i
YW0gPSBmYWxzZSwKPiAgCS51c2VfY29kZXdvcmRfZml4dXAgPSB0cnVlLAo+ICAJLmRldl9jbWRf
cmVnX3N0YXJ0ID0gMHgwLAo+ICsJLm9mZnNldF9mcm9tX3FwaWMgPSAweDMwMDAwLAoKSG93IDB4
MzAwMDAgaXMgc3VwcG9zZWQgdG8gd29yaz8gWW91IHNhaWQgdGhlIE5BTkRjIGlnbm9yZXMgbG93
ZXIgMTggYml0cywgYnV0CnRoaXMgaGFzIDE3dGggYW5kIDE4dGggYml0cyBzZXQuCgotIE1hbmkK
Ci0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+N
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
