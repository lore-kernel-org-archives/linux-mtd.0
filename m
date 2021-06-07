Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4959DC47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 10:33:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16F53611AD
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 10:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16F53611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuVRXtEBR9jOiCH3B+pdQHXoiQuWz0YXZRyrA9OTRM4=; b=NCokkqmOlQWj1L2ichkX4v13OW
	SwywmAO33nZY3uuppmYrTYOxL1PhC1HR0HpVhH8AwJEtbc6koVt1gzE/dYa7La28KMlLJcVXpL6bF
	DJKmR3zfXRxGUVQtFw0zAACSWu1GyT+aScnb3TzwWInCkFnreG2gscTsdmY+cYrpgbkT4tH19/KNV
	H06S60vIct1ewmlD6h4xXxjAeWSXFOuyPvdwkU6+Yx/8Ubs86eR/+DQvNuKd4o9eE7/Bbyu3GRJLX
	lMmvAbqJ95wXoHo+HLM6+qam1cHa3vpOaQivCnvzhaWOMPexi/y2vtR7JoYttn+UD/gTSEvc43hyV
	Tq9y0wjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqCYf-002wg5-LR; Mon, 07 Jun 2021 10:32:37 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqBzr-002kR8-OX
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 09:56:43 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 05FDD22236;
 Mon,  7 Jun 2021 11:56:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623059794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xzgfBFbxeSlqZGJke4ZiAA5mBlvIZlSrB4UTCFtSoc=;
 b=BnhmTxn6qCgDq4G8u00G3Easz6kAbZFEvYdraCXnCfNzQMdAGe07Gog7bf5SDLmpEiwiS2
 dTmI76m5GlF7aGgGF46TLT+49ocDklV0cjgiWLwoLzG5Sgzed5qGLtnZMvjbv74gtqS8NE
 M9miSofRUt/wNstya70WN6tqBp/yWIw=
MIME-Version: 1.0
Date: Mon, 07 Jun 2021 11:56:33 +0200
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at
Subject: Re: [PATCH v5 3/5] mtd: spi-nor: otp: return -EROFS if region is
 read-only
In-Reply-To: <3e46bc75-6ace-f7c0-1b14-aae812554ac9@ti.com>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-4-michael@walle.cc>
 <c2b58dcc-5a60-792c-30ac-a3db327a85ed@microchip.com>
 <e117bc50b9f9e10549c25602b66cfe26@walle.cc>
 <1549db61-500a-e5df-9303-823b41457861@ti.com>
 <4ba7994b0cc8d436012a776ca14addca@walle.cc>
 <3e46bc75-6ace-f7c0-1b14-aae812554ac9@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2559d150b3a0d964ece0c9e29e155ecc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_025640_005890_EA6E5C9E 
X-CRM114-Status: GOOD (  19.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wNi0wNyAwODo0Nywgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+IE9uIDYv
Ny8yMSAxMTozOCBBTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4gQW0gMjAyMS0wNi0wNyAwNzo0
Niwgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+Pj4gT24gNi80LzIxIDY6NDUgUE0sIE1p
Y2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4gQW0gMjAyMS0wNi0wNCAxNTowNywgc2NocmllYiBUdWRv
ci5BbWJhcnVzQG1pY3JvY2hpcC5jb206Cj4+Pj4+IE9uIDYvNC8yMSAxOjAyIFBNLCBNaWNoYWVs
IFdhbGxlIHdyb3RlOgo+Pj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UKPj4+Pj4+IGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZQo+Pj4+Pj4gCj4+Pj4+PiBTUEkgTk9SIGZsYXNoZXMgd2lsbCBqdXN0IGlnbm9yZSBwcm9n
cmFtIGNvbW1hbmRzIGlmIHRoZSBPVFAgCj4+Pj4+PiByZWdpb24gaXMKPj4+Pj4+IGxvY2tlZC4g
VGh1cywgYSB1c2VyIG1pZ2h0IG5vdCBub3RpY2UgdGhhdCB0aGUgaW50ZW5kZWQgd3JpdGUKPj4+
Pj4+IGRpZG4ndCBlbmQKPj4+Pj4+IHVwIGluIHRoZSBmbGFzaC4gUmV0dXJuIC1FUk9GUyB0byB0
aGUgdXNlciBpbiB0aGlzIGNhc2UuIEZyb20gd2hhdAo+Pj4+Pj4gSSBjYW4KPj4+Pj4+IHRlbGws
IGNoaXBzL2NmaV9jbWRzZXRfMDAwMS5jIGFsc28gcmV0dXJuIHRoaXMgZXJyb3IgY29kZS4KPj4+
Pj4+IAo+Pj4+Pj4gT25lIGNvdWxkIG9wdGltaXplIHNwaV9ub3JfbXRkX290cF9yYW5nZV9pc19s
b2NrZWQoKSB0byByZWFkIHRoZQo+Pj4+Pj4gc3RhdHVzCj4+Pj4+PiByZWdpc3RlciBvbmx5IG9u
Y2UgYW5kIG5vdCBmb3IgZXZlcnkgT1RQIHJlZ2lvbiwgYnV0IGZvciB0aGF0IHdlIAo+Pj4+Pj4g
d291bGQKPj4+Pj4+IG5lZWQgc29tZSBtb3JlIGludmFzaXZlIGNoYW5nZXMuIEdpdmVuIHRoYXQg
dGhpcyBpcwo+Pj4+Pj4gb25lLXRpbWUtcHJvZ3JhbW1hYmxlIG1lbW9yeSBhbmQgdGhlIG5vcm1h
bCBhY2Nlc3MgbW9kZSBpcyAKPj4+Pj4+IHJlYWRpbmcsIHdlCj4+Pj4+PiBqdXN0IGxpdmUgd2l0
aCB0aGUgc21hbGwgb3ZlcmhlYWQuCj4+Pj4+PiAKPj4+Pj4+IEZpeGVzOiAwNjkwODlhY2Y4OGIg
KCJtdGQ6IHNwaS1ub3I6IGFkZCBPVFAgc3VwcG9ydCIpCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBN
aWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPgo+Pj4+Pj4gUmV2aWV3ZWQtYnk6IFByYXR5
dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqBkcml2ZXJzL210
ZC9zcGktbm9yL290cC5jIHwgMzYgCj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4+Pj4+IMKgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKPj4+Pj4+
IAo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL290cC5jCj4+Pj4+PiBpbmRleCAzODk4ZWQ2N2JhMWMuLjA2M2Y4ZmI2ODY0
OSAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMKPj4+Pj4+ICsr
KyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMKPj4+Pj4+IEBAIC0yNDksNiArMjQ5LDMyIEBA
IHN0YXRpYyBpbnQgc3BpX25vcl9tdGRfb3RwX2luZm8oc3RydWN0IAo+Pj4+Pj4gbXRkX2luZm8K
Pj4+Pj4+ICptdGQsIHNpemVfdCBsZW4sCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Owo+Pj4+Pj4gwqB9Cj4+Pj4+PiAKPj4+Pj4+ICtzdGF0aWMgaW50IHNwaV9ub3JfbXRkX290cF9y
YW5nZV9pc19sb2NrZWQoc3RydWN0IHNwaV9ub3IgKm5vciwKPj4+Pj4+IGxvZmZfdCBvZnMsCj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgbGVuKQo+Pj4+Pj4gK3sKPj4+
Pj4+ICvCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHNwaV9ub3Jfb3RwX29wcyAqb3BzID0gbm9y
LT5wYXJhbXMtPm90cC5vcHM7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCByZWdp
b247Cj4+Pj4+PiArwqDCoMKgwqDCoMKgIGludCBsb2NrZWQ7Cj4+Pj4+PiArCj4+Pj4+PiArwqDC
oMKgwqDCoMKgIGlmICghbGVuKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIDA7Cj4+Pj4+PiArCj4+Pj4+IAo+Pj4+PiBZb3Ugd29uJ3QgbmVlZCB0aGlzIGlmIHlv
dSBwdXQgcGF0Y2ggNC81IGJlZm9yZSB0aGlzIG9uZS4gV2l0aCAKPj4+Pj4gdGhpczoKPj4+PiAK
Pj4+PiBUaGlzIHBhdGNoIHdpbGwgZ2V0IGJhY2twb3J0ZWQgdG8gdGhlIHN0YWJsZSBrZXJuZWxz
LiBQYXRjaCA0IG9uIHRoZQo+Pj4+IG90aGVyIGhhbmQgZG9lcyBub3QuCj4+Pj4gCj4+PiAKPj4+
IEkgZG9uJ3Qgc2VlIHdoeSA0LzUgY2Fubm90IGJlIG1hcmtlZCBmb3IgYmFja3BvcnQgdG9vIGFz
IGl0IG1ha2VzIDMvNQo+Pj4gbXVjaCBjbGVhbmVyPwo+PiAKPj4gV2hhdCBraW5kIG9mIHByb2Js
ZW0gZG9lcyA0LzUgZml4PyBJIGNhbid0IHNlZSBob3cgdGhhdCBwYXRjaCB3b3VsZAo+PiBhcHBs
eSB0byBhbnkgcnVsZSBpbiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3RhYmxlLWtlcm5lbC1ydWxl
cy5yc3QuCj4+IAo+IAo+IExvb2tpbmcgZnVydGhlciwgSSBkb24ndCBzZWUgdGhlIG5lZWQgZm9y
IDQvNSB0byBiZSBhIHNlcGFyYXRlIHBhdGNoLgo+IFBhdGNoIDQvNSBpcyBzaW1wbGlmeWluZyBz
cGlfbm9yX210ZF9vdHBfcmFuZ2VfaXNfbG9ja2VkKCkgYnkgZW5zdXJpbmcKPiAnbGVuJyBwYXNz
ZWQgaXMgbmV2ZXIgMCB3aGljaCBjYW4gYmUgZG9uZSBpbiAzLzUgd2hlbiBpbnRyb2R1Y2luZwo+
IHNwaV9ub3JfbXRkX290cF9yYW5nZV9pc19sb2NrZWQoKS4KPiAKPiBTbyB3aHkgbm90IHNxdWFz
aGVkIGl0IGludG8gMy81LgoKQmVjYXVzZSwgc3RyaWN0bHkgc3BlYWtpbmcsIGl0IGlzIG5vdCBw
YXJ0IG9mIHRoYXQgcGFydGljdWxhciBmaXgKYW5kIElNSE8gdmlvbGF0ZXMgIkl0IG11c3QgZml4
IG9ubHkgb25lIHRoaW5nIi4gQnV0IGlmIHlvdSdyZSBmaW5lCndpdGggdGhhdCwgSSBjYW4gc3F1
YXNoIHRoZSB0d28uCgpUQkggSSBmaW5kIGl0IGtpbmRhIGZ1bm55IHRvIGJlbmQgdGhlIHJ1bGVz
LCBqdXN0IHRvIGdldCByaWQgb2YKdGhlc2UgdGhyZWUgbGluZXMgb2YgY29kZSBvciB0aGUgdWds
aW5lc3MgdGhhdCB0aGV5IHdpbGwgYmUgcmVtb3ZlZAppbiB0aGUgZm9sbG93aW5nIHBhdGNoLgoK
LW1pY2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
