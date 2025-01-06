Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5100AE77188
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2025 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wuJlyt22i/RbyknX6vLw/zhRrznZfiKTJBJhPAsBah0=; b=Y9NvMnlw5djJB5
	ML8ZPEWCA2J6teMfJCUrNxy+uTgvTLZhjcG8rAT/fUI8x5frH6wgGDx759BSv6f7kTW1TxsLRauoY
	H2Vb1Z+Gq3lPCU0BzRhDXvyCcZtKbJDh/xLpirx2K1Wuf0d0n6QXN1nROMNYph3WaI+xVi1omqs7V
	1olXnSqV9aU3xw8G7jHg4k0azQDK1cEqPFC6vtSfUDrZ6ZD7cE3v+yg6ZQCSEaPnvMZdngqLTChi/
	19vV82dnhB5h1xW5XrIP9NXdmpd9KSpFZl4WePzI2WVZRUQVp/bxiPNTr/Q7cEg840O22L0q+hvyh
	gA3CO5jlVcF80vKCwHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnlW-00000001W1e-446G;
	Mon, 06 Jan 2025 14:07:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUniW-00000001Uxa-4Bxa
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jan 2025 14:04:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21644aca3a0so23867315ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 06 Jan 2025 06:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736172268; x=1736777068; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPCTx7YZO3kYinhY7a/YvtUWfdELIKIx/KCwel3xU3E=;
        b=mkVfKNwf2ypsKb5Slx7CmC5Li1SCh97KGhTMwnHH9STj4uKfPUsCzcoYxBns+VeyaM
         nqKLuJgPPfv5bBG5tNBetACL+A3/iLH8EnLxyzEA3xHqejUYKNvxrjYSOnEXkxv7nJUP
         7Mx3I8cEozF8pVE2oLl8dvUG1R61HWba/ncj0BOGxOT25H63zocfmMNqKaxPC6vIMQ3A
         HMUH+kgNbKhkrxhw/srwA1gFCjN8+pfkMxduJT5UmcrlU/2DmO/6vyLfhvzFGXiPeXS/
         s+SAlDhYH1ls3Vm9xzzcl82kJSpV/q/7uDFO+FHahzsZUGp5CDzNt5c3DXJsBbwBZQQc
         NXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172268; x=1736777068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPCTx7YZO3kYinhY7a/YvtUWfdELIKIx/KCwel3xU3E=;
        b=j7JcEaM95nEold4QrT7brqxSdLJo0SUre+rKlIWi1HK3qaQ9MluBh/vUz9/FaRhguS
         9GrINA7UZploHhtX7hvTD0tlS9nIcoW47Gt/ujINbKy2rFC6Cs2Adfqb/hHN1PmMO0Ek
         STSWgXJqMxWpvyhDTO9KcOpx24e57hLg/uwSke0bs7KCu4SI7+g1dCEZNqmg7GeLLmRC
         vOrJl6zl8ODZc8pMbbjskhi2WYpTfB9wtzuuD1UQS165kU9/ysACEt9I12V2WMYIp3Jg
         jnLNOiMd6nbjnbukl/WQkrNHa1qcC/zVcc3Q33us+KrNgSkkZleig8txbJVUYFOotuNk
         ibVA==
X-Forwarded-Encrypted: i=1; AJvYcCX2zAzzkpAE+e0st5Df7bC6n4FqklyvhawXsfemeJUpZ/YrHOf6XxFEra86nsUHNoci/zHC52X5o+8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkV+iOo+JL/zUrj81Sa73NtnbLdvr5sp6dUQasZYwPz3FqpAn1
	LHDqYGIcxTFJ/u+BdH6yg5hzrewyyCBgaPol0Ebx7y7X7urigmpzaJvh3PvsOg==
X-Gm-Gg: ASbGncsYBTBfOtZO1IyAwu36jffbXsOHxYwF+4TWgV/MrcvPW6lUWFCXOFbB9R0CGIZ
	p/e1C6wPSFjg5QDyHUb0XnnqRG2xIgacpxEZ6mCjmBT6Cv+F83MbDyQ+frkdvkqg8dOINn+447P
	tHoPZx6maE24jdoJbP6LAdd2aCXf9+XHS0voGl10NjaiQ5vsPmPlqIREOFWjfvjsakaJf1JQ2zD
	TMUClKd+okGg9yGTqCPIDc26HBjMPP88vNi1nCjp1gVU/nTQu9t9mBZvV7pE1Oj3J4=
X-Google-Smtp-Source: AGHT+IHOt8/xeOzitH/i9FEolYj7w8e6OxGuhTMPSPoHNq0YQ4Vj0EUbfZi/o55bGUVsRd2Aw/j2rw==
X-Received: by 2002:a17:902:e746:b0:216:6769:9ee7 with SMTP id d9443c01a7336-219e6f13c5dmr848287925ad.41.1736172268112;
        Mon, 06 Jan 2025 06:04:28 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02b27sm290329535ad.276.2025.01.06.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:04:27 -0800 (PST)
Date: Mon, 6 Jan 2025 19:34:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	bbrezillon@kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_nainmeht@quicinc.com, quic_laksd@quicinc.com
Subject: Re: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Message-ID: <20250106140417.ypyynt2xvixiixhb@thinkpad>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
 <20241220093029.z4zsr3owdnqll2vg@thinkpad>
 <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18af7a68-42a3-6a82-c1b1-38ba8b06ed78@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_060429_895272_D7D935BE 
X-CRM114-Status: GOOD (  16.01  )
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

T24gVHVlLCBEZWMgMjQsIDIwMjQgYXQgMTA6NTI6MDNBTSArMDUzMCwgTWQgU2FkcmUgQWxhbSB3
cm90ZToKPiAKPiAKPiBPbiAxMi8yMC8yMDI0IDM6MDAgUE0sIE1hbml2YW5uYW4gU2FkaGFzaXZh
bSB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDIyLCAyMDI0IGF0IDAyOjI5OjMwUE0gKzA1MzAsIE1k
IFNhZHJlIEFsYW0gd3JvdGU6Cj4gPiA+IHYyOgo+ID4gPiAgICogVXBkYXRlZCBjb21taXQgbWVz
c2FnZQo+ID4gPiAgICogQWRkZWQgc3RhYmxlIGtlcm5lbCB0YWcKPiA+ID4gICAqIEFkZGVkIEZp
eGVzIHRhZwo+ID4gPiAgICogUmVuYW1lZCB0aGUgdmFyaWFibGUgZnJvbSBvZmZzZXRfZnJvbV9x
cGljIHRvIG5hbmRjX29mZnNldAo+ID4gPiAgICogU2V0IGJ1Zl9jb3VudCB0byA1MTIgaW4gdGhl
IHBhcmFtZXRlciBwYWdlIHJlYWQKPiA+ID4gICAqIFJlcGxhY2VkIHRoZSBidWZfY291bnQgdmFs
dWUgb2YgNTEyIHdpdGggdGhlIGxlbiBpbiBieXRlcwo+ID4gPiAKPiA+ID4gdjE6Cj4gPiA+ICAg
KiBUaGVzZSBwYXRjaGVzIHdpbGwgZml4IHRoZSBmb2xsb3dpbmc6Cj4gPiA+ICAgKiAxKSBvbmZp
IHBhcmFtIHBhZ2UgcmVhZCB3aGljaCB3YXMgYnJva2VuIGJ5IGV4ZWNfb3AoKSBwYXRjaC4KPiA+
ID4gICAqIDIpIEZpeGVkIG9mZnNldCBwYXNzZWQgdG8gQkFNIGZyb20gUVBJQyBiYXNlCj4gPiA+
IAo+ID4gPiBNZCBTYWRyZSBBbGFtICgzKToKPiA+ID4gICAgbXRkOiByYXduYW5kOiBxY29tOiBQ
YXNzIDE4IGJpdCBvZmZzZXQgZnJvbSBRUElDIGJhc2UgYWRkcmVzcyB0byBCQU0KPiA+ID4gICAg
bXRkOiByYXduYW5kOiBxY29tOiBGaXggb25maSBwYXJhbSBwYWdlIHJlYWQKPiA+ID4gICAgbXRk
OiByYXduYW5kOiBxY29tOiBGaXggcmVhZCBsZW4gZm9yIG9uZmkgcGFyYW0gcGFnZQo+ID4gPiAK
PiA+IAo+ID4gRG8geW91IHBsYW4gdG8gcmVzcGluIHRoaXMgc2VyaWVzPyBGWUksIHRoZXNlIGFy
ZSByZWdyZXNzaW9ucywgc28gc2hvdWxkIGdvIGluCj4gPiBlYXJseSBhcyBwb3NzaWJsZS4KPiBX
YWl0aW5nIGZvciBTUEkgTkFORCBzZXJpZXMgcGF0Y2hlcyBbMV0gdG8gYmUgbWVyZ2VkIChyYXcg
bmFuZCBjaGFuZ2UgcGF0Y2gKPiAyLTUpLiBPbiB0b3Agb2YgdGhhdCB3aWxsIHJlcG9zdCB0aGVz
ZSBwYXRjaGVzLgoKVGhpcyBzZXJpZXMgZml4ZXMgcmVncmVzc2lvbiwgc28gdGhlc2Ugc2hvdWxk
IGJlIG1lcmdlZCBmaXJzdC4gRG8gbm90IG1ha2UgZml4ZXMKZGVwZW5kIG9uIGZlYXR1cmUuCgot
IE1hbmkKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K61
4K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
