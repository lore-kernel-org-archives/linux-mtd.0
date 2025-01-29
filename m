Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6423DC0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zU+Ik8SrLjE0AP18apfjol5sFv0YtYI4DoxAOyVVK1s=; b=Q+mUKObpJCtE29
	QPvds5+k8Y0+c0XLyq6T6G/IyybRDK4yv2St4as57ZpsfjhAS1aByrhs57Fq0olOOhwGsYHv+tZW9
	a/2tYLkWxXrGXIAjvVOb1j79ExEEra5Ue2mgNHtBMewZ9guTjJsWWcaCTmpT+25Lpd1qcUaZHOtPN
	Eo9Kls7uWmxy6hkeame35zOlc1r8/p7lbCvykeXztYjf/Z2tXauZHA1UGD+e2EcAGO/WEpUMPbDsh
	gcjSGs0ROthEnBZ418jfpE+77qJDh0wZ5liW+JWhNabctA14VhQvTJOX30DPkYoycMEpvJZES6JFt
	zWB3FdYah64hBvI3GWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4uP-00000006iOs-2YCv;
	Wed, 29 Jan 2025 10:02:57 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4uM-00000006iNl-241h
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 10:02:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66BE61BF20B;
	Wed, 29 Jan 2025 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738144971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wcl0cPx8rZqpTFMCORA9hZrc9Kug1hp+prCqbj9pEgU=;
	b=QrPl/MsO/h9YF32cczxmsjuVZq58MJ+WfKoqouPOj+MI/ZxUOJBFcez4Oas31NeP8HsfzR
	nf+ahhv/KXSsl9g+3cqiwmYZzZC/b0OPOVD2bWthqPiqH5MnPJJVkuJQ73ndGmDn8K9gul
	5VWQ3ubZQFydw6vNn0BzZpPHSUz9lrY+369kTvK5D0VDBLc1EL5hKe7R13OA1yZuKeG6gI
	crXNgOiX1c8pXqF4tv5KEHNXbX0PoikB+hyg+y7Tw2vzQtC4EKRq8oDyxY9waEy35ose+2
	z3Pb+U7wqkyVF9kwl5DDbNsYG5qGqgt7qDHrYP5LImJH1OUueV+BwRknyANU/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "linux@treblig.org" <linux@treblig.org>,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob
 when DMA is not ready
In-Reply-To: <BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Wed, 29 Jan 2025 09:17:29 +0000")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	<87plkgpk8k.fsf@bootlin.com>
	<BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 29 Jan 2025 11:02:49 +0100
Message-ID: <874j1i0wfq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_020254_789305_359CFA1C 
X-CRM114-Status: GOOD (  19.38  )
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

SGVsbG8sCgo+PiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NhZGVuY2UtbmFuZC1jb250
cm9sbGVyLmMKPj4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29u
dHJvbGxlci5jCj4+ID4gQEAgLTI5MDgsNyArMjkwOCw3IEBAIHN0YXRpYyBpbnQgY2FkZW5jZV9u
YW5kX2luaXQoc3RydWN0IGNkbnNfbmFuZF9jdHJsCj4+ICpjZG5zX2N0cmwpCj4+ID4gIAkJaWYg
KCFjZG5zX2N0cmwtPmRtYWMpIHsKPj4gPiAgCQkJZGV2X2VycihjZG5zX2N0cmwtPmRldiwKPj4g
PiAgCQkJCSJVbmFibGUgdG8gZ2V0IGEgRE1BIGNoYW5uZWxcbiIpOwo+PiA+IC0JCQlyZXQgPSAt
RUJVU1k7Cj4+ID4gKwkJCXJldCA9IC1FUFJPQkVfREVGRVI7Cj4+IAo+PiBEb2VzIGl0IHdvcmsg
aWYgdGhlcmUgaXMgbm8gRE1BIGNoYW5uZWwgcHJvdmlkZWQ/IFRoZSBiaW5kaW5ncyBkbyBub3Qg
bWVudGlvbgo+PiBETUEgY2hhbm5lbHMgYXMgbWFuZGF0b3J5Lgo+PiAKPgo+IFRoZSB3YXkgQ2Fk
ZW5jZSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyIGlzIHdyaXR0ZW4gaW4gc3VjaCBhIHdheSB0aGF0
IGl0IHVzZXMgCj4gaGFzX2RtYT0xIGFzIGhhcmRjb2RlZCB2YWx1ZSwgaW5kaWNhdGluZyB0aGF0
IHNsYXZlIERNQSBpbnRlcmZhY2UgaXMgY29ubmVjdGVkCj4gdG8gRE1BIGVuZ2luZS4gSG93ZXZl
ciwgaXQgZG9lcyBub3QgdXRpbGl6ZSB0aGUgZGVkaWNhdGVkIERNQSBjaGFubmVsIGluZm9ybWF0
aW9uCj4gZnJvbSB0aGUgZGV2aWNlIHRyZWUuCgpUaGlzIGlzIG5vdCBvay4KCj4gRHJpdmVyIHdv
cmtzIHdpdGhvdXQgZXh0ZXJuYWwgRE1BIGludGVyZmFjZSBpLmUuIGhhc19kbWE9MC4gCj4gSG93
ZXZlciBjdXJyZW50IGRyaXZlciBkb2VzIG5vdCBoYXZlIGEgbWVjaGFuaXNtIHRvIGNvbmZpZ3Vy
ZSBpdCBmcm9tCj4gZGV2aWNlIHRyZWUuCgpXaGF0PyBXaHkgYXJlIHlvdSByZXF1ZXN0aW5nIGEg
RE1BIGNoYW5uZWwgZnJvbSBhIGRtYWVuZ2luZSBpbiB0aGlzIGNhc2U/CgpQbGVhc2UgbWFrZSB0
aGUgZGlzdGluY3Rpb24gYmV0d2VlbiB0aGUgT1MgaW1wbGVtZW50YXRpb24gKHRoZSBkcml2ZXIp
CmFuZCB0aGUgRFQgYmluZGluZyB3aGljaCBkZXNjcmliZSB0aGUgSFcgYW5kIG9ubHkgdGhlIEhX
LgoKPj4gQWxzbywgd291bGRuJ3QgaXQgYmUgbW9yZSBwbGVhc2FudCB0byB1c2UgYW5vdGhlciBo
ZWxwZXIgZnJvbSB0aGUgRE1BIGNvcmUKPj4gdGhhdCByZXR1cm5zIGEgcHJvcGVyIHJldHVybiBj
b2RlPyBTbyB3ZSBub3cgd2hpY2ggb25lIGFtb25nIC1FQlVTWSwgLQo+PiBFTk9ERVYgb3IgLUVQ
Uk9CRV9ERUZFUiB3ZSBnZXQ/Cj4+IAo+Cj4gQWdyZWUuCj4gSSB3aWxsIGNoYW5nZSB0byAiZG1h
X3JlcXVlc3RfY2hhbl9ieV9tYXNrIiBpbnN0ZWFkIG9mICJkbWFfcmVxdWVzdF9jaGFubmVsICIK
PiBzbyBpdCBjYW4gcmV0dXJuIGEgcHJvcGVyIGVycm9yIGNvZGUuIAo+ICAgCj4gCQljZG5zX2N0
cmwtPmRtYWMgPSBkbWFfcmVxdWVzdF9jaGFuX2J5X21hc2soJm1hc2spOwo+IAkJaWYgKElTX0VS
UihjZG5zX2N0cmwtPmRtYWMpKSB7Cj4gCQkJcmV0ID0gUFRSX0VSUihjZG5zX2N0cmwtPmRtYWMp
Owo+IAkJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKPiAJCQkJZGV2X2VycihjZG5zX2N0cmwt
PmRldiwKPiAJCQkJCSJGYWlsZWQgdG8gZ2V0IGEgRE1BIGNoYW5uZWw6JWRcbiIscmV0KTsKPiAJ
CQlnb3RvIGRpc2FibGVfaXJxOwo+IAkJfQo+Cj4gSXMgdGhpcyByZWFzb25hYmxlPwoKSXQgaXMg
YmV0dGVyLCBidXQgbWF5YmUgeW91IGNhbiB1c2UgZGV2X2Vycl9wcm9iZSgpIGluc3RlYWQgdG8g
aW5jbHVkZQp0aGUgRVBST0JFX0RFRkVSIGVycm9yIGhhbmRsaW5nLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
