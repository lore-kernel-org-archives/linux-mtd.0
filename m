Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045ECC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UukadgYZ6QNs9iICxPWxT8UJnoYsTt5WJDRr9FeGl6U=; b=l4t0swn7YtCgYQ
	qL63xQ1Ngl2YR2/8TgI0nqqlhV+/s4mNhJ5vf8mvChRiHgwpFW/QIqmIasjNH0mJeru6slRHpUqKy
	HBE6W2HU7wJbSQg9XBzJNQKO6WnH7Xqb+eynSsAfxhEMVAfcPC6W30Vc6Pko5/iMlDxFnUVR0urIn
	yiIZM3RLaJBic15hnvAigc3JAV4QHZQkCKT+nmts1t6uJvCM/dqCvqvNrL6lRIo9j8Ww/Ra+WN/Mg
	RMLWKpsLhbZ0JTEjls7IYcBNiHPRby7c14LlZbeAeSXh5L4lxCokfWlGuXwqLJVcamNzanqWxzOTc
	H/juLrmvjueeJNSecjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCVP-00HM2m-Uj; Thu, 09 Jun 2022 07:23:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCVN-00HLzB-0l
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 07:22:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A3A7BB82C44;
	Thu,  9 Jun 2022 07:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1117AC34114;
	Thu,  9 Jun 2022 07:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654759374;
	bh=RUqBPuiFnGDcizHkOj1N9zmIBU4Hc2al7dVQSSZImWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=elyTdc0keXlyuqFHuj6jTBqKIijllhjYZIutFkdS0yLMZjITiN/xtyhos+bdM/ESf
	 8fIVvcr0ms0oy868yLbdiuRcQYgus0IT0V0GVvDeCj+n9QfR5j0cHpeTDkHvdhtYXp
	 y/G0lnkgoF/e/kxp2rAAqym3Txkydf9VF6OlJkhE3AtCI2TyIhPvv7AdZM1mSaB6DU
	 +pfNnSkIWF9I8YTLfzfvNHx7SOhUKIKdUL1hSggq3A41fmkGopWYxkpWNN/Y7aPd6K
	 35MFgjfcxxh9jOwY7hknO8RDdAbGWs8zAzCT6wDY1QFt7DCsguopHNRGevqq0Ltn5h
	 f6MLMzoUT9S2Q==
Date: Thu, 9 Jun 2022 12:52:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
Message-ID: <20220609072240.GB2758@thinkpad>
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
 <20220608001030.18813-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608001030.18813-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_002257_228704_F9B01E24 
X-CRM114-Status: GOOD (  16.68  )
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

T24gV2VkLCBKdW4gMDgsIDIwMjIgYXQgMDI6MTA6MzBBTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IFJlb3JkZXIgcWNvbV9uYW5kX2hvc3QgdG8gc2F2ZSBob2xlcyBpbiB0aGUgc3RydWN0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+
CgpJZiB0aGlzIHBhdGNoIGdldHMgbW92ZWQgdG8gMi8zLCB5b3UgY291bGQgc2F2ZSBmZXcgY2hh
bmdlcy4gQWxzbywgZG8gdGhlIHNhbWUKZm9yIG90aGVyIHN0cnVjdHMgYXMgd2VsbC4KClRoYW5r
cywKTWFuaQoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgNyAr
KysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IGluZGV4IDA2ZWU5YTgzNmEzYi4uMTEw
ZjgzOWM5ZTUxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IEBAIC00NzUsMTEg
KzQ3NSwxMyBAQCBzdHJ1Y3QgcWNvbV9uYW5kX2hvc3Qgewo+ICAJaW50IGNzOwo+ICAJaW50IGN3
X3NpemU7Cj4gIAlpbnQgY3dfZGF0YTsKPiAtCWJvb2wgdXNlX2VjYzsKPiAtCWJvb2wgYmNoX2Vu
YWJsZWQ7Cj4gIAlpbnQgZWNjX2J5dGVzX2h3Owo+ICAJaW50IHNwYXJlX2J5dGVzOwo+ICAJaW50
IGJibV9zaXplOwo+ICsKPiArCWJvb2wgY29kZXdvcmRfZml4dXA7Cj4gKwlib29sIHVzZV9lY2M7
Cj4gKwlib29sIGJjaF9lbmFibGVkOwo+ICAJdTggc3RhdHVzOwo+ICAJaW50IGxhc3RfY29tbWFu
ZDsKPiAgCj4gQEAgLTQ5MCw3ICs0OTIsNiBAQCBzdHJ1Y3QgcWNvbV9uYW5kX2hvc3Qgewo+ICAJ
dTMyIGNscmZsYXNoc3RhdHVzOwo+ICAJdTMyIGNscnJlYWRzdGF0dXM7Cj4gIAo+IC0JYm9vbCBj
b2Rld29yZF9maXh1cDsKPiAgCWludCBucl9ib290X3BhcnRpdGlvbnM7Cj4gIAlzdHJ1Y3QgcWNv
bV9uYW5kX2Jvb3RfcGFydGl0aW9uICpib290X3BhcnRpdGlvbnM7Cj4gIH07Cj4gLS0gCj4gMi4z
Ni4xCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+Cu
teCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
