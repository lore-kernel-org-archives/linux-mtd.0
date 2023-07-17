Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A13EB64DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 06:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRnFXyQTvpsWc6zR6VFYgTogfyXS9uGPE9a2Wge8wGw=; b=wG20DBIMHxiy3f
	fRNp9ANv9j/SP0/mHkuUQumpzerQOoCDHmv5NpsYGixOYXYvTnvBTE29QwSmmJpGW8ddnP+SdkQzI
	7EVzruH7/j3VAImnAEbcAkJYkXTQCPXxY8t2psI9Ry/vabyjbQs/hZzCFJjVos1vDmBCYUSjkaoat
	Fpr/Sks45ypI3N8SUtumN7KlMN3hsY/2tUs6cS5AAX4ipQQlHsuvxEcS2tqI0LLODPbDPdminVlVB
	We3SYqbWkZU+JkSbgIi5Vs5ETKS0kpwcjfWNeBJEDZrAyZb0IhDs+g5RykSvLtx3DWx+CkVa131RG
	op+YojdWydA2CrxXiCiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHst-003DlW-3B;
	Mon, 17 Jul 2023 06:39:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLHsp-003DkM-0R;
	Mon, 17 Jul 2023 06:39:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4287F60C68;
	Mon, 17 Jul 2023 06:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64C9C433C7;
	Mon, 17 Jul 2023 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689575937;
	bh=NEJNCaFWP/KhRZFf4qp4fe0DMtP2EiePkfLClMN2fxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bc3auWd8e70/3tvANwpZmOEu+QvF1/9vnF5wIKirY6BiBF5PAHrB9tfSgNm17XAId
	 wrXVB9G4JvCrveF9paGlOBIpO6NKOSeky9veayMSnxeRNwl1znJNEDcLZMIN/hJmvI
	 v0Y5jC9C+3NOcCpiSEe28ptmtAmj1jxAaa0dzWprLYENciVFnN5lvnGeG5lQmSZxHD
	 fJyHopKTptExp7FWfssrUd3gwzJXJHWnaCNfRIQ1JNYBQtrzOp2P62AihEBT6rwfEo
	 YOzuBVz1hQm/j+lM3etRPpDzr8mw+kf773bZuU5Mr2CP/0WVRdlXmDFMvMEJy7n1IJ
	 vTgeGTqzfbqlg==
Date: Mon, 17 Jul 2023 12:08:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within
 ->exec_op()
Message-ID: <20230717063843.GA7062@thinkpad>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230716144612.32132-9-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_233859_287316_13B6A2B7 
X-CRM114-Status: GOOD (  19.95  )
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

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMDQ6NDY6MTJQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBUaGUgbmFkZHJzIHZhcmlhYmxlIGlzIGluaXRpYWxpemVkIGJ1dCBub3QgdXNlZC4g
Rml4aW5nIHRoaXMgY291bGQgaGF2ZQo+IGJlZW4gYSBtYXR0ZXIgb2YgZHJvcHBpbmcgdGhlIHZh
cmlhYmxlLCBidXQgdGhlIHJpZ2h0IHdheSB0byBkbyBpdCBsb29rcwo+IGEgYml0IG1vcmUgY29t
cGxleDogd2UgY2FuIGF2b2lkIHVzZWxlc3Mgd3JpdGVzIHRvIHRoZSBxX29wIHN0cnVjdHVyZSBi
eQo+IHVzaW5nIGl0LiBJbiBwcmFjdGljZSB3ZSBjb3VsZCBldmVuIGhhdmUgcG9zc2libGUgb3V0
LW9mLWJvdW5kIGJ1Z3Mgd2l0aAo+IHRoZSBleGlzdGluZyBpbXBsZW1lbnRhdGlvbi4gTGV0J3Mg
Zml4IGFsbCB0aGF0IGJ5IGp1c3QgcGVyZm9ybWluZyB0aGUKPiByaWdodCBudW1iZXIgb2YgYXNz
aWdubWVudHMgaW4gdGhlIGFkZHJ7MSwyfV9yZWcgZmllbGRzLgo+IAo+IEZpeGVzOiA4OTU1MGJl
YjA5OGUgKCJtdGQ6IHJhd25hbmQ6IHFjb206IEltcGxlbWVudCBleGVjX29wKCkiKQo+IFJlcG9y
dGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBDbG9zZXM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA3MTMxOTU5LlBkUFNDODZLLWxr
cEBpbnRlbC5jb20vCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQt
YWxsLzIwMjMwNzEzMTczMC5OT1liY2pCci1sa3BAaW50ZWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpMR1RNISBCdXQgSSdt
IHJlbHlpbmcgb24gU2FkcmUgdG8gdGVzdCBpdC4KCkFja2VkLWJ5OiBNYW5pdmFubmFuIFNhZGhh
c2l2YW0gPG1hbmlAa2VybmVsLm9yZz4KCi0gTWFuaQoKPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvcWNvbV9uYW5kYy5jIHwgMTMgKysrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmMKPiBpbmRleCA0ZmM4ZGFmYThmMDMuLmRjOGNhNjBmYzJlMiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMjYxNiwxMiArMjYxNiwxMyBAQCBzdGF0aWMgdm9pZCBx
Y29tX3BhcnNlX2luc3RydWN0aW9ucyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAo+ICAJCQlvZmZz
ZXQgPSBuYW5kX3N1Ym9wX2dldF9hZGRyX3N0YXJ0X29mZihzdWJvcCwgb3BfaWQpOwo+ICAJCQlu
YWRkcnMgPSBuYW5kX3N1Ym9wX2dldF9udW1fYWRkcl9jeWMoc3Vib3AsIG9wX2lkKTsKPiAgCQkJ
YWRkcnMgPSAmaW5zdHItPmN0eC5hZGRyLmFkZHJzW29mZnNldF07Cj4gLQkJCWZvciAoaSA9IDA7
IGkgPCBNQVhfQUREUkVTU19DWUNMRTsgaSsrKSB7Cj4gLQkJCQlpZiAoaSA8IDQpCj4gLQkJCQkJ
cV9vcC0+YWRkcjFfcmVnIHw9ICh1MzIpYWRkcnNbaV0gPDwgaSAqIDg7Cj4gLQkJCQllbHNlCj4g
LQkJCQkJcV9vcC0+YWRkcjJfcmVnIHw9IGFkZHJzW2ldOwo+IC0JCQl9Cj4gKwo+ICsJCQlmb3Ig
KGkgPSAwOyBpIDwgbWluX3QodW5zaWduZWQgaW50LCA0LCBuYWRkcnMpOyBpKyspCj4gKwkJCQlx
X29wLT5hZGRyMV9yZWcgfD0gYWRkcnNbaV0gPDwgKGkgKiA4KTsKPiArCj4gKwkJCWlmIChuYWRk
cnMgPiA0KQo+ICsJCQkJcV9vcC0+YWRkcjJfcmVnIHw9IGFkZHJzWzRdOwo+ICsKPiAgCQkJcV9v
cC0+cmR5X2RlbGF5X25zID0gaW5zdHItPmRlbGF5X25zOwo+ICAJCQlicmVhazsKPiAgCj4gLS0g
Cj4gMi4zNC4xCj4gCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCu
muCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
