Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2936BC77B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTsqVAfUT2HuwxT5O3zQ5grwrQHU39XSWtCjRTV9+mk=; b=uTLcXnu3BZBPly
	1WQn0Hv9ctLYCXe0RxxZbsGAYVH/FOmQVAyo3SerZGKUH8owau03EKoyerb2IpK65TcejkuoEFf6P
	WfgsotVGnntJ+yNaVny0YwO7Xoi0x8W5tsDRUVxDBuu+oCaMQzOiMwuvb27X+ae11GIzX27hmmZ1R
	mqvhKV0BraYxiw1SWH1Pg4QQNy3YDT8YSbm4o2BrIUHskTNESbyB7W5LyrRCj8SIP4qh3saSGZbTD
	A6XVIM95Pu5rX0bDR6CFr5sI1wAUbqwDiCxh1KVFuOCsE9jKZfDZl0E2QxwrFhxRey8KFjWob+G9D
	FVDB7nKb4FYYpjEOj9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptshn-0024EK-25;
	Tue, 02 May 2023 16:18:19 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptshh-0024CB-0R;
	Tue, 02 May 2023 16:18:15 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 689AC5FD54;
	Tue,  2 May 2023 19:18:05 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683044285;
	bh=KB7t1gI+RMBNvw7I7y9I6bRPUNqRZKglTVgYjRU9Y14=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Z3B+mSkDfgXw9RskkN1I/SKq0O+hFAHDs0e4zk5SbhXAdZBYCR2WNZOb2lN5fkMvJ
	 MdRwj4xnCFODLABxQF+fp9up4WfxCQmXOX8mo4iqDGnlHgtF/qmmTpoxTDJzgNl74g
	 b8BZkW+7YxPoOYVxNlFUhPHtrYrf/itgDy3FtX1MesaBC1inCBZbsVwdIJgBUjyI+/
	 jikgsc13261kDhbmlurt2Uadm2qUVoM5E8xxDyIVKqh7MJGy+QIAeE53AGPi0ilfG/
	 sgb4wwVIXfZhPoPcOMKQEwCwLVfInHWavKuPV4ybfhuGMayAyowrJxrpYmzq10uNa7
	 gtWV0R9VD13Dg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  2 May 2023 19:18:02 +0300 (MSK)
Message-ID: <8996d53c-54ff-6a37-e08b-95cae0629703@sberdevices.ru>
Date: Tue, 2 May 2023 19:13:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <oxffffaa@gmail.com>,
	<kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, yonghui.yu <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230413122252.0a8efcd8@xps-13>
 <569a948e-654a-b21f-8a4f-55dc4b295387@sberdevices.ru>
 <60fa656e-bda1-1de6-a79e-3e3041cd69a8@sberdevices.ru>
 <780c0cae-18b6-2652-1c2c-6d398ea60451@amlogic.com>
 <e7c49f2d-b3c1-8d9b-76fe-c8759b37c7c7@sberdevices.ru>
 <20230418152505.72fc16da@xps-13>
 <15a6e415-1489-a81f-fc8f-2372678ad2cb@sberdevices.ru>
 <ee10bdeb-416c-70f0-d323-7107fe0746e8@amlogic.com>
 <5e4b395e-bf9d-0123-a0f2-2b378d950b29@sberdevices.ru>
 <fda1ae91-4bf8-6945-bd0d-b6dabc9cb4bd@sberdevices.ru>
 <a5010dcf-a8ce-f144-949c-687548cefce7@amlogic.com>
 <cf27b6b4-a75b-c5a6-32ea-ac20a2984192@sberdevices.ru>
 <20230502115913.78012d98@xps-13>
 <2274b432-d1a9-b3cf-4f7b-08c4a4c580b5@sberdevices.ru>
 <20230502132745.14349770@xps-13>
 <2b2f5cb4-84f7-65f6-13b2-42f965503023@sberdevices.ru>
 <20230502141703.29f0bc30@xps-13>
 <91cb8e19-e782-b847-8d2b-22580c371c34@sberdevices.ru>
 <20230502150553.65fdeb7f@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230502150553.65fdeb7f@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/02 12:31:00 #21205949
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_091813_554868_14CB96A9 
X-CRM114-Status: GOOD (  30.72  )
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

CgpPbiAwMi4wNS4yMDIzIDE2OjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgMiBNYXkgMjAyMyAx
NToyNDowOSArMDMwMDoKPiAKPj4gT24gMDIuMDUuMjAyMyAxNToxNywgTWlxdWVsIFJheW5hbCB3
cm90ZToKPj4+IEhpIEFyc2VuaXksCj4+Pgo+Pj4gUmljaGFyZCwgeW91ciBpbnB1dCBpcyB3ZWxj
b21lIGJlbG93IDotKQo+Pj4gICAKPj4+Pj4+Pj4+Pj4gSSBqdXN0IGNoZWNrZWQgSkZGUzIgbW91
bnQvdW1vdW50IGFnYWluLCBoZXJlIGlzIHdoYXQgaSBzZWU6Cj4+Pj4+Pj4+Pj4+IDApIEZpcnN0
IGF0dGVtcHQgdG8gbW91bnQgSkZGUzIuCj4+Pj4+Pj4+Pj4+IDEpIEl0IHdyaXRlcyBPT0IgdG8g
cGFnZSBOIChpJ20gdXNpbmcgcmF3IHdyaXRlKS4gSXQgaXMgY2xlYW5tYXJrZXIgdmFsdWUgMHg4
NSAweDE5IDB4MDMgMHgyMC4gTW91bnQgaXMgZG9uZS4KPj4+Pj4+Pj4+Pj4gMikgVW1vdW50IEpG
RlMyLiBEb25lLgo+Pj4+Pj4+Pj4+PiAzKSBTZWNvbmQgYXR0ZW1wdCB0byBtb3VudCBKRkZTMi4K
Pj4+Pj4+Pj4+Pj4gNCkgSXQgcmVhZHMgT09CIGZyb20gcGFnZSBOIChpJ20gdXNpbmcgcmF3IHJl
YWQpLiBWYWx1ZSBpcyAweDg1IDB4MTkgMHgwMyAweDIwLiBEb25lLgo+Pj4+Pj4+Pj4+PiA1KSBJ
dCByZWFkcyBwYWdlIE4gaW4gRUNDIG1vZGUsIGFuZCBpIGdldDoKPj4+Pj4+Pj4+Pj4gwqDCoMKg
wqAgamZmczI6IG10ZC0+cmVhZCgweDEwMCBieXRlcyBmcm9tIE4pIHJldHVybmVkIEVDQyBlcnJv
cgo+Pj4+Pj4+Pj4+PiA2KSBNb3VudCBmYWlsZWQuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFdl
IGFscmVhZHkgaGFkIHByb2JsZW0gd2hpY2ggbG9va3MgbGlrZSB0aGlzIG9uIGFub3RoZXIgZGV2
aWNlLiBTb2x1dGlvbiB3YXMgdG8gdXNlIE9PQiBhcmVhIHdoaWNoIGlzCj4+Pj4+Pj4+Pj4+IG5v
dCBjb3ZlcmVkIGJ5IEVDQyBmb3IgSkZGUzIgY2xlYW5tYXJrZXJzLiAgICAgICAgCj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4gb2ssIHNvIHRoZXJlIGlzIG5vdCBFQ0MgcGFyaXR5IGJ5dGVzIGFuZCBtdGQt
PnJlYWQoKSByZXR1cm5zIEVDQyBlcnJvci4KPj4+Pj4+Pj4+IGRvZXMgaXQgaGF2ZSB0byB1c2Ug
cmF3IHdyaXRlL3JlYWQgb24gc3RlcCAxKSBhbmQgNCk/Cj4+Pj4+Pj4+PiAgICAgICAgIAo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBJZiBpJ20gdXNpbmcgbm9uIHJhdyBhY2Nlc3MgdG8gT09CLCBmb3IgZXhh
bXBsZSB3cml0ZSBPT0IgKHVzZXIgYnl0ZXMpIGluIEVDQyBtb2RlLCB0aGVuCj4+Pj4+Pj4+IHN0
ZXBzIDEpIGFuZCA0KSBhbmQgNSkgcGFzc2VzIG9rLCBidXQgd3JpdGUgdG8gdGhpcyBwYWdlIHdp
bGwgYmUgaW1wb3NzaWJsZSAoZm9yIGV4YW1wbGUgSkZGUzIKPj4+Pj4+Pj4gd3JpdGVzIHRvIHN1
Y2ggcGFnZXMgbGF0ZXIpIC0gd2UgY2FuJ3QgdXBkYXRlIEVDQyBjb2RlcyBwcm9wZXJseSB3aXRo
b3V0IGVyYXNpbmcgd2hvbGUgcGFnZS4KPj4+Pj4+Pj4gV3JpdGUgb3BlcmF0aW9uIHdpbGwgYmUg
ZG9uZSB3aXRob3V0IHByb2JsZW0sIGJ1dCByZWFkIHdpbGwgdHJpZ2dlciBFQ0MgZXJyb3JzIGR1
ZSB0byBicm9rZW4KPj4+Pj4+Pj4gRUNDIGNvZGVzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJbiBnZW5l
cmFsIHByb2JsZW0gdGhhdCB3ZSBkaXNjdXNzIGlzIHRoYXQgaW4gY3VycmVudCBpbXBsZW1lbnRh
dGlvbiBkYXRhIGFuZCBPT0IgY29uZmxpY3RzCj4+Pj4+Pj4+IHdpdGggZWFjaCBvdGhlciBieSBz
aGFyaW5nIHNhbWUgRUNDIGNvZGVzLCB0aGVzZSBFQ0MgY29kZXMgY291bGQgYmUgd3JpdHRlbiBv
bmx5IG9uY2UgKHdpdGhvdXQKPj4+Pj4+Pj4gZXJhc2luZyksIHdoaWxlIGRhdGEgYW5kIE9PQiBo
YXMgZGlmZmVyZW50IGNhbGxiYWNrcyB0byBhY2Nlc3MgYW5kIHRodXMgc3VwcG9zZWQgdG8gd29y
awo+Pj4+Pj4+PiBzZXBhcmF0ZWx5LiAgICAgIAo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhlIGZhY3QgdGhh
dCB0aGVyZSBtaWdodCBiZSBoZWxwZXJzIGp1c3QgZm9yIHdyaXRpbmcgT09CIGFyZWFzIG9yIGp1
c3QKPj4+Pj4+PiBpbi1iYW5kIGFyZWFzIGFyZSBvcHRpbWl6YXRpb25zLiBOQU5EIHBhZ2VzIGFy
ZSBtZWFudCB0byBiZSB3cml0dGVuIGEKPj4+Pj4+PiBzaW5nbGUgdGltZSwgbm8gbWF0dGVyIHdo
YXQgcG9ydGlvbiB5b3Ugd3JpdGUuIEluIHNvbWUgY2FzZXMsIGl0IGlzCj4+Pj4+Pj4gcG9zc2li
bGUgdG8gcGVyZm9ybSBzdWJwYWdlIHdyaXRlcyBpZiB0aGUgY2hpcCBzdXBwb3J0cyBpdC4gUGFn
ZXMgbWF5Cj4+Pj4+Pj4gYmUgc3BsaXQgaW50byBzZXZlcmFsIGFyZWFzIHdoaWNoIGNvdmVyIGEg
cGFydGlhbCBpbi1iYW5kIGFyZWEgKmFuZCogYQo+Pj4+Pj4+IHBhcnRpYWwgT09CIGFyZWEuIElm
IHlvdSB3cml0ZSBpbnRvIHRoZSBpbi1iYW5kICpvciogb3V0LW9mLWJhbmQgYXJlYXMKPj4+Pj4+
PiBvZiBhIGdpdmVuIHN1YnBhZ2UsIHlvdSAqY2Fubm90KiB3cml0ZSB0aGUgb3RoZXIgcGFydCBs
YXRlciB3aXRob3V0ICAgICAgCj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzIGZvciBkZXRhaWxzISBTbyBp
biBjYXNlIG9mIEpGRlMyIGl0IGxvb2tzIGxpa2Ugc3RyYW5nZSwgdGhhdCBpdCB0cmllcwo+Pj4+
Pj4gdG8gd3JpdGUgcGFnZSBhZnRlciB3cml0aW5nIGNsZWFuIG1hcmtlcnMgdG8gaXQgYmVmb3Jl
PyBJbiB0aGUgb2xkIHZlbmRvcidzCj4+Pj4+PiBkcml2ZXIgT09CIHdyaXRlIGNhbGxiYWNrIGlz
IHN1cHByZXNzZWQgYnkgcmV0dXJuIDAgYWx3YXlzIGFuZCBKRkZTMiB3b3Jrcwo+Pj4+Pj4gY29y
cmVjdGx5LiAgICAKPj4+Pj4KPj4+Pj4gQ2FuIHlvdSBwb2ludCB0aGUgY29kZSB5b3UncmUgbWVu
dGlvbmluZz8gKGJvdGggd2hhdCBKRkZTMiB3aGljaCBsb29rcwo+Pj4+PiBzdHJhbmdlIHRvIHlv
dSBhbmQgdGhlIG9sZCB2ZW5kb3IgaGFjaykgICAgCj4+Pj4KPj4+PiBIZXJlIGlzIHZlcnNpb24g
b2YgdGhlIG9sZCB2ZW5kb3IncyBkcml2ZXI6Cj4+Pj4KPj4+PiBodHRwczovL2dpdGh1Yi5jb20v
a3N6YXEvbGludXgtYW1sb2dpYy9ibG9iL21hc3Rlcl9uZXdfYW1wb3J0cy9kcml2ZXJzL2FtbG9n
aWMvbmFuZC9uYW5kL2FtbF9uYW5kLmMjTDMyNjAKPj4+Pgo+Pj4+IEluIG15IHZlcnNpb24gdGhl
cmUgaXMgbm8gQlVHKCkgdGhlcmUsIGJ1dCBpdCBpcyBzYW1lIGRyaXZlciBmb3IgdGhlIHNhbWUg
Y2hpcC4KPj4+Pgo+Pj4+IEFib3V0IEpGRlMyIC0gaSBkaWRuJ3QgY2hlY2sgaXRzIHNvdXJjZSBj
b2RlLCBidXQgd2hhdCBJIGNhbiBzZWUgdXNpbmcgcHJpbnRrKCksIGlzIHRoYXQgaXQgZmlyc3QK
Pj4+PiB0cmllcyB0byB3cml0ZSBjbGVhbm1hcmtlciB1c2luZyBPT0Igd3JpdGUgY2FsbGJhY2su
IFRoZW4gbGF0ZXIgaXQgdHJpZXMgdG8gd3JpdGUgdG8gdGhpcyBwYWdlLCBzbwo+Pj4+IG1heSBi
ZSBpdCBpcyB1bmV4cGVjdGVkIGJlaGF2aW91ciBvZiBKRkZTMj8gIAo+Pj4KPj4+IFRCSCBJIGFt
IG5vdCBrbm93bGVkZ2VhYmxlIGFib3V0IEpGRlMyLCBtYXliZSBSaWNoYXJkIGNhbiBoZWxwIGhl
cmUuCj4+Pgo+Pj4gQXJlIHlvdSBzdXJlIHlvdSBmbGFzaCBpcyByZWNvZ25pemVkIGJ5IEpGRlMy
IGFzIGJlaW5nIGEgTkFORCBkZXZpY2U/Cj4+PiBEaWQgeW91IGVuYWJsZSBDT05GSUdfSkZGUzJf
RlNfV1JJVEVCVUZGRVIgY29ycmVjdGx5PyBCZWNhdXNlCj4+PiBjbGVhbm1hcmtlciBzZWVtIHRv
IGJlIGRpc2NhcmRlZCB3aGVuIHVzaW5nIGEgTkFORCBkZXZpY2UsIGFuZAo+Pj4gcmVjb2duaXpp
bmcgdGhlIGRldmljZSBhcyBhIE5BTkQgZGV2aWNlIHJlcXVpcmVzIHRoZSBhYm92ZSBvcHRpb24g
dG8gYmUKPj4+IHNldCBhcHBhcmVudGx5LiAgCj4+Cj4+IFllcywgSSBoYXZlCj4+Cj4+IENPTkZJ
R19KRkZTMl9GU19XUklURUJVRkZFUj15Cj4+Cj4+IEFuZCBpIHNlZSwgdGhhdCBqZmZzMl9tYXJr
X2VyYXNlZF9ibG9jaygpIGNhbGxzIGpmZnMyX2NsZWFubWFya2VyX29vYigpIHdoaWNoIGNoZWNr
cyB0aGF0IHdlIGhhdmUgTVREX05BTkRGTEFTSC4gVGhpcwo+PiBjaGVjayBpcyB0cnVlLCBzbyB0
aGVuIGpmZnMyX3dyaXRlX25hbmRfY2xlYW5tYXJrZXIoKSBpcyBjYWxsZWQgYW5kIHRoZXJlIGlz
IE9PQiB3cml0ZSBpbiBpdC4gU28gSSBzZWUgb3Bwb3NpdGUgdGhpbmc6Cj4+IGNsZWFubWFya2Vy
cyBhcmUgbm90IGRpc2NhcmRlZCB3aXRoIE5BTkQgZGV2aWNlLiAKPiAKPiBFeGNlbGxlbnQuIFNv
IHdoZW4gY2xlYW5tYXJrZXJfc2l6ZSA9PSAwLCBpdCBtZWFucyB0aGVyZSBpcyBubwo+IGNsZWFu
bWFya2VyLiBCdXQgaWYgaXQgaXMgYSBOQU5EIGRldmljZSwgd2Ugd3JpdGUgdGhlIG1hcmtlciBh
bnl3YXkuCj4gCj4gV2VsbCBJIGd1ZXNzIGl0IHVzZWQgdG8gd29yayBvbiBvbGQgY29udHJvbGxl
cnMgdXNpbmcgYSBIYW1taW5nIEVDQwo+IGVuZ2luZSBub3QgcHJvdGVjdGluZyBhbnkgdXNlciBP
T0IgYnl0ZXMsIHNvIHdyaXRpbmcgdGhlIGNsZWFuIG1hcmtlcnMKPiB3b3VsZCBzaW1wbHkgbm90
IGxlYWQgdG8gRUNDIGJ5dGVzIGJlaW5nIHByb2R1Y2VkL3dyaXR0ZW4uIE9yIGl0IG1pZ2h0Cj4g
aGF2ZSB3b3JrZWQgYXMgd2VsbCBvbiBjb250cm9sbGVyIGRyaXZlcnMgbm90IGVuYWJsaW5nIHRo
ZSBFQ0MgZW5naW5lCj4gd2hlbiBwZXJmb3JtaW5nIE9PQi1vbmx5IHdyaXRlcy4gSXQgYWxzbyBy
ZXF1aXJlcyB0aGUgY2hpcCB0byBiZSBvbGQKPiBlbm91Z2ggdG8gc3VwcG9ydCBtdWx0aXBsZSB3
cml0ZXMgb24gdGhlIHNhbWUgKHN1YilwYWdlIGFzIGxvbmcgYXMgdGhlCj4gd3JpdHRlbiBiaXRz
IGRvIG5vdCBvdmVybGFwPwoKWWVzLCB3aXRoIGNvbnRyb2xsZXIgd2hpY2ggc3VwcG9ydHMgc3Vj
aCBtb2RlcyB0aGVyZSB3aWxsIGJlIG5vIHByb2JsZW0gaGVyZSEKV2hhdCBpIHNlZSwgaXMgdGhh
dCB0aGlzIGNvbnRyb2xsZXIgZG9lc24ndCBzdXBwb3J0IG11bHRpcGxlIHdyaXRlcyB0byB0aGUK
c2FtZSBwYWdlIGluIEVDQyBtb2RlKGUuZy4gaXQgY2FuJ3QgdXBkYXRlIEVDQyBjb3JyZWN0bHkp
LiBTbyBpbiB2MiBpJ3ZlIGFkZGVkCnBhdGNoIHdoaWNoIG1vdmVzIE9PQiBvdXQgb2YgRUNDIGFy
ZWEsIHRodXMgSkZGUzIgZHJpdmVyIHdpbGwgd29yayBjb3JyZWN0bHkuClNvIGZvciBtZSBtYWlu
IHF1ZXN0aW9uIGhlcmUgaXM6CgpIb3cgSkZGUzIgc2hvdWxkIHdvcmsgd2l0aCBjb250cm9sbGVy
cyB3aGVyZSB3ZSBjYW4ndCB1cGRhdGUgZGF0YSBhbmQgT09CCmluZGVwZW5kZW50bHk/IERyaXZl
ciBvZiB0aGlzIGZpbGVzeXN0ZW0ga25vd3Mgbm90aGluZyBhYm91dCB0aGlzIGZlYXR1cmVzIG9m
CnRoZSBjb250cm9sbGVyLgoKT3IgSkZGUzIgd29ya3MgaW5jb3JyZWN0bHkgaW4gbXkgY2FzZSB3
aGVuIGl0IHRyaWVzIHRvIGNhbGwgd3JpdGUgcGFnZSBjYWxsYmFjawphZnRlciBjYWxsaW5nIHdy
aXRlIE9PQiBjYWxsYmFjayAoSUlVQyBpdCBpcyBiZXR0ZXIgdG8gYXNrIFJpY2hhcmQgYXMgWW91
IG1lbnRpb25lZCBhYm92ZSkuCgpPciBtYXkgYmUgaXQgaXMgYmV0dGVyIHRvIHN1cHByZXNzIE9P
QiB3cml0ZSBjYWxsYmFjayAob3Igc2V0IGl0IHRvIE5VTEwpIGluIHRoaXMKZHJpdmVyIGFzIGlu
IHZlbmRvcidzIGRyaXZlcj8KClRoYW5rcywgQXJzZW5peQoKPiAKPiBQZXJoYXBzIHRoYXQncyB3
aGF0IHRoZSBoYWNrIGluIHRoZSBvbGQgZHJpdmVyIGlzIGZvci4gQnV0IHRoYXQncwo+IElNSE8g
YnJva2VuIGluIGNhc2Ugb2YgdW5leHBlY3RlZCByZWJvb3QgOi0pCj4gCj4gTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
