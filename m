Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9319C47082
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 10:44:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DB960FEA
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 10:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DB960FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JpdhH9kmbA3dKjO+j98F7CCs8WK4LjsGaorMaH4OQnU=; b=g8Ejf+1ycsa6I5mo02R8UBLMk+
	CyvW+VWE5dl56Zakkc7x9t1KkjTWqmvRk1HBF9KU5BY+jmApXRtSf/iAJybNoLpOc26QkIxNn7Wqe
	akcOyXkHLjePt9pAV1+BPKe9bY+D9z/+K+k/F8K14GVpUpvYTwUVMo0FvVZtOHtlWeoW6RBqZWnly
	cUjJ6PKzV/7vsZ5Yitt+1y0MQerEa24SJq4xmWJqSqdo9BcZVWh8WqjpNNHKM5nfvCx0HvOfa6bwZ
	HdMVW+E/TRCRQHjbCiEx2BJoBEkYUVuSZcCZurbBUyyV7Pvja+dczM2FAqeQZEySG9Zrt5WcVUanh
	hVILidMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqCj4-0031jE-OH; Mon, 07 Jun 2021 10:43:23 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqCWo-002vbX-Qn
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 10:30:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 157AUbdc120986;
 Mon, 7 Jun 2021 05:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623061837;
 bh=rs53RVoF/lk4i+SEk7UakVzfsG5HYB/uTZVfGqulVdY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=S7vDk7mfNQQr3brRkEnboggqobywh872wwIcl/0Q2iKPP1P9soE3lqZYWqQSZcdLK
 2Mt2RM57FnDYYIfIqjJ6szzhVMFv7XyQNsu9SWnvMs1a2WkKKM8kvxsVE9mJ675IrH
 qJ06islThJRpQVu8lzBASLqNSemEumL9RKLXs8NE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 157AUbVD101925
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Jun 2021 05:30:37 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 7 Jun
 2021 05:30:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 7 Jun 2021 05:30:37 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 157AUYdK093239;
 Mon, 7 Jun 2021 05:30:35 -0500
Subject: Re: [PATCH v5 3/5] mtd: spi-nor: otp: return -EROFS if region is
 read-only
To: Michael Walle <michael@walle.cc>
CC: <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <p.yadav@ti.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
References: <20210604100252.9975-1-michael@walle.cc>
 <20210604100252.9975-4-michael@walle.cc>
 <c2b58dcc-5a60-792c-30ac-a3db327a85ed@microchip.com>
 <e117bc50b9f9e10549c25602b66cfe26@walle.cc>
 <1549db61-500a-e5df-9303-823b41457861@ti.com>
 <4ba7994b0cc8d436012a776ca14addca@walle.cc>
 <3e46bc75-6ace-f7c0-1b14-aae812554ac9@ti.com>
 <2559d150b3a0d964ece0c9e29e155ecc@walle.cc>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <4b3e1bde-09ff-eebd-8e93-8db7a5834f96@ti.com>
Date: Mon, 7 Jun 2021 16:00:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2559d150b3a0d964ece0c9e29e155ecc@walle.cc>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_033043_030420_E1787371 
X-CRM114-Status: GOOD (  26.63  )
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

CgpPbiA2LzcvMjEgMzoyNiBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBBbSAyMDIxLTA2LTA3
IDA4OjQ3LCBzY2hyaWViIFZpZ25lc2ggUmFnaGF2ZW5kcmE6Cj4+IE9uIDYvNy8yMSAxMTozOCBB
TSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEFtIDIwMjEtMDYtMDcgMDc6NDYsIHNjaHJpZWIg
VmlnbmVzaCBSYWdoYXZlbmRyYToKPj4+PiBPbiA2LzQvMjEgNjo0NSBQTSwgTWljaGFlbCBXYWxs
ZSB3cm90ZToKPj4+Pj4gQW0gMjAyMS0wNi0wNCAxNTowNywgc2NocmllYiBUdWRvci5BbWJhcnVz
QG1pY3JvY2hpcC5jb206Cj4+Pj4+PiBPbiA2LzQvMjEgMTowMiBQTSwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPj4+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdQo+Pj4+Pj4+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+
Pj4+Pj4+Cj4+Pj4+Pj4gU1BJIE5PUiBmbGFzaGVzIHdpbGwganVzdCBpZ25vcmUgcHJvZ3JhbSBj
b21tYW5kcyBpZiB0aGUgT1RQCj4+Pj4+Pj4gcmVnaW9uIGlzCj4+Pj4+Pj4gbG9ja2VkLiBUaHVz
LCBhIHVzZXIgbWlnaHQgbm90IG5vdGljZSB0aGF0IHRoZSBpbnRlbmRlZCB3cml0ZQo+Pj4+Pj4+
IGRpZG4ndCBlbmQKPj4+Pj4+PiB1cCBpbiB0aGUgZmxhc2guIFJldHVybiAtRVJPRlMgdG8gdGhl
IHVzZXIgaW4gdGhpcyBjYXNlLiBGcm9tIHdoYXQKPj4+Pj4+PiBJIGNhbgo+Pj4+Pj4+IHRlbGws
IGNoaXBzL2NmaV9jbWRzZXRfMDAwMS5jIGFsc28gcmV0dXJuIHRoaXMgZXJyb3IgY29kZS4KPj4+
Pj4+Pgo+Pj4+Pj4+IE9uZSBjb3VsZCBvcHRpbWl6ZSBzcGlfbm9yX210ZF9vdHBfcmFuZ2VfaXNf
bG9ja2VkKCkgdG8gcmVhZCB0aGUKPj4+Pj4+PiBzdGF0dXMKPj4+Pj4+PiByZWdpc3RlciBvbmx5
IG9uY2UgYW5kIG5vdCBmb3IgZXZlcnkgT1RQIHJlZ2lvbiwgYnV0IGZvciB0aGF0IHdlCj4+Pj4+
Pj4gd291bGQKPj4+Pj4+PiBuZWVkIHNvbWUgbW9yZSBpbnZhc2l2ZSBjaGFuZ2VzLiBHaXZlbiB0
aGF0IHRoaXMgaXMKPj4+Pj4+PiBvbmUtdGltZS1wcm9ncmFtbWFibGUgbWVtb3J5IGFuZCB0aGUg
bm9ybWFsIGFjY2VzcyBtb2RlIGlzCj4+Pj4+Pj4gcmVhZGluZywgd2UKPj4+Pj4+PiBqdXN0IGxp
dmUgd2l0aCB0aGUgc21hbGwgb3ZlcmhlYWQuCj4+Pj4+Pj4KPj4+Pj4+PiBGaXhlczogMDY5MDg5
YWNmODhiICgibXRkOiBzcGktbm9yOiBhZGQgT1RQIHN1cHBvcnQiKQo+Pj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4+Pj4+Pj4gUmV2aWV3ZWQt
Ynk6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KPj4+Pj4+PiAtLS0KPj4+Pj4+PiDC
oGRyaXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4+Pj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4+
Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYyBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3Ivb3RwLmMKPj4+Pj4+PiBpbmRleCAzODk4ZWQ2N2JhMWMuLjA2M2Y4
ZmI2ODY0OSAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL290cC5jCj4+
Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9vdHAuYwo+Pj4+Pj4+IEBAIC0yNDksNiAr
MjQ5LDMyIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9tdGRfb3RwX2luZm8oc3RydWN0IG10ZF9pbmZv
Cj4+Pj4+Pj4gKm10ZCwgc2l6ZV90IGxlbiwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Owo+Pj4+Pj4+IMKgfQo+Pj4+Pj4+Cj4+Pj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9tdGRf
b3RwX3JhbmdlX2lzX2xvY2tlZChzdHJ1Y3Qgc3BpX25vciAqbm9yLAo+Pj4+Pj4+IGxvZmZfdCBv
ZnMsCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IGxlbikKPj4+Pj4+
PiArewo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IHNwaV9ub3Jfb3RwX29wcyAq
b3BzID0gbm9yLT5wYXJhbXMtPm90cC5vcHM7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoCB1bnNpZ25l
ZCBpbnQgcmVnaW9uOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqAgaW50IGxvY2tlZDsKPj4+Pj4+PiAr
Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoCBpZiAoIWxlbikKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+Pj4+PiArCj4+Pj4+Pgo+Pj4+Pj4gWW91IHdvbid0
IG5lZWQgdGhpcyBpZiB5b3UgcHV0IHBhdGNoIDQvNSBiZWZvcmUgdGhpcyBvbmUuIFdpdGggdGhp
czoKPj4+Pj4KPj4+Pj4gVGhpcyBwYXRjaCB3aWxsIGdldCBiYWNrcG9ydGVkIHRvIHRoZSBzdGFi
bGUga2VybmVscy4gUGF0Y2ggNCBvbiB0aGUKPj4+Pj4gb3RoZXIgaGFuZCBkb2VzIG5vdC4KPj4+
Pj4KPj4+Pgo+Pj4+IEkgZG9uJ3Qgc2VlIHdoeSA0LzUgY2Fubm90IGJlIG1hcmtlZCBmb3IgYmFj
a3BvcnQgdG9vIGFzIGl0IG1ha2VzIDMvNQo+Pj4+IG11Y2ggY2xlYW5lcj8KPj4+Cj4+PiBXaGF0
IGtpbmQgb2YgcHJvYmxlbSBkb2VzIDQvNSBmaXg/IEkgY2FuJ3Qgc2VlIGhvdyB0aGF0IHBhdGNo
IHdvdWxkCj4+PiBhcHBseSB0byBhbnkgcnVsZSBpbiBEb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3Rh
YmxlLWtlcm5lbC1ydWxlcy5yc3QuCj4+Pgo+Pgo+PiBMb29raW5nIGZ1cnRoZXIsIEkgZG9uJ3Qg
c2VlIHRoZSBuZWVkIGZvciA0LzUgdG8gYmUgYSBzZXBhcmF0ZSBwYXRjaC4KPj4gUGF0Y2ggNC81
IGlzIHNpbXBsaWZ5aW5nIHNwaV9ub3JfbXRkX290cF9yYW5nZV9pc19sb2NrZWQoKSBieSBlbnN1
cmluZwo+PiAnbGVuJyBwYXNzZWQgaXMgbmV2ZXIgMCB3aGljaCBjYW4gYmUgZG9uZSBpbiAzLzUg
d2hlbiBpbnRyb2R1Y2luZwo+PiBzcGlfbm9yX210ZF9vdHBfcmFuZ2VfaXNfbG9ja2VkKCkuCj4+
Cj4+IFNvIHdoeSBub3Qgc3F1YXNoZWQgaXQgaW50byAzLzUuCj4gCj4gQmVjYXVzZSwgc3RyaWN0
bHkgc3BlYWtpbmcsIGl0IGlzIG5vdCBwYXJ0IG9mIHRoYXQgcGFydGljdWxhciBmaXgKPiBhbmQg
SU1ITyB2aW9sYXRlcyAiSXQgbXVzdCBmaXggb25seSBvbmUgdGhpbmciLiBCdXQgaWYgeW91J3Jl
IGZpbmUKPiB3aXRoIHRoYXQsIEkgY2FuIHNxdWFzaCB0aGUgdHdvLgo+IAo+IFRCSCBJIGZpbmQg
aXQga2luZGEgZnVubnkgdG8gYmVuZCB0aGUgcnVsZXMsIGp1c3QgdG8gZ2V0IHJpZCBvZgo+IHRo
ZXNlIHRocmVlIGxpbmVzIG9mIGNvZGUgb3IgdGhlIHVnbGluZXNzIHRoYXQgdGhleSB3aWxsIGJl
IHJlbW92ZWQKPiBpbiB0aGUgZm9sbG93aW5nIHBhdGNoLgo+IAoKVGhpcyBpcyBzdGlsbCBmaXhp
bmcgb25seSBvbmUgdGhpbmcgIkluZGljYXRpbmcgT1RQIHdyaXRlcyBhcmUgaWdub3JlZAp3aGVu
IHJlZ2lvbiBpcyBsb2NrZWQiIChpZSBzcGlfbm9yX210ZF9vdHBfcmFuZ2VfaXNfbG9ja2VkKCkg
Y2hlY2spLgpCdXQsIHNwaV9ub3JfbXRkX290cF9yYW5nZV9pc19sb2NrZWQoKSAoYXMgaW4gMy81
KSBjYW4gYmUgc2ltcGxpZmllZCBpZgonbGVuICE9IDAnIGlzIGNoZWNrZWQgcHJpb3IgdG8gY2Fs
bGluZyB0aGUgZnVuY3Rpb24uIFRoYXQncyB3aGF0IDQvNQpkb2VzIHdoaWNoIEkgYmVsaWV2ZSBj
YW4gYmUgc3F1YXNoZWQgaGVyZS4KCkkganVzdCBkb24ndCBsaWtlIGNvZGUgYmVpbmcgcmVmYWN0
b3JlZCBmb3IgdGhlIHB1cnBvc2Ugb2YgYmVpbmcgYWJsZSB0bwpiZSBiYWNrcG9ydGVkLiBJdCBm
ZWVscyB3ZWlyZCB0byBoYXZlIGEgcGllY2Ugb2YgY29kZSBiZWluZyBhZGRlZCBpbiBvbmUKY29t
bWl0LCBhbmQgdGhlbiBiZWluZyBkZWxldGVkIHRoZSB2ZXJ5IG5leHQgY29tbWl0LgpTbyBzdHJp
Y3RseSBzcGVha2luZyA0LzUgaGFzIHRvIGNvbWUgYmVmb3JlIDMvNS4KCkJ1dCBJIGFtIGZpbmUg
dG8gbGl2ZSB3aXRoIHRoaXMgdGVtcG9yYXJ5IHVnbGluZXNzIGlmIFR1ZG9yIGFncmVlcy4KCgpS
ZWdhcmRzClZpZ25lc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
