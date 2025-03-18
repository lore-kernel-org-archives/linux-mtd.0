Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AC6C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48lp/EeYQrYPmSp//0uQFdN4f+wnTRzhwwx0gF39mn0=; b=q9HQkKKztONfgO
	BjGLL7I0YXkP5HkfDQqTn+oTcYW9UqEh06cVxa+01KjTDImhyTDtQHfr23WarslBKNT7rDstxdhQS
	AT8qyxE0/F5fS+jtYeatwuP64o3MwUzis3FQsl0he3SulzTIC2akgqI6DFNGYuPpElXiAh2Y8o3EU
	HpQLcCSxYbRBeWpE8JxgG4oWGAsBEf6eNumen0/af/lYk/9Ddp4xM6SeXBooNcMb3jd0grTse//fP
	4pEjO9S/WzBehwlScaaNx4rG/ZEbrlXTl9u74pLZEZvdfUmQhCL3OB22r0WWzCnAMeIpHydBPh11x
	adOVFBARk4HD2esflSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYON-00000006GnA-0veW;
	Tue, 18 Mar 2025 14:58:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYOK-00000006Gla-14gg
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 14:58:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so30611715e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742309882; x=1742914682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIYhiSbyjyMgqKSk2yPk/8dcvUtNJxh0D/RVa279Fn0=;
        b=YiUon106CW3ypKZsPmkTui5Ltu5hI1Wfx+TA+CWkBfKeUI25zJTSXVJFzpHph0yEmq
         A3vY0MmH67jFRq2GcWEbkWIprU0j3/8eoVkD9HAKdFNA6iUj95yxHtqjwfFy3b1+0Jrz
         GRnkl1Y9Bcp/lP4p3Q+7ZjuZPgLP2ki4WrKFAcbFDtwqNjHXjqBSDz71auNeIyhKOQdz
         U9SR8y+7JQcOhOBI8F8hSwqKjJ8wzr1IzZI2uofwIybTDVB2E1e4JNXVFooLg7WnUqyU
         8/gkKLd+v17zX3EWUw7uQ+jr9OGh0/TScxtmld43XjLkBtA3SVQVawTBcVi+TKx2x6U6
         ogkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309882; x=1742914682;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIYhiSbyjyMgqKSk2yPk/8dcvUtNJxh0D/RVa279Fn0=;
        b=wu2tw03bta7Ggrepx1QpFtkm1d4CFTNVhlRM019SwLd6HNEyObqqvdKsXC0v0yV9x1
         N/xqL7O1jkETzs1o2/4rF6/YKrjyoHyeIi/8Z57qgExITqztu7ALer7xHVtbcpbcUufa
         ov/q7fN5+7xVMslDiYNWHWsuU/hCxT0qf0j8PpTa0phxVIK4dNlZJgJQLMtyu4a3Bbzp
         OhjxK7DPtu3jKouJVpkLiNJPP7uC+tXe0vctXpEGdSRH1U/5H/Ql3BcW1WJJpCL/JA8F
         sTKbJrkpbZx43U8z2JSnTU5tXkRkFx7Cv48jNGBYW8S/iLysPfJzx2soT1Eq/uYfe8cb
         jrsw==
X-Forwarded-Encrypted: i=1; AJvYcCWvoJWycpuNuynTjWc26+dzVnExc0K2UxEC9hoWrgWVTsOU6y/cH9B8wWTXLRnBXgY2qWKolbEub8s=@lists.infradead.org
X-Gm-Message-State: AOJu0YysCOAKvqGjy68jEF8d32540CT81UwQLWOUIiMLDH+fSLX1ARxl
	4IiTU0F+iq5rXJDvXDj5YC+3JTE1hJ6tx9Fql3bs/Par4fpX7HZ5
X-Gm-Gg: ASbGnctXH60l1Od4CIexY9xPf7xmbGGdTIdeg5lD6m06pN5RpPeNmbqb/18i6ydSBQ1
	TFlIwPmfOF76bHgSypSF39sacTqcXFvIl2DdBdxSlaphPDqHB3OUPAGr1J7Fw/fwjO9nAEIWvvI
	bwXxK6TrKMY5nmrVVoT99CMgDq0lmcsSdxnqLMGpiEeUoA/ctrc1Avlr5//7zHYBz7BkTq7pVLw
	mmr0x/jWfv6BNWha/YMhwfktfPdxZrLhh+xNzpXzH/a1ohCTTvhVVaLZH0nHdf5hUohIOIlr7sJ
	ocMCufgCkXSjQ9/rNdbXjQg2fyFYKA1JSwp4w3+xPUXIdMYRKtFNmg3tAXWytLW2K2b0U6BMQmM
	XBctBElwFsA==
X-Google-Smtp-Source: AGHT+IHqIIsxhsxL4TFb4mT39GCDZautBu6ueHr8Va0JRlDgI6GhXcz9I1HKZ70r9nkSYDmiKVjgSQ==
X-Received: by 2002:a05:600c:3b9f:b0:43d:1f1:8cd with SMTP id 5b1f17b1804b1-43d3b9dc60dmr23405505e9.24.1742309882448;
        Tue, 18 Mar 2025 07:58:02 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb62ccsm137191865e9.7.2025.03.18.07.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 07:58:02 -0700 (PDT)
Message-ID: <a72f0db0-fd49-4cff-bffe-671fc757a219@gmail.com>
Date: Tue, 18 Mar 2025 15:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH v3 4/4] spi: spi-qpic-snand: set nandc_offset for ipq9574
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
 manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, bbrezillon@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-5-quic_mdalam@quicinc.com>
Content-Language: hu
In-Reply-To: <20250310120906.1577292-5-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_075804_295302_9924DDB4 
X-CRM114-Status: GOOD (  16.77  )
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

MjAyNS4gMDMuIDEwLiAxMzowOSBrZWx0ZXrDqXNzZWwsIE1kIFNhZHJlIEFsYW0gw61ydGE6Cj4g
VGhlIEJBTSBibG9jayBleHBlY3RzIE5BTkQgcmVnaXN0ZXIgYWRkcmVzc2VzIHRvIGJlIGNvbXB1
dGVkIGJhc2VkIG9uCj4gdGhlIE5BTkQgcmVnaXN0ZXIgb2Zmc2V0IGZyb20gUVBJQyBiYXNlLiBU
aGlzIHZhbHVlIGlzIDB4MzAwMDAgZm9yCj4gaXBxOTU3NC4gVXBkYXRlIHRoZSAnbmFuZGNfb2Zm
c2V0JyB2YWx1ZSBpbiB0aGUgcWNvbV9uYW5kY19wcm9wcwo+IGFwcHJvcHJpYXRlbHkuCj4gCj4g
U2lnbmVkLW9mZi1ieTogTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFsYW1AcXVpY2luYy5jb20+Cj4g
LS0tCj4gCj4gQ2hhbmdlIGluIFt2M10KPiAKPiAqIEFkZGVkIG5hbmRfb2Zmc2V0IGZvciBwcm9w
ZXIgYWRkcmVzcyBjYWxjdWxhdGlvbgo+ICAgZm9yIG5ld2VyIFNvY3MKPiAKPiBDaGFuZ2UgaW4g
W3YyXQo+IAo+ICogVGhpcyBwYXRjaCB3YXMgbm90IHBhcnQgb2YgdjIKPiAKPiBDaGFuZ2UgaW4g
W3YxXQo+IAo+ICogVGhpcyBwYXRjaCB3YXMgbm90IHBhcnQgb2YgdjEKPiAKPiAgZHJpdmVycy9z
cGkvc3BpLXFwaWMtc25hbmQuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYyBiL2RyaXZl
cnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKPiBpbmRleCA4YzQxM2E2YTUxNTIuLjg1YTc0MmUyMWNm
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gKysrIGIvZHJp
dmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYwo+IEBAIC0xNjA0LDYgKzE2MDQsNyBAQCBzdGF0aWMg
dm9pZCBxY29tX3NwaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBxY29tX25hbmRjX3Byb3BzIGlwcTk1NzRfc25hbmRjX3Byb3BzID0g
ewo+ICAJLmRldl9jbWRfcmVnX3N0YXJ0ID0gMHg3MDAwLAo+ICAJLnN1cHBvcnRzX2JhbSA9IHRy
dWUsCj4gKwkubmFuZGNfb2Zmc2V0ID0gMHgzMDAwMCwKPiAgfTsKCkFwcGx5aW5nIHRoZSBmaXJz
dCBwYXRjaCBhbG9uZSByZXN1bHRzIGluIHRoZSBmb2xsb3dpbmcgZXJyb3Igb24gSVBROTU3NDoK
ClsgICAgMy41OTY0MDNdIHFjb21fc25hbmQgNzliMDAwMC5zcGk6IGZhaWx1cmUgaW4gc3VibWl0
dGluZyBjbWQgZGVzY3JpcHRvcgpbICAgIDMuNTk2NDkwXSBzcGktbmFuZCBzcGkwLjA6IHByb2Jl
IHdpdGggZHJpdmVyIHNwaS1uYW5kIGZhaWxlZCB3aXRoIGVycm9yIC0xMTAKClNvIHRoaXMgY2hh
bmdlIHNob3VsZCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGZpcnN0IHBhdGNoLiBPdGhlcndpc2Us
IFNQSSBOQU5ECnN1cHBvcnQgd291bGQgYmUgYnJva2VuIG9uIElQUTk1NzQgdGVtcG9yYXJpbHkg
YmV0d2VlbiB0aGUgZmlyc3QgYW5kIHRoZQpjdXJyZW50IHBhdGNoLgoKUmVnYXJkcywKR2Fib3IK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
