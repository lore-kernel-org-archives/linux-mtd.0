Return-Path: <SRS0=dwdD=7Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49CBC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 07:14:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95825207D5
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jun 2020 07:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JOZ55I5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95825207D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDaBP4Eok7GWlDZ1zYONGZl0PnV1SI4cGobxZjoNuVg=; b=JOZ55I5niYewcq
	e0Mj8fKSb/prWYUdSCv3KhDAm9/EKEqs5xINYuKxvsDRl+tT4+45dDPo0zZhwBKT21AbtwiVGmOir
	HRl119VUszcaKgoLlV2YNlia9L0hfM3HWxGK9RW1NZmfxe/U8tWpfF6ZcKq9lNJLjta7DQHAZ142B
	dw+xJvGg5YwiV7q1twjN5mnv5+an99iu2HF7iPf0oEb+YNvcs1PCoEgMm/Ahgyct1JJXp8CKa8ivl
	c5FpB04ouKLnU8Kl7tUZ1fxJ+Q/DPnW+wWVgGvEdeLYpkf9YF6mMdjz4F2e6i4CJDYeYyWWPkLJx6
	0DcSM1fcUFDiU0OzZ2Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjHPH-00064R-MZ; Thu, 11 Jun 2020 07:13:47 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjHPE-00063p-9s
 for linux-mtd@lists.infradead.org; Thu, 11 Jun 2020 07:13:45 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 20389E0016;
 Thu, 11 Jun 2020 07:13:37 +0000 (UTC)
Date: Thu, 11 Jun 2020 09:13:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: Re: [PATCH V2 2/2] mtd: rawnand: qcom: set BAM mode only if not set
 already
Message-ID: <20200611091336.1f22ad55@xps13>
In-Reply-To: <2abac8fb-28ac-5137-70cc-47cbd20613b7@codeaurora.org>
References: <1591701056-3944-1-git-send-email-sivaprak@codeaurora.org>
 <1591701056-3944-3-git-send-email-sivaprak@codeaurora.org>
 <20200609160352.60cbad80@xps13>
 <2abac8fb-28ac-5137-70cc-47cbd20613b7@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_001344_476546_E596A3C7 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: peter.ujfalusi@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2l2YXByYWthc2gsCgpTaXZhcHJha2FzaCBNdXJ1Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJv
cmEub3JnPiB3cm90ZSBvbiBUaHUsIDExIEp1bgoyMDIwIDA5OjU3OjU5ICswNTMwOgoKPiBIaSBN
aXF1ZWwsCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+IAo+IE9uIDYvOS8yMDIwIDc6MzMg
UE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBTaXZhcHJha2FzaCwKPiA+Cj4gPiBTaXZh
cHJha2FzaCBNdXJ1Z2VzYW4gPHNpdmFwcmFrQGNvZGVhdXJvcmEub3JnPiB3cm90ZSBvbiBUdWUs
ICA5IEp1bgo+ID4gMjAyMCAxNjo0MDo1NiArMDUzMDoKPiA+ICAKPiA+PiBCQU0gbW9kZSBpcyBz
ZXQgYnkgd3JpdGluZyBCQU1fTU9ERV9FTiBiaXQgb24gTkFORF9DVFJMIHJlZ2lzdGVyLgo+ID4+
IE5BTkRfQ1RSTCBpcyBhbiBvcGVyYXRpb25hbCByZWdpc3RlciBhbmQgaW4gQkFNIG1vZGUgb3Bl
cmF0aW9uYWwKPiA+PiByZWdpc3RlcnMgYXJlIHJlYWQgb25seS4KPiA+Pgo+ID4+IFNvLCBiZWZv
cmUgd3JpdGluZyBpbnRvIE5BTkRfQ1RSTCByZWdpc3RlciBjaGVjayBpZiBCQU0gbW9kZSBpcyBh
bHJlYWR5Cj4gPj4gZW5hYmxlZCBieSBib290bG9hZGVyLCBhbmQgc2V0IEJBTSBtb2RlIG9ubHkg
aWYgaXQgaXMgbm90IHNldCBhbHJlYWR5Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogU2l2YXBy
YWthc2ggTXVydWdlc2FuIDxzaXZhcHJha0Bjb2RlYXVyb3JhLm9yZz4KPiA+PiAtLS0KPiA+PiAg
IGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyB8IDkgKysrKysrKystCj4gPj4gICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gPj4gaW5kZXggZTBhZmEyYy4uNzc0MDA1OSAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+PiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiA+PiBAQCAtMjc3OSw3ICsyNzc5
LDE0IEBAIHN0YXRpYyBpbnQgcWNvbV9uYW5kY19zZXR1cChzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRy
b2xsZXIgKm5hbmRjKQo+ID4+ICAgCS8qIGVuYWJsZSBBRE0gb3IgQkFNIERNQSAqLwo+ID4+ICAg
CWlmIChuYW5kYy0+cHJvcHMtPmlzX2JhbSkgewo+ID4+ICAgCQluYW5kX2N0cmwgPSBuYW5kY19y
ZWFkKG5hbmRjLCBOQU5EX0NUUkwpOwo+ID4+IC0JCW5hbmRjX3dyaXRlKG5hbmRjLCBOQU5EX0NU
UkwsIG5hbmRfY3RybCB8IEJBTV9NT0RFX0VOKTsKPiA+PiArCQkvKiBOQU5EX0NUUkwgaXMgYW4g
b3BlcmF0aW9uYWwgcmVnaXN0ZXJzLCBhbmQgQ1BVCj4gPj4gKwkJICogYWNjZXNzIHRvIG9wZXJh
dGlvbmFsIHJlZ2lzdGVycyBhcmUgcmVhZCBvbmx5Cj4gPj4gKwkJICogaW4gQkFNIG1vZGUuIFNv
IHVwZGF0ZSB0aGUgTkFORF9DVFJMIHJlZ2lzdGVyCj4gPj4gKwkJICogb25seSBpZiBpdCBpcyBu
b3QgaW4gQkFNIG1vZGUuIEluIG1vc3QgY2FzZXMgQkFNCj4gPj4gKwkJICogbW9kZSB3aWxsIGJl
IGVuYWJsZWQgaW4gYm9vdGxvYWRlcgo+ID4+ICsJCSAqLwo+ID4+ICsJCWlmICghKG5hbmRfY3Ry
bCB8IEJBTV9NT0RFX0VOKSkKPiA+PiArCQkJbmFuZGNfd3JpdGUobmFuZGMsIE5BTkRfQ1RSTCwg
bmFuZF9jdHJsIHwgQkFNX01PREVfRU4pOwo+ID4+ICAgCX0gZWxzZSB7Cj4gPj4gICAJCW5hbmRj
X3dyaXRlKG5hbmRjLCBOQU5EX0ZMQVNIX0NISVBfU0VMRUNULCBETV9FTik7Cj4gPj4gICAJfSAg
Cj4gPiBEb2VzIHRoaXMgY3VycmVudGx5IHByb2R1Y2VzIGFuIGlzc3VlIGF0IHJ1bnRpbWU/Cj4g
Pgo+ID4gSWYgeWVzLCB5b3Ugc2hvdWxkIGhhdmUgYSBGaXhlcy9DQzogc3RhYmxlIHBhaXIgb2Yg
dGFncy4KPiA+Cj4gPiBBbHNvLCB3aGF0IGlzIEJBTSBtb2RlPyBQbGVhc2UgdGVsbCB1cyBpbiB0
aGUgY29tbWl0IGxvZy4gIAo+IAo+IEN1cnJlbnRseSB0aGlzIGlzIG5vdCBjYXVzaW5nIGFueSBp
c3N1ZSBvbiBydW4gdGltZS4KPiAKPiBUaGUgd3JpdGVzIHRvIHRoaXMgcmVnaXN0ZXIgaXMgc2ls
ZW50bHkgaWdub3JlZC4KPiAKPiBIb3dldmVyLCB0aGlzIGNvdWxkIGJlIGFuIGlzc3VlIGluIGZ1
dHVyZSBIYXJkd2FyZSBkZXNpZ25zLgo+IAo+IEJBTSBpcyB0aGUgRE1BIGVuZ2luZSBvbiBRQ09N
IElQUSBwbGF0Zm9ybXMsIHN1cmUgd2lsbCBleHBsYWluIHRoaXMKPiAKPiBtb2RlIGluIG5leHQg
cGF0Y2hzZXQuCgpJIGRvbid0IGxpa2Ugc28gbXVjaCB0aGUgaWRlYSBvZiBETUEgYmVpbmcgZW5h
YmxlZCBieSB0aGUgQm9vdGxvYWRlciBvcgpub3QsIHRoaXMgaXMgc29tZXRoaW5nIHRoYXQgc2hv
dWxkIG5lZWQgdG8gYmUgZml4ZWQuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
