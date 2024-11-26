Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D8CD5A6DF
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2024 05:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLDaYqmflvAVda5kas/HbmnEl5Ck2/v4j2r3vlas5xA=; b=U6oWkey6vPQEDq
	xupOEeRVpUYx6CuOaCl9LhNaND+xnibzcnDFInW4dj7HXAtK6uZH9DHIRfpzg+ZkOEvdVRyC6edYr
	xw+0l4oB4/c9sxAFf4YrOrqRniExhoi3JS4k+KOAFKSGJXp9zqyjsP/eRrlfPUo2rRPGt81NVO2iG
	ayVkhzZsssNGCjmh9kLB4AdqvECwpVDSeWNXZisH8gd+ld//W/uRF/VLaEp4naUvWVLn7NTEtvYKz
	ubXVhvvzN4ZNuNmt0tqAnDlOol/dYaokRbbPIyGs1hSvErRCT5SlzN48bc0Ut52YU5Wj9xY3joJYn
	nsAhVWOgj0XLwJAuzsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFoQN-00000009hTV-2OD6;
	Tue, 26 Nov 2024 05:47:47 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFoOF-00000009h9h-3nLy
	for linux-mtd@lists.infradead.org;
	Tue, 26 Nov 2024 05:45:37 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-724f383c5bfso2327254b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 21:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732599935; x=1733204735; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ru8A8FYea7pWk45ZPv+cLA69r/6TsIev+AJUTgUfZ+o=;
        b=KI6j4yxdq0C2BWU58qUyHaErRFyuEGsNa3AxLrPLARXdXA+nubnOnDrs+DFO3lzAgT
         At+H9IrUY8bXIvedZqmcvGJDxDZM0RwmbHRFrJpWwcQOiG+2VZtdadRGjILp7Mqy/Ebp
         8bodizv7N92JKR6OSsZzYnNwHZ4wUBYJHjy66u1h4TH85M+mt7BTDyUYPI4N5f3LJLIx
         JcPbqfl0TnqnS3HpZD3JpyG4Dmb6AZ4jUMPO4oFmYohozrcy/Sq1MfekTNcM3H/eHTn/
         I0vzzFu8iIn56F8zZvUbLdQggYkcDd6NSFcRWC3EJxj53iwTb2Zr7LqDAkxeUbNd063l
         FACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732599935; x=1733204735;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ru8A8FYea7pWk45ZPv+cLA69r/6TsIev+AJUTgUfZ+o=;
        b=fayMOZN5zC+ikzvFcu3pQjd+keCvmdTQ9cVm872CVOx/CFufrT5hmHPOZjXuEocJ4Q
         apd32gckQeR7Erz/Mg4X1SUOIXScbDIaDnNVo3HcQ3E+XfIOh/X1FlrldSzQvZbmILj9
         t+cVJa9GMjbyc2bVy/qCPo28Gi/F68oIXQL93RSSGLiTMNtTNXR8ZWzJSQ+FSYXBDn6R
         RxeYBaiPFWrXIKK972jFhKjlhQJMPfTnRCfa9NFzddhffhM6W9MZnfGOWAsWz+vBQTN7
         ujfB1/ZlO13NN1zKhj05N8FO31QU8ki7sAgSrbkS+smrH+ERcTIuQz72HV8u1m0560XW
         lyRA==
X-Forwarded-Encrypted: i=1; AJvYcCVDE7Zp/RxmHYyJwlRFqU6Ap6XQCcCSfu/XXPoH6IWK/cW8S1SmegQf7l9AxEq6WWLJVr++dWQgtnA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzItQw7+s9YGQQqK9lq0Qt+G1bxJz/nBmPNyDrkmgBJpGm3tSPR
	kF1ltOoSg1KeGMiTg6IIWu7xQP1KNMvdoYMjG6ssjtMXRjgqVna/uUT/Ri95Mg==
X-Gm-Gg: ASbGncvklnoMxXjY3ZE5PJtA8RGrZqlFFRkSROctMQjWHzMbgKuFEmHOm64NfXTH/fc
	TjZjr90+8o971BodfXLayGPAqBAzlmD0jbu1XYLFa4/8jYX73Fey9hyCOIk1/ISFj3XLwolyJOT
	zdHhsZOLAhh0QCGhaxzzXWYyBQhCh4/aTxZ4SgJhAiAlwqPmgTcrVmWGYKPeP20BBMgKErkVaB9
	nMFyTTpO8ogWsBMGOw08dErpWxvcfQcMne2CM1jkoEK1I9yrl4VGjUIMEGKgBE=
X-Google-Smtp-Source: AGHT+IEBdAbqM+xFjnu+5Y3RUrCVenb/3lk9NHI94YHgWcVczPs6/2qW10NRSJW4WAL4o0zVcC2bbg==
X-Received: by 2002:a05:6a00:244e:b0:71d:f510:b791 with SMTP id d2e1a72fcca58-724df5ee500mr20478083b3a.12.1732599935009;
        Mon, 25 Nov 2024 21:45:35 -0800 (PST)
Received: from thinkpad ([220.158.156.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454ae5sm7505161b3a.7.2024.11.25.21.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 21:45:34 -0800 (PST)
Date: Tue, 26 Nov 2024 11:15:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 3/3] mtd: rawnand: qcom: Fix read len for onfi param
 page
Message-ID: <20241126054529.ewoajuaor4wpa4xe@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241122085933.2663927-4-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241122085933.2663927-4-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_214535_950519_4B050591 
X-CRM114-Status: GOOD (  18.66  )
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

T24gRnJpLCBOb3YgMjIsIDIwMjQgYXQgMDI6Mjk6MzNQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBUaGUgbWluaW11bSBzaXplIHRvIGZldGNoIHRoZSBkYXRhIGZyb20gZGV2aWNlIHRv
IFFQSUMgYnVmZmVyCj4gaXMgNTEyLWJ5dGVzLiBJZiBzaXplIGlzIGxlc3MgdGhhbiA1MTItYnl0
ZXMgdGhlIGRhdGEgd2lsbCBub3QgYmUKPiBwcm90ZWN0ZWQgYnkgRUNDIGFzIHBlciBRUElDIHN0
YW5kYXJkLiBTbyB3aGlsZSByZWFkaW5nIG9uZmkgcGFyYW1ldGVyCj4gcGFnZSBmcm9tIE5BTkQg
ZGV2aWNlIHNldHRpbmcgbmFuZGMtPmJ1Zl9jb3VudCA9IDUxMi4KCnMvc2V0dGluZy9zZXQKCj4g
Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBGaXhlczogODk1NTBiZWIwOThlICgibXRk
OiByYXduYW5kOiBxY29tOiBJbXBsZW1lbnQgZXhlY19vcCgpIikKPiBTaWduZWQtb2ZmLWJ5OiBN
ZCBTYWRyZSBBbGFtIDxxdWljX21kYWxhbUBxdWljaW5jLmNvbT4KClJldmlld2VkLWJ5OiBNYW5p
dmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgoKLSBN
YW5pCgo+IC0tLQo+IAo+IENoYW5nZSBpbiBbdjJdCj4gCj4gKiBTZXQgYnVmX2NvdW50IHRvIDUx
MiBpbiB0aGUgcGFyYW1ldGVyIHBhZ2UgcmVhZAo+IAo+IENoYW5nZSBpbiBbdjFdCj4gCj4gKiBU
aGlzIHBhdGNoIHdhcyBub3QgaW5jbHVkZWQgaW4gdjEKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvcWNvbV9uYW5kYy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggMzFl
YzNkYjEyNDZkLi5lMWRjYTQ4NTc3NTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gQEAgLTI5MjYsNyArMjkyNiw3IEBAIHN0YXRpYyBpbnQgcWNvbV9wYXJhbV9wYWdlX3R5cGVf
ZXhlYyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCAgY29uc3Qgc3RydWN0IG5hbmRfCj4gIAkJd3Jp
dGVfcmVnX2RtYShuYW5kYywgTkFORF9ERVZfQ01EMSwgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+
ICAJfQo+ICAKPiAtCW5hbmRjLT5idWZfY291bnQgPSBsZW47Cj4gKwluYW5kYy0+YnVmX2NvdW50
ID0gNTEyOwo+ICAJbWVtc2V0KG5hbmRjLT5kYXRhX2J1ZmZlciwgMHhmZiwgbmFuZGMtPmJ1Zl9j
b3VudCk7Cj4gIAo+ICAJY29uZmlnX25hbmRfc2luZ2xlX2N3X3BhZ2VfcmVhZChjaGlwLCBmYWxz
ZSwgMCk7Cj4gLS0gCj4gMi4zNC4xCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+N
IOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
