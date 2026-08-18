Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB238C5DF67
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Aug 2026 04:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpTk7i2OJD/2GIorTycf8FctNc77zpGh1eLjeJnsj8w=; b=ba3KQ7HtPy1YFdMGqxjGUWvrAk
	k4j0zPfqYPkQciMvUzyKaqNsL1Cca5wd9+9TBkT59kMRTxdI40Ks1r1/kFP9mG5Tgj6q7qCI32eTR
	hpGkhlkX9/GnUn0v5lsvDWP4KNjP2ZTYDJf6+UXvh+kemkNSdTc8L4iCmDfq2YWxme7vjnze1J+xF
	QNMUoji6uCHuFgbC8GS1czutgaYrY4jH/2OtL/lvS5IVo91TeyCpXUuN/yYIk9kdX0HNuxj0fR9kO
	FHWl13dJYDgVA7saqANRFT8Woty3UOqTO1bDa0lGOhx9PqCFo1JglTJz73gElFjj8aa78q1zSFYL4
	syxCnXSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwBjP-00000007IPa-1BMO;
	Tue, 18 Aug 2026 04:47:23 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwBjK-00000007IOQ-359F
	for linux-mtd@lists.infradead.org;
	Tue, 18 Aug 2026 04:47:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=McZMtrUa3hzu0hmypcB7NhE1Zyyi8suts0Khhwn9SGU=;
	b=JlMsbSRlu4gGhwvCetSIAp9Ez0mXGF5lMdEZG9PDhnRs/GdbJEcQGtGF4dbV1N2N/Mlrjb/Jc
	OLCMJfOh7NZTl/YOqzq0DO/mXKzWfpmffMuiHjTmrh4t+XGbQ+at+yoeTCLZAwpT5fsw/kBs4x4
	ruWAdsRthoJzEm7TcbdryEA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hPH2s4fBjzRhR0;
	Tue, 18 Aug 2026 12:36:21 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 61B4340561;
	Tue, 18 Aug 2026 12:47:00 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 12:46:59 +0800
Subject: Re: [PATCH v6.12.y 1/2] mtd: ubi: skip programming unused bits in ubi
 headers
To: Dominique Martinet <dominique.martinet@atmark-techno.com>,
	<stable@vger.kernel.org>
CC: Richard Weinberger <richard@nod.at>, Miquel Raynal
	<miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
 <20260818-ubi-backports-v1-1-324d6816d2ae@atmark-techno.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <3fec694c-386d-2227-fe72-25e2c909a5a4@huawei.com>
Date: Tue, 18 Aug 2026 12:46:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260818-ubi-backports-v1-1-324d6816d2ae@atmark-techno.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_214719_444540_11E5F625 
X-CRM114-Status: GOOD (  18.40  )
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

5ZyoIDIwMjYvOC8xOCAxMDowOSwgRG9taW5pcXVlIE1hcnRpbmV0IOWGmemBkzoKPiBGcm9tOiBD
aGVuZyBNaW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+IAo+IFRoaXMgcGF0Y2gg
cHJldmVudHMgdW5uZWNlc3NhcnkgcHJvZ3JhbW1pbmcgb2YgYml0cyBpbiBlY19oZHIgYW5kCj4g
dmlkX2hkciB0aGF0IGFyZSBub3QgdXNlZCBvciByZWFkIGR1cmluZyBub3JtYWwgVUJJIG9wZXJh
dGlvbi4gVGhlc2UKPiB1bnVzZWQgYml0cyBhcmUgdHlwY2lhbGx5IGFscmVhZHkgc2V0IHRvIDEg
aW4gZXJhc2VkIGZsYXNoIGFuZCBkbyBub3QKPiBuZWVkIHRvIGJlIGV4cGxpY2l0bHkgcHJvZ3Jh
bW1lZCB0byAwIGlmIHRoZXkgYXJlIG5vdCB1c2VkLgo+IAo+IFByb2dyYW1taW5nIHN1Y2ggdW51
c2VkIGFyZWFzIG9mZmVycyBubyBmdW5jdGlvbmFsIGJlbmVmaXQgYW5kIG1heQo+IHJlc3VsdCBp
biB1bm5lY2Vzc2FyeSBmbGFzaCB3ZWFyLCByZWR1Y2luZyB0aGUgb3ZlcmFsbCBsaWZldGltZSBv
ZiB0aGUKPiBkZXZpY2UuIEJ5IHNraXBwaW5nIHRoZXNlIHdyaXRlcywgd2UgcHJlc2VydmUgdGhl
IGZsYXNoIHN0YXRlIGFzIG11Y2ggYXMKPiBwb3NzaWJsZSBhbmQgbWluaW1pemUgd2VhciBjYXVz
ZWQgYnkgcmVkdW5kYW50IG9wZXJhdGlvbnMuCj4gCj4gVGhpcyBjaGFuZ2UgZW5zdXJlcyB0aGF0
IG9ubHkgbmVjZXNzYXJ5IGZpZWxkcyBhcmUgd3JpdHRlbiB3aGVuIHByZXBhcmluZwo+IFVCSSBo
ZWFkZXJzLCBpbXByb3ZpbmcgZmxhc2ggZWZmaWNpZW5jeSB3aXRob3V0IGFmZmVjdGluZyBmdW5j
dGlvbmFsaXR5Lgo+IAo+IEFkZGl0aW9uYWxseSwgdGhlIEtpb3hpYSBUQzU4TlZHMVMzSFRBMDAg
ZGF0YXNoZWV0IChwYWdlIDYzKSBhbHNvIG5vdGVzCj4gdGhhdCBjb250aW51b3VzIHByb2dyYW0v
ZXJhc2UgY3ljbGluZyB3aXRoIGEgaGlnaCBwZXJjZW50YWdlIG9mICcwJyBiaXRzCj4gaW4gdGhl
IGRhdGEgcGF0dGVybiBjYW4gYWNjZWxlcmF0ZSBibG9jayBlbmR1cmFuY2UgZGVncmFkYXRpb24u
Cj4gVGhpcyBmdXJ0aGVyIHN1cHBvcnRzIGF2b2lkaW5nIGxhcmdlIDB4MDAgcGF0dGVybnMuCj4g
Cj4gTGluazogaHR0cHM6Ly9ldXJvcGUua2lveGlhLmNvbS9jb250ZW50L2RhbS9raW94aWEvbmV3
aWRyL3Byb2R1Y3RpbmZvL2RhdGFzaGVldC8yMDE5MTAvRFNUX1RDNThOVkcxUzNIVEEwMC1UREVf
RU5fMzE0NDIucGRmCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWlu
Z2xpbkBteGljLmNvbS50dz4KPiBSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJh
eW5hbEBib290bGluLmNvbT4KPiBSZXZpZXdlZC1ieTogWmhpaGFvIENoZW5nIDxjaGVuZ3poaWhh
bzFAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hh
cmRAbm9kLmF0Pgo+IChjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDc3NTMwZDFhNzhjYTVjMjc0
ZTM3ZDY0OTRhOTY1MjIzNjcyNjMwYjIpCj4gU2lnbmVkLW9mZi1ieTogRG9taW5pcXVlIE1hcnRp
bmV0IDxkb21pbmlxdWUubWFydGluZXRAYXRtYXJrLXRlY2huby5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL210ZC91YmkvaW8uYyB8IDEwICsrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspCj4gCgoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8x
QGh1YXdlaS5jb20+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9pby5jIGIvZHJpdmVy
cy9tdGQvdWJpL2lvLmMKPiBpbmRleCBhNDk5OWJjZTQzNWYuLjkxNWViNjRjYjAwMSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC91YmkvaW8uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9pby5j
Cj4gQEAgLTg2OCw2ICs4NjgsOCBAQCBpbnQgdWJpX2lvX3dyaXRlX2VjX2hkcihzdHJ1Y3QgdWJp
X2RldmljZSAqdWJpLCBpbnQgcG51bSwKPiAgIAkJcmV0dXJuIC1FUk9GUzsKPiAgIAl9Cj4gICAK
PiArCW1lbXNldCgoY2hhciAqKWVjX2hkciArIFVCSV9FQ19IRFJfU0laRSwgMHhGRiwgdWJpLT5l
Y19oZHJfYWxzaXplIC0gVUJJX0VDX0hEUl9TSVpFKTsKPiArCj4gICAJZXJyID0gdWJpX2lvX3dy
aXRlKHViaSwgZWNfaGRyLCBwbnVtLCAwLCB1YmktPmVjX2hkcl9hbHNpemUpOwo+ICAgCXJldHVy
biBlcnI7Cj4gICB9Cj4gQEAgLTExNTAsNiArMTE1MiwxNCBAQCBpbnQgdWJpX2lvX3dyaXRlX3Zp
ZF9oZHIoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0sCj4gICAJCXJldHVybiAtRVJP
RlM7Cj4gICAJfQo+ICAgCj4gKwlpZiAodWJpLT52aWRfaGRyX3NoaWZ0KSB7Cj4gKwkJbWVtc2V0
KChjaGFyICopcCwgMHhGRiwgdWJpLT52aWRfaGRyX3NoaWZ0KTsKPiArCQltZW1zZXQoKGNoYXIg
KilwICsgdWJpLT52aWRfaGRyX3NoaWZ0ICsgVUJJX1ZJRF9IRFJfU0laRSwgMHhGRiwKPiArCQkg
ICAgICAgdWJpLT52aWRfaGRyX2Fsc2l6ZSAtICh1YmktPnZpZF9oZHJfc2hpZnQgKyBVQklfVklE
X0hEUl9TSVpFKSk7Cj4gKwl9IGVsc2Ugewo+ICsJCW1lbXNldCgoY2hhciAqKXAgKyBVQklfVklE
X0hEUl9TSVpFLCAweEZGLCB1YmktPnZpZF9oZHJfYWxzaXplIC0gVUJJX1ZJRF9IRFJfU0laRSk7
Cj4gKwl9Cj4gKwo+ICAgCWVyciA9IHViaV9pb193cml0ZSh1YmksIHAsIHBudW0sIHViaS0+dmlk
X2hkcl9hbG9mZnNldCwKPiAgIAkJCSAgIHViaS0+dmlkX2hkcl9hbHNpemUpOwo+ICAgCXJldHVy
biBlcnI7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
