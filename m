Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EACCC282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjFY7316NAwCb24AMYB+WLiyuHrnTxOV8S6vzBY/cvo=; b=YyVrNYJpMckNKo
	1pRzMZfYM528SwWJkGsaNMVu3H8EhCIjYh7ngO/lXoGCGsnwwCtqcLbxB6v62Ni8ITM4pzrQGmFxF
	uHsAohLAkbQ12GG+XJEVQBcYgSP+tChMfQqbUSNruV3/oJW0xeQ1iXrKL3OGU0QNZpINo+4SpXteN
	NorP/CBPHnZ9H7gCC4oJj98dyG/almT3XJS3YMVAfKTloulAcnSKkKiwjDAwejhDEOE4HROMkMFPi
	GEa/mGzrN+g+AXx2wlrAg1vGooW9dwmbDRw4JqdeI6s1pmEF6FjYRe7Iekf6cogATTnqnk271QfnV
	XgY2PIFRQiMCaFAhWZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRTy-00000004wHJ-3yfh;
	Tue, 18 Mar 2025 07:35:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRTw-00000004wFt-2x6E
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 07:35:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22401f4d35aso98333645ad.2
        for <linux-mtd@lists.infradead.org>; Tue, 18 Mar 2025 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283324; x=1742888124; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ti9mkkr8qvTbrEt9TTTW4ivjULJ5uCNkrYEb+oujtBo=;
        b=Ib6MHsWo25YJmZoFRCT917mnBxI3ehSt09Aq1audIkvMrprIhqeOhHL3oY01SncMzS
         MW03t/wIqmyFd3n1G4le7mbMziDtI/pDc7Uf7nXX0sJ0H1PATAKTBIDj36BdA6M7phuF
         3oxkqAMjR9tK1f5z74huB0uYuUQ4841Tm0wbUFR0+x6fSYn7oNtLnF12HImJ4y6WDM4o
         RPlN+f4AXxjM5LCQ8ofVppeHuNEAiPb0V76F2oKvFV5QsQfjmZq9X9oW8aJ5ZRAo7Y1k
         VWl4CM0n8/jtNT8BQSjF4qQl6udyhC7p051VnGRaUsMEpstZanMXI54NXT4SwFxGNrCf
         ihLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283324; x=1742888124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ti9mkkr8qvTbrEt9TTTW4ivjULJ5uCNkrYEb+oujtBo=;
        b=jjhOzNadi+zJsn+s7lYBmxSmGJ/PPU6L67OhlPRwqNKtCgBorb6I4NWF8lc8grUsXt
         zTIQ8oHCRabojFELYnQ3Pb9xPIobSP849E+NSCOD/9adV1ZizDUy50qTiR+4SplYKwvC
         Gs0+PkPEzxLS68NkZXweHG7+Wj4G+jKgIZrO6fMcZUQDouuBUVfECeuN27kR/G0mcQWW
         cxaRdECohNFUix0MPJwvsN/qU07FIOY8udUGAU95VLfqd/NKxS92ZPkh5z/7K7EOzS48
         geL6xCvHn0fdsQIdSZA9WhA/cr9pfokVNBFncN9Irh72zRqVuwoykMLe176LsGRF2lsp
         KPYw==
X-Forwarded-Encrypted: i=1; AJvYcCWKa9ANirDuDmbMddFRtrBjt5C3Ev6xR/H7nm5+WTjmzX/VWhjM8f699lbZcr9bs8sJz8E6tR1nCm8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHrF+2Ha6U+C/0OL74njfsqOaoAVQDoxRfHBq9FJrhcmY4hEYC
	pldPYeAFmcd1VoiQXkTSq/rzoOfGh02qrioYNBH3Wfg8St0tYI0Nu+2M0/8PIQ==
X-Gm-Gg: ASbGncuMRoou3A4huMtYIHp4uD9A8R33UiXS16OYHgB0h7lOLbChT0j+XsmEm/oRAk5
	c9CZ2bISHAXFvPcRVxos1GMHM8SgQg0Ys4K2img+mTkJFS6j+mXvIuzVN/iJz5BloXZyAN8g+fl
	i6HjXLE2tuYHYxdkZR7U/SBIbfVkvKvzLQGI97nO+aQSJEN1FwxAezHSgJRcsqiKQ15Cr8NXO7+
	tUVF6MzVBfPHah/WxIyY/54uqYx69u+KKiLEaeiZYOPBCTS50BJiSPsl4fYBgtATaCSqWu1PCv3
	bC2ntmGYn0TERUlSA77ZRgjyU08fta1pVHhyTqWuesDEUlIhVqZAlGh6
X-Google-Smtp-Source: AGHT+IHmw89wtVmgBhfVxX9PTZBqglKeGhES/xurGrbMglniid1oBlbFanI6j4PT2q5RJtFbNqS0gg==
X-Received: by 2002:a17:902:ce81:b0:223:3ef1:a30a with SMTP id d9443c01a7336-2262c611213mr25670245ad.45.1742283324004;
        Tue, 18 Mar 2025 00:35:24 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd3d5bsm87724655ad.217.2025.03.18.00.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:35:23 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:05:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 4/4] spi: spi-qpic-snand: set nandc_offset for ipq9574
Message-ID: <20250318073519.pgise5vnlu2aha5u@thinkpad>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-5-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310120906.1577292-5-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_003524_739123_D427E832 
X-CRM114-Status: GOOD (  17.25  )
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

T24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMDU6Mzk6MDZQTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiBUaGUgQkFNIGJsb2NrIGV4cGVjdHMgTkFORCByZWdpc3RlciBhZGRyZXNzZXMgdG8g
YmUgY29tcHV0ZWQgYmFzZWQgb24KPiB0aGUgTkFORCByZWdpc3RlciBvZmZzZXQgZnJvbSBRUElD
IGJhc2UuIFRoaXMgdmFsdWUgaXMgMHgzMDAwMCBmb3IKPiBpcHE5NTc0LiBVcGRhdGUgdGhlICdu
YW5kY19vZmZzZXQnIHZhbHVlIGluIHRoZSBxY29tX25hbmRjX3Byb3BzCj4gYXBwcm9wcmlhdGVs
eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxxdWljX21kYWxhbUBxdWljaW5j
LmNvbT4KCkFja2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFz
aXZhbUBsaW5hcm8ub3JnPgoKLSBNYW5pCgo+IC0tLQo+IAo+IENoYW5nZSBpbiBbdjNdCj4gCj4g
KiBBZGRlZCBuYW5kX29mZnNldCBmb3IgcHJvcGVyIGFkZHJlc3MgY2FsY3VsYXRpb24KPiAgIGZv
ciBuZXdlciBTb2NzCj4gCj4gQ2hhbmdlIGluIFt2Ml0KPiAKPiAqIFRoaXMgcGF0Y2ggd2FzIG5v
dCBwYXJ0IG9mIHYyCj4gCj4gQ2hhbmdlIGluIFt2MV0KPiAKPiAqIFRoaXMgcGF0Y2ggd2FzIG5v
dCBwYXJ0IG9mIHYxCj4gCj4gIGRyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3BpL3NwaS1xcGljLXNuYW5kLmMgYi9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gaW5k
ZXggOGM0MTNhNmE1MTUyLi44NWE3NDJlMjFjZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkv
c3BpLXFwaWMtc25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKPiBA
QCAtMTYwNCw2ICsxNjA0LDcgQEAgc3RhdGljIHZvaWQgcWNvbV9zcGlfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcWNvbV9uYW5kY19w
cm9wcyBpcHE5NTc0X3NuYW5kY19wcm9wcyA9IHsKPiAgCS5kZXZfY21kX3JlZ19zdGFydCA9IDB4
NzAwMCwKPiAgCS5zdXBwb3J0c19iYW0gPSB0cnVlLAo+ICsJLm5hbmRjX29mZnNldCA9IDB4MzAw
MDAsCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBxY29tX3Nu
YW5kY19vZl9tYXRjaFtdID0gewo+IC0tIAo+IDIuMzQuMQo+IAoKLS0gCuCuruCuo+Cuv+CuteCu
o+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
