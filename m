Return-Path: <SRS0=9k8X=RF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7ADC43381
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Mar 2019 08:58:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4534220836
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Mar 2019 08:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DzG/7k2S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="syUDuGcB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4534220836
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oZcV1GS1ojLiky1gmf9FZavzGovWkxU1Lvbn4wMrEw=; b=DzG/7k2SVogH6/
	cXLVGIbL3pNZXyYrBWZoglhC8B5FINnuzTz1oZZ6pdque/YJ4BmcdNHnXQpTL+JKZPGe8xNiLfliT
	7/Qt0jVlxxXLeyLpPC48k+SDAbFp5mKBu65261vTp86edG6Rajsvx/XRAyLdBZdrXTWggZUrRWcA1
	9rQJHrfmUEOg9f8249Qpt35BH51kHFAL58p9d8Azzp8dz4mesFGGj1joIsfolvaGz/Fk8shZeEZay
	QnQX/YCYVIzQdiDa4nCYmvl1kXP9t3Bx/v3V2MZR6fZ82WzfQWIJeXI01RiZr/4ZMjDlMnY5AlejT
	6WuCGGLTdVy/4OOzFgfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h00TV-0008FZ-6f; Sat, 02 Mar 2019 08:58:29 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h00TQ-0008F5-Fp
 for linux-mtd@lists.infradead.org; Sat, 02 Mar 2019 08:58:26 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x228w1sD055297;
 Sat, 2 Mar 2019 02:58:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1551517081;
 bh=ALOW7bCh93XjxU4oUJJzLplSu9kQFhCcZ+h+IJKVzZA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=syUDuGcBspn0SGICKUshWIDlOF5uccGUpbT48VY7tZM/w3y+MGvtR50jf9DppbP0P
 jlQEraEJMntF8rGPlGup7Zu0FbH2hVmMq7nfTeRvJ02N7HTdGqZfKLU+SeIQD1RI4t
 o7MVmtfVkrvt688ZV+iYElzZocAq61fmdA8uAAHY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x228w1p4015309
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 2 Mar 2019 02:58:01 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Sat, 2
 Mar 2019 02:58:00 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Sat, 2 Mar 2019 02:58:00 -0600
Received: from [172.22.217.208] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x228vtIn009809;
 Sat, 2 Mar 2019 02:57:56 -0600
Subject: Re: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
To: Tokunori Ikegami <ikegami_to@yahoo.co.jp>, "'liujian (CE)'"
 <liujian56@huawei.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
 <016001d4cf71$865e7b60$931b7220$@gmail.com>
 <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
 <20190228164228.734ede80@collabora.com>
 <005a01d4d03e$39b0e0f0$ad12a2d0$@yahoo.co.jp>
 <4b3bc01a-3632-5dde-f683-94744ee7179d@ti.com>
 <000501d4d050$38eca160$aac5e420$@gmail.com>
 <20190301184317.6bad546f@collabora.com>
 <001c01d4d057$f68572e0$e39058a0$@yahoo.co.jp>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <de75d4f6-dfff-26e0-e191-6240ffc20223@ti.com>
Date: Sat, 2 Mar 2019 14:27:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <001c01d4d057$f68572e0$e39058a0$@yahoo.co.jp>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190302_005824_658465_DE93F2BD 
X-CRM114-Status: GOOD (  17.71  )
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
Cc: 'Tokunori Ikegami' <ikegami.t@gmail.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "ikegami@allied-telesis.co.jp" <ikegami@allied-telesis.co.jp>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 'Boris Brezillon' <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAwMS1NYXItMTkgMTE6MjUgUE0sIFRva3Vub3JpIElrZWdhbWkgd3JvdGU6Cj4+Pj4gWy4u
Ll0KPj4+Pj4+Pj4+IEluIGZ1bmN0aW9uIGRvX3dyaXRlX2J1ZmZlcigpLCBpbiB0aGUgZm9yIGxv
b3AsIHRoZXJlIGlzIGEKPj4+Pj4+Pj4+IGNhc2UgY2hpcF9yZWFkeSgpIHJldHVybnMgMSB3aGls
ZSBjaGlwX2dvb2QoKSByZXR1cm5zIDAsIHNvCj4+Pj4+Pj4+PiBpdCBuZXZlciBicmVhayB0aGUg
bG9vcC4KPj4+Pj4+Pj4+IFRvIGZpeCB0aGlzLCBjaGlwX2dvb2QoKSBpcyBlbm91Z2ggYW5kIGl0
IHNob3VsZCB0aW1lb3V0IGlmCj4+Pj4+Pj4+PiBpdCBzdGF5IGJhZCBmb3IgYSB3aGlsZS4KPj4+
Pj4+Pj4+Cj4+Pj4+Pj4+PiBGaXhlczogZGZlYWUxMDczNTgzKCJtdGQ6IGNmaV9jbWRzZXRfMDAw
MjogQ2hhbmdlIHdyaXRlCj4+Pj4+Pj4+PiBidWZmZXIgdG8gY2hlY2sgY29ycmVjdCB2YWx1ZSIp
Cj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZaSBIdWFpamllIDx5aWh1YWlqaWVAaHVhd2VpLmNv
bT4KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IExpdSBKaWFuIDxsaXVqaWFuNTZAaHVhd2VpLmNv
bT4KPj4+Pj4+Pj4+IFJldmlld2VkLWJ5OiBUb2t1bm9yaSBJa2VnYW1pIDxpa2VnYW1pX3RvQHlh
aG9vLmNvLmpwPgo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+PiB2Mi0+djM6Cj4+Pj4+Pj4+PiBGb2xs
b3cgVmlnbmVzaCdzIGFkdmljZToKPj4+Pj4+Pj4+IGFkZCBvbmUgbW9yZSBjaGVjayBmb3IgY2hl
Y2tfZ29vZCgpIGV2ZW4gd2hlbiB0aW1lX2FmdGVyKCkKPj4+Pj4+Pj4+IHJldHVybnMKPj4+Pj4+
IHRydWUuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMi5jIHwgMiArLQo+Pj4+Pj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+Pj4+Pj4+Pj4gYi9kcml2ZXJzL210ZC9jaGlwcy9j
ZmlfY21kc2V0XzAwMDIuYwo+Pj4+Pj4+Pj4gaW5kZXggNzI0MjhiNi4uM2RhMjM3NiAxMDA2NDQK
Pj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4+Pj4+
Pj4+PiArKysgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+Pj4+Pj4+Pj4g
QEAgLTE4NzYsNyArMTg3Niw3IEBAIHN0YXRpYyBpbnQgX194aXByYW0KPj4+Pj4+Pj4+IGRvX3dy
aXRlX2J1ZmZlcihzdHJ1Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hpcCwKPj4+
Pj4+Pj4+ICAJCQljb250aW51ZTsKPj4+Pj4+Pj4+ICAJCX0KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAt
CQlpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lbykKPj4+Pj4+Pj4+ICYmICFjaGlwX3JlYWR5
KG1hcCwgYWRyKSkKPj4+Pj4+Pj4+ICsJCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKQo+
Pj4+Pj4+Pj4gJiYgIWNoaXBfZ29vZChtYXAsIGFkciwgZGF0dW0pKQo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiAgIEp1c3QgYW5vdGhlciBpZGVhIHRvIHVuZGVyc3RhbmQgZWFzaWx5Lgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiAgICAgdW5zaWduZWQgbG9uZyBub3cgPSBqaWZmaWVzOwo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAg
ICAgaWYgKGNoaXBfZ29vZChtYXAsIGFkciwgZGF0dW0pKSB7Cj4+Pj4+Pj4+ICAgICAgICAgeGlw
X2VuYWJsZShtYXAsIGNoaXAsIGFkcik7Cj4+Pj4+Pj4+ICAgICAgICAgZ290byBvcF9kb25lOwo+
Pj4+Pj4+PiAgICAgfQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAgICAgaWYgKHRpbWVfYWZ0ZXIobm93LCB0
aW1lbykgewo+Pj4+Pj4+PiAgICAgICAgIGJyZWFrOwo+Pj4+Pj4+PiAgICAgfQo+Pj4+Pj4+Pgo+
Pj4+Pj4+Cj4+Pj4+Pj4gVGhhbmsgeW91fi4gSXQgaXMgbW9yZSBlYXNpZXIgdG8gdW5kZXJzdGFu
ZO+8gQo+Pj4+Pj4+IElmIHRoZXJlIGFyZSBubyBvdGhlciBjb21tZW50cywgSSB3aWxsIHNlbmQg
bmV3IHBhdGNoIGFnYWluICk6Cj4+Pj4+Pgo+Pj4+Pj4gRXhjZXB0IHRoaXMgdmVyc2lvbiBubyBs
b25nZXIgZG9lcyB3aGF0IFZpZ25lc2ggc3VnZ2VzdGVkLiBTZWUKPj4+Pj4+IGhvdyB5b3Ugbm8g
bG9uZ2VyIHRlc3QgaWYgY2hpcF9nb29kKCkgaXMgdHJ1ZSBpZiB0aW1lX2FmdGVyKCkKPj4+Pj4+
IHJldHVybnMgdHJ1ZS4gU28sIGltYWdpbmUgdGhlIHRocmVhZCBlbnRlcmluZyB0aGlzIGZ1bmN0
aW9uIGlzCj4+Pj4+PiBwcmVlbXB0ZWQganVzdCBhZnRlciB0aGUgZmlyc3QgY2hpcF9nb29kKCkg
dGVzdCwgYW5kIHJlc3VtZWQgYQo+Pj4+Pj4gZmV3IG1zIGxhdGVyLiB0aW1lX2FmdGVyKCkgd2ls
bCByZXR1cm4gdHJ1ZSwgYnV0IGNoaXBfZ29vZCgpCj4+Pj4+PiBtaWdodCBhbHNvIHJldHVybiB0
cnVlLCBhbmQgeW91IGlnbm9yZSBpdC4KPj4+Pj4KPj4+Pj4gSSB0aGluayB0aGF0IHRoZSBmb2xs
b3dpbmcgMyB2ZXJzaW9ucyB3aWxsIGJlIHdvcmtlZCBmb3IKPj4+Pj4gdGltZV9hZnRlcigpCj4+
Pj4gYXMgYSBzYW1lIHJlc3VsdCBhbmQgZm9sbG93IHRoZSBWaWduZXNoLXNhbiBzdWdnZXN0aW9u
Lgo+Pj4+Pgo+Pj4+Cj4+Pj4gQXMgQm9yaXMgZXhwbGFpbmVkIGFib3ZlIHZlcnNpb24gMyBkb2Vz
IG5vdCByZWFsbHkgZm9sbG93IG15Cj4+Pj4gc3VnZ2VzdGlvbi4uLiBQbGVhc2Ugc2VlIGJlbG93
Cj4+Pj4KPj4+Pj4gMS4gT3JpZ2luYWwgVmlnbmVzaC1zYW4gc3VnZ2VzdGlvbgo+Pj4+Pgo+Pj4+
PiAJaWYgKGNoaXBfZ29vZChtYXAsIGFkciwgZGF0dW0pKSB7Cj4+Pj4+IAkJeGlwX2VuYWJsZSht
YXAsIGNoaXAsIGFkcik7Cj4+Pj4+IAkJZ290byBvcF9kb25lOwo+Pj4+PiAJfQo+Pj4+Pgo+Pj4+
PiAJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW8pKSB7Cj4+Pj4+IAkJLyogVGVzdCBjaGlw
X2dvb2QoKSBpZiBUUlVFIGluY29ycmVjdGx5IGFnYWluIHNvCj4+Pj4+IHdyaXRlCj4+Pj4gZmFp
bHVyZSBieSB0aW1lX2FmdGVyKCkgY2FuIGJlIGF2b2lkZWQuICovCj4+Pj4+IAkJaWYgKGNoaXBf
Z29vZChtYXAsIGFkciwgZGF0dW0pKSB7Cj4+Pj4+IAkJCXhpcF9lbmFibGUobWFwLCBjaGlwLCBh
ZHIpOwo+Pj4+PiAJCQlnb3RvIG9wX2RvbmU7Cj4+Pj4+IAkJfQo+Pj4+PiAJCWJyZWFrOwo+Pj4+
PiAJfQo+Pj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBSaWdodCwgaGVyZSB3ZSBjaGVjayBjaGlwX2dvb2Qo
KSBvbmNlIF9ldmVuIHdoZW4gdGltZV9hZnRlcigpIGlzCj4+Pj4gdHJ1ZV8gdG8gYXZvaWQgX3Nw
dXJpb3VzXyB0aW1lb3V0Cj4+Pj4KPj4+Pj4gMi4gTGl1amlhbi1zYW4gdjMgcGF0Y2gKPj4+Pj4K
Pj4+Pj4gCS8qIFRlc3QgY2hpcF9nb29kKCkgaWYgRkFMU0UgY29ycmVjdGx5IHNvIHdyaXRlIGZh
aWx1cmUKPj4+Pj4gYnkKPj4+PiB0aW1lX2FmdGVyKCkgY2FuIGJlIGF2b2lkZWQuICovCj4+Pj4+
IAlpZiAodGltZV9hZnRlcihqaWZmaWVzLCB0aW1lbykgJiYgIWNoaXBfZ29vZChtYXAsIGFkcikp
Cj4+Pj4+IAkJYnJlYWs7Cj4+Pj4+Cj4+Pj4+IAlpZiAoY2hpcF9nb29kKG1hcCwgYWRyLCBkYXR1
bSkpIHsKPj4+Pj4gCQl4aXBfZW5hYmxlKG1hcCwgY2hpcCwgYWRyKTsKPj4+Pj4gCQlnb3RvIG9w
X2RvbmU7Cj4+Pj4+IAl9Cj4+Pj4+Cj4+Pj4KPj4+PiBUaGlzIGlzIGEgYmV0dGVyIHZlcnNpb24g
b2YgMQo+Pj4+Cj4+Pj4+IDMuIE15IGlkZWEKPj4+Pj4KPj4+Pj4gCS8qIFNhdmUgY3VycmVudCBq
aWZmaWVzIHZhbHVlIGJlZm9yZSBjaGlwX2dvb2QoKSB0byBhdm9pZAo+Pj4+PiB3cml0ZQo+Pj4+
IGZhaWx1cmUgYnkgdGltZV9hZnRlcigpIHdpdGhvdXQgdGVzdGluZyBjaGlwX2dvb2QoKSBhZ2Fp
bi4gKi8KPj4+Pj4gCXVuc2lnbmVkIGxvbmcgbm93ID0gamlmZmllczsKPj4+Pj4KPj4+Pj4gCWlm
IChjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgewo+Pj4+PiAJCXhpcF9lbmFibGUobWFwLCBj
aGlwLCBhZHIpOwo+Pj4+PiAJCWdvdG8gb3BfZG9uZTsKPj4+Pj4gCX0KPj4+Pj4KPj4+Pgo+Pj4+
IFdoYXQgaWYgdGhyZWFkIGdldHMgcHJlLWVtcHRlZCBhdCB0aGlzIHBvaW50IGFuZCBpcyByZS1z
Y2hlZHVsZWQKPj4+PiBleGFjdGx5IGFmdGVyIHRpbWVvIGppZmZpZXMgaGF2ZSBlbGFwc2VkPyBC
ZWxvdyBjaGVjayB3b3VsZCBiZSB0cnVlCj4+Pj4gYW5kIGV4aXQgbG9vcAo+Pj4KPj4+ICAgSSB0
aGluayB0aGF0IHRoZSBqaWZmaWVzIHZhbHVlIG5vdyBpcyBzYXZlIGJlZm9yZSBjaGlwX2dvb2Qo
KSBzbwo+Pj4gYmVsb3cgY2hlY2sgd291bGQgYmUgZmFsc2UgYW5kIG5vdCBleGl0IGxvb3AuCj4+
CgpPaywgSSBnZXQgaXQgbm93LgoKPj4gVHJ1ZSwgSSBvdmVybG9va2VkIHRoYXQgcGFydCwgYW5k
IHNvIFZpZ25lc2ggZGlkLiBUaGlzIHByb3ZlcyBvbmUKPj4gdGhpbmc6IGNvZGUgaXMgbm90IGVh
c2llciB0byBmb2xsb3cgd2l0aCB5b3VyIHZlcnNpb24uIElNTywgaWYgd2Ugd2FudAo+PiB0byBt
YWtlIHRoaW5ncyBjbGVhciwgd2Ugc2hvdWxkIGFkZCBhIGNvbW1lbnQgdG8gTGl1amlhbidzIGV4
cGxhaW5pbmcKPj4gd2h5IHRoZSBleHRyYSB0ZXN0IGFmdGVyIHRpbWVfYWZ0ZXIoamlmZmllcywg
dGltZW8pIGlzIG5lZWRlZC4KPiAKPiBJIHNlZSBzbyBJIGFtIG9rYXkgd2l0aCB0aGUgY2hhbmdl
IG9mIExpdWppYW4tc2FuIHYzIHBhdGNoLgo+IEFsc28gYWdyZWUgd2l0aCB0aGUgY29tbWVudCB0
byBiZSBhZGRlZC4KPiAKClJpZ2h0LCBJIGxpa2UgdGhlIGN1cnJlbnQgcGF0Y2ggZnJvbSBMaXVq
aWFuLCBiZWNhdXNlIGl0cyBtb3JlCmNvbnNpc3RlbnQgd2l0aCB0aGUgZXhpc3RpbmcgY29kZSBp
biB0aGlzIGZpbGUuCgpMaXVqaWFuLCBDb3VsZCB5b3UgcmUtcG9zdCB3aXRoIGEgY29tbWVudCBh
ZGRlZCBhcyBzdWdnZXN0ZWQgYWJvdmU/CgpSZWdhcmRzClZpZ25lc2gKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
