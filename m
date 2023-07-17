Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E99EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 02:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGcCTx9FWYpSYNuLE2X9diSCTuIqtLNr0uQrxFLcPtM=; b=Bw9XRRkxlzuOUu
	/B5SWoVkPi6qPl47+fMkxkLmukwakm5jzQ67pEZQdyisUGfInhPaHzwlMTe4bN+uruzfMJNPnA7nX
	Jh0lBwfqudMG/HtdyliJHmEHiQKGhCFxcmmsTj5YOZG20HCjQvMXQb+xbB9ucyigSIim6/NPRc2EQ
	LfQtkh5FT64+wXLPUDt7LEkssseTqJg7pSIFHp4BZxydml/fLIHWcVEWF03S46JgF/LKlEBaFTeGj
	IexyTn6JmyQeizfqOVROOw79u8ZGaA/SAh9Sskk2lwzIrJGkWLALp8wOgYsThaG30QPgV/zEW71rg
	5QCgk2bpnBj959cEqjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDw8-000oGG-07;
	Mon, 17 Jul 2023 02:26:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLDw3-000oCc-1e;
	Mon, 17 Jul 2023 02:26:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5360260EF4;
	Mon, 17 Jul 2023 02:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F40C433C7;
	Mon, 17 Jul 2023 02:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689560761;
	bh=2DEPTy4yveGkADZ+WKeF/BCSw45Wm0fmWbpTb5OdITM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N8svR2L6GmzcYIthLjN5kZdDNn73y4oovi96ImdynHBkTqPOrHu/iBZCroaRpazr/
	 TGSRgCJdTR/AWNgqy1sc60FQRM3BoEyeowARB5HB7kLKhtgfZQpMhk++5BeFFv/qny
	 qZ0y0FQT77sXxcrOGlNIrF8XJScHP4z5MC6iC3noa4k65nAQQTqJtwYIKitfJAmZl1
	 26z7pdIvyVQ5Ql1u0/XPyYxv6/UYC/1CMr2KWmfkJinFRvTlzSIs6R2HqdTL0Q2RA6
	 tWgrSgtW5DuOa6L8p0wem/qubApktFNs6oAxljsSFkcCcNfXjMvZnpERmBN9Evh/Rg
	 wKYAS+9NXAEtg==
Date: Mon, 17 Jul 2023 07:55:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: Use the BIT() macro
Message-ID: <20230717022548.GA5996@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716144612.32132-2-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_192603_649641_42957CAA 
X-CRM114-Status: GOOD (  14.00  )
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MDVQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBGaXggdGhlIGZvbGxvd2luZyBjaGVja3BhdGNoIHdhcm5pbmc6Cj4gICAgICJDSEVD
SzogUHJlZmVyIHVzaW5nIHRoZSBCSVQgbWFjcm8iCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KCkFja2VkLWJ5OiBNYW5pdmFubmFu
IFNhZGhhc2l2YW0gPG1hbmlAa2VybmVsLm9yZz4KCi0gTWFuaQoKPiAtLS0KPiAgZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMu
Ywo+IGluZGV4IGIxZTY5ZDYzNGQ0YS4uMDIzYzhiMzY0MjZiIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3Fjb21fbmFuZGMuYwo+IEBAIC0xMjMsOCArMTIzLDggQEAKPiAgLyogTkFORF9FUkFTRURfQ1df
REVURUNUX0NGRyBiaXRzICovCj4gICNkZWZpbmUJRVJBU0VEX0NXX0VDQ19NQVNLCQkxCj4gICNk
ZWZpbmUJQVVUT19ERVRFQ1RfUkVTCQkJMAo+IC0jZGVmaW5lCU1BU0tfRUNDCQkJKDEgPDwgRVJB
U0VEX0NXX0VDQ19NQVNLKQo+IC0jZGVmaW5lCVJFU0VUX0VSQVNFRF9ERVQJCSgxIDw8IEFVVE9f
REVURUNUX1JFUykKPiArI2RlZmluZQlNQVNLX0VDQwkJCUJJVChFUkFTRURfQ1dfRUNDX01BU0sp
Cj4gKyNkZWZpbmUJUkVTRVRfRVJBU0VEX0RFVAkJQklUKEFVVE9fREVURUNUX1JFUykKPiAgI2Rl
ZmluZQlBQ1RJVkVfRVJBU0VEX0RFVAkJKDAgPDwgQVVUT19ERVRFQ1RfUkVTKQo+ICAjZGVmaW5l
CUNMUl9FUkFTRURfUEFHRV9ERVQJCShSRVNFVF9FUkFTRURfREVUIHwgTUFTS19FQ0MpCj4gICNk
ZWZpbmUJU0VUX0VSQVNFRF9QQUdFX0RFVAkJKEFDVElWRV9FUkFTRURfREVUIHwgTUFTS19FQ0Mp
Cj4gLS0gCj4gMi4zNC4xCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCu
pOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
