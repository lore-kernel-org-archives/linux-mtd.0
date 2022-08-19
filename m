Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82EFC00140
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Aug 2022 02:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5SA/8ETeyNks4yT7gBY687CagmZ4w9PQeOJbqCVczU=; b=zr56F3E0qGCRWdmtgcf3g4Gh8i
	iHs8YksIPVCrQFGhVu0R85gYdXG2Nb0XJ102nab/ve2D2FKJShCuPRcyE0v2uvFt4FfpmMgh6aZmM
	G7w+fkteIoVEgdgiKUrgDKvfRCy9vA9ElkRLakY+nCeFnXPY6V05lxlnoLXPF74Ia4jyzpK5sPqTA
	yP+uG93jU7lVuP7x5Kp7etkKqTidyL2Adc1L3S004dp1phnKtpWAOhjvUwhEAducInZA8AxA/cfaA
	bfzpvH/iFlLXuHuO+GUkxYP5WaY8imy7vMKqEYC6N57hJitG3aI2DyqoMw7oy5U2LedUaNJhf9qJq
	n11AsJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOrtG-00Efwc-IK; Fri, 19 Aug 2022 02:37:42 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOrtA-00Efkq-UV
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2022 02:37:39 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M85Td3QV7zGpg4;
	Fri, 19 Aug 2022 10:35:49 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 19 Aug 2022 10:37:23 +0800
Subject: Re: [PATCH -next] mtd/ftl: Fix memleak in ftl_add_mtd()
To: Richard Weinberger <richard@nod.at>, <cuigaosheng1@huawei.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, <gongruiqi1@huawei.com>,
	<wangweiyang2@huawei.com>
References: <20220715071105.2321311-1-cuigaosheng1@huawei.com>
 <6733eee6-bfb6-7ee9-1331-2a739520fcd5@huawei.com>
 <1160016027.119085.1660805967979.JavaMail.zimbra@nod.at>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <df18397e-bcbe-7d3b-d316-5f22dd4cff9b@huawei.com>
Date: Fri, 19 Aug 2022 10:37:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1160016027.119085.1660805967979.JavaMail.zimbra@nod.at>
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_193737_192001_E5CA1DCE 
X-CRM114-Status: GOOD (  10.83  )
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

PiBUaGVyZSBzZWVtcyB0byBiZSBhIHByb2JsZW0gd2l0aCB5b3VyIGNhcHMgbG9jayBrZXkuIDst
KQoKSSB3aWwgYWRqdXN0IG15IGNhcHMgbG9jayBrZXksIFRoYW5rcyBmb3IgcmVtaW5kaW5nLgoK
PiBJcyB0aGlzIGxlYWsgb2JzZXJ2YWJsZSB2aWEga21lbWxlYWsgb3Igc3VjaD8KPiBJIGFsd2F5
cyB0aG91Z2h0IC0+cmVtb3ZlX2RldigpIHVuY29uZGl0aW9uYWxseSBkbyBhIGNsZWFudXAgbGF0
ZXIuCgpXaGVuIEknbSB3b3JraW5nIG9uIG90aGVyIGlzc3VlcyB3aXRoIG10ZCxJIG5lZWRlZCB0
byBhbmFseXplIHRoZSBtdGQgZHJpdmVyCmluaXRpYWxpemF0aW9uIHByb2Nlc3MsZHVyaW5nIHJl
YWRpbmcgdGhlIGNvZGUsIHJlZmVyIHRvIG90aGVyIGRyaXZlcgppbXBsZW1lbnRhdGlvbu+8jEkg
Zm91bmQgdGhpcyBwcm9ibGVtLCBub3Qga21lbWxlYWsuIFRoYW5rcy4KCuWcqCAyMDIyLzgvMTgg
MTQ6NTksIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUg
TWFpbCAtLS0tLQo+PiBWb246ICJjdWlnYW9zaGVuZyIgPGN1aWdhb3NoZW5nMUBodWF3ZWkuY29t
Pgo+Pgo+PiBQSU5HCj4gVGhlcmUgc2VlbXMgdG8gYmUgYSBwcm9ibGVtIHdpdGggeW91ciBjYXBz
IGxvY2sga2V5LiA7LSkKPiAgIAo+PiDlnKggMjAyMi83LzE1IDE1OjExLCBHYW9zaGVuZyBDdWkg
5YaZ6YGTOgo+Pj4gV2hlbiBhZGRfbXRkX2Jsa3RyYW5zX2RldiBmYWlsZWQsIHBhcnRpdGlvbidz
IG1lbW9yeSB3aWxsIGJlIGZyZWVkCj4+PiBieSBrZnJlZSwgYnV0IHRoZXJlIGFyZSBzb21lIHN0
cnVjdHVyZSBtZW1iZXJzIHRoYXQgYXJlIGFsbG9jYXRlZAo+Pj4gZm9yIG1lbW9yeSBpbmRlcGVu
ZGVudGx5LCBzdWNoIGFzIHBhcnRpdGlvbi0+VmlydHVhbEJsb2NrTWFwLAo+Pj4gcGFydGl0aW9u
LT5FVU5JbmZvLCBwYXJ0aXRpb24tPlpmZXJJbmZvLCBhbmQgcGFydGl0aW9uLT5iYW1fY2FjaGUs
Cj4+PiBzbyBrZnJlZShwYXJ0aXRpb24pIG1heSBjYXVzZSBtZW1vcnkgbGVha3MsIHVzaW5nIGZ0
bF9mcmVlcGFydChwYXJ0aXRpb24pCj4+PiB3aWxsIGZpeCBpdC4KPiBJcyB0aGlzIGxlYWsgb2Jz
ZXJ2YWJsZSB2aWEga21lbWxlYWsgb3Igc3VjaD8KPiBJIGFsd2F5cyB0aG91Z2h0IC0+cmVtb3Zl
X2RldigpIHVuY29uZGl0aW9uYWxseSBkbyBhIGNsZWFudXAgbGF0ZXIuCj4KPj4+IEZpeGVzOiAx
ZGExNzdlNGMzZjQgKCJMaW51eC0yLjYuMTItcmMyIikKPj4+IFNpZ25lZC1vZmYtYnk6IEdhb3No
ZW5nIEN1aSA8Y3VpZ2Fvc2hlbmcxQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMv
bXRkL2Z0bC5jIHwgMSArCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvZnRsLmMgYi9kcml2ZXJzL210ZC9mdGwuYwo+
Pj4gaW5kZXggZjY1NWQyOTA1MjcwLi4yMDAyNzFiZGM3YWEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2
ZXJzL210ZC9mdGwuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQvZnRsLmMKPj4+IEBAIC0xMDMxLDYg
KzEwMzEsNyBAQCBzdGF0aWMgdm9pZCBmdGxfYWRkX210ZChzdHJ1Y3QgbXRkX2Jsa3RyYW5zX29w
cyAqdHIsCj4+PiBzdHJ1Y3QgbXRkX2luZm8gKm10ZCkKPj4+ICAgIAkJcGFydGl0aW9uLT5tYmQu
ZGV2bnVtID0gLTE7Cj4+PiAgICAJCWlmICghYWRkX210ZF9ibGt0cmFuc19kZXYoJnBhcnRpdGlv
bi0+bWJkKSkKPj4+ICAgIAkJCXJldHVybjsKPj4+ICsJCWZ0bF9mcmVlcGFydChwYXJ0aXRpb24p
Owo+Pj4gICAgCX0KPj4+ICAgIAo+Pj4gICAgCWtmcmVlKHBhcnRpdGlvbik7Cj4gLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
