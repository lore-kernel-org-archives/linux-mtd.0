Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86151CD343B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 07:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfVVJxdh2xl0EglYCGCOT2fow7v9qlUKyh/AN2prjwI=; b=UoF7e3JUt1x8pPxpbScSxOFSop
	f/POwzri3ovF5+PcWDV54AplMcxDGEQVjtg2npsT175u7VMJfz2Sk6066CgPlMMpQzRg8/K2Hbrfs
	gx0DS5c4yVCoCoetJ3kSBQm/AWtmSqnB1ekJvguC7YFzCna2WkDY1v7cG39WcQeqCTmneiZFTWoYU
	g0VjZAi9TaexRRNWF3GaRbzCRWD8cauuhHskkZ56zPKq/u1q0uu6/xYjqNbDdPzTEKHbd/71zmy6W
	01nwM9LlnnNJZTZ+AYzpGRd44gVyNvwUgBdaWKk5YMYsuGcM728arjLlpxhf53Er3QWFTXrTznDCn
	J2VLQeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtQO-000000033xh-3kCx;
	Thu, 07 May 2026 07:45:36 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtQN-000000033xA-1rKP
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 07:45:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oPhLvozyduIQ9R43wIjbsXFY6+/JJjQHr+R3hmvfQlE=;
	b=kpLlHbQuevSRySV1ubHhBQ2uPbGcbbIcajKg8jh6cPfBFmTDgkZrXqXZeYYNnT+ZJ3uSmFDM0
	C6TaU+Xh4MT9INpP78dC8H3o4oKSty+NmvwHyne67Z38qLPenQFbnU+0UvoB+KNUyiRaa3bkURX
	V7AKB4qkcQDIbLg5b2rGEK4=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gB3yz27NKz1prPP;
	Thu,  7 May 2026 15:38:51 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B372140569;
	Thu,  7 May 2026 15:45:25 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 May 2026 15:45:25 +0800
Subject: Re: [PATCH 2/2] ubi: build: replace simple_strtoul with kstrtoul in
 bytes_str_to_int()
To: haoyu.lu <hechushiguitu666@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260507032308.16485-1-hechushiguitu666@gmail.com>
 <20260507032308.16485-2-hechushiguitu666@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7c4bf8d4-c561-f5bf-fc7f-3e384fe1a9e6@huawei.com>
Date: Thu, 7 May 2026 15:45:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260507032308.16485-2-hechushiguitu666@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_004535_803487_FA79F184 
X-CRM114-Status: GOOD (  18.84  )
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

1NogMjAyNi81LzcgMTE6MjMsIGhhb3l1Lmx1INC0tcA6Cj4gRnJvbTogSGFveXUgTHUgPGhlY2h1
c2hpZ3VpdHU2NjZAZ21haWwuY29tPgo+IAo+IFJlcGxhY2UgdGhlIGRlcHJlY2F0ZWQgc2ltcGxl
X3N0cnRvdWwoKSB3aXRoIGtzdHJ0b3VsKCkgaW4gdGhlCj4gYnl0ZXNfc3RyX3RvX2ludCgpIGhl
bHBlciBmdW5jdGlvbi4gU2luY2Uga3N0cnRvdWwoKSByZWplY3RzIHRyYWlsaW5nCj4gbm9uLW51
bWVyaWMgY2hhcmFjdGVycyAoc3VjaCBhcyB0aGUgRy9NL0sgc3VmZml4ZXMpLCB0aGUgbnVtZXJp
YyBwcmVmaXgKPiBpcyBmaXJzdCBleHRyYWN0ZWQgd2l0aCBzdHJzcG4oKSBhbmQgdGhlbiBwYXJz
ZWQgc2VwYXJhdGVseSBiZWZvcmUKPiBoYW5kbGluZyB0aGUgc3VmZml4Lgo+IAo+IFRoaXMgcHJv
dmlkZXMgcHJvcGVyIGVycm9yIGhhbmRsaW5nIHRocm91Z2ggdGhlIGtzdHJ0byogZmFtaWx5IHdo
aWxlCj4gcHJlc2VydmluZyB0aGUgZXhpc3Rpbmcgc3VmZml4IHNlbWFudGljcyBmb3IgYnl0ZSBj
b3VudCBwYXJhbWV0ZXJzLgo+IAo+IE5vdGU6IHRoZSBvcmlnaW5hbCBzaW1wbGVfc3RydG91bCgp
IHdpdGggYmFzZT0wIGFjY2VwdGVkIGhleGFkZWNpbWFsCj4gKDB4IHByZWZpeCkgYW5kIG9jdGFs
ICgwIHByZWZpeCkgZm9ybWF0cywgd2hpbGUga3N0cnRvdWwoKSB3aXRoIGJhc2U9MTAKPiBvbmx5
IHN1cHBvcnRzIGRlY2ltYWwuIFRoaXMgaXMgbm90IGEgcHJhY3RpY2FsIGNvbmNlcm4gc2luY2Ug
TVREIGJ5dGUKPiBjb3VudCBwYXJhbWV0ZXJzIGFyZSBhbHdheXMgc3BlY2lmaWVkIGFzIGRlY2lt
YWwgdmFsdWVzIGluIGJvb3QKPiBwYXJhbWV0ZXJzLgpUaGUgdWJpIGNvdWxkIGJlIGxvYWRlZCBi
eSBtb2R1bGUgaW5zZXJ0aW9uLCBtYW55IHZlbmRvcnMgc2V0IHBhcmFtIAondmlkX2hkcl9vZmZz
JyB0byBzYXZlIHNwYWNlLiBXZSBjYW5ub3QgbWFrZSB0aGUgYXNzdW1wdGlvbiB0aGF0IGFsbCAK
dXNlcnMgdXNlIHRoZSBkZWNpbWFsIHN5c3RlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW95dSBM
dSA8aGVjaHVzaGlndWl0dTY2NkBnbWFpbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91Ymkv
YnVpbGQuYyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC91YmkvYnVpbGQuYyBiL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gaW5kZXggMDNlZjE5NWRj
MjVjLi43Y2I2YmE0YTM4NDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMK
PiArKysgYi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IEBAIC0xNDI2LDE2ICsxNDI2LDI3IEBA
IG1vZHVsZV9leGl0KHViaV9leGl0KTsKPiAgICAqLwo+ICAgc3RhdGljIGludCBieXRlc19zdHJf
dG9faW50KGNvbnN0IGNoYXIgKnN0cikKPiAgIHsKPiAtCWNoYXIgKmVuZHA7Cj4gICAJdW5zaWdu
ZWQgbG9uZyByZXN1bHQ7Cj4gKwl1bnNpZ25lZCBpbnQgbnVtX2xlbjsKPiArCWNoYXIgbnVtX2J1
ZlszMl07Cj4gICAKPiAtCXJlc3VsdCA9IHNpbXBsZV9zdHJ0b3VsKHN0ciwgJmVuZHAsIDApOwo+
IC0JaWYgKHN0ciA9PSBlbmRwIHx8IHJlc3VsdCA+PSBJTlRfTUFYKSB7Cj4gKwkvKiBGaW5kIHRo
ZSBsZW5ndGggb2YgdGhlIG51bWVyaWMgcHJlZml4ICovCj4gKwludW1fbGVuID0gc3Ryc3BuKHN0
ciwgIjAxMjM0NTY3ODkiKTsKPiArCWlmIChudW1fbGVuID09IDAgfHwgbnVtX2xlbiA+PSBzaXpl
b2YobnVtX2J1ZikpIHsKPiAgIAkJcHJfZXJyKCJVQkkgZXJyb3I6IGluY29ycmVjdCBieXRlcyBj
b3VudDogXCIlc1wiXG4iLCBzdHIpOwo+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgIAl9Cj4gICAK
PiAtCXN3aXRjaCAoKmVuZHApIHsKPiArCS8qIFBhcnNlIHRoZSBudW1lcmljIHBhcnQgKi8KPiAr
CW1lbWNweShudW1fYnVmLCBzdHIsIG51bV9sZW4pOwo+ICsJbnVtX2J1ZltudW1fbGVuXSA9ICdc
MCc7Cj4gKwlpZiAoa3N0cnRvdWwobnVtX2J1ZiwgMTAsICZyZXN1bHQpIDwgMCB8fCByZXN1bHQg
Pj0gSU5UX01BWCkgewo+ICsJCXByX2VycigiVUJJIGVycm9yOiBpbmNvcnJlY3QgYnl0ZXMgY291
bnQ6IFwiJXNcIlxuIiwgc3RyKTsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCj4gKwkv
KiBIYW5kbGUgc3VmZml4ICovCj4gKwlzd2l0Y2ggKHN0cltudW1fbGVuXSkgewo+ICAgCWNhc2Ug
J0cnOgo+ICAgCQlyZXN1bHQgKj0gMTAyNDsKPiAgIAkJZmFsbHRocm91Z2g7Cj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
