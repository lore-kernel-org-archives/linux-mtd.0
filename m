Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE141C47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 06:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C29161164
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 06:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C29161164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IV42D/DjR0SjQ3K+JrN/ztYAak6Bp1Bp3jQpIvIeXAE=; b=zmrWCFSnOFR65EldbYvwcfnABE
	MWmFQhK1I9vslyKq70NRfBzxglmDdUYlay0SocCFWpe4Vb4XX/y6tqmP3O9UmPbHiO/qMDLfrj9BQ
	WOKcHidtTm9lrstxEPTDB7fGj7jfxkSEpQs+Of68T+YmSo432BOGox1g8jF55Tz0frSWNbMwPG1Ri
	ExoFrz9yDjY+789SH6jV6CE6MjuGemOxeB9ajQJ7wwpR9F3aqsoXJuygUDCHcMwlUuHoLV96OCW7B
	FcnObYifXMZN67fv/t+NNQybqPXMYJWxBTFC2XuwJ4QtagxCf32IsZ+EhKM3eqV7v1OpmrwAfA+wK
	1gJfbvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq8Ri-001e5i-6m; Mon, 07 Jun 2021 06:09:10 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq8Rc-001e3V-UI
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 06:09:09 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A95F322172;
 Mon,  7 Jun 2021 08:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623046137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DzuWySf29iNNVaJeQVLK8ftx+fbfOMCdpAMGH60BRJY=;
 b=v6fteIE6JrovjRlc372f+PAaq6l6ffqlKryJOv8kigSsoen+hGv8D62fCjULu0BUFz/CBM
 zv1ldaTEA+1QE00H0phE3V3sImfoWsN0ndZyvm0AEH19ZBkw/sBmIYtCTWY6YHh+UMbHP7
 Bevb4FQD7vDAC4gOzpd9IjqdVylQb8M=
MIME-Version: 1.0
Date: Mon, 07 Jun 2021 08:08:56 +0200
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at
Subject: Re: [PATCH v5 3/5] mtd: spi-nor: otp: return -EROFS if region is
 read-only
In-Reply-To: <1549db61-500a-e5df-9303-823b41457861@ti.com>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-4-michael@walle.cc>
 <c2b58dcc-5a60-792c-30ac-a3db327a85ed@microchip.com>
 <e117bc50b9f9e10549c25602b66cfe26@walle.cc>
 <1549db61-500a-e5df-9303-823b41457861@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4ba7994b0cc8d436012a776ca14addca@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_230905_156395_A18D613A 
X-CRM114-Status: GOOD (  16.82  )
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

QW0gMjAyMS0wNi0wNyAwNzo0Niwgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+IE9uIDYv
NC8yMSA2OjQ1IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBBbSAyMDIxLTA2LTA0IDE1OjA3
LCBzY2hyaWViIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToKPj4+IE9uIDYvNC8yMSAxOjAy
IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91Cj4+Pj4ga25vdyB0aGUgY29u
dGVudCBpcyBzYWZlCj4+Pj4gCj4+Pj4gU1BJIE5PUiBmbGFzaGVzIHdpbGwganVzdCBpZ25vcmUg
cHJvZ3JhbSBjb21tYW5kcyBpZiB0aGUgT1RQIHJlZ2lvbiAKPj4+PiBpcwo+Pj4+IGxvY2tlZC4g
VGh1cywgYSB1c2VyIG1pZ2h0IG5vdCBub3RpY2UgdGhhdCB0aGUgaW50ZW5kZWQgd3JpdGUgZGlk
bid0IAo+Pj4+IGVuZAo+Pj4+IHVwIGluIHRoZSBmbGFzaC4gUmV0dXJuIC1FUk9GUyB0byB0aGUg
dXNlciBpbiB0aGlzIGNhc2UuIEZyb20gd2hhdCBJIAo+Pj4+IGNhbgo+Pj4+IHRlbGwsIGNoaXBz
L2NmaV9jbWRzZXRfMDAwMS5jIGFsc28gcmV0dXJuIHRoaXMgZXJyb3IgY29kZS4KPj4+PiAKPj4+
PiBPbmUgY291bGQgb3B0aW1pemUgc3BpX25vcl9tdGRfb3RwX3JhbmdlX2lzX2xvY2tlZCgpIHRv
IHJlYWQgdGhlIAo+Pj4+IHN0YXR1cwo+Pj4+IHJlZ2lzdGVyIG9ubHkgb25jZSBhbmQgbm90IGZv
ciBldmVyeSBPVFAgcmVnaW9uLCBidXQgZm9yIHRoYXQgd2UgCj4+Pj4gd291bGQKPj4+PiBuZWVk
IHNvbWUgbW9yZSBpbnZhc2l2ZSBjaGFuZ2VzLiBHaXZlbiB0aGF0IHRoaXMgaXMKPj4+PiBvbmUt
dGltZS1wcm9ncmFtbWFibGUgbWVtb3J5IGFuZCB0aGUgbm9ybWFsIGFjY2VzcyBtb2RlIGlzIHJl
YWRpbmcsIAo+Pj4+IHdlCj4+Pj4ganVzdCBsaXZlIHdpdGggdGhlIHNtYWxsIG92ZXJoZWFkLgo+
Pj4+IAo+Pj4+IEZpeGVzOiAwNjkwODlhY2Y4OGIgKCJtdGQ6IHNwaS1ub3I6IGFkZCBPVFAgc3Vw
cG9ydCIpCj4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBXYWxsZSA8bWljaGFlbEB3YWxsZS5j
Yz4KPj4+PiBSZXZpZXdlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHAueWFkYXZAdGkuY29tPgo+Pj4+
IC0tLQo+Pj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYyB8IDM2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+Pj4+IMKgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlv
bnMoKykKPj4+PiAKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMKPj4+PiBpbmRleCAzODk4ZWQ2N2JhMWMuLjA2M2Y4
ZmI2ODY0OSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL290cC5jCj4+Pj4g
KysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYwo+Pj4+IEBAIC0yNDksNiArMjQ5LDMyIEBA
IHN0YXRpYyBpbnQgc3BpX25vcl9tdGRfb3RwX2luZm8oc3RydWN0IG10ZF9pbmZvCj4+Pj4gKm10
ZCwgc2l6ZV90IGxlbiwKPj4+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+IMKgfQo+
Pj4+IAo+Pj4+ICtzdGF0aWMgaW50IHNwaV9ub3JfbXRkX290cF9yYW5nZV9pc19sb2NrZWQoc3Ry
dWN0IHNwaV9ub3IgKm5vciwKPj4+PiBsb2ZmX3Qgb2ZzLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNpemVfdCBsZW4pCj4+Pj4gK3sKPj4+PiArwqDCoMKgwqDCoMKgIGNvbnN0IHN0
cnVjdCBzcGlfbm9yX290cF9vcHMgKm9wcyA9IG5vci0+cGFyYW1zLT5vdHAub3BzOwo+Pj4+ICvC
oMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHJlZ2lvbjsKPj4+PiArwqDCoMKgwqDCoMKgIGludCBs
b2NrZWQ7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqAgaWYgKCFsZW4pCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gKwo+Pj4gCj4+PiBZb3Ugd29uJ3Qg
bmVlZCB0aGlzIGlmIHlvdSBwdXQgcGF0Y2ggNC81IGJlZm9yZSB0aGlzIG9uZS4gV2l0aCB0aGlz
Ogo+PiAKPj4gVGhpcyBwYXRjaCB3aWxsIGdldCBiYWNrcG9ydGVkIHRvIHRoZSBzdGFibGUga2Vy
bmVscy4gUGF0Y2ggNCBvbiB0aGUKPj4gb3RoZXIgaGFuZCBkb2VzIG5vdC4KPj4gCj4gCj4gSSBk
b24ndCBzZWUgd2h5IDQvNSBjYW5ub3QgYmUgbWFya2VkIGZvciBiYWNrcG9ydCB0b28gYXMgaXQg
bWFrZXMgMy81Cj4gbXVjaCBjbGVhbmVyPwoKV2hhdCBraW5kIG9mIHByb2JsZW0gZG9lcyA0LzUg
Zml4PyBJIGNhbid0IHNlZSBob3cgdGhhdCBwYXRjaCB3b3VsZAphcHBseSB0byBhbnkgcnVsZSBp
biBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3RhYmxlLWtlcm5lbC1ydWxlcy5yc3QuCgpCdXQgc3Vy
ZSwgYWRkaW5nIHRoZSBzYW1lIEZpeGVzOiB0YWcsIEkgY2FuIHN3YXAgdGhvc2UgdHdvLgoKLW1p
Y2hhZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
