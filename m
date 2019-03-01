Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D56C43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:43:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB2C20848
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WSHHfCem"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BB2C20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LegSUSAWXATa9b250aM4/wR6ruvoeVQQ15S6Yzowlo0=; b=WSHHfCemBQzp0s
	S9kiu/6TFHmsPZ/92C4jSgD27WUPjW042NepwgCkD+kogtmMt98OaEpeRrY/BKs0kuvBsj1rUQ+FM
	s3+o74vIpZ22bEZIJtSu05un7tCPbVjxx8gLCkk0korwpwJRMdYJqJQBSDLF+VCn6Aza7E8S8WDo1
	PWMW1nqWMjvF1WiF3e1P1vIkbOVhahQziwKc3kFC1KN8Z5vFL7mrGMJRxumAbodXteNb3wkcayL36
	fbNto0vfl1WYnJZea0wjWEa9QFK82SXEP0urOjcSlqSM7S309sqleTutvN8yYGKKMvTL0dbrDaIev
	+1AU90ghCRzJ9xCkqN8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzmBy-00076k-T4; Fri, 01 Mar 2019 17:43:26 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzmBv-000761-7n
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 17:43:25 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5CE33272BD9;
 Fri,  1 Mar 2019 17:43:20 +0000 (GMT)
Date: Fri, 1 Mar 2019 18:43:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Tokunori Ikegami" <ikegami.t@gmail.com>
Subject: Re: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Message-ID: <20190301184317.6bad546f@collabora.com>
In-Reply-To: <000501d4d050$38eca160$aac5e420$@gmail.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
 <016001d4cf71$865e7b60$931b7220$@gmail.com>
 <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
 <20190228164228.734ede80@collabora.com>
 <005a01d4d03e$39b0e0f0$ad12a2d0$@yahoo.co.jp>
 <4b3bc01a-3632-5dde-f683-94744ee7179d@ti.com>
 <000501d4d050$38eca160$aac5e420$@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_094323_740359_05DCCE3C 
X-CRM114-Status: GOOD (  26.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: 'Vignesh Raghavendra' <vigneshr@ti.com>, bbrezillon@kernel.org,
 ikegami@allied-telesis.co.jp, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 "'liujian \(CE\)'" <liujian56@huawei.com>, keescook@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyIE1hciAyMDE5IDAxOjU5OjQxICswOTAwCiJUb2t1bm9yaSBJa2VnYW1pIiA8aWtl
Z2FtaS50QGdtYWlsLmNvbT4gd3JvdGU6Cgo+ID4gWy4uLl0gIAo+ID4gPj4+Pj4gSW4gZnVuY3Rp
b24gZG9fd3JpdGVfYnVmZmVyKCksIGluIHRoZSBmb3IgbG9vcCwgdGhlcmUgaXMgYQo+ID4gPj4+
Pj4gY2FzZSBjaGlwX3JlYWR5KCkgcmV0dXJucyAxIHdoaWxlIGNoaXBfZ29vZCgpIHJldHVybnMg
MCwgc28KPiA+ID4+Pj4+IGl0IG5ldmVyIGJyZWFrIHRoZSBsb29wLgo+ID4gPj4+Pj4gVG8gZml4
IHRoaXMsIGNoaXBfZ29vZCgpIGlzIGVub3VnaCBhbmQgaXQgc2hvdWxkIHRpbWVvdXQgaWYKPiA+
ID4+Pj4+IGl0IHN0YXkgYmFkIGZvciBhIHdoaWxlLgo+ID4gPj4+Pj4KPiA+ID4+Pj4+IEZpeGVz
OiBkZmVhZTEwNzM1ODMoIm10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUKPiA+ID4+
Pj4+IGJ1ZmZlciB0byBjaGVjayBjb3JyZWN0IHZhbHVlIikKPiA+ID4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFlpIEh1YWlqaWUgPHlpaHVhaWppZUBodWF3ZWkuY29tPgo+ID4gPj4+Pj4gU2lnbmVkLW9m
Zi1ieTogTGl1IEppYW4gPGxpdWppYW41NkBodWF3ZWkuY29tPgo+ID4gPj4+Pj4gUmV2aWV3ZWQt
Ynk6IFRva3Vub3JpIElrZWdhbWkgPGlrZWdhbWlfdG9AeWFob28uY28uanA+Cj4gPiA+Pj4+PiAt
LS0KPiA+ID4+Pj4+IHYyLT52MzoKPiA+ID4+Pj4+IEZvbGxvdyBWaWduZXNoJ3MgYWR2aWNlOgo+
ID4gPj4+Pj4gYWRkIG9uZSBtb3JlIGNoZWNrIGZvciBjaGVja19nb29kKCkgZXZlbiB3aGVuIHRp
bWVfYWZ0ZXIoKQo+ID4gPj4+Pj4gcmV0dXJucyAgCj4gPiA+PiB0cnVlLiAgCj4gPiA+Pj4+Pgo+
ID4gPj4+Pj4gIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwgMiArLQo+ID4g
Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4g
Pj4+Pj4KPiA+ID4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0
XzAwMDIuYwo+ID4gPj4+Pj4gYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+
ID4gPj4+Pj4gaW5kZXggNzI0MjhiNi4uM2RhMjM3NiAxMDA2NDQKPiA+ID4+Pj4+IC0tLSBhL2Ry
aXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPiA+Pj4+PiArKysgYi9kcml2ZXJz
L210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+ID4gPj4+Pj4gQEAgLTE4NzYsNyArMTg3Niw3
IEBAIHN0YXRpYyBpbnQgX194aXByYW0KPiA+ID4+Pj4+IGRvX3dyaXRlX2J1ZmZlcihzdHJ1Y3Qg
bWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hpcCwKPiA+ID4+Pj4+ICAJCQljb250aW51
ZTsKPiA+ID4+Pj4+ICAJCX0KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiAtCQlpZiAodGltZV9hZnRlcihq
aWZmaWVzLCB0aW1lbykKPiA+ID4+Pj4+ICYmICFjaGlwX3JlYWR5KG1hcCwgYWRyKSkKPiA+ID4+
Pj4+ICsJCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKQo+ID4gPj4+Pj4gJiYgIWNoaXBf
Z29vZChtYXAsIGFkciwgZGF0dW0pKSAgCj4gPiA+Pj4+Cj4gPiA+Pj4+ICAgSnVzdCBhbm90aGVy
IGlkZWEgdG8gdW5kZXJzdGFuZCBlYXNpbHkuCj4gPiA+Pj4+Cj4gPiA+Pj4+ICAgICB1bnNpZ25l
ZCBsb25nIG5vdyA9IGppZmZpZXM7Cj4gPiA+Pj4+Cj4gPiA+Pj4+ICAgICBpZiAoY2hpcF9nb29k
KG1hcCwgYWRyLCBkYXR1bSkpIHsKPiA+ID4+Pj4gICAgICAgICB4aXBfZW5hYmxlKG1hcCwgY2hp
cCwgYWRyKTsKPiA+ID4+Pj4gICAgICAgICBnb3RvIG9wX2RvbmU7Cj4gPiA+Pj4+ICAgICB9Cj4g
PiA+Pj4+Cj4gPiA+Pj4+ICAgICBpZiAodGltZV9hZnRlcihub3csIHRpbWVvKSB7Cj4gPiA+Pj4+
ICAgICAgICAgYnJlYWs7Cj4gPiA+Pj4+ICAgICB9Cj4gPiA+Pj4+ICAKPiA+ID4+Pgo+ID4gPj4+
IFRoYW5rIHlvdX4uIEl0IGlzIG1vcmUgZWFzaWVyIHRvIHVuZGVyc3RhbmTvvIEKPiA+ID4+PiBJ
ZiB0aGVyZSBhcmUgbm8gb3RoZXIgY29tbWVudHMsIEkgd2lsbCBzZW5kIG5ldyBwYXRjaCBhZ2Fp
biApOiAgCj4gPiA+Pgo+ID4gPj4gRXhjZXB0IHRoaXMgdmVyc2lvbiBubyBsb25nZXIgZG9lcyB3
aGF0IFZpZ25lc2ggc3VnZ2VzdGVkLiBTZWUKPiA+ID4+IGhvdyB5b3Ugbm8gbG9uZ2VyIHRlc3Qg
aWYgY2hpcF9nb29kKCkgaXMgdHJ1ZSBpZiB0aW1lX2FmdGVyKCkKPiA+ID4+IHJldHVybnMgdHJ1
ZS4gU28sIGltYWdpbmUgdGhlIHRocmVhZCBlbnRlcmluZyB0aGlzIGZ1bmN0aW9uIGlzCj4gPiA+
PiBwcmVlbXB0ZWQganVzdCBhZnRlciB0aGUgZmlyc3QgY2hpcF9nb29kKCkgdGVzdCwgYW5kIHJl
c3VtZWQgYQo+ID4gPj4gZmV3IG1zIGxhdGVyLiB0aW1lX2FmdGVyKCkgd2lsbCByZXR1cm4gdHJ1
ZSwgYnV0IGNoaXBfZ29vZCgpCj4gPiA+PiBtaWdodCBhbHNvIHJldHVybiB0cnVlLCBhbmQgeW91
IGlnbm9yZSBpdC4gIAo+ID4gPgo+ID4gPiBJIHRoaW5rIHRoYXQgdGhlIGZvbGxvd2luZyAzIHZl
cnNpb25zIHdpbGwgYmUgd29ya2VkIGZvcgo+ID4gPiB0aW1lX2FmdGVyKCkgIAo+ID4gYXMgYSBz
YW1lIHJlc3VsdCBhbmQgZm9sbG93IHRoZSBWaWduZXNoLXNhbiBzdWdnZXN0aW9uLiAgCj4gPiA+
ICAKPiA+IAo+ID4gQXMgQm9yaXMgZXhwbGFpbmVkIGFib3ZlIHZlcnNpb24gMyBkb2VzIG5vdCBy
ZWFsbHkgZm9sbG93IG15Cj4gPiBzdWdnZXN0aW9uLi4uIFBsZWFzZSBzZWUgYmVsb3cKPiA+ICAg
Cj4gPiA+IDEuIE9yaWdpbmFsIFZpZ25lc2gtc2FuIHN1Z2dlc3Rpb24KPiA+ID4KPiA+ID4gCWlm
IChjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgewo+ID4gPiAJCXhpcF9lbmFibGUobWFwLCBj
aGlwLCBhZHIpOwo+ID4gPiAJCWdvdG8gb3BfZG9uZTsKPiA+ID4gCX0KPiA+ID4KPiA+ID4gCWlm
ICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKSkgewo+ID4gPiAJCS8qIFRlc3QgY2hpcF9nb29k
KCkgaWYgVFJVRSBpbmNvcnJlY3RseSBhZ2FpbiBzbwo+ID4gPiB3cml0ZSAgCj4gPiBmYWlsdXJl
IGJ5IHRpbWVfYWZ0ZXIoKSBjYW4gYmUgYXZvaWRlZC4gKi8gIAo+ID4gPiAJCWlmIChjaGlwX2dv
b2QobWFwLCBhZHIsIGRhdHVtKSkgewo+ID4gPiAJCQl4aXBfZW5hYmxlKG1hcCwgY2hpcCwgYWRy
KTsKPiA+ID4gCQkJZ290byBvcF9kb25lOwo+ID4gPiAJCX0KPiA+ID4gCQlicmVhazsKPiA+ID4g
CX0KPiA+ID4gIAo+ID4gCj4gPiAKPiA+IFJpZ2h0LCBoZXJlIHdlIGNoZWNrIGNoaXBfZ29vZCgp
IG9uY2UgX2V2ZW4gd2hlbiB0aW1lX2FmdGVyKCkgaXMKPiA+IHRydWVfIHRvIGF2b2lkIF9zcHVy
aW91c18gdGltZW91dAo+ID4gICAKPiA+ID4gMi4gTGl1amlhbi1zYW4gdjMgcGF0Y2gKPiA+ID4K
PiA+ID4gCS8qIFRlc3QgY2hpcF9nb29kKCkgaWYgRkFMU0UgY29ycmVjdGx5IHNvIHdyaXRlIGZh
aWx1cmUKPiA+ID4gYnkgIAo+ID4gdGltZV9hZnRlcigpIGNhbiBiZSBhdm9pZGVkLiAqLyAgCj4g
PiA+IAlpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lbykgJiYgIWNoaXBfZ29vZChtYXAsIGFk
cikpCj4gPiA+IAkJYnJlYWs7Cj4gPiA+Cj4gPiA+IAlpZiAoY2hpcF9nb29kKG1hcCwgYWRyLCBk
YXR1bSkpIHsKPiA+ID4gCQl4aXBfZW5hYmxlKG1hcCwgY2hpcCwgYWRyKTsKPiA+ID4gCQlnb3Rv
IG9wX2RvbmU7Cj4gPiA+IAl9Cj4gPiA+ICAKPiA+IAo+ID4gVGhpcyBpcyBhIGJldHRlciB2ZXJz
aW9uIG9mIDEKPiA+ICAgCj4gPiA+IDMuIE15IGlkZWEKPiA+ID4KPiA+ID4gCS8qIFNhdmUgY3Vy
cmVudCBqaWZmaWVzIHZhbHVlIGJlZm9yZSBjaGlwX2dvb2QoKSB0byBhdm9pZAo+ID4gPiB3cml0
ZSAgCj4gPiBmYWlsdXJlIGJ5IHRpbWVfYWZ0ZXIoKSB3aXRob3V0IHRlc3RpbmcgY2hpcF9nb29k
KCkgYWdhaW4uICovICAKPiA+ID4gCXVuc2lnbmVkIGxvbmcgbm93ID0gamlmZmllczsKPiA+ID4K
PiA+ID4gCWlmIChjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgewo+ID4gPiAJCXhpcF9lbmFi
bGUobWFwLCBjaGlwLCBhZHIpOwo+ID4gPiAJCWdvdG8gb3BfZG9uZTsKPiA+ID4gCX0KPiA+ID4g
IAo+ID4gCj4gPiBXaGF0IGlmIHRocmVhZCBnZXRzIHByZS1lbXB0ZWQgYXQgdGhpcyBwb2ludCBh
bmQgaXMgcmUtc2NoZWR1bGVkCj4gPiBleGFjdGx5IGFmdGVyIHRpbWVvIGppZmZpZXMgaGF2ZSBl
bGFwc2VkPyBCZWxvdyBjaGVjayB3b3VsZCBiZSB0cnVlCj4gPiBhbmQgZXhpdCBsb29wICAKPiAK
PiAgIEkgdGhpbmsgdGhhdCB0aGUgamlmZmllcyB2YWx1ZSBub3cgaXMgc2F2ZSBiZWZvcmUgY2hp
cF9nb29kKCkgc28KPiBiZWxvdyBjaGVjayB3b3VsZCBiZSBmYWxzZSBhbmQgbm90IGV4aXQgbG9v
cC4KClRydWUsIEkgb3Zlcmxvb2tlZCB0aGF0IHBhcnQsIGFuZCBzbyBWaWduZXNoIGRpZC4gVGhp
cyBwcm92ZXMgb25lCnRoaW5nOiBjb2RlIGlzIG5vdCBlYXNpZXIgdG8gZm9sbG93IHdpdGggeW91
ciB2ZXJzaW9uLiBJTU8sIGlmIHdlIHdhbnQKdG8gbWFrZSB0aGluZ3MgY2xlYXIsIHdlIHNob3Vs
ZCBhZGQgYSBjb21tZW50IHRvIExpdWppYW4ncyBleHBsYWluaW5nCndoeSB0aGUgZXh0cmEgdGVz
dCBhZnRlciB0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKSBpcyBuZWVkZWQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
