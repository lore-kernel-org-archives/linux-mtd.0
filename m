Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE893CE7A9B
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI4ENkTnfowvfYwsZExF7YB5avmSQVrAno6QOcjx+Ks=; b=rz6WebN78uIPiOVnm11r0BrRFd
	aloW2Eu610qCNc2+rDyKq9vHmzwejP/yHb/Mdq1LbuXUonhD+lQytAzjcYVavXVOs0wSguDmNU4jJ
	pA2sA39dgNhAaRaxQ/jVBL0PNkFSgg4/JGGn6+xKo00NIX5RQil7Gm/MsXu5KFm0O7PIa4+IQZ3m2
	OtRJ9lv6jj1tCt56dEAurrsqZ4Wl0CYtQX7IZb1u56dXKmUnoPAbx500rYLa9PZNdIVGpkTEsQieg
	nQAZdYQR0hTHbKvZbifxkWPp8ZRifRDC/KmZP7r734R4P6coITVdCBPYNuEn+oia6qp/CT1p+wa9D
	2rn6/TWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq73-0000000Bv1X-10cx;
	Fri, 14 Nov 2025 09:29:01 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJq70-0000000Bv13-3EhN
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 09:29:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EPhjjw9jvWhXdsW7KJ+gvHj3YCMaaj9HqAmBiZasGfY=;
	b=qwQubv6piDdxYZtWXta0tQ03QhpAMHpJgtPEsx8kG0DdYmxU0TLhEC9HG84dpbnABvDRam/iq
	yxFZ6Sqwt/d0CftBV1nL2C89gkX0ORat9NlwHxq6U8LMhbHndmhxd8zgCIgzp8/h4wowtb2wi0V
	9FDa/fmsBYbE3KqgkCd5BCA=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4d7Bbt13KWzcb1j;
	Fri, 14 Nov 2025 17:26:50 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 41386180B66;
	Fri, 14 Nov 2025 17:28:43 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Nov 2025 17:28:42 +0800
Subject: Re: [PATCH v2 1/1] mtd: ubi: skip programming unused bits in ubi
 headers
To: Cheng Ming Lin <linchengming884@gmail.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <alvinzhou@mxic.com.tw>, <leoyu@mxic.com.tw>, Cheng Ming Lin
	<chengminglin@mxic.com.tw>
References: <20251114024452.2927429-1-linchengming884@gmail.com>
 <20251114024452.2927429-2-linchengming884@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <37a8a673-4c5e-fd61-ae63-6059be311a34@huawei.com>
Date: Fri, 14 Nov 2025 17:28:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20251114024452.2927429-2-linchengming884@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_012859_127219_7DB0C81F 
X-CRM114-Status: GOOD (  16.89  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNS8xMS8xNCAxMDo0NCwgQ2hlbmcgTWluZyBMaW4g0LS1wDoKPiBGcm9tOiBDaGVuZyBN
aW5nIExpbiA8Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+IAo+IFRoaXMgcGF0Y2ggcHJldmVu
dHMgdW5uZWNlc3NhcnkgcHJvZ3JhbW1pbmcgb2YgYml0cyBpbiBlY19oZHIgYW5kCj4gdmlkX2hk
ciB0aGF0IGFyZSBub3QgdXNlZCBvciByZWFkIGR1cmluZyBub3JtYWwgVUJJIG9wZXJhdGlvbi4g
VGhlc2UKPiB1bnVzZWQgYml0cyBhcmUgdHlwY2lhbGx5IGFscmVhZHkgc2V0IHRvIDEgaW4gZXJh
c2VkIGZsYXNoIGFuZCBkbyBub3QKPiBuZWVkIHRvIGJlIGV4cGxpY2l0bHkgcHJvZ3JhbW1lZCB0
byAwIGlmIHRoZXkgYXJlIG5vdCB1c2VkLgo+IAo+IFByb2dyYW1taW5nIHN1Y2ggdW51c2VkIGFy
ZWFzIG9mZmVycyBubyBmdW5jdGlvbmFsIGJlbmVmaXQgYW5kIG1heQo+IHJlc3VsdCBpbiB1bm5l
Y2Vzc2FyeSBmbGFzaCB3ZWFyLCByZWR1Y2luZyB0aGUgb3ZlcmFsbCBsaWZldGltZSBvZiB0aGUK
PiBkZXZpY2UuIEJ5IHNraXBwaW5nIHRoZXNlIHdyaXRlcywgd2UgcHJlc2VydmUgdGhlIGZsYXNo
IHN0YXRlIGFzIG11Y2ggYXMKPiBwb3NzaWJsZSBhbmQgbWluaW1pemUgd2VhciBjYXVzZWQgYnkg
cmVkdW5kYW50IG9wZXJhdGlvbnMuCj4gCj4gVGhpcyBjaGFuZ2UgZW5zdXJlcyB0aGF0IG9ubHkg
bmVjZXNzYXJ5IGZpZWxkcyBhcmUgd3JpdHRlbiB3aGVuIHByZXBhcmluZwo+IFVCSSBoZWFkZXJz
LCBpbXByb3ZpbmcgZmxhc2ggZWZmaWNpZW5jeSB3aXRob3V0IGFmZmVjdGluZyBmdW5jdGlvbmFs
aXR5Lgo+IAo+IEFkZGl0aW9uYWxseSwgdGhlIEtpb3hpYSBUQzU4TlZHMVMzSFRBMDAgZGF0YXNo
ZWV0IChwYWdlIDYzKSBhbHNvIG5vdGVzCj4gdGhhdCBjb250aW51b3VzIHByb2dyYW0vZXJhc2Ug
Y3ljbGluZyB3aXRoIGEgaGlnaCBwZXJjZW50YWdlIG9mICcwJyBiaXRzCj4gaW4gdGhlIGRhdGEg
cGF0dGVybiBjYW4gYWNjZWxlcmF0ZSBibG9jayBlbmR1cmFuY2UgZGVncmFkYXRpb24uCj4gVGhp
cyBmdXJ0aGVyIHN1cHBvcnRzIGF2b2lkaW5nIGxhcmdlIDB4MDAgcGF0dGVybnMuCj4gCj4gTGlu
azogaHR0cHM6Ly9ldXJvcGUua2lveGlhLmNvbS9jb250ZW50L2RhbS9raW94aWEvbmV3aWRyL3By
b2R1Y3RpbmZvL2RhdGFzaGVldC8yMDE5MTAvRFNUX1RDNThOVkcxUzNIVEEwMC1UREVfRU5fMzE0
NDIucGRmCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBt
eGljLmNvbS50dz4KPiAtLS0KPiAgIGRyaXZlcnMvbXRkL3ViaS9pby5jIHwgMTAgKysrKysrKysr
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5OiBaaGlo
YW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC91YmkvaW8uYyBiL2RyaXZlcnMvbXRkL3ViaS9pby5jCj4gaW5kZXggYTQ5OTliY2U0
Li5kZmI5YzI3YzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2lvLmMKPiArKysgYi9k
cml2ZXJzL210ZC91YmkvaW8uYwo+IEBAIC04NjgsNiArODY4LDggQEAgaW50IHViaV9pb193cml0
ZV9lY19oZHIoc3RydWN0IHViaV9kZXZpY2UgKnViaSwgaW50IHBudW0sCj4gICAJCXJldHVybiAt
RVJPRlM7Cj4gICAJfQo+ICAgCj4gKwltZW1zZXQoKGNoYXIgKillY19oZHIgKyBVQklfRUNfSERS
X1NJWkUsIDB4RkYsIHViaS0+ZWNfaGRyX2Fsc2l6ZSAtIFVCSV9FQ19IRFJfU0laRSk7Cj4gKwo+
ICAgCWVyciA9IHViaV9pb193cml0ZSh1YmksIGVjX2hkciwgcG51bSwgMCwgdWJpLT5lY19oZHJf
YWxzaXplKTsKPiAgIAlyZXR1cm4gZXJyOwo+ICAgfQo+IEBAIC0xMTUwLDYgKzExNTIsMTQgQEAg
aW50IHViaV9pb193cml0ZV92aWRfaGRyKHN0cnVjdCB1YmlfZGV2aWNlICp1YmksIGludCBwbnVt
LAo+ICAgCQlyZXR1cm4gLUVST0ZTOwo+ICAgCX0KPiAgIAo+ICsJaWYgKHViaS0+dmlkX2hkcl9z
aGlmdCkgewo+ICsJCW1lbXNldCgoY2hhciAqKXAsIDB4RkYsIHViaS0+dmlkX2hkcl9zaGlmdCk7
Cj4gKwkJbWVtc2V0KChjaGFyICopcCArIHViaS0+dmlkX2hkcl9zaGlmdCArIFVCSV9WSURfSERS
X1NJWkUsIDB4RkYsCj4gKwkJICAgICAgIHViaS0+dmlkX2hkcl9hbHNpemUgLSAodWJpLT52aWRf
aGRyX3NoaWZ0ICsgVUJJX1ZJRF9IRFJfU0laRSkpOwo+ICsJfSBlbHNlIHsKPiArCQltZW1zZXQo
KGNoYXIgKilwICsgVUJJX1ZJRF9IRFJfU0laRSwgMHhGRiwgdWJpLT52aWRfaGRyX2Fsc2l6ZSAt
IFVCSV9WSURfSERSX1NJWkUpOwo+ICsJfQo+ICsKPiAgIAllcnIgPSB1YmlfaW9fd3JpdGUodWJp
LCBwLCBwbnVtLCB1YmktPnZpZF9oZHJfYWxvZmZzZXQsCj4gICAJCQkgICB1YmktPnZpZF9oZHJf
YWxzaXplKTsKPiAgIAlyZXR1cm4gZXJyOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
