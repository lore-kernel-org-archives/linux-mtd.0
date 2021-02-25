Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF3BBC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 07:47:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785C564E20
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 07:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 785C564E20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bBNJ0hufK2uSMhZ0pW/tjmoOLq1zAQS2PDBXzZ62rR8=; b=RwLr8LaCxY7H+Bj8kmO6JylB3
	f028t+twNSDQ4zMEu0ExCIwi030io6rrK+I9gxgbU3FchSUEXXjY/DXdxM5AyTnvz5C+a5fJszeR+
	+cN+YIuHCPR26wuIH60CVWb/MSoSzFbabD93Izi2iIhoN2+fTqejD7z381djpRBf5H36H5HHAJyM4
	PJf2yG1uPqLKhig18eiqbc9aO9zlBJzrXgJmSNisnlsjOyf8KtGrzPSbdlAVgf3MvgDwLZi28pVIz
	FCFB2lZOrUXp1welwzy9i6884ka1kha9vpblU7qvuwdPFy4rDBA9u6RsAf64BB6xOaGilGn6TZ028
	e+6omXFBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFBMc-00052f-TI; Thu, 25 Feb 2021 07:47:10 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFBMa-00051y-E2
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 07:47:09 +0000
X-Originating-IP: 86.250.253.134
Received: from xps13 (lfbn-tou-1-813-134.w86-250.abo.wanadoo.fr
 [86.250.253.134]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CF320E0005;
 Thu, 25 Feb 2021 07:47:03 +0000 (UTC)
Date: Thu, 25 Feb 2021 08:47:02 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: qcom: Add support for secure
 regions in NAND memory
Message-ID: <20210225084702.2c753b99@xps13>
In-Reply-To: <20210225041129.58576-4-manivannan.sadhasivam@linaro.org>
References: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
 <20210225041129.58576-4-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_024708_573765_83F3586B 
X-CRM114-Status: GOOD (  18.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Daniele.Palmas@telit.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFuaXZhbm5hbiwKCk1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+IHdyb3RlIG9uIFRodSwKMjUgRmViIDIwMjEgMDk6NDE6MjkgKzA1MzA6
Cgo+IE9uIGEgdHlwaWNhbCBlbmQgcHJvZHVjdCwgYSB2ZW5kb3IgbWF5IGNob29zZSB0byBzZWN1
cmUgc29tZSByZWdpb25zIGluCj4gdGhlIE5BTkQgbWVtb3J5IHdoaWNoIGFyZSBzdXBwb3NlZCB0
byBzdGF5IGludGFjdCBiZXR3ZWVuIEZXIHVwZ3JhZGVzLgo+IFRoZSBhY2Nlc3MgdG8gdGhvc2Ug
cmVnaW9ucyB3aWxsIGJlIGJsb2NrZWQgYnkgYSBzZWN1cmUgZWxlbWVudCBsaWtlCj4gVHJ1c3R6
b25lLiBTbyB0aGUgbm9ybWFsIHdvcmxkIHNvZnR3YXJlIGxpa2UgTGludXgga2VybmVsIHNob3Vs
ZCBub3QKPiB0b3VjaCB0aGVzZSByZWdpb25zIChpbmNsdWRpbmcgcmVhZGluZykuCj4gCj4gVGhl
IHJlZ2lvbnMgYXJlIGRlY2xhcmVkIHVzaW5nIGEgTkFORCBjaGlwIERUIHByb3BlcnR5LAo+ICJu
YW5kLXNlY3VyZS1yZWdpb25zIi4gU28gbGV0J3MgbWFrZSB1c2Ugb2YgdGhpcyBwcm9wZXJ0eSBh
bmQgc2tpcAo+IGFjY2VzcyB0byB0aGUgc2VjdXJlIHJlZ2lvbnMgcHJlc2VudCBpbiBhIHN5c3Rl
bS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4u
c2FkaGFzaXZhbUBsaW5hcm8ub3JnPgo+IC0tLQoKWy4uLl0KCj4gIAljb25maWdfbmFuZF9wYWdl
X3dyaXRlKG5hbmRjKTsKPiBAQCAtMjgzMCw3ICsyODY1LDggQEAgc3RhdGljIGludCBxY29tX25h
bmRfaG9zdF9pbml0X2FuZF9yZWdpc3RlcihzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKm5h
bmRjLAo+ICAJc3RydWN0IG5hbmRfY2hpcCAqY2hpcCA9ICZob3N0LT5jaGlwOwo+ICAJc3RydWN0
IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiAgCXN0cnVjdCBkZXZpY2UgKmRl
diA9IG5hbmRjLT5kZXY7Cj4gLQlpbnQgcmV0Owo+ICsJc3RydWN0IHByb3BlcnR5ICpwcm9wOwo+
ICsJaW50IHJldCwgbGVuZ3RoLCBucl9lbGVtOwo+ICAKPiAgCXJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKGRuLCAicmVnIiwgJmhvc3QtPmNzKTsKPiAgCWlmIChyZXQpIHsKPiBAQCAtMjg4Niw2
ICsyOTIyLDI0IEBAIHN0YXRpYyBpbnQgcWNvbV9uYW5kX2hvc3RfaW5pdF9hbmRfcmVnaXN0ZXIo
c3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpuYW5kYywKPiAgCQl9Cj4gIAl9Cj4gIAo+ICsJ
LyoKPiArCSAqIExvb2sgZm9yIHNlY3VyZSByZWdpb25zIGluIHRoZSBOQU5EIGNoaXAuIFRoZXNl
IHJlZ2lvbnMgYXJlIHN1cHBvc2VkCj4gKwkgKiB0byBiZSBwcm90ZWN0ZWQgYnkgYSBzZWN1cmUg
ZWxlbWVudCBsaWtlIFRydXN0em9uZS4gU28gdGhlIHJlYWQvd3JpdGUKPiArCSAqIGFjY2Vzc2Vz
IHRvIHRoZXNlIHJlZ2lvbnMgd2lsbCBiZSBibG9ja2VkIGluIHRoZSBydW50aW1lIGJ5IHRoaXMK
PiArCSAqIGRyaXZlci4KPiArCSAqLwo+ICsJcHJvcCA9IG9mX2ZpbmRfcHJvcGVydHkoZG4sICJu
YW5kLXNlY3VyZS1yZWdpb25zIiwgJmxlbmd0aCk7CgpJJ20gbm90IHN1cmUgdGhlIG5hbmQtIHBy
ZWZpeCBvbiB0aGlzIHByb3BlcnR5IGlzIG5lZWRlZCBoZXJlLCBidXQKd2hhdGV2ZXIuCgo+ICsJ
aWYgKHByb3ApIHsKPiArCQlucl9lbGVtID0gbGVuZ3RoIC8gc2l6ZW9mKHUzMik7Cj4gKwkJaG9z
dC0+bnJfc2VjX3JlZ2lvbnMgPSBucl9lbGVtIC8gMjsKPiArCj4gKwkJaG9zdC0+c2VjX3JlZ2lv
bnMgPSBkZXZtX2tjYWxsb2MoZGV2LCBucl9lbGVtLCBzaXplb2YodTMyKSwgR0ZQX0tFUk5FTCk7
Cj4gKwkJaWYgKCFob3N0LT5zZWNfcmVnaW9ucykKPiArCQkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+
ICsJCW9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KGRuLCAibmFuZC1zZWN1cmUtcmVnaW9ucyIs
IGhvc3QtPnNlY19yZWdpb25zLCBucl9lbGVtKTsKPiArCX0KPiArCgpJIHdvdWxkIG1vdmUgdGhp
cyBiZWZvcmUgbmFuZF9zY2FuKCkuCgpJZiB5b3UgZG9uJ3QsIHlvdSBzaG91bGQgYmFpbCBvdXQg
d2l0aCBhIG5hbmRfY2xlYW51cCgpIHVwb24gZXJyb3IuCgo+ICAJcmV0ID0gbXRkX2RldmljZV9w
YXJzZV9yZWdpc3RlcihtdGQsIHByb2JlcywgTlVMTCwgTlVMTCwgMCk7Cj4gIAlpZiAocmV0KQo+
ICAJCW5hbmRfY2xlYW51cChjaGlwKTsKCgpPdGhlcndpc2UgbGd0bS4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
